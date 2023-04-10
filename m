Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE628C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:41:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.40289.1681119718367086296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8ZDMdls;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso7424043wmr.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681119716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+O8L3paxbiuaAZsITQUKpBHLAeTyAH9i9D1+6vsQBgM=;
        b=k8ZDMdls97Da/0eqeCBfeuK6d7do1dua6jeTr+nPyfoKrc9Hm9fjDgXpYeH0DHGS+V
         26Ui4onTmDxLtd3lVM+YyTCW54LLvEEn855Q2LNbBB2h5mEVJI7xebmUZEjmsfBQhBE7
         iTNdfnmjb61Pq56QnJr812My0BTCi54Y89TD+T6OtzGhQbHHl6/gifsoROML/tXHYMR1
         qXBlTQol//z2fmMtBgzoKQnOKuFVLxHI7tai6tb4PFZIXh5IcVCaum/d4D1eC25z1JBW
         jnkYJAoaNrYSmp9ZclNQhh1RlezrgckJ5osMGzBXdcDP5RuqMD5sdopLE8NFfKVafBh+
         G9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O8L3paxbiuaAZsITQUKpBHLAeTyAH9i9D1+6vsQBgM=;
        b=bArKALf20tRvxfIISF6spgF6qxQl9555p53UMVKFcQsOY0H2uPnF6jXuKAAAk0ttxT
         hb1Jfk/X042EVLPjNyV8+dHa0XjYqBl7JBeMeaNeeBB17bWpVx8p08H9nWFZ1KvMveto
         v7HIpze/+SIM5HLDtYVh90nqw6AEYNYHwkGCjxG+5bPx8xFYpHC3qyr6vINElh1lkIkT
         Q+cpX2pI5bhWtpYnQo+A5jE26NZyzC/5gTa5H+AAOru7RfMCg9+3mw8yIj3fgNiP8qm0
         Vs3ESdsccUZsqD42LH0aF9P48PW9q68F+eelP2eKwjw1sIX5b4v0TwIB7CB0SriEY/uN
         YFXg==
X-Gm-Message-State: AAQBX9c1o3mfOubQZ5nPl2xGv2lHAVzuYBL5wz7tjj4d/CQSUqGRBy5u
	R7D0MGxM8jh5TdGReMUlmOZw+EP457s=
X-Google-Smtp-Source: AKy350aigFrbjlyr+evp+JoKIGXtickN1Si3XGhLm1723GNx36X874IT38Z07dNkOIpX/SBDiYtO8g==
X-Received: by 2002:a1c:f716:0:b0:3ef:4138:9eef with SMTP id v22-20020a1cf716000000b003ef41389eefmr7258672wmh.36.1681119716178;
        Mon, 10 Apr 2023 02:41:56 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id z23-20020a1c4c17000000b003f07f0405b5sm8673663wmf.43.2023.04.10.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 02:41:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
Date: Mon, 10 Apr 2023 10:41:22 +0100
Message-Id: <20230410094122.5865-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179885

Changes:

* Update the GitHub RSA host key bundled within Cargo. The key was
  rotated by GitHub on 2023-03-24 after the old one leaked.
* Mark the old GitHub RSA host key as revoked. This will prevent Cargo
  from accepting the leaked key even when trusted by the system.
* Add support for @revoked and a better error message for
  @cert-authority in Cargo’s SSH host key verification

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} | 0
 .../rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb}           | 0
 ...t-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} | 0
 .../rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/recipes-devtools/rust/cargo_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index c8f5a5a9c4c4..6d3a4b131e26 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb3544fe26f4037b911d9fb2"
+SRC_URI[rust.sha256sum] = "ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb b/meta/recipes-devtools/rust/rust_1.68.2.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.68.1.bb
rename to meta/recipes-devtools/rust/rust_1.68.2.bb
-- 
2.39.0


