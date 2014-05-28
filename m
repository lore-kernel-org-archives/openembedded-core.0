Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8B465E42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 10:49:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 28 May 2014 03:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,927,1392192000"; d="scan'208";a="538858358"
Received: from drewstep-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.232])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2014 03:49:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 11:49:30 +0100
Message-Id: <5b14d719d78b7301ab95819a4d41f5fec5d3520a.1401274062.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1401274062.git.paul.eggleton@linux.intel.com>
References: <cover.1401274062.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1401274062.git.paul.eggleton@linux.intel.com>
References: <cover.1401274062.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/2] qt4: add patch for GIF denial-of-service vulnerability
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
X-List-Received-Date: Wed, 28 May 2014 10:49:46 -0000

For further details, see:
https://bugreports.qt-project.org/browse/QTBUG-38367

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
 .../0028-Don-t-crash-on-broken-GIF-images.patch    | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-images.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index c4dd36f..ae6692b 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -21,6 +21,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0018-configure-make-pulseaudio-a-configurable-option.patch \
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
+           file://0028-Don-t-crash-on-broken-GIF-images.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-images.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-images.patch
new file mode 100644
index 0000000..906e2fd
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-images.patch
@@ -0,0 +1,47 @@
+From f1b76c126c476c155af8c404b97c42cd1a709333 Mon Sep 17 00:00:00 2001
+From: Lars Knoll <lars.knoll@digia.com>
+Date: Thu, 24 Apr 2014 15:33:27 +0200
+Subject: [PATCH] Don't crash on broken GIF images
+
+Broken GIF images could set invalid width and height
+values inside the image, leading to Qt creating a null
+QImage for it. In that case we need to abort decoding
+the image and return an error.
+
+Initial patch by Rich Moore.
+
+Backport of Id82a4036f478bd6e49c402d6598f57e7e5bb5e1e from Qt 5
+
+Task-number: QTBUG-38367
+Change-Id: I0680740018aaa8356d267b7af3f01fac3697312a
+Security-advisory: CVE-2014-0190
+Reviewed-by: Richard J. Moore <rich@kde.org>
+
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ src/gui/image/qgifhandler.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/gui/image/qgifhandler.cpp b/src/gui/image/qgifhandler.cpp
+index 3324f04..5199dd3 100644
+--- a/src/gui/image/qgifhandler.cpp
++++ b/src/gui/image/qgifhandler.cpp
+@@ -359,6 +359,13 @@ int QGIFFormat::decode(QImage *image, const uchar *buffer, int length,
+                     memset(bits, 0, image->byteCount());
+                 }
+ 
++                // Check if the previous attempt to create the image failed. If it
++                // did then the image is broken and we should give up.
++                if (image->isNull()) {
++                    state = Error;
++                    return -1;
++                }
++
+                 disposePrevious(image);
+                 disposed = false;
+ 
+-- 
+1.9.3
+
-- 
1.9.3


