Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRig3-000554-4z
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 14:06:15 +0200
Received: from localhost ([127.0.0.1]:41349 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRiSy-0001sH-Kb; Fri, 26 Oct 2012 11:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=QgIBPfNbnfyNRMRXXUJ0XKEo
	Jvk=; b=R6p7lH/HBfrDAakfXDEUGy/JB6VG/Xhc/qNUUO2gOpvO8XPzAMrZ2uDn
	qlpEher737XqGm8COwoDb3rglGq7P6R1Mxqnx97FfYy7QI2rmp1L3W8UX4WWMlZL
	s1bfGTu+Qd5nQy7qgd522l9VWdI4JDmkYuwdHGDJjP7aWVEaPCg=
Received: from [195.171.99.130] (port=57894 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRiSy-0001sE-Eu; Fri, 26 Oct 2012 11:52:44 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 12:54:18 +0100
Message-Id: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12.4
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [oe][PATCH 1/3] latencytop: disable GTK and remove gtk+ dependacy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 12:06:15 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

---

v2
- Don't use -D to define with make
- Rename EXTRA_OECONF_X to EXTRA_OEMAKE_X

When DISTRO_FEATURES does not contain x11, disable GTK GUI and
also don't add gtk+ to the DEPENDS

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
 meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  6 ++++--
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
index 59a0b1f..596450c 100644
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
@@ -1,8 +1,9 @@
-Upstream-Status: Inappropriate [configuration]
-
---- a/Makefile	2010-07-20 18:51:32.000000000 +0800
-+++ b/Makefile	2010-07-20 18:54:54.000000000 +0800
-@@ -4,7 +4,8 @@
+--- a/Makefile 2010-07-20 18:51:32.000000000 +0800
++++ b/Makefile 2010-07-20 18:54:54.000000000 +0800
+@@ -1,10 +1,8 @@
+-# FIXME: Use autoconf ?
+-HAS_GTK_GUI = 1
+-
  DESTDIR =
  SBINDIR = /usr/sbin
  XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
@@ -12,7 +13,7 @@ Upstream-Status: Inappropriate [configuration]
  
  OBJS= latencytop.o text_display.o translate.o fsync.o
  
-@@ -26,16 +27,17 @@
+@@ -26,16 +24,17 @@
  
  # We write explicity this "implicit rule"
  %.o : %.c
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 15f3667..695e12b 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "n/a"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
 
-DEPENDS = "virtual/libintl ncurses glib-2.0 gtk+"
+DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 
 PR = "r2"
 
@@ -15,8 +15,10 @@ SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
 SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
 
+EXTRA_OEMAKE_X = "${@base_contains('DISTRO_FEATURES', 'x11', 'HAS_GTK_GUI=1', '', d)}"
+
 CFLAGS += "${LDFLAGS}"
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D} ${EXTRA_OEMAKE_X}
 }
-- 
1.7.12.4



