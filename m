Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C530960959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 12:44:49 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 May 2013 05:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,778,1363158000"; d="scan'208";a="310532006"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 31 May 2013 05:44:40 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 15:45:28 +0300
Message-Id: <1370004328-32620-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libpng : upgrade to 1.6.2
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
X-List-Received-Date: Fri, 31 May 2013 12:44:50 -0000

upgrade from 1.6.1 -> 1.6.2

- removed patch contained upstream
- minor changes in png.h and LICENSE file ( changes
regarding the date )

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../libpng/libpng/transform.patch                  |   46 --------------------
 .../libpng/{libpng_1.6.1.bb => libpng_1.6.2.bb}    |    9 ++--
 2 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng/transform.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.1.bb => libpng_1.6.2.bb} (61%)

diff --git a/meta/recipes-multimedia/libpng/libpng/transform.patch b/meta/recipes-multimedia/libpng/libpng/transform.patch
deleted file mode 100644
index 369a2c0..0000000
--- a/meta/recipes-multimedia/libpng/libpng/transform.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Corrected the test on user transform changes on read. It was in the png_set of
-the transform function, but that doesn't matter unless the transform function
-changes the rowbuf size, and that is only valid if transform_info is called.
-
-Upstream-Status: Backport (will be in 1.6.2)
-                 - b44cd59ad9747069b90c6ff0f76558157a61e26a
-                 - a8715cabd11354da9650dff7c0770686a217b550
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-diff --git a/pngrtran.c b/pngrtran.c
-index 626f3b0..4485e40 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -1056,9 +1056,6 @@ png_set_read_user_transform_fn(png_structrp png_ptr, png_user_transform_ptr
- {
-    png_debug(1, "in png_set_read_user_transform_fn");
- 
--   if (!png_rtran_ok(png_ptr, 0))
--      return;
--
- #ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
-    png_ptr->transformations |= PNG_USER_TRANSFORM;
-    png_ptr->read_user_transform_fn = read_user_transform_fn;
-diff --git a/pngtrans.c b/pngtrans.c
-index b532172..f822324 100644
---- a/pngtrans.c
-+++ b/pngtrans.c
-@@ -782,6 +782,17 @@ png_set_user_transform_info(png_structrp png_ptr, png_voidp
- 
-    if (png_ptr == NULL)
-       return;
-+
-+#ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
-+   if ((png_ptr->mode & PNG_IS_READ_STRUCT) != 0 &&
-+      (png_ptr->flags & PNG_FLAG_ROW_INIT) != 0)
-+   {
-+      png_app_error(png_ptr,
-+            "info change after png_start_read_image or png_read_update_info");
-+      return;
-+   }
-+#endif
-+
-    png_ptr->user_transform_ptr = user_transform_ptr;
-    png_ptr->user_transform_depth = (png_byte)user_transform_depth;
-    png_ptr->user_transform_channels = (png_byte)user_transform_channels;
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.1.bb b/meta/recipes-multimedia/libpng/libpng_1.6.2.bb
similarity index 61%
rename from meta/recipes-multimedia/libpng/libpng_1.6.1.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.2.bb
index 6f9fb09..7a19313 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.1.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.2.bb
@@ -3,17 +3,16 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8273188b2e21c831f5a09fd9285db62f \
-                    file://png.h;beginline=207;endline=321;md5=de107fb61766e9d826943f3b6a354fc9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b7c6b3f443bd29d45da5575f36293606 \
+                    file://png.h;beginline=207;endline=321;md5=f8e34d28a077eca674b739ded0de063c"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
            file://0001-configure-lower-automake-requirement.patch \
-           file://transform.patch \
           "
-SRC_URI[md5sum] = "93fc0b0841ce2db0e6756673e22dafc3"
-SRC_URI[sha256sum] = "5ef57f8b9ef591c8504e2a8f78d31779f0c8f2b34b34d01d533360d2483c8946"
+SRC_URI[md5sum] = "9d838f6fca9948a9f360a0cc1b516d5f"
+SRC_URI[sha256sum] = "1c97a90bc22107e50f04f77a0115f4ec890d5c6a373ac4c560e8fb87259e92de"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.9.5


