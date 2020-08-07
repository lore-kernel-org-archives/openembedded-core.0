Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3016.1596793522486784343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: zBgezWh8dtyZTop93gtYoBa7y8jz5BSOl2IKr6k1mCrg1K2KpWUFsGzOdCwbNy/DRV7fI695Av
 Yc7Si7iqFSqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="132602544"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; 
   d="scan'208";a="132602544"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2020 02:45:23 -0700
IronPort-SDR: KGDCflv2ZUU7dGKLbQwJKQUXusYokIlYrKtuXeZ/MLJpgwhX2xSxPI41jAuAj6W03sC/uyIR5G
 D9cgmvkBNOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; 
   d="scan'208";a="333496891"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 02:45:22 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 3/4] libjpeg-turbo: fix CVE-2020-13790
Date: Fri,  7 Aug 2020 17:45:18 +0800
Message-Id: <20200807094519.6436-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094519.6436-1-chee.yang.lee@intel.com>
References: <20200807094519.6436-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../jpeg/files/CVE-2020-13790.patch           | 76 +++++++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2020-13790.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2020-13790.patch b/meta/recipes-graphics/jpeg/files/CVE-2020-13790.patch
new file mode 100644
index 0000000000..4617978bdc
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2020-13790.patch
@@ -0,0 +1,76 @@
+From 07caad7e0a9afb372e0608299fb3e832cc78495f Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 2 Jun 2020 14:15:37 -0500
+Subject: [PATCH] rdppm.c: Fix buf overrun caused by bad binary PPM
+
+This extends the fix in 1e81b0c3ea26f4ea8f56de05367469333de64a9f to
+include binary PPM files with maximum values < 255, thus preventing a
+malformed binary PPM input file with those specifications from
+triggering an overrun of the rescale array and potentially crashing
+cjpeg, TJBench, or any program that uses the tjLoadImage() function.
+
+Fixes #433
+
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a]
+CVE: CVE-2020-13790
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ ChangeLog.md | 14 ++++++++++----
+ rdppm.c      |  4 ++--
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 4d1219e..af660ab 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -38,6 +38,12 @@ this issue did not likely pose a security risk.
+ separate read-only data section rather than in the text section, to support
+ execute-only memory layouts.
+ 
++3. Fixed an issue in the PPM reader that caused a buffer overrun in cjpeg,
++TJBench, or the `tjLoadImage()` function if one of the values in a binary
++PPM/PGM input file exceeded the maximum value defined in the file's header and
++that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
++similar fix for binary PPM/PGM files with maximum values greater than 255.
++
+ 
+ 2.0.3
+ =====
+@@ -562,10 +568,10 @@ application was linked against.
+ 
+ 3. Fixed a couple of issues in the PPM reader that would cause buffer overruns
+ in cjpeg if one of the values in a binary PPM/PGM input file exceeded the
+-maximum value defined in the file's header.  libjpeg-turbo 1.4.2 already
+-included a similar fix for ASCII PPM/PGM files.  Note that these issues were
+-not security bugs, since they were confined to the cjpeg program and did not
+-affect any of the libjpeg-turbo libraries.
++maximum value defined in the file's header and that maximum value was greater
++than 255.  libjpeg-turbo 1.4.2 already included a similar fix for ASCII PPM/PGM
++files.  Note that these issues were not security bugs, since they were confined
++to the cjpeg program and did not affect any of the libjpeg-turbo libraries.
+ 
+ 4. Fixed an issue whereby attempting to decompress a JPEG file with a corrupt
+ header using the `tjDecompressToYUV2()` function would cause the function to
+diff --git a/rdppm.c b/rdppm.c
+index 87bc330..a8507b9 100644
+--- a/rdppm.c
++++ b/rdppm.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2009 by Bill Allombert, Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2015-2017, D. R. Commander.
++ * Copyright (C) 2015-2017, 2020, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+  *
+@@ -720,7 +720,7 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
+     /* On 16-bit-int machines we have to be careful of maxval = 65535 */
+     source->rescale = (JSAMPLE *)
+       (*cinfo->mem->alloc_small) ((j_common_ptr)cinfo, JPOOL_IMAGE,
+-                                  (size_t)(((long)maxval + 1L) *
++                                  (size_t)(((long)MAX(maxval, 255) + 1L) *
+                                            sizeof(JSAMPLE)));
+     half_maxval = maxval / 2;
+     for (val = 0; val <= (long)maxval; val++) {
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 1f49fd3d3b..3005a8a789 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -12,6 +12,7 @@ DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
+           file://CVE-2020-13790.patch \
            "
 
 SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
-- 
2.17.1

