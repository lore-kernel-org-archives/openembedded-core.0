Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BC50970620
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 23:06:01 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XBXVy-000192-LW from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Jul 2014 16:06:02 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 27 Jul 2014 16:06:02 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Sun, 27 Jul 2014 16:06:01 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Jul 2014 19:05:57 -0400
Message-ID: <1406502357-17590-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Jul 2014 23:06:02.0543 (UTC)
	FILETIME=[563203F0:01CFA9EF]
Subject: [PATCH] libx11: Add missing NULL check
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
X-List-Received-Date: Sun, 27 Jul 2014 23:06:08 -0000
Content-Type: text/plain

Add a check for NULL on dereferencing the xim pointer.
Using mplayer with the x11 backend will trigger this and result
in a segfault.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../libx11/libX11-Add-missing-NULL-check.patch     | 72 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb     |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch b/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
new file mode 100644
index 0000000..3068620
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
@@ -0,0 +1,72 @@
+From 4d85d5f3bd8afac893738fd88e19d8cb5cf998ff Mon Sep 17 00:00:00 2001
+From: Drew Moseley <drew_moseley@mentor.com>
+Date: Sun, 27 Jul 2014 13:10:07 -0400
+Subject: [PATCH] libX11: Add missing NULL check on im and im->methods
+
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=81822]
+
+Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+---
+ src/xlibi18n/ICWrap.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff -ru libX11-1.6.2-orig/src/xlibi18n/ICWrap.c libX11-1.6.2/src/xlibi18n/ICWrap.c
+--- libX11-1.6.2-orig/src/xlibi18n/ICWrap.c	2014-07-27 13:38:29.586666449 -0400
++++ libX11-1.6.2/src/xlibi18n/ICWrap.c	2014-07-27 13:41:39.671609030 -0400
+@@ -169,7 +169,7 @@
+     va_list var;
+     int     total_count;
+     XIMArg *args;
+-    char   *ret;
++    char   *ret = NULL;
+ 
+     /*
+      * so count the stuff dangling here
+@@ -185,7 +185,8 @@
+     _XIMVaToNestedList(var, total_count, &args);
+     va_end(var);
+ 
+-    ret = (*im->methods->set_values) (im, args);
++    if (im && im->methods)
++	ret = (*im->methods->set_values) (im, args);
+     if (args) Xfree(args);
+     return ret;
+ }
+@@ -196,7 +197,7 @@
+     va_list var;
+     int     total_count;
+     XIMArg *args;
+-    char   *ret;
++    char   *ret = NULL;
+ 
+     /*
+      * so count the stuff dangling here
+@@ -212,7 +213,8 @@
+     _XIMVaToNestedList(var, total_count, &args);
+     va_end(var);
+ 
+-    ret = (*im->methods->get_values) (im, args);
++    if (im && im->methods)
++	ret = (*im->methods->get_values) (im, args);
+     if (args) Xfree(args);
+     return ret;
+ }
+@@ -228,7 +230,7 @@
+     va_list var;
+     int     total_count;
+     XIMArg *args;
+-    XIC     ic;
++    XIC     ic = NULL;
+ 
+     /*
+      * so count the stuff dangling here
+@@ -244,7 +246,8 @@
+     _XIMVaToNestedList(var, total_count, &args);
+     va_end(var);
+ 
+-    ic = (XIC) (*im->methods->create_ic) (im, args);
++    if (im && im->methods)
++	ic = (XIC) (*im->methods->create_ic) (im, args);
+     if (args) Xfree(args);
+     if (ic) {
+ 	ic->core.next = im->core.ic_chain;
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
index 700bc36..a722648 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
@@ -5,6 +5,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://disable_tests.patch \
             file://nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch \
+            file://libX11-Add-missing-NULL-check.patch \
            "
 
 SRC_URI[md5sum] = "c35d6ad95b06635a524579e88622fdb5"
-- 
1.9.1


