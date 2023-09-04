Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB01C83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 16:50:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.1658.1693846243580596850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 09:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q4mIb5AC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401187f8071so10877225e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693846242; x=1694451042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYbc9FRZ2z5sG209ILHoXYu+cvUPviouT0b93EiJ+tk=;
        b=Q4mIb5ACxA0cG+NsOnVzM2JD7fKRx7uw+eZjCzt+MuuOl18RlY9jBfmdPvbbWhReEE
         vbq59bXzt3CBkDpqoR5KhVFYwXE6K/A67v9RJhXM9CGf97w8dxUfyD4R2I/s7thOZjko
         KlxHR0ruCe2LcFBJlWZDJpCWtUkTh+e0veaQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846242; x=1694451042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYbc9FRZ2z5sG209ILHoXYu+cvUPviouT0b93EiJ+tk=;
        b=K5v2PKqbAQCshw9kIJK/50cnw5atwVtd2n0aTR+TfCjXvRJyJVdBBEDIOHyj5Py0Z5
         EVEHJyGpLaOjrORXl2cagmR7SsxmfnRRacCcRy8yiVQfee0KXsN+AcwHnh0JjaZLYpMs
         S/abotOZETyib53qjhyBpGX9GKqT30k0Cj9iiikayWJb/2jNimwcje76JzyuiHoTNvCN
         /z4ihBrt8Vh/n4xkGU9vLfz1V2a7g7l797brZ/r2s2YwTgHV2+xYLoieaq07T1xyqHKH
         CYkkjWs2CXiL+/ZtaQ7VIbsvoWXs5slNWdLrJ94HKZPLiAoHXwlD5/gmm6fSEvjp65W+
         TT3A==
X-Gm-Message-State: AOJu0YymH/qotJ8dZFQyGMr+8zKmGWiSLp8fRR6/hpdKPNSWF4OFZnN1
	HWW+hl/j9GTM3PCP3eqj9DbUEI21R+VnId21GdA=
X-Google-Smtp-Source: AGHT+IFPb8eP+BPwXiPR+8rY5vMkyqCoCqRyQT+VP8nmWYWIIH9TlfSP8Y9Ravr3C7uf9mzwRvfllw==
X-Received: by 2002:a1c:750a:0:b0:3f6:d90:3db with SMTP id o10-20020a1c750a000000b003f60d9003dbmr8015277wmc.3.1693846241464;
        Mon, 04 Sep 2023 09:50:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:29e1:34bc:352d:65c])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003fef6881350sm15080413wms.25.2023.09.04.09.50.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 09:50:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-numpy: Attempt to fix reproducibility issue
Date: Mon,  4 Sep 2023 17:50:40 +0100
Message-Id: <20230904165040.2721727-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 16:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187192

We've seen reproducibility failures where it appears an extra -O3 compiler flag ends
up in the multiarray library compilation. This can only really have come through
extra_info for BLASS support since it only affects just this library. Rather than
try and track down exactly where this came from in a rabbit warren of code, just
disable this since we don't have any of the dependencies anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-numpy/disable_blas.patch   | 37 +++++++++++++++++++
 .../python/python3-numpy_1.25.2.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/disable_blas.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/disable_blas.patch b/meta/recipes-devtools/python/python3-numpy/disable_blas.patch
new file mode 100644
index 00000000000..09d65e84190
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/disable_blas.patch
@@ -0,0 +1,37 @@
+We've seen reproducibility failures where it appears an extra -O3 compiler flag ends
+up in the multiarray library compilation. This can only really have come through
+extra_info since it only affects just this library. Rather than try and track
+down exactly where this came from in a rabbit warren of code, just disable
+this since we don't have any of the dependencies.
+
+Upstream-Status: Inappropriate [OE specific config hack]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: numpy-1.25.2/numpy/core/setup.py
+===================================================================
+--- numpy-1.25.2.orig/numpy/core/setup.py
++++ numpy-1.25.2/numpy/core/setup.py
+@@ -755,22 +755,7 @@ def configuration(parent_package='',top_
+             join('src', 'common', 'npy_cpu_features.c'),
+             ]
+ 
+-    if os.environ.get('NPY_USE_BLAS_ILP64', "0") != "0":
+-        blas_info = get_info('blas_ilp64_opt', 2)
+-    else:
+-        blas_info = get_info('blas_opt', 0)
+-
+-    have_blas = blas_info and ('HAVE_CBLAS', None) in blas_info.get('define_macros', [])
+-
+-    if have_blas:
+-        extra_info = blas_info
+-        # These files are also in MANIFEST.in so that they are always in
+-        # the source distribution independently of HAVE_CBLAS.
+-        common_src.extend([join('src', 'common', 'cblasfuncs.c'),
+-                           join('src', 'common', 'python_xerbla.c'),
+-                          ])
+-    else:
+-        extra_info = {}
++    extra_info = {}
+ 
+     #######################################################################
+     #             _multiarray_umath module - multiarray part              #
diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.2.bb b/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
index 0c6c0a32874..4793b23a38c 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
@@ -10,6 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://disable_blas.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "fd608e19c8d7c55021dffd43bfe5492fab8cc105cc8986f813f8c3c048b38760"
-- 
2.39.2


