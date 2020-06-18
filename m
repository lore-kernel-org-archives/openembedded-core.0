Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3075.1592469166696105590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 01:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: haitao.liu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05I8WB9R024143
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 01:32:35 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 01:32:13 -0700
From: "jason.lau" <Haitao.Liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <haitao.liu@windriver.com>
Subject: [OE-core][zeus][PATCH] libjpeg-turbo: Fix CVE-2020-13790
Date: Thu, 18 Jun 2020 16:31:36 +0800
Message-ID: <1592469096-110049-1-git-send-email-haitao.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

libjpeg-turbo 2.0.4 has a heap-based buffer over-read
in get_rgb_row() in rdppm.c via a malformed PPM input file.

Upstream-Status: Backport
[https://github.com/libjpeg-turbo/libjpeg-turbo/commit/3de15e0c344d11d4b90f4a47136467053eb2d09a]

CVE:CVE-2020-13790

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
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
2.17.0

