Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SOo5K-00035p-OD for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 12:44:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UAYLIc002459
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 11:34:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25331-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 11:34:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UAYACM002453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 11:34:12 +0100
Message-ID: <1335782052.7415.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 11:34:12 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] qt-4.8.1: Fix compile failures on qemux86
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 10:44:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
index b42ca01..8c38cae 100644
--- a/meta/recipes-qt/qt4/qt-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
@@ -21,6 +21,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://g++.conf \
            file://linux.conf \
            file://gcc47-fix.patch \
+           file://gcc47-fix2.patch \
            file://disable-fuse-gold-flag.patch \
            "
 
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
new file mode 100644
index 0000000..09513b6
--- a/dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
@@ -0,0 +1,50 @@
+Fixes for gcc 4.7.0, particularly on qemux86
+
+Origin: upstream, http://trac.webkit.org/changeset/93631
+Origin: upstream, http://trac.webkit.org/changeset/113848
+
+Bug: https://bugs.webkit.org/show_bug.cgi?id=62168
+Bug: https://bugs.webkit.org/show_bug.cgi?id=83584
+
+RP 2012/04/30
+
+Upstream-Status: Backport
+
+Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
+===================================================================
+--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp	2012-04-30 09:15:17.000000000 +0000
++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp	2012-04-30 09:22:04.586008994 +0000
+@@ -1080,7 +1080,7 @@
+ {
+     // Ref currentStyle in case it would otherwise be deleted when setRenderStyle() is called.
+     RefPtr<RenderStyle> currentStyle(renderStyle());
+-    bool hasParentStyle = parentNodeForRenderingAndStyle() ? parentNodeForRenderingAndStyle()->renderStyle() : false;
++    bool hasParentStyle = parentNodeForRenderingAndStyle() ? static_cast<bool>(parentNodeForRenderingAndStyle()->renderStyle()) : false;
+     bool hasDirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByDirectAdjacentRules();
+     bool hasIndirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByForwardPositionalRules();
+ 
+Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
+===================================================================
+--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp	2012-03-14 14:01:19.000000000 +0000
++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp	2012-04-30 09:22:04.586008994 +0000
+@@ -74,7 +74,7 @@
+     RefPtr<HTMLImageElement> image = adoptRef(new HTMLImageElement(imgTag, document));
+     if (optionalWidth)
+         image->setWidth(*optionalWidth);
+-    if (optionalHeight > 0)
++    if (optionalHeight)
+         image->setHeight(*optionalHeight);
+     return image.release();
+ }
+Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
+===================================================================
+--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h	2012-03-14 14:01:24.000000000 +0000
++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h	2012-04-30 09:22:04.590008963 +0000
+@@ -25,6 +25,7 @@
+ #if ENABLE(TILED_BACKING_STORE)
+ class TiledBackingStoreClient {
+ public:
++    virtual ~TiledBackingStoreClient() { }
+     virtual void tiledBackingStorePaintBegin() = 0;
+     virtual void tiledBackingStorePaint(GraphicsContext*, const IntRect&) = 0;
+     virtual void tiledBackingStorePaintEnd(const Vector<IntRect>& paintedArea) = 0;
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
index e16264c..668565e 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
index 533b5d6..a2a1dbd 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
@@ -1,6 +1,6 @@
 require qt4-native.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # Find the g++.conf/linux.conf in the right directory.
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
index c4bd3cf..e17a8ad 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
@@ -1,6 +1,6 @@
 require qt4-tools-nativesdk.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://qmake_pri_fixes.patch"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
index 7afb51f..6978053 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 




