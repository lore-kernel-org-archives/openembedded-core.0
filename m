Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B0EE82CA0
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:56:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.30141.1696024578578568878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JjlfiSNp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-406609df1a6so8489375e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696024577; x=1696629377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGL9j5r308mPvNax/fjNdPtWoAMjvoiRoxns7eDHuGw=;
        b=JjlfiSNpEDIsHS5G/esnOtgRE9k7UkmL+e7NwvaX++Yc5JevQt8IuyPXnJ8XSPj12p
         lWLyqfg50pNtNC4J6153b5iFlXRVcCbepliN6LrCb+S5vXbSX5t/fqpLT3NZQKiV6tSQ
         pPPkw9YEO8UeIsYq2N+Cs8OEVs+eEX85Q3P+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024577; x=1696629377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGL9j5r308mPvNax/fjNdPtWoAMjvoiRoxns7eDHuGw=;
        b=jgPYiE2QAKky5omoHkiibBuvUMke/BvhXp1G7o+wss9zmaS8unpH9dXqSVsG+RvzbV
         xr4x9SloG+WEhVD9OVSQHVObgDA7/LKI7Gzar6oS6BLI0lMeZlUW+lb1laNA2MiMVI7b
         98tGcktEYfQux3U48ZVWuYiMc6aui9BoffYzDn1YKnNQtAcf+za6MW0nK99Z5pKvnhd7
         ArBeySeuHOEiRUWx4n6jU4WC89FQ4YwKj4eKX468fjiPkQQcLp2KFzcz+9MwygEoHVx+
         idh3+f0bBpxmrPtktBiULKR4SBKFUHkYarZmxM7yTw8Ae9sO9KBeKzDkVsBGMhsvXQLx
         PorQ==
X-Gm-Message-State: AOJu0YxAh+rQuOAJ4fhOEvus7xw4U5C2uWB1QyQLFOW1dwAJnk/FtZMD
	+WOJVnLxBQ9bT2xVJKHFd1mgNJbfmHzmwTK5lLU=
X-Google-Smtp-Source: AGHT+IG5DPHqFcU/m9iZf6XWL5o7Py0TNU5z1nUKxcr1QtV8QGurob2fg+z9UG+9IVh8d28Ay/YedQ==
X-Received: by 2002:a1c:7c05:0:b0:403:cc79:44f3 with SMTP id x5-20020a1c7c05000000b00403cc7944f3mr5669693wmc.19.1696024576493;
        Fri, 29 Sep 2023 14:56:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a077:4896:f66b:df48])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm8297567wrn.114.2023.09.29.14.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:56:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-numpy: Fix reproducibility issue
Date: Fri, 29 Sep 2023 22:56:15 +0100
Message-Id: <20230929215615.2543438-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 21:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188447

Add a patch to fix the reproducibility issue being seen during testing. The issue
is from a poor choice of regex against the compiler flags, being triggered by
different path names.

Drop the previous attempt at fixing this as it wasn't that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-numpy/disable_blas.patch   | 37 -------------------
 .../python3-numpy/fix_reproducibility.patch   | 33 +++++++++++++++++
 .../python/python3-numpy_1.26.0.bb            |  2 +-
 3 files changed, 34 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/disable_blas.patch
 create mode 100644 meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/disable_blas.patch b/meta/recipes-devtools/python/python3-numpy/disable_blas.patch
deleted file mode 100644
index 09d65e84190..00000000000
--- a/meta/recipes-devtools/python/python3-numpy/disable_blas.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-We've seen reproducibility failures where it appears an extra -O3 compiler flag ends
-up in the multiarray library compilation. This can only really have come through
-extra_info since it only affects just this library. Rather than try and track
-down exactly where this came from in a rabbit warren of code, just disable
-this since we don't have any of the dependencies.
-
-Upstream-Status: Inappropriate [OE specific config hack]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: numpy-1.25.2/numpy/core/setup.py
-===================================================================
---- numpy-1.25.2.orig/numpy/core/setup.py
-+++ numpy-1.25.2/numpy/core/setup.py
-@@ -755,22 +755,7 @@ def configuration(parent_package='',top_
-             join('src', 'common', 'npy_cpu_features.c'),
-             ]
- 
--    if os.environ.get('NPY_USE_BLAS_ILP64', "0") != "0":
--        blas_info = get_info('blas_ilp64_opt', 2)
--    else:
--        blas_info = get_info('blas_opt', 0)
--
--    have_blas = blas_info and ('HAVE_CBLAS', None) in blas_info.get('define_macros', [])
--
--    if have_blas:
--        extra_info = blas_info
--        # These files are also in MANIFEST.in so that they are always in
--        # the source distribution independently of HAVE_CBLAS.
--        common_src.extend([join('src', 'common', 'cblasfuncs.c'),
--                           join('src', 'common', 'python_xerbla.c'),
--                          ])
--    else:
--        extra_info = {}
-+    extra_info = {}
- 
-     #######################################################################
-     #             _multiarray_umath module - multiarray part              #
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
new file mode 100644
index 00000000000..d952aed00c6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -0,0 +1,33 @@
+This regex decides whether to use O3 opimisation on numpy or not.
+
+It includes "od", which happens to be a substring of "reproducible"
+but not "qemux86-world". 
+
+The regex will run against all compiler options including things like:
+
+-fmacro-prefix-map=/XXX/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.0/numpy-1.26.0=/usr/src/debug/python3-numpy/1.26.0-r0
+
+i.e. including build paths.
+
+Reduce the regex to something deterministic for our builds, assuming
+nobody builds in /home/debug:full/
+
+The autobuilder race depended upon whether qemux86-world or the
+reproducible target ran first and won the race to populate sstate.
+
+Upstream-Status: Inappropriate [upstream have dropped distutils and switched to meson]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: numpy-1.26.0/numpy/distutils/ccompiler_opt.py
+===================================================================
+--- numpy-1.26.0.orig/numpy/distutils/ccompiler_opt.py
++++ numpy-1.26.0/numpy/distutils/ccompiler_opt.py
+@@ -990,7 +990,7 @@ class _CCompiler:
+             ("cc_is_nocc",     "", ""),
+         )
+         detect_args = (
+-           ("cc_has_debug",  ".*(O0|Od|ggdb|coverage|debug:full).*", ""),
++           ("cc_has_debug",  ".*debug:full.*", ""),
+            ("cc_has_native",
+                 ".*(-march=native|-xHost|/QxHost|-mcpu=a64fx).*", ""),
+            # in case if the class run with -DNPY_DISABLE_OPTIMIZATION
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
index a1f398338ee..e6aaafe7dd4 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
@@ -10,7 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
-           file://disable_blas.patch \
+           file://fix_reproducibility.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "f93fc78fe8bf15afe2b8d6b6499f1c73953169fad1e9a8dd086cdff3190e7fdf"
-- 
2.39.2


