Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dXqzaaH+GZk8B2q+1Zu4fCL7TJg/xpwqHocg/sNdhmrPfvqFlZ00m32vOs5ncJkg49Gh8V9vIP
 mDgmceacjmSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628801"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628801"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:25 -0700
IronPort-SDR: 3QP1wVra/fd2Y8GwiH/bIuxu7c14Whb7WmlVHAazvcvn0TlN5Y5GtdHaJ/+rkyKEbHESNF+krK
 K27aEOq5KfNQ==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801566"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:24 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 04/10] libjpeg-turbo: Fix CVE-2020-13790
Date: Thu,  2 Jul 2020 08:54:06 +0800
Message-Id: <90f4e2f299d8cd6c839b73307dc7b0ec3d389294.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "jason.lau" <Haitao.Liu@windriver.com>

libjpeg-turbo 2.0.4 has a heap-based buffer over-read
in get_rgb_row() in rdppm.c via a malformed PPM input file.

Upstream-Status: Backport
[https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a]

CVE:CVE-2020-13790

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...buf-overrun-caused-by-bad-binary-PPM.patch | 81 +++++++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.3.bb               |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch

diff --git a/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
new file mode 100644
index 0000000000..03b6dba153
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch
@@ -0,0 +1,81 @@
+From ade1818b7542ef9e11ece5ce98df91fab45d674c Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2020-13790
+
+Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
+---
+ ChangeLog.md | 20 ++++++++++++++++----
+ rdppm.c      |  4 ++--
+ 2 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 3667d12..198c7b8 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -1,3 +1,15 @@
++2.0.4
++=====
++
++### Significant changes relative to 2.0.3:
++
++1. Fixed an issue in the PPM reader that caused a buffer overrun in cjpeg,
++TJBench, or the `tjLoadImage()` function if one of the values in a binary
++PPM/PGM input file exceeded the maximum value defined in the file's header and
++that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
++similar fix for binary PPM/PGM files with maximum values greater than 255.
++
++
+ 2.0.3
+ =====
+ 
+@@ -520,10 +532,10 @@ application was linked against.
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
+-- 
+2.17.0
+
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
index 1cf854de62..8ea81f386f 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
@@ -12,6 +12,7 @@ DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
+           file://0001-rdppm.c-Fix-buf-overrun-caused-by-bad-binary-PPM.patch \
            "
 
 SRC_URI[md5sum] = "bd07fddf26f9def7bab02739eb655116"
-- 
2.25.4

