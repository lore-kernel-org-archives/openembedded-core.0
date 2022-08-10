Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7A6C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:00:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.661.1660168838171316768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YGvZ4nCC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z12so19263453wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=fdMoGYTqUVfdQzlkAreyKYncbc252enSJncamOkZIxQ=;
        b=YGvZ4nCC2An3eBKwnuCEx2Z5fzvK5/UTDouGCrok4XD8LeW2LwceA1u/1UyN4vemQA
         f/iiqrc4qINvlCctiksL4SpF4kqo1BRSkrfqwELa6pxvoKfa8aqwbUJF9Yruxu1j2U0l
         HTtA+viL01swb4vlrH/cV4xIekDYD0j4GJN3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=fdMoGYTqUVfdQzlkAreyKYncbc252enSJncamOkZIxQ=;
        b=WTHMHqF5VnMEl6XjBDq4gX4+hwXuO+rnPfgimTLVr3XzRWi2X9dGq2QKy9h9OpRA25
         TXmW1YXc77Icm/iO9+PDer77hQ9BsBFpf0C9krpX521ZlS7VLDyNulr8/HvaYDzoEJVq
         aNvgwxK7IlyhIXxubQoOe5kppjOtkH0eyI5M+lGcX1VBtDhSJpRggy20bYmUz/ZC76lW
         uze0PQcCPl5znHKcUj7MRVe7236ssIU5Lc4VRYbSyM3R11VajOHGF9B5bk/u28p5izmC
         PhAq3r5mV9WP1ifw5ET+m3fREd3N+fJ9ZkzZYC5j0LGLtGGIfL8cDc6Zybygma/35JDY
         229Q==
X-Gm-Message-State: ACgBeo1f0th9dnJiqG16P5wcyTxi3besDCPEYUYRqGA08w8ibezp/+p6
	GFnfytNeiGYYDLYulTihFOQ3XovhgHmpig==
X-Google-Smtp-Source: 
 AA6agR6AgQKw4LPc8LdaMHxDV8ur78pR/sZaBGqIIRA3NKWQNbRAR8XfkEGwoFjTFMlWxuKml+dtMg==
X-Received: by 2002:a05:6000:1a85:b0:221:7333:80d0 with SMTP id
 f5-20020a0560001a8500b00221733380d0mr15952016wry.177.1660168836106;
        Wed, 10 Aug 2022 15:00:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b003a5b746abd4sm2369956wmq.22.2022.08.10.15.00.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:00:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust: Remove unneeded RUST_TARGETGENS settings
Date: Wed, 10 Aug 2022 23:00:34 +0100
Message-Id: <20220810220034.507620-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:00:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169212

These match the default from the class so drop them. We then always
generate all targets so remove the configuration from the class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/rust-target-config.bbclass | 8 ++------
 meta/recipes-devtools/cargo/cargo.inc          | 2 --
 meta/recipes-devtools/rust/libstd-rs.inc       | 3 ---
 meta/recipes-devtools/rust/rust.inc            | 2 --
 4 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 35d83e0cd26..34050864023 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -378,16 +378,12 @@ do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH
 RUST_TARGETS_DIR = "${WORKDIR}/rust-targets/"
 export RUST_TARGET_PATH = "${RUST_TARGETS_DIR}"
 
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
 python do_rust_gen_targets () {
     wd = d.getVar('RUST_TARGETS_DIR')
     # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
     rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
-    if "HOST" in d.getVar("RUST_TARGETGENS"):
-        rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
-    if "TARGET" in d.getVar("RUST_TARGETGENS"):
-        rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
+    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
 }
 
 addtask rust_gen_targets after do_patch before do_compile
diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 636e9c4fe51..40421df4f76 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -18,8 +18,6 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index 1498b88f0e2..d49383ced58 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -12,9 +12,6 @@ DEPENDS:append:libc-musl = " libunwind"
 DEPENDS:remove:riscv32 = "libunwind"
 DEPENDS:remove:riscv64 = "libunwind"
 
-
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
 # Embed bitcode in order to allow compiling both with and without LTO
 RUSTFLAGS += "-Cembed-bitcode=yes"
 # Needed so cargo can find libbacktrace
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 7e302b59929..284347dedc3 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -34,8 +34,6 @@ setup_cargo_environment () {
 
 inherit rust-target-config
 
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
 do_rust_setup_snapshot () {
     for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
         "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
-- 
2.34.1


