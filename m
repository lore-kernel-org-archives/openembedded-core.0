Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0D1C10DCE
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:00:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.30493.1702036836153794865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NK8sil1s;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c09d0b045so23439505e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702036834; x=1702641634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XXAG26dwx1/20mJp7k/JnLqiC8dWklO5n09lSNJzKg=;
        b=NK8sil1sF9jxD6kAEAjH30jasv7hZ7nra8L/3Tyuz/UvK2V8oHaxS3WixAvu6C9ULK
         M4sIgJtR6uEQ1VyyMdyVwO8jm6NTyeSUmPmRohzr0uOmIrOBHyh1a4lYp0A71mV3EuNE
         oXMwgTQONdKh/kwCYy1CjDO/LyaeyZz/73BH3LpHgH4RBgeZAqUQGnhEueu96MvC/z1j
         yCpc2tdZkRa1kNckA5PWUvPc0uAkiWdYIHxDFFWI2eR9BXNNsGLpzdp4xVNeqgz3x3OO
         Zw50+bPn8UVGHRUk3jsHKKMMeL6BaR274f//Z6O6GUMs8KFIytlRIYCoP0jRTv2giorF
         sP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702036834; x=1702641634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XXAG26dwx1/20mJp7k/JnLqiC8dWklO5n09lSNJzKg=;
        b=GmBn+5ShhuZen8ZCDlKtx70eoll4E0dW8kkbnfeRIBYy96O64YVeSmE/4G679n4eXT
         qYTyRjMYaWmraQOAl8/e7hP6ReP6Q5pxPvcpJPRaT+xhVDZbooykD2+tAhykbOc6YD7J
         IcWeEqC8Icoc2Z+ncILZHGEm15jeYXb/5CPlER0zWPSEh7owVIcKqDbGzwhM531qEQCv
         1uW011larCNrOi2DsrCXV1a/Ss8xlv+wxfKbq/snr3/guDmyxHTD4xENAQqxsOpoW3XS
         EQEAzpeBZzArxpSopmVEnIwIm3HGiIghponVUIcf+Fj9Yi+vfIR7Bsdj3HXIuNC+Pp1D
         0fUA==
X-Gm-Message-State: AOJu0Yw4OESYweJWifzVFeQMj/AiODmzude8x655CfPsqmPUYatxFWwH
	QpRf0ajB+pJP20OdtqhB9Dpw4Lbb1k0=
X-Google-Smtp-Source: AGHT+IHi/Uz7EE1vqT3uNF1XicXTLQrxmeVf43S4ssrsLXGK7iP68GJNbwBd/G+jafPgea/TPPagWA==
X-Received: by 2002:a05:600c:4744:b0:40c:2734:13f3 with SMTP id w4-20020a05600c474400b0040c273413f3mr1058078wmo.24.1702036834162;
        Fri, 08 Dec 2023 04:00:34 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm2636353wmb.38.2023.12.08.04.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:00:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 3/4] rust: cargo: Convert single-valued variables to weak defaults
Date: Fri,  8 Dec 2023 12:00:27 +0000
Message-Id: <20231208120028.2953-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231208120028.2953-1-alex.kiernan@gmail.com>
References: <20231208120028.2953-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192049

All of these variables are single-valued, so we can use weak-defaults
for them and only see the final assignment after parsing.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- New in v2

 meta/classes-recipe/cargo_common.bbclass | 6 +++---
 meta/classes-recipe/rust-common.bbclass  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 509aa195c5fa..48cdd69bca13 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -28,10 +28,10 @@ export PKG_CONFIG_ALLOW_CROSS = "1"
 # Don't instruct cargo to use crates downloaded by bitbake. Some rust packages,
 # for example the rust compiler itself, come with their own vendored sources.
 # Specifying two [source.crates-io] will not work.
-CARGO_DISABLE_BITBAKE_VENDORING ?= "0"
+CARGO_DISABLE_BITBAKE_VENDORING ??= "0"
 
 # Used by libstd-rs to point to the vendor dir included in rustc src
-CARGO_VENDORING_DIRECTORY ?= "${CARGO_HOME}/bitbake"
+CARGO_VENDORING_DIRECTORY ??= "${CARGO_HOME}/bitbake"
 
 # The directory of the Cargo.toml relative to the root directory, per default
 # assume there's a Cargo.toml directly in the root directory
@@ -40,7 +40,7 @@ CARGO_SRC_DIR ??= ""
 # The actual path to the Cargo.toml
 CARGO_MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
-CARGO_RUST_TARGET_CCLD ?= "${RUST_TARGET_CCLD}"
+CARGO_RUST_TARGET_CCLD ??= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
 
diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index ae96d9c5b1ff..6940093e59bf 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -16,8 +16,8 @@ FILES:${PN}-dbg += "${rustlibdir}/.debug"
 RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
-RUSTLIB_DEP ?= "libstd-rs"
-RUST_PANIC_STRATEGY ?= "unwind"
+RUSTLIB_DEP ??= "libstd-rs"
+RUST_PANIC_STRATEGY ??= "unwind"
 
 def target_is_armv7(d):
     '''Determine if target is armv7'''
-- 
2.39.0


