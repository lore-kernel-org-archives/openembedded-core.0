Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A78EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:00:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.18932.1687964451762189245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TPqsBY0p;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-98df69cacd1so425863066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687964450; x=1690556450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pVmQA9NCyz4BFB1rQO+2CFZ4gfgkJMmZJG9EG+O/Mo=;
        b=TPqsBY0p5n8Ntll8m4nHI0l0rgyVeitAoa+2GNNajg+VFitlY3SaV5DpDIxm08h9nq
         B+oIKRShUqsW78r1mJZ7UPEXn/r6P+XRQIKvqqHIU0ZIsXeAhoujy30lkFzSqm6Ucu9K
         qOF7/AUSBUEflfnaptP7Y22fZGxuu3C84A4ruvApY5edkG7lm7iq+jXbunB1DQRxh423
         g58g7yTNCUOAycZIHW2QbQkP3u2FOO2DNLWiEhowzpDoubE3VdqxhjQ3Uc7BdkcxYCFd
         xCfPvEt8iH/eN9qRhra41uoifGppjFYUTgIecf1z6N4US5pTfh4FUF2Xtplz8GlRd/Gv
         s5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964450; x=1690556450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pVmQA9NCyz4BFB1rQO+2CFZ4gfgkJMmZJG9EG+O/Mo=;
        b=IbWmZFVldYU0smOko7XcHzp/9RaCFC4cHHPfuGyOpdzVVGzKBjbeknZnlDPKm2Q1IQ
         XAxBr/po8G6jMG7oQAgmwdlizGMd5YyxWcBtCE/xFPRVMy3q7ZcTzHcUocl5CY3P+C0E
         ifHmisMTQk9i8R5pE7omw080FuRX5LiMFQeHJbF+nQCuQLptnIV5msOE/f3keRd/gxlu
         gxqWFU6X8OtsBcRCPJlsbpD5nTRAuLfvaEa0U2WczRHevEzfBR+P47D55noaagQB9+gZ
         QdIE1Y/DnNghknngjYtMXduVVEOwb/Jm71gDyvQAqZQieILlHixelcw3RKgM4FXNFV2w
         fqQg==
X-Gm-Message-State: AC+VfDyl2195kKjxsUqldPhSsrS+FTfaZonFk33tlQJk9dpbNcx2P60e
	KunQuTKNZYP0m8jGSPl5d5+jrdLPahMecg==
X-Google-Smtp-Source: ACHHUZ6Tzisv4/M59w4VtmirLOjlXCSJG8B2DsXYrjd3k6t928XmJsZYekGfEGk88udQ6OOXTOmC9Q==
X-Received: by 2002:a17:906:72db:b0:992:a3d9:a7a0 with SMTP id m27-20020a17090672db00b00992a3d9a7a0mr17729ejl.68.1687964449992;
        Wed, 28 Jun 2023 08:00:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906720300b009926928d486sm969433ejk.35.2023.06.28.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:00:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] python3-cryptography: update a patch to upstream's better followup fix
Date: Wed, 28 Jun 2023 17:00:42 +0200
Message-Id: <20230628150043.70814-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230628150043.70814-1-alex@linutronix.de>
References: <20230628150043.70814-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183590

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-directory-when-cross-compiling-9129.patch | 52 +++++++++++++++++++
 ...i-substitute-include-path-from-targe.patch | 29 -----------
 .../python/python3-cryptography_41.0.1.bb     |  2 +-
 3 files changed, 53 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch
new file mode 100644
index 00000000000..d720359ded7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9129.patch
@@ -0,0 +1,52 @@
+From 2f9cd402d3293f6efe0f3ac06f17c6c14edbed86 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 25 Jun 2023 17:39:19 -0600
+Subject: [PATCH] Fix include directory when cross compiling (#9129)
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/pull/9129]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/rust/cryptography-cffi/build.rs | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/rust/cryptography-cffi/build.rs b/src/rust/cryptography-cffi/build.rs
+index 07590ad2e..384af1ddb 100644
+--- a/src/rust/cryptography-cffi/build.rs
++++ b/src/rust/cryptography-cffi/build.rs
+@@ -47,9 +47,14 @@ fn main() {
+     )
+     .unwrap();
+     println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
+-    let python_include = run_python_script(
++    let python_includes = run_python_script(
+         &python,
+-        "import sysconfig; print(sysconfig.get_path('include'), end='')",
++        "import os; \
++         import setuptools.dist; \
++         import setuptools.command.build_ext; \
++         b = setuptools.command.build_ext.build_ext(setuptools.dist.Distribution()); \
++         b.finalize_options(); \
++         print(os.pathsep.join(b.include_dirs), end='')",
+     )
+     .unwrap();
+     let openssl_include =
+@@ -59,12 +64,15 @@ fn main() {
+     let mut build = cc::Build::new();
+     build
+         .file(openssl_c)
+-        .include(python_include)
+         .include(openssl_include)
+         .flag_if_supported("-Wconversion")
+         .flag_if_supported("-Wno-error=sign-conversion")
+         .flag_if_supported("-Wno-unused-parameter");
+ 
++    for python_include in env::split_paths(&python_includes) {
++        build.include(python_include);
++    }
++
+     // Enable abi3 mode if we're not using PyPy.
+     if python_impl != "PyPy" {
+         // cp37 (Python 3.7 to help our grep when we some day drop 3.7 support)
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch b/meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch
deleted file mode 100644
index 1a60abada79..00000000000
--- a/meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 04aac6c88152088778c6551dfa86b2fc446dc61c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 19 Jun 2023 13:27:28 +0200
-Subject: [PATCH] cryptography-cffi: substitute include path from target
- sysroot
-
-Upstream-Status: Accepted [https://github.com/pyca/cryptography/pull/9105]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/rust/cryptography-cffi/build.rs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rust/cryptography-cffi/build.rs b/src/rust/cryptography-cffi/build.rs
-index 4a40990..08abb95 100644
---- a/src/rust/cryptography-cffi/build.rs
-+++ b/src/rust/cryptography-cffi/build.rs
-@@ -48,7 +48,7 @@ fn main() {
-     println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
-     let python_include = run_python_script(
-         &python,
--        "import sysconfig; print(sysconfig.get_path('include'), end='')",
-+        "import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'), end='')",
-     )
-     .unwrap();
-     let openssl_include =
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
index fc4f70246be..494ca233f00 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 SRC_URI[sha256sum] = "d34579085401d3f49762d2f7d6634d6b6c2ae1242202e860f4d26b046e3a1006"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
-            file://0001-cryptography-cffi-substitute-include-path-from-targe.patch \
+            file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
-- 
2.30.2


