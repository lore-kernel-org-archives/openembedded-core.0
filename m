Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB82E756CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:32:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S1WBMS012959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:32:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 27 May 2015 18:32:10 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <randy.macleod@windriver.com>
Date: Thu, 28 May 2015 09:26:16 +0800
Message-ID: <0bbc0582db36c1fc63650e96b3eaef3561dd7494.1432775689.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432775689.git.kai.kang@windriver.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] qt4: fix CVE issues
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
X-List-Received-Date: Thu, 28 May 2015 01:32:11 -0000
Content-Type: text/plain

Backport patches to fix qt4 CVE issues:

* CVE-2015-1858
* CVE-2015-1859
* CVE-2015-1860

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  2 +
 ...Fixes-crash-in-bmp-and-ico-image-decoding.patch | 71 ++++++++++++++++++++++
 .../0036-Fixes-crash-in-gif-image-decoder.patch    | 39 ++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0035-Fixes-crash-in-bmp-and-ico-image-decoding.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0036-Fixes-crash-in-gif-image-decoder.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index 0cb7f80..4fe26af 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -27,6 +27,8 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0031-aarch64_arm64_mkspecs.patch \
            file://0032-aarch64_add_header.patch \
            file://0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
+           file://0035-Fixes-crash-in-bmp-and-ico-image-decoding.patch \
+           file://0036-Fixes-crash-in-gif-image-decoder.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://add_check_for_aarch64_32.patch \
            file://g++.conf \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0035-Fixes-crash-in-bmp-and-ico-image-decoding.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0035-Fixes-crash-in-bmp-and-ico-image-decoding.patch
new file mode 100644
index 0000000..c88879a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0035-Fixes-crash-in-bmp-and-ico-image-decoding.patch
@@ -0,0 +1,71 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2015-1858 and CVE-2015-1859
+
+http://code.qt.io/cgit/qt/qt.git/commit/?id=3e55cd6
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 3e55cd6dc467303a3c35312e9fcb255c2c048b32 Mon Sep 17 00:00:00 2001
+From: Eirik Aavitsland <eirik.aavitsland@theqtcompany.com>
+Date: Wed, 11 Mar 2015 13:34:01 +0100
+Subject: [PATCH] Fixes crash in bmp and ico image decoding
+
+Fuzzing test revealed that for certain malformed bmp and ico files,
+the handler would segfault.
+
+Change-Id: I19d45145f31e7f808f7f6a1a1610270ea4159cbe
+(cherry picked from qtbase/2adbbae5432aa9d8cc41c6fcf55c2e310d2d4078)
+Reviewed-by: Richard J. Moore <rich@kde.org>
+---
+ src/gui/image/qbmphandler.cpp                | 13 +++++++------
+ src/plugins/imageformats/ico/qicohandler.cpp |  2 +-
+ 2 files changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/src/gui/image/qbmphandler.cpp b/src/gui/image/qbmphandler.cpp
+index 30fa9e0..17a880b 100644
+--- a/src/gui/image/qbmphandler.cpp
++++ b/src/gui/image/qbmphandler.cpp
+@@ -478,12 +478,6 @@ static bool read_dib_body(QDataStream &s, const BMP_INFOHDR &bi, int offset, int
+                             p = data + (h-y-1)*bpl;
+                             break;
+                         case 2:                        // delta (jump)
+-                            // Protection
+-                            if ((uint)x >= (uint)w)
+-                                x = w-1;
+-                            if ((uint)y >= (uint)h)
+-                                y = h-1;
+-
+                             {
+                                 quint8 tmp;
+                                 d->getChar((char *)&tmp);
+@@ -491,6 +485,13 @@ static bool read_dib_body(QDataStream &s, const BMP_INFOHDR &bi, int offset, int
+                                 d->getChar((char *)&tmp);
+                                 y += tmp;
+                             }
++
++                            // Protection
++                            if ((uint)x >= (uint)w)
++                                x = w-1;
++                            if ((uint)y >= (uint)h)
++                                y = h-1;
++
+                             p = data + (h-y-1)*bpl + x;
+                             break;
+                         default:                // absolute mode
+diff --git a/src/plugins/imageformats/ico/qicohandler.cpp b/src/plugins/imageformats/ico/qicohandler.cpp
+index 1a88605..3c34765 100644
+--- a/src/plugins/imageformats/ico/qicohandler.cpp
++++ b/src/plugins/imageformats/ico/qicohandler.cpp
+@@ -571,7 +571,7 @@ QImage ICOReader::iconAt(int index)
+                 QImage::Format format = QImage::Format_ARGB32;
+                 if (icoAttrib.nbits == 24)
+                     format = QImage::Format_RGB32;
+-                else if (icoAttrib.ncolors == 2)
++                else if (icoAttrib.ncolors == 2 && icoAttrib.depth == 1)
+                     format = QImage::Format_Mono;
+                 else if (icoAttrib.ncolors > 0)
+                     format = QImage::Format_Indexed8;
+-- 
+2.4.1
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0036-Fixes-crash-in-gif-image-decoder.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0036-Fixes-crash-in-gif-image-decoder.patch
new file mode 100644
index 0000000..c1baf0e
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0036-Fixes-crash-in-gif-image-decoder.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2015-1860
+
+http://code.qt.io/cgit/qt/qt.git/commit/?id=9f2425a
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From a1cf194c54be57d6ab55dfd26b9562a60532208e Mon Sep 17 00:00:00 2001
+From: Eirik Aavitsland <eirik.aavitsland@theqtcompany.com>
+Date: Wed, 11 Mar 2015 09:00:41 +0100
+Subject: [PATCH] Fixes crash in gif image decoder
+
+Fuzzing test revealed that for certain malformed gif files,
+qgifhandler would segfault.
+
+Change-Id: I5bb6f60e1c61849e0d8c735edc3869945e5331c1
+(cherry picked from qtbase/ea2c5417fcd374302f5019e67f72af5facbd29f6)
+Reviewed-by: Richard J. Moore <rich@kde.org>
+---
+ src/gui/image/qgifhandler.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gui/image/qgifhandler.cpp b/src/gui/image/qgifhandler.cpp
+index 5199dd3..49aa2a6 100644
+--- a/src/gui/image/qgifhandler.cpp
++++ b/src/gui/image/qgifhandler.cpp
+@@ -944,6 +944,8 @@ void QGIFFormat::fillRect(QImage *image, int col, int row, int w, int h, QRgb co
+ 
+ void QGIFFormat::nextY(unsigned char *bits, int bpl)
+ {
++    if (out_of_bounds)
++        return;
+     int my;
+     switch (interlace) {
+     case 0: // Non-interlaced
+-- 
+2.4.1
+
-- 
1.9.1


