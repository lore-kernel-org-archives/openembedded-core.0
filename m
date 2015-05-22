Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3950601DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 07:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4M7vtQm000347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 00:57:55 -0700 (PDT)
Received: from pek-khao-d1.corp.ad.wrs.com (128.224.162.156) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Fri, 22 May 2015 00:57:54 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 May 2015 15:57:49 +0800
Message-ID: <1432281469-21784-1-git-send-email-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] PCMCIA: remove the support for PCMCIA
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 07:57:56 -0000
Content-Type: text/plain

PCMCIA is so uncommon in now days and was also removed by other distro
such as Debian [1]. So remove it from oe-core. Will move it to
meta-openembedded/meta-oe.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=698105

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/conf/bitbake.conf                             |   1 -
 meta/conf/distro/include/default-distrovars.inc    |   2 +-
 meta/conf/local.conf.sample.extended               |   4 +-
 .../0001-fix-a-parallel-building-issue.patch       |  45 ---------
 .../pcmciautils/pcmciautils-018/makefile_fix.patch | 101 ---------------------
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |  32 -------
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |  13 ---
 .../packagegroups/packagegroup-base.bb             |  31 +------
 8 files changed, 7 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils.inc
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8653a7f3a943..8194a475015b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -741,7 +741,6 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "vfat", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "irda", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pcmcia", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pci", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost", d)} \
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 29b762b22733..2ad27a74c1c4 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -8,7 +8,7 @@ IMAGE_LINGUAS ?= "en-us en-gb"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 
-DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
+DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index ccdd32682723..5e3521a9629f 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -36,10 +36,10 @@
 #               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 #               libc-posix-wchar-io"
 
-#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
 
 # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
+#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
 
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
deleted file mode 100644
index 7b010400f792..000000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5a793a1a9fb3477719aabf7e27ff22ed1acdf559 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Tue, 19 May 2015 15:54:24 +0800
-Subject: [PATCH] fix a parallel building issue
-
-Fixed:
-|   src/lex_config.c:34:25: fatal error: yacc_config.h: No such file or directory
-|
-|    #include "yacc_config.h"
-|                            ^
-|   compilation terminated.
-
-And:
-Compiling lex_config.c.
-  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or directory
-
-Upstream-Status: Pending
-
-there are two Makefile rules to generate lex_config.o, one is to generate
-lex_config.o other is to generate src/lex_config.o, so we can remove one.
-and add the needed dependence for lex_config.o
-
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index d45fdc3..4c53bc2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -246,8 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
- 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
- 	$(QUIET) $(STRIPCMD) $@
- 
--yacc_config.o lex_config.o: %.o: %.c
--	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
-+src/lex_config.o:src/yacc_config.h
- 
- debugtools: ccdv $(CBDUMP) $(CISDUMP)
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
deleted file mode 100644
index 7b0ce21194c1..000000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Hardcoded paths are bad...
-This lets us use the install from OE's native sysroot
-rebase the patch to 018, removing hardcoded path for true
-as well. Removing of -D in install invocation is a little
-questionable, is it some GNU extention?
-
--Khem Raj <raj.khem@gmail.com>
-
-Index: pcmciautils-018/Makefile
-===================================================================
---- pcmciautils-018.orig/Makefile
-+++ pcmciautils-018/Makefile
-@@ -76,7 +76,7 @@ sbindir =	${exec_prefix}/sbin
- mandir =	${prefix}/usr/share/man
- udevdir =	${prefix}/lib/udev
- 
--INSTALL = /usr/bin/install -c
-+INSTALL = install -c
- INSTALL_PROGRAM = ${INSTALL}
- INSTALL_DATA  = ${INSTALL} -m 644
- INSTALL_SCRIPT = ${INSTALL_PROGRAM}
-@@ -180,7 +180,7 @@ endif
- # if DEBUG is enabled, then we do not strip or optimize
- ifeq ($(strip $(DEBUG)),true)
- 	CFLAGS  += -O1 -g -DDEBUG -D_GNU_SOURCE
--	STRIPCMD = /bin/true -Since_we_are_debugging
-+	STRIPCMD = true -Since_we_are_debugging
- else
- 	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
- 	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
-@@ -273,30 +273,32 @@ clean:
- 
- install-hotplug:
- 	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.agent
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
-+	$(INSTALL_PROGRAM) hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.agent
-+	$(INSTALL_PROGRAM) hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
- 
- uninstall-hotplug:
- 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.rc
- 
- install-socket-hotplug:
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent
--	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
-+	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent
-+	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
- 
- uninstall-socket-hotplug:
- 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
- 
- install-socket-tools:
--	$(INSTALL_PROGRAM) -D $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
-+	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
-+	$(INSTALL_PROGRAM) $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
- 
- uninstall-socket-tools:
- 	- rm -f $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
- 
- install-tools:
- 	$(INSTALL) -d $(DESTDIR)$(sbindir)
--	$(INSTALL_PROGRAM) -D $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
-+	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
-+	$(INSTALL_PROGRAM) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
- 	$(SYMLINK) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(LSPCMCIA)
--	$(INSTALL_PROGRAM) -D $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_CHECK_BROKEN_CIS)
-+	$(INSTALL_PROGRAM) $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_CHECK_BROKEN_CIS)
- 
- uninstall-tools:
- 	- rm -f $(DESTDIR)$(sbindir)/$(PCCARDCTL)
-@@ -305,22 +307,24 @@ uninstall-tools:
- 
- install-config:
- 	$(INSTALL) -d $(DESTDIR)$(pcmciaconfdir)
--	$(INSTALL_DATA)  -D config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.opts
-+	$(INSTALL_DATA)  config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.opts
- 	if [ -f config/config.opts.$(ARCH) ]; then \
--		$(INSTALL_DATA) -D config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)/config.opts; \
-+		$(INSTALL_DATA) config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)/config.opts; \
- 	fi
- 
- uninstall-config:
- #	- rm -f $(DESTDIR)$(pcmciaconfdir)/config.opts
- 
- install-udev:
--	$(INSTALL_DATA) -D $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
-+	$(INSTALL) -d $(DESTDIR)$(udevrulesdir)
-+	$(INSTALL_DATA) $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
- 
- uninstall-udev:
- 	- rm -f $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
- 
- install-man:
--	$(INSTALL_DATA) -D man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardctl.8
-+	$(INSTALL) -d $(DESTDIR)$(mandir)/man8
-+	$(INSTALL_DATA) man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardctl.8
- 	$(SYMLINK) pccardctl.8 $(DESTDIR)$(mandir)/man8/lspcmcia.8
- 
- uninstall-man:
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
deleted file mode 100644
index 9d1c55bbad9a..000000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Linux kernel userland utilities for the PCMCIA subsystem"
-HOMEPAGE = "https://www.kernel.org/pub/linux/utils/kernel/pcmcia/"
-SECTION = "kernel/userland"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "udev sysfsutils flex-native"
-RDEPENDS_${PN} = "udev module-init-tools"
-
-SRC_URI = "http://mirror.linux.org.au/linux/utils/kernel/pcmcia/${BP}.tar.bz2"
-
-S = "${WORKDIR}/pcmciautils-${PV}"
-
-export HOSTCC = "${BUILD_CC}"
-export etcdir = "${sysconfdir}"
-export sbindir = "${base_sbindir}"
-export pcmciaconfdir = "${sysconfdir}/pcmcia"
-export udevdir = "`pkg-config --variable=udevdir udev`"
-export udevrulesdir = "`pkg-config --variable=udevdir udev`/rules.d"
-export UDEV = "1"
-LD = "${CC}"
-CFLAGS =+ "-I${S}/src"
-CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
-
-EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-}
-
-CONFFILES_${PN} += "${sysconfdir}/pcmcia/config.opts"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
deleted file mode 100644
index 24ceed87a930..000000000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require pcmciautils.inc
-
-SRC_URI += "file://makefile_fix.patch \
-            file://0001-fix-a-parallel-building-issue.patch \
-"
-
-SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
-SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
-
-PR = "r1"
-
-FILES_${PN}-dbg += "*/udev/.debug"
-FILES_${PN} += "*/udev"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 262d65f5dc0c..e2b85b4af56b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -25,7 +25,6 @@ PACKAGES = ' \
             ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
