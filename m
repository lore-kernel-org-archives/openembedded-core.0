Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id C74E971F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 04:38:03 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so2027279iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 20:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=q34rCbclnKDmqCT2hVDojXWBVBW2rVfnWs5KNvmylt8=;
	b=j8e1lKa7RTwxnxQrje+XAfhI12j3Dq810dBAcM4LgQg5Ljkom3iCD9KycCmbBjsput
	0tMrp6sko2+mX9u9xBSwvSM0vYD3s880siIQMqngQm3QIUrC8UHRS8grrleI5sl52KT+
	nebcApEo0tBHJHvXCVVF1jYKWfNi1QWrOhIv4PcHig1ONQfarMS3EHqnwwCCxpS5i4vs
	k9g/zO6ZG5ZFicFrQKL9buKyZ63W82Kffe9lsTA7oAdgLu+yh3HZzegKBI5iphJM9jVk
	HwN4QIG5Bf9wytnsm7lxhum7QvVcgFoAD8gtm+J41v6WrgNri+F4qmlTpSYbXW78C03i
	kwmQ==
X-Gm-Message-State: ALoCoQne9ZihGOiWlLUNTokGsN9kp9k/nwe05EJO27sBrfaF4N8Or39eHowRWaCLoHqA/dooXIZ9
X-Received: by 10.107.135.27 with SMTP id j27mr2133743iod.55.1424839084224;
	Tue, 24 Feb 2015 20:38:04 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id d6sm14531816ioe.44.2015.02.24.20.38.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Feb 2015 20:38:03 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2015 23:39:01 -0500
Message-Id: <1424839141-1532-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libpcap: add pkg-config support
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
X-List-Received-Date: Wed, 25 Feb 2015 04:38:06 -0000

libpcap was not previously installing a pkg-config file.  Add a basic one
that will allow using 'pkg-config --libs libpcap', for example, in recipes
rather than 'pcap-config', which frequently returns incorrect information.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

Hmm, pretty sure I sent this to the wrong list, now that I think about it.  So
here's what I put in the comment I sent to the Yocto list.  Sorry about that.

I'm not convinced that this is necessary, but when I tried to convert the ptpd
recipe in meta-networking to stop failing by using pcap-config it seems like
libpcap was never actually installing a reasonable .pc file.  The only other
example I could find in meta-networking switched from using pcap-config to an
internal pcap library, rather than using the oe-core version, so maybe it really
isn't working for anyone right now.  I created something that at least gets ptpd
to stop blowing up, but if there's a proper way to do this for ptpd, I'd be
happy to adopt that instead.

-J.

 meta/recipes-connectivity/libpcap/libpcap.inc      |  2 +-
 .../libpcap/libpcap-pkgconfig-support.patch        | 71 ++++++++++++++++++++++
 meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb |  6 +-
 3 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 979665c..0c608b5 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-inherit bluetooth
+inherit bluetooth pkgconfig
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
 PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
new file mode 100644
index 0000000..9cfb9df
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
@@ -0,0 +1,71 @@
+From 8887132e85892a72a84ca3878e60f254ad2ce939 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Tue, 24 Feb 2015 15:56:06 -0500
+Subject: [PATCH] libpcap: pkgconfig support
+
+Adding basic structure to support pkg-config.
+
+Upstream-status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ Makefile.in   |  5 +++++
+ configure.in  |  1 +
+ libpcap.pc.in | 10 ++++++++++
+ 3 files changed, 16 insertions(+)
+ create mode 100644 libpcap.pc.in
+
+diff --git a/Makefile.in b/Makefile.in
+index 1c2d745..1f25faf 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -60,6 +60,10 @@ V_RPATH_OPT = @V_RPATH_OPT@
+ DEPENDENCY_CFLAG = @DEPENDENCY_CFLAG@
+ PROG=libpcap
+ 
++# pkgconfig support
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = libpcap.pc
++
+ # Standard CFLAGS
+ FULL_CFLAGS = $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
+ 
+@@ -275,6 +279,7 @@ EXTRA_DIST = \
+ 	lbl/os-solaris2.h \
+ 	lbl/os-sunos4.h \
+ 	lbl/os-ultrix4.h \
++	libpcap.pc \
+ 	missing/snprintf.c \
+ 	mkdep \
+ 	msdos/bin2c.c \
+diff --git a/configure.in b/configure.in
+index 8f5c86b..fb51b35 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1700,6 +1700,7 @@ esac
+ AC_PROG_INSTALL
+ 
+ AC_CONFIG_HEADER(config.h)
++AC_CONFIG_FILES([libpcap.pc])
+ 
+ AC_OUTPUT_COMMANDS([if test -f .devel; then
+ 	echo timestamp > stamp-h
+diff --git a/libpcap.pc.in b/libpcap.pc.in
+new file mode 100644
+index 0000000..4f78ad8
+--- /dev/null
++++ b/libpcap.pc.in
+@@ -0,0 +1,10 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: libpcap
++Description: System-independent interface for user-level packet capture.
++Version: @VERSION@
++Libs: -L${libdir} -lpcap
++Cflags: -I${includedir}
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb b/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
index a2d5ef4..611543e 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
@@ -1,6 +1,8 @@
 require libpcap.inc
 
-SRC_URI += "file://aclocal.patch"
+SRC_URI += "file://aclocal.patch \
+            file://libpcap-pkgconfig-support.patch \
+           "
 SRC_URI[md5sum] = "5f14191c1a684a75532c739c2c4059fa"
 SRC_URI[sha256sum] = "5db3e2998f1eeba2c76da55da5d474248fe19c44f49e15cac8a796a2c7e19690"
 
@@ -19,4 +21,6 @@ do_install_prepend () {
     install -d ${D}${bindir}
     oe_runmake install-shared DESTDIR=${D}
     oe_libinstall -a -so libpcap ${D}${libdir}
+    sed "s|@VERSION@|${PV}|" -i ${B}/libpcap.pc
+    install -D -m 0644 libpcap.pc ${D}${libdir}/pkgconfig/libpcap.pc
 }
-- 
1.9.1


