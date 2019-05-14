Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1B66C7DDB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 08:45:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 453B990kYHz5m;
	Tue, 14 May 2019 10:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557823549;
	bh=icOClPKikzBybE+Gw5poFjApsT+8DJFY5qORlTHIMww=;
	h=From:To:Cc:Subject:Date:From;
	b=LVKRN0FogSQqyAgQDjNxq2KJS/rfrjFh5tl1zdIiLoQxD+NX80iQ+Uffrh8whhIv7
	Tl5HRoCZZ9bTNTzto4mpw6v+XWCgyfuAvlOIMYcPIvCj0P5sAHm7rVLM1clKDE8tvc
	0Yt7o1JdFv/zSna4v+jp34+NNUQmNmRlsL5Bqaa6I+CTzK/CM7ndivtLMBPGE9vcVa
	WE5VV1GmfOmeA1CLhYuAN5OMxDQAaYYfC5rm1oMPNn5cgKQWVLf/xr7n0yaA7nV/p8
	mOgWSDPBSbNMorV3a9XKSp+XoyFQUNhR7WZZgnMiqHQ19Tb+PQgd8/kkL9PoM6Lma9
	mPYrl/10ur5YWmEhEQI6u8Ev+AAg+sV563KbuUUNP+LDmJsHsXBwlu1TCE0v3Qqm5C
	DFNW9/7UF1nA/uRZ5DKhkaPlsAMzE6uVSPOdPfPBUbqAnnaXB0G0OjXWHWxpEtlJWK
	JUg+ZQ1YZyscRLS3h5D2Jt13mI1wC3+2iIee1Ata/inQ61Ez2KKDG3OYUZJeXC5B7a
	eyrK1A49wKLplP6SZQPR3D+wPWtND/impIGCIe7rH2gHuAIycbvFdarIBOAR7XeiKE
	xEDCYNvBEZroyeu4NOsdzCGcAolOqDIic6todL7s6atfnSWzTZAwIBrlGV1TzXbcV5
	p1wtd3Zc2lpkKB8V+MTm2NDs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 11:45:48 +0300
Message-Id: <20190514084548.27552-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] Remove irda-utils and the irda feature
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
X-List-Received-Date: Tue, 14 May 2019 08:45:49 -0000

IrDA support was removed in kernel 4.17.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
irda-utils will be submitted for inclusion in meta-openembedded.
v2: Changes to documentation and a comment in meta-poky
    will be sent separately.
---
 .../distro/include/default-distrovars.inc     |  2 +-
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../irda-utils/irda-utils-0.9.18/init         | 78 -----------------
 .../irda-utils-0.9.18/ldflags.patch           | 87 -------------------
 .../irda-utils/irda-utils-0.9.18/musl.patch   | 29 -------
 .../irda-utils/irda-utils_0.9.18.bb           | 51 -----------
 .../packagegroups/packagegroup-base.bb        | 19 ----
 7 files changed, 1 insertion(+), 266 deletions(-)
 delete mode 100755 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
 delete mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
 delete mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
 delete mode 100644 meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7a0baf3260..10d86cf7b1 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2f1976a00f..67a51cdecc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -286,7 +286,6 @@ RECIPE_MAINTAINER_pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER_pn-irda-utils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iso-codes = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
