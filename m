Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D121C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 12:50:55 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.18801.1716295849509947103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 05:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kbfg83w4;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59b49162aeso827173466b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716295848; x=1716900648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPNcM1xdWejvI+BC1btAiA9YQq7o6vAKPdbz5T/xGJw=;
        b=Kbfg83w4vpVRIbN+B/7hfLuoZ4t3HZdQlgxt4aHArJ0ch2s8HWNhWwL0OvcHg5Q1j4
         BJ+WW3Z6cLrblA+EHhOGDSbnbNhKnd1+ceR/tHN/2KxLn++q8a8qOiC1z6t7de/Yvjei
         gmf5j0uZlaKqdbJ76Dr3PaAIVnFyqeeRjwYn6colxdl8bTa/xjUDt0GwEbGGHZJ++YN0
         WPcI9W+awdV1o1dj8/IpbWaY6eZ4RvaPxhgHeqFc2rirKzO4BtvOcxuqYErYtm3CdYOn
         FDHM89xnPtZ9N2WxgVnb++f83Mvn7yeFVhR05UxcOODEMEH5nNVRrfVlAA7vZw22tD7u
         kfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716295848; x=1716900648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPNcM1xdWejvI+BC1btAiA9YQq7o6vAKPdbz5T/xGJw=;
        b=rcS/31YCX0Djg3UzdCVLwHuTfTawTs6WxgchASsVs2e7r1EYamQJAVnX1o5U1f8St2
         MyjSb3TDJLH6pJG2SHPBKlL+Z6wuYsFOmlNdb+mLqq4LIiClxIxt8OzLiUFRA+8D7hmX
         7T1UCqTTKhjw812wO5ex0wL6U7jL4f7qwUGYywnqIL39tAKB1AN6uKy/4rvMa8KClHHk
         KezvvkL/704f/haT4kc+PW5LEuDqsok5SvbZ+RfMcRW3g9BqbfrTqbk3Rd0k8Muvhg0o
         KwE4znbR8olJykKIKBCB1T9z8v9HXBFY/h0vgaamzBrmI7d3lzCQYu1Uqm0oc7bOo1Cy
         UBKA==
X-Gm-Message-State: AOJu0Yzj6VZTjmxgyZhXb2f6wXPFOhc+kzgdZrox7VYnUbcWtHUUd1r/
	R4oknS9yGsvS0Wb3VNJmiFHdhVDGX8ZdeZYKG1QV3ZNLg5We3eOMMOlymg==
X-Google-Smtp-Source: AGHT+IFSTErMR5DQmr9I3vbmR65hlcVudh8D3ApYXpTXs4Ruyay0Oh7M/htAKtVVvdjvqyhTRTgUxg==
X-Received: by 2002:a17:906:305a:b0:a59:db0f:6be4 with SMTP id a640c23a62f3a-a5a2d534ec4mr2049361166b.5.1716295847626;
        Tue, 21 May 2024 05:50:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d294sm1595584166b.28.2024.05.21.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:50:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/5] rust: use rust-snapshot binaries only in rust-native
Date: Tue, 21 May 2024 14:50:39 +0200
Message-Id: <20240521125041.3611820-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521125041.3611820-1-alex.kanavin@gmail.com>
References: <20240521125041.3611820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199634

From: Alexander Kanavin <alex@linutronix.de>

Otherwise, use rust-native and cargo-native binaries as that allows
our native tweaks in them to be used for target/nativesdk rust -
same as for everything else written in rust.

In particular, this allows building target rust with
cargo-native that includes important reproducibility tweaks.

Unfortunately, this also breaks rust selftest, and that
is partially addressed by the following commit.

[YOCTO #15185]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index 8ef838ee90c..e82a7395e44 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -11,6 +11,11 @@ DEPENDS += "file-native python3-native"
 DEPENDS:append:class-native = " rust-llvm-native"
 DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
 
+# native rust uses cargo/rustc from binary snapshots to bootstrap
+# but everything else should use our native builds
+DEPENDS:append:class-target = " cargo-native rust-native"
+DEPENDS:append:class-nativesdk = " cargo-native rust-native"
+
 DEPENDS += "rust-llvm (=${PV})"
 
 RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
@@ -68,6 +73,11 @@ addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
+RUSTC_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/rustc"
+CARGO_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/cargo"
+RUSTC_BOOTSTRAP:class-native = "${WORKDIR}/rust-snapshot/bin/rustc"
+CARGO_BOOTSTRAP:class-native = "${WORKDIR}/rust-snapshot/bin/cargo"
+
 python do_configure() {
     import json
     import configparser
@@ -141,10 +151,10 @@ python do_configure() {
     config.set("build", "docs", e(False))
     config.set("build", "tools", ["rust-demangler",])
 
-    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
+    rustc = d.getVar('RUSTC_BOOTSTRAP')
     config.set("build", "rustc", e(rustc))
 
-    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    cargo = d.getVar('CARGO_BOOTSTRAP')
     config.set("build", "cargo", e(cargo))
 
     config.set("build", "vendor", e(True))
-- 
2.39.2


