Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4990B6BA2F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 05:16:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7P5Gsmt021767
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 24 Aug 2013 22:16:54 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 24 Aug 2013 22:16:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 25 Aug 2013 01:16:37 -0400
Message-ID: <03d9de265ca50b2182016c8335193e2f2302698a.1377405083.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377405083.git.bruce.ashfield@windriver.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] gst-plugins-good: fix 3.10 libc-headers build failure
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
X-List-Received-Date: Sun, 25 Aug 2013 05:16:54 -0000
Content-Type: text/plain

kernel commit 24b9f5017 [[media] V4L: Remove deprecated image centering controls]
removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after three
years of depreciation.

The ioctl values are still free, and the case statement which processess them
in v4l2 userspace falls through to the proper replacement. So in the short
term, we can explicitly define them using the old absolute values, and everything
will work.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 ++++++++++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
new file mode 100644
index 0000000..bd0de58
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
@@ -0,0 +1,45 @@
+From ccb01de8096a32d86d47b0d92ec3416c57ee4d25 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Thu, 22 Aug 2013 12:15:54 -0400
+Subject: [PATCH] v4l2_calls: define V4L2_CID_HCENTER and V4L2_CID_VCENTER
+
+kernel commit 24b9f5017 [[media] V4L: Remove deprecated image centering controls]
+removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after three
+years of depreciation.
+
+The ioctl values are still free, and the case statement which processess them
+in v4l2 userspace falls through to the proper replacement. So in the short
+term, we can explicitly define them using the old absolute values, and everything
+will work.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ sys/v4l2/v4l2_calls.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
+index 309bfb6..3c64544 100644
+--- a/sys/v4l2/v4l2_calls.c
++++ b/sys/v4l2/v4l2_calls.c
+@@ -54,11 +54,16 @@
+ #include "gst/gst-i18n-plugin.h"
+ 
+ /* Those are ioctl calls */
++
++/* V4L2_CID_HCENTER has been removed from the mainline kernel, but
++   the ioctl space is still present. Since these values fall through
++   to their replacement, it is safe (in the short term) to re-use the
++    old values explictily */
+ #ifndef V4L2_CID_HCENTER
+-#define V4L2_CID_HCENTER V4L2_CID_HCENTER_DEPRECATED
++#define V4L2_CID_HCENTER V4L2_CID_BASE+22
+ #endif
+ #ifndef V4L2_CID_VCENTER
+-#define V4L2_CID_VCENTER V4L2_CID_VCENTER_DEPRECATED
++#define V4L2_CID_VCENTER V4L2_CID_BASE+23
+ #endif
+ 
+ GST_DEBUG_CATEGORY_EXTERN (v4l2_debug);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index daffcf1..d18e155 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -23,6 +23,7 @@ DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
 inherit gettext gconf
 
 SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
+SRC_URI += "file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
                  --disable-examples --disable-taglib"
-- 
1.7.10.4