deleted file mode 100755
index 6f29e9c6ed..0000000000
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
+++ /dev/null
@@ -1,78 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          irda
-# Required-Start:    $network $remote_fs
-# Required-Stop:     $network $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: Infrared port support
-### END INIT INFO
-
-NAME="irattach"
-test -x "$IRDA_DAEMON" || IRDA_DAEMON=/usr/sbin/irattach
-test -z "$IRATTACH_PID" && IRATTACH_PID=/var/run/irattach.pid
-
-# Source function library.
-. /etc/init.d/functions
-
-module_id() {
-        awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
-}
-
-if [ ! -f /etc/sysconfig/irda ]; then
-    case `module_id` in
-	"HP iPAQ H2200" | "HP iPAQ HX4700" | "HTC Universal")
-	    IRDA=yes
-	    DEVICE=/dev/ttyS2
-	    DONGLE=
-	    DISCOVERY=
-	    ;;
-	*)
-	    IRDA=yes
-	    DEVICE=/dev/ttyS1
-	    DONGLE=
-	    DISCOVERY=
-	    ;;
-    esac
-else
-    . /etc/sysconfig/irda
-fi
-
-# Check that irda is up.
-[ ${IRDA} = "no" ] && exit 0
-
-[ -f /usr/sbin/irattach ] || exit 0
-
-ARGS=
-if [ $DONGLE ]; then
-	ARGS="$ARGS -d $DONGLE"
-fi
-if [ "$DISCOVERY" = "yes" ];then
-	ARGS="$ARGS -s"
-fi
-
-case "$1" in
-  start)
-	echo -n "Starting IrDA: $NAME"
-	start-stop-daemon --start --quiet --exec "$IRDA_DAEMON" ${DEVICE} ${ARGS} --pidfile "$IRATTACH_PID"
-	sleep 1
-	[ -f /var/run/irattach.pid ] && echo " done" || echo " fail"
-	;;
-  stop)
-	echo "Stopping IrDA: $NAME"
-	start-stop-daemon --stop --quiet --exec "$IRDA_DAEMON" --pidfile "$IRATTACH_PID"
-	;;
-  restart|force-reload)
-	$0 stop
-	$0 start
-	;;
-  status)
-	status irattach
-	exit $?
-	;;
-  *)
-	N=/etc/init.d/$NAME
-	echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
-	exit 1
-	;;
-esac
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
deleted file mode 100644
index b246de8f5f..0000000000
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-Obey LDFLAGS
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
-Index: irda-utils-0.9.18/findchip/Makefile
-===================================================================
---- irda-utils-0.9.18.orig/findchip/Makefile
-+++ irda-utils-0.9.18/findchip/Makefile
-@@ -65,5 +65,5 @@ install: findchip
- 
- gfindchip: gfindchip.c 
- 	$(prn_cc)
--	$(ECMD))$(CC) $(CFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
- 
-Index: irda-utils-0.9.18/irattach/Makefile
-===================================================================
---- irda-utils-0.9.18.orig/irattach/Makefile
-+++ irda-utils-0.9.18/irattach/Makefile
-@@ -49,13 +49,13 @@ all: $(TARGETS)
- 
- irattach: irattach.o util.o
- 	$(prn_cc_o)
--	$(ECMD)$(CC) $(CFLAGS) irattach.o util.o -o $@
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
- 
- 
- 
- dongle_attach: dongle_attach.o
- 	$(prn_cc_o)
--	$(ECMD)$(CC) $(CFLAGS) dongle_attach.o -o $@
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) dongle_attach.o -o $@
- 
- 
- install: $(TARGETS)
-Index: irda-utils-0.9.18/irdadump/Makefile
-===================================================================
---- irda-utils-0.9.18.orig/irdadump/Makefile
-+++ irda-utils-0.9.18/irdadump/Makefile
-@@ -40,7 +40,7 @@ lib_irdadump.a: $(LIBIRDADUMP_OBJS)
- 
- irdadump: $(IRDADUMP_OBJS) $(LIBIRDADUMP_TARGET)
- 	$(prn_cc_o)
--	$(ECMD)$(CC) $(CFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
- 
- 
- .c.o:
-Index: irda-utils-0.9.18/irdaping/Makefile
-===================================================================
---- irda-utils-0.9.18.orig/irdaping/Makefile
-+++ irda-utils-0.9.18/irdaping/Makefile
-@@ -56,7 +56,7 @@ all: $(TARGETS)
- 
- irdaping: $(OBJS)
- 	$(prn_cc_o)
--	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
- 
- 
- .c.o:
-Index: irda-utils-0.9.18/irnetd/Makefile
-===================================================================
---- irda-utils-0.9.18.orig/irnetd/Makefile
-+++ irda-utils-0.9.18/irnetd/Makefile
-@@ -50,7 +50,7 @@ all: $(TARGETS)
- 
- irnetd: $(OBJS)
- 	$(prn_cc_o)
--	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
- 
- 
- install: irnetd
-Index: irda-utils-0.9.18/psion/Makefile
-===================================================================
---- irda-utils-0.9.18.orig/psion/Makefile
-+++ irda-utils-0.9.18/psion/Makefile
-@@ -25,4 +25,4 @@ install: $(PSION_TARGETS)
- CFLAGS += -g -I../include -Wall -Wstrict-prototypes $(RPM_OPT_FLAGS)
- irpsion5: 
- 	$(prn_cc_o)
--	$(ECMD)$(CC) $(CFLAGS) $(PSION_SRC) -o $@
-\ No newline at end of file
-+	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(PSION_SRC) -o $@
-\ No newline at end of file
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
deleted file mode 100644
index 97eb975023..0000000000
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Replace use of <net/if_packet.h> with <linux/if_packet.h>.
-
-kernel headers <linux/if_packet.h> already provides the
-needed definitions, moreover not all libc implementations
-provide if_packet.h e.g. musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: irda-utils-0.9.18/irdaping/irdaping.c
-===================================================================
---- irda-utils-0.9.18.orig/irdaping/irdaping.c
-+++ irda-utils-0.9.18/irdaping/irdaping.c
-@@ -33,7 +33,6 @@
- #include <sys/socket.h>
- #include <sys/ioctl.h>
- #include <net/if.h>		/* For struct ifreq */
--#include <net/if_packet.h>	/* For struct sockaddr_pkt */
- #include <net/if_arp.h>		/* For ARPHRD_IRDA */
- #include <netinet/if_ether.h>	/* For ETH_P_ALL */
- #include <netinet/in.h>		/* For htons */
-@@ -46,6 +45,7 @@
- #include <asm/byteorder.h>	/* __cpu_to_le32 and co. */
- 
- #include <linux/types.h>	/* For __u8 and co. */
-+#include <linux/if_packet.h>	/* For struct sockaddr_pkt */
- #include <irda.h>
- 
- #ifndef AF_IRDA
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
deleted file mode 100644
index 11b2ee9117..0000000000
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Common files for IrDA"
-DESCRIPTION = "Provides common files needed to use IrDA. \
-IrDA allows communication over Infrared with other devices \
-such as phones and laptops."
-HOMEPAGE = "http://irda.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/p/irda/bugs/"
-SECTION = "base"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://smcinit/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://man/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://irdadump/irdadump.c;beginline=1;endline=24;md5=d78b9dce3cd78c2220250c9c7a2be178"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
-           file://ldflags.patch \
-           file://musl.patch \
-           file://init"
-
-SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
-SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
-
-inherit update-rc.d
-
-EXTRA_OEMAKE = "\
-    'CC=${CC}' \
-    'LD=${LD}' \
-    'CFLAGS=${CFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-    'SYS_INCLUDES=' \
-    'V=1' \
-"
-
-INITSCRIPT_NAME = "irattach"
-INITSCRIPT_PARAMS = "defaults 20"
-
-TARGETS ??= "irattach irdaping"
-do_compile () {
-	for t in ${TARGETS}; do
-		oe_runmake -C $t
-	done
-}
-
-do_install () {
-	install -d ${D}${sbindir}
-	for t in ${TARGETS}; do
-		oe_runmake -C $t ROOT="${D}" install
-	done
-
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-}
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 442201c9ef..cae704aa24 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -21,7 +21,6 @@ PACKAGES = ' \
             ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
@@ -63,7 +62,6 @@ RDEPENDS_packagegroup-base = "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'irda', 'packagegroup-base-irda', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
@@ -221,23 +219,6 @@ RRECOMMENDS_packagegroup-base-bluetooth = "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
     "
 
-SUMMARY_packagegroup-base-irda = "IrDA support"
-RDEPENDS_packagegroup-base-irda = "\
-    irda-utils"
-
-RRECOMMENDS_packagegroup-base-irda = "\
-    kernel-module-pxaficp-ir \
-    kernel-module-irda \
-    kernel-module-ircomm \
-    kernel-module-ircomm-tty \
-    kernel-module-irlan \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'kernel-module-irnet', '',d)} \
-    kernel-module-irport \
-    kernel-module-irtty \
-    kernel-module-irtty-sir \
-    kernel-module-sir-dev \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
-
 SUMMARY_packagegroup-base-usbgadget = "USB gadget support"
 RRECOMMENDS_packagegroup-base-usbgadget = "\
     kernel-module-pxa27x_udc \
-- 
2.17.1


