
ALL = \
	jdk-7u1-linux-i586.tar.gz \
	jdk-7u1-linux-x64.tar.gz \
	$(NULL)

JDK_7U1_URI = http://www.oracle.com/technetwork/java/javase/downloads/jdk-7u1-download-513651.html

.PHONY: all build clean

all: $(ALL)
	$(MAKE) build

jdk-7u1-%.tar.gz:
	@echo "Please download the Java Binaries with accepting Oracle Binary Code License Agreement for Java SE."
	@echo "Press anykey..."
	@read
	sensible-browser $(JDK_7U1_URI)

build:
	debuild -uc -us

clean:
	fakeroot $(MAKE) -f debian/rules $@
