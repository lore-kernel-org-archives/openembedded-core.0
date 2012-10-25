Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRN9D-000664-Un
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 15:06:56 +0200
Received: from localhost ([127.0.0.1]:55200 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRMwA-0008D8-Hs; Thu, 25 Oct 2012 12:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=OscroIJExjXtizQ2/2UXUB0X
	mz8=; b=WtKiAeHJvB+KAUfwWkjvaGXIUPwNsYh0Ew4EJ22YuC5ehuUasyo+fGFI
	J8s1y/cv5pJSztb5VjS4GNjZmPTfMrpVafVNPPhxHgiyMjZgUoi8/ZzZJys7hRQq
	KFXEMgsnqpgari2iMKrOuDkaK6n96zhVqtsVYnFnNRDcCmbwMAA=
Received: from [195.171.99.130] (port=41748 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRMwA-0008D5-DD; Thu, 25 Oct 2012 12:53:26 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2012 13:55:02 +0100
Message-Id: <1351169702-2652-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12.4
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [oe][PATCH] latencytop: disable GTK and remove gtk+ dependacy
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
X-List-Received-Date: Thu, 25 Oct 2012 13:06:56 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

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
index 15f3667..2429b3d 100644
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
 
+EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '-DHAS_GTK_GUI=1', '', d)}"
+
 CFLAGS += "${LDFLAGS}"
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D} ${EXTRA_OECONF_X}
 }
-- 
1.7.12.4



