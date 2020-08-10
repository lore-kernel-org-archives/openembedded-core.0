Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.37300.1597028417247123134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vCSqoX0t;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id d19so4090536pgl.10
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2vtrkSoxOyr4tDAp8UCD5Ti7k2L/Q331Qf+iFdDqaJE=;
        b=vCSqoX0t759PUqKVe7MLgxSjBkNYhIRfO92pKp+UDmpPHcGvImT+jFua7SKVyBZkks
         pt4X+WQ4dZ02ZMMGc2La//1xqwV97VaPKghSjYeileVr8rvRz0WSDKSPQ3nZpQwnWld3
         zmaDFTO8ZJ7NqKy6PJTthHtDatP3QxUt3Hh9E7TAspe6wKGTzn8TXFI4LE2MJrPjME1e
         5QE+VXFaCaAFLxxO/0seKIrP4nIjNpoMQOtra8Kl39zWdCxYlCy3IYEmXmrlDtAnkSly
         4O7znwnWnCAf9ixKaxS2MK5wboirbQrcLRu5/GJCmGh/SHpYekFmwX2CQ5iL+g41du8g
         YoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2vtrkSoxOyr4tDAp8UCD5Ti7k2L/Q331Qf+iFdDqaJE=;
        b=qbTWanhAXxqT4FAeyI/PxvEiZvSL5Udb9aePywUGdaKF1PEwTg0CpcsZg1fpHTN3m1
         /3WWOivVS6s3OL7ISwPRx15ze8Lm8X4CUK/rA0mzulbHKWSxNwKVSSEy3rJcvUhW1acb
         mJUY6DX20T3IOu6jlqC07PRIq1omMyFggV7gnKNT3HUScgD4NunSjVa8eoEwVyGWYpWT
         xDlDavGGazzfopGfKxqidRBiFuZyM4n6rEz1zi/+bh0lxeBoA77zgsMxrGsPzIzTGsr1
         PluepnuZ2mNPtZzU8KV1pxpZ9eXJ4WbTXxoDfK3RFehrCz5Gu8XR9ayNMC2EGSliaY31
         yz/A==
X-Gm-Message-State: AOAM533ggmisUBWzZDldr+Bkyk0res2LgkQ6WkShhY6q25hKj3Y1SPtR
	JqYkDcxygyLYa6RUcUPM+UITMWkGBE1q4w==
X-Google-Smtp-Source: ABdhPJx3ODjKwKsIv1h8rz/gWIeIvOwEOK6o3Wq4UO6ZuxL1SUGzIQuJFWJJpddJGeATkRYpH5GH3A==
X-Received: by 2002:a62:ce8c:: with SMTP id y134mr23523391pfg.236.1597028415747;
        Sun, 09 Aug 2020 20:00:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/19] libjpeg-turbo: fix CVE-2020-13790
Date: Sun,  9 Aug 2020 16:59:20 -1000
Message-Id: <d4662adbb34d8c4a23fe7f111c2c991b1aedeaef.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

