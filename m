Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSlpc-00076R-Bc
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 10:40:28 +0100
Received: from localhost ([127.0.0.1]:54980 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcU-0006oY-O1; Mon, 29 Oct 2012 09:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=o
	o/5AaldSrUcC9qU4E7xgMw+tis=; b=IQRPNZHaWR/gX4+mXuaDz2KAY3iCrbEVP
	4DVkicMveIxF99ssWfqByjLYoUED9O391k3adhzZS2z86sr2R3jVvOa2cA3jccD1
	vcxWhePgc3Rla453kIUWkc/NypgQ8WpWwco/5apak4LOH52HE9m4cWaKKjaz0ZL/
	wltlL1DXJY=
Received: from [195.171.99.130] (port=2554 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcU-0006o4-Ja; Mon, 29 Oct 2012 09:26:54 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:28:48 +0000
Message-Id: <1351502930-2348-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
References: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 1/3] latencytop: disable GTK and remove gtk+ dependacy
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
X-List-Received-Date: Mon, 29 Oct 2012 09:40:28 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

When DISTRO_FEATURES does not contain x11, disable GTK GUI and
also don't add gtk+ to the DEPENDS

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
 meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  8 +++++---
 2 files changed, 12 insertions(+), 9 deletions(-)

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
index 15f3667..3e35bf9 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -5,9 +5,9 @@ BUGTRACKER = "n/a"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
 
-DEPENDS = "virtual/libintl ncurses glib-2.0 gtk+"
+DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
             file://latencytop-makefile.patch"
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
1.8.0



