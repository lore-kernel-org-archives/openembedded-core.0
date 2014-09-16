Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA19F62252
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:58:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G8waXt006713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:58:36 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:58:35 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Sep 2014 04:58:34 -0400
Message-ID: <1410857914-23170-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] gst-plugins-base: fix build failure for x86
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
X-List-Received-Date: Tue, 16 Sep 2014 08:58:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

On x86, EMMINTRIN is defined but not usable without SSE so check for
__SSE__ and __SSE2__ as well.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |   37 ++++++++++++++++++++
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
new file mode 100644
index 0000000..5214256
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
@@ -0,0 +1,37 @@
+audioresample: Fix build on x86 if emmintrin.h is available but can't be used
+
+On x86, EMMINTRIN is defined but not usable without SSE so check for
+__SSE__ and __SSE2__ as well.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=670690
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ gst/audioresample/resample.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
+index 98d006c..481fa01 100644
+--- a/gst/audioresample/resample.c
++++ b/gst/audioresample/resample.c
+@@ -77,13 +77,13 @@
+ #define EXPORT G_GNUC_INTERNAL
+ 
+ #ifdef _USE_SSE
+-#ifndef HAVE_XMMINTRIN_H
++#if !defined(__SSE__) || !defined(HAVE_XMMINTRIN_H)
+ #undef _USE_SSE
+ #endif
+ #endif
+ 
+ #ifdef _USE_SSE2
+-#ifndef HAVE_EMMINTRIN_H
++#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
+ #undef _USE_SSE2
+ #endif
+ #endif
+-- 
+1.7.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 4a8a994..c8a9499 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 DEPENDS += "alsa-lib liboil libogg libvorbis libtheora util-linux tremor glib-2.0-native"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
-            file://configure.ac-fix-subparse-plugin.patch"
+            file://configure.ac-fix-subparse-plugin.patch \
+            file://audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch \
+"
 
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
-- 
1.7.9.5