@@ -67,7 +66,6 @@ RDEPENDS_packagegroup-base = "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'irda', 'packagegroup-base-irda', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
@@ -108,19 +106,19 @@ ADD_3G = ""
 ADD_NFC = ""
 
 python __anonymous () {
-    # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (one of them)
+    # If Distro want wifi and machine feature wifi/pci/usbhost (one of them)
     # then include packagegroup-base-wifi in packagegroup-base
 
     distro_features = set(d.getVar("DISTRO_FEATURES", True).split())
     machine_features= set(d.getVar("MACHINE_FEATURES", True).split())
 
-    if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
+    if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pci" in machine_features or "usbhost" in machine_features):
         d.setVar("ADD_BT", "packagegroup-base-bluetooth")
 
-    if "wifi" in distro_features and not "wifi" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
+    if "wifi" in distro_features and not "wifi" in machine_features and ("pci" in machine_features or "usbhost" in machine_features):
         d.setVar("ADD_WIFI", "packagegroup-base-wifi")
 
-    if "3g" in distro_features and not "3g" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
+    if "3g" in distro_features and not "3g" in machine_features and ("pci" in machine_features or "usbhost" in machine_features):
         d.setVar("ADD_3G", "packagegroup-base-3g")
 
     if "nfc" in distro_features and not "nfc" in machine_features and ("usbhost" in machine_features):
@@ -186,22 +184,6 @@ RRECOMMENDS_packagegroup-base-alsa = "\
     kernel-module-snd-mixer-oss \
     kernel-module-snd-pcm-oss"
 
-SUMMARY_packagegroup-base-pcmcia = "PC card slot support"
-RDEPENDS_packagegroup-base-pcmcia = "\
-    pcmciautils \
-    "
-
-RRECOMMENDS_packagegroup-base-pcmcia = "\
-    kernel-module-pcmcia \
-    kernel-module-airo-cs \
-    kernel-module-pcnet-cs \
-    kernel-module-serial-cs \
-    kernel-module-ide-cs \
-    kernel-module-ide-disk \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hostap-cs', '',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
-
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
     ${BLUEZ} \
@@ -218,10 +200,6 @@ RRECOMMENDS_packagegroup-base-bluetooth = "\
     kernel-module-hci-uart \
     kernel-module-sco \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
     "
 
 SUMMARY_packagegroup-base-irda = "IrDA support"
@@ -293,7 +271,6 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
     wireless-tools \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
     wpa-supplicant"
 
-- 
2.1.0


