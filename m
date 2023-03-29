Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE05C761A6
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 22:34:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.11713.1680129240166741148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 15:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UGjdGbl1;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so17752688pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680129239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFo2dsU+pxy/Ia9y16gCTjVqYsqOBsQIlzPwX/F9b1o=;
        b=UGjdGbl1TJiRtWIopFal7cjZDDH2CM041Q+mesybjIfaHqd3I9JB9ScLA7FnoOBZ7U
         690w1m12/o12f2ZBx7N+SVSZ3mxDM+vf5wEHKy3k5jQaV83SZAyzodrVfev67z42XU7d
         Lyn/gEZttVS2vV4sX9/8OHo2F7d/LtIR9pm5U/LJc9iQFCeVVRqILPphi8NcsuswLvsf
         xV467KpbtNGFTA/QDziqbciD321vCNZtfKwyy+2nL3BBZoHs0Lix/wJb/0hUCB7BAdyk
         6LkoTQoYWjSmE2OCp+nrN1XSjVIQ6DRYlRT7uJjwf2sKjA/rXUHrS31dMqEA1hmZdm7v
         Kgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680129239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFo2dsU+pxy/Ia9y16gCTjVqYsqOBsQIlzPwX/F9b1o=;
        b=pr8XGaZkXaeDlAIF+8IBX0BAMGJuePSn5QQ1UYdGgFoQhPrcrFenemWrKg34U620kg
         MMoUwJJheSYpZDEj8Ve3IoLhoD3tJwF6qRzprDLD81//psSFNf4eyCCH85UClboSp7gD
         iG9AN1fzO9QvEZ2BP+g3OTMbrD5abtXyy0cP6u/zgdD86Jyfqa49+m0mfWAVomWrFvZt
         T7+NLzvcAt6aHYG2XkyYADaCc82sh+9YFEDc3LrR4M8JSt9zuKg+wSv1BPPpRDxVMOFk
         p+GmuElcGw6AB02HpdVaxRr5EP2EL6ZIoLEa96UvASlmNN1lYxZFYfLb0iC+ou/LBC5b
         ztZQ==
X-Gm-Message-State: AAQBX9fSg9HSMtv54un7xbZYCN1Zp7LsmSaJxj8ukZvLcVmmurzG2yGj
	AveVSJnGQ/bLf6YG43fl3oIaleBvJ5hprg==
X-Google-Smtp-Source: AKy350ZsmxaIOA8ARurRlZkVnyo+Z7cIskC7M9WmNhpVHKYHaPC/xEpFWX4xjKcan6Oq8OuD9hz9eA==
X-Received: by 2002:a17:90b:1a8f:b0:23b:3682:c899 with SMTP id ng15-20020a17090b1a8f00b0023b3682c899mr21758219pjb.23.1680129238860;
        Wed, 29 Mar 2023 15:33:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090a2e0b00b00240aff612f0sm1700714pjd.5.2023.03.29.15.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 15:33:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gpgme: Use 64bit off_t consistently
Date: Wed, 29 Mar 2023 15:33:55 -0700
Message-Id: <20230329223355.2190782-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 22:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179299

swig needs this defined as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Ensure-64bit-off_t-is-used.patch     | 35 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.18.0.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Ensure-64bit-off_t-is-used.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Ensure-64bit-off_t-is-used.patch b/meta/recipes-support/gpgme/gpgme/0001-Ensure-64bit-off_t-is-used.patch
new file mode 100644
index 0000000000..59a6e818ec
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-Ensure-64bit-off_t-is-used.patch
@@ -0,0 +1,35 @@
+From 4449b70eb1d89ee71b45bf9f113016f969d0ed38 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2023 15:31:20 -0700
+Subject: [PATCH] Ensure 64bit off_t is used
+
+This ensures that consistent off_t is used across python modules and
+main gpgme
+
+Fixes
+| swig -python -threads -py3 -DHAVE_CONFIG_H=1 -DHAVE_DATA_H=1 -DIN_TREE_BUILD=1 -Ipython3-gpg -outdir python3-gpg/lib.linux-x86_64-3.11/gpg -o python3-gpg/gpgme_wrap.c python3-gpg/gpgme.i
+| Deprecated command line option: -py3. Ignored, this option is no longer supported.
+| python3-gpg/gpgme.h:111: Error: CPP #error "GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section "Largefile support (LFS)" in the GPGME manual.". Use the -cpperraswarn option to continue swig processing.
+| error: command '/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux-musl/gpgme/1.18.0-r0/recipe-sysroot-native/usr/bin/swig' failed with exit code 1
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lang/python/setup.py.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
+index 006216d..3c540d5 100755
+--- a/lang/python/setup.py.in
++++ b/lang/python/setup.py.in
+@@ -52,6 +52,7 @@ if top_builddir:
+         HAVE_CONFIG_H=1,
+         HAVE_DATA_H=1,
+         IN_TREE_BUILD=1,
++        _FILE_OFFSET_BITS=64,
+     )
+ 
+ if hasattr(subprocess, 'DEVNULL'):
+-- 
+2.40.0
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index a7b0de44a5..1a7a21f7cc 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
+           file://0001-Ensure-64bit-off_t-is-used.patch \
            "
 
 SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
-- 
2.40.0


