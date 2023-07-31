Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FFEC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3767.1690796658331620281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oYke7YBs;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso48330445e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796656; x=1691401456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+Je3rq+Bg2IulUMK4l4pCVlQTT7qpTbAubHcbfzdwY=;
        b=oYke7YBso2Olym25K1EdxVW8rlGiJP0bQXNY8Xl4tlCheXj8zzdSgcHfqi+RvMl83t
         H000QytMFEpTTJDSz+ATe1aaLTDKJZmMhHaFySRoY6lfViAMM2/uJDwohCVO15+gcy9v
         Y8Lavu9Z8q+A/wAF40ZaohVanDLcGlJrQx+r6/qMtVzc7yfUOuak/ngoMBa80S6q3cwV
         YCwWxzogZQgldIHNgJWH0Fv4FyJtY7tCoWOrf1Dger+ZIRGeGpEvN17OSR+7DPC+Pq3I
         VGrcm4rNVK7gg7pHPhKTF28MZalEaYZddZlKdHC7d9RWy9ztmeYrJ9e2Xs7abwbd1c1T
         mC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796656; x=1691401456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+Je3rq+Bg2IulUMK4l4pCVlQTT7qpTbAubHcbfzdwY=;
        b=iCbHs/ppEblIJ/8fLHudYQvv5fPQ2AHkLT6+Td33x3tGMmHpq+PUeFx8ao0tWILP1R
         beybm9k2cqMWBU/flQSgDys4Qf7WTxeFUCKlbBKESP17NVvZSMZ5o86i7aqpnexZxyxK
         QL+6caH8zvExm54c5pFARfHW+KMsOccthLhdJdLYnWZ75MrWFsHojHj3T0ZakXM3O4HX
         ChfbPUP7/0Th6i94ZWAUEIRK58XC820sAY/LDijbdF6cTPZh2OnxA6qqorswJqo3SBYX
         ANjad2EuTxC06sgH3QcND2GhMSlLnI3W4BPzMUfzkQgg7082D8MHRySlRnMPaqPmozES
         ryDQ==
X-Gm-Message-State: ABy/qLYsOPi7ObJRggOIyApafa8Wm0fhOLwzZ+sEB3XczFn2SHQuGjEx
	xD/sM9pa6eG+k6Tgl4BhPC6SxUnYgok=
X-Google-Smtp-Source: APBJJlEAU5NDA+1yqfY6Cat23D6j/pOTL0x5+9ftIEB0kSH/Y6eeLUtVPtZdLtC7k97KHsjxeAxKpQ==
X-Received: by 2002:adf:f644:0:b0:314:362d:6d7b with SMTP id x4-20020adff644000000b00314362d6d7bmr7872306wrp.19.1690796655985;
        Mon, 31 Jul 2023 02:44:15 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:c4e8:ab56:aff:118a])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm12526610wrw.58.2023.07.31.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:44:15 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH 3/3] cargo.bbclass: Offer a way to use --offline instead of --frozen
Date: Mon, 31 Jul 2023 11:44:10 +0200
Message-Id: <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690795930.git.frederic.martinsons@gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 09:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185131

From: Frederic Martinsons <frederic.martinsons@gmail.com>

And use that for rust-hello-world recipe that did not ship
a Cargo.lock file.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo.bbclass                          | 4 +++-
 meta/classes-recipe/cargo_common.bbclass                   | 3 +++
 meta/recipes-extended/rust-example/rust-hello-world_git.bb | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 8c0b92df8d..d8ab94f2b4 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -39,12 +39,14 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
+
 # --frozen flag will prevent network access (which is required since only
 # the do_fetch step is authorized to access network)
 # and will require an up to date Cargo.lock file.
 # This force the package being built to already ship a Cargo.lock, in the end
 # this is what we want, at least, for reproducibility of the build.
-CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_EXTRA_FLAGS =  "${@['--frozen', '--offline'][d.getVar('CARGO_NO_FROZEN') == '1']}"
+CARGO_BUILD_FLAGS = "-v ${CARGO_EXTRA_FLAGS} --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 01afb74640..d17501182f 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -152,6 +152,9 @@ python cargo_common_do_patch_paths() {
     if not patches:
         return
 
+    if d.getVar("CARGO_NO_FROZEN") == 1:
+        return
+
     # Cargo.lock file is needed for to be sure that artifacts
     # downloaded by the fetch steps are those expected by the
     # project and that the possible patches are correctly applied.
diff --git a/meta/recipes-extended/rust-example/rust-hello-world_git.bb b/meta/recipes-extended/rust-example/rust-hello-world_git.bb
index 1d91109b51..cad184837f 100644
--- a/meta/recipes-extended/rust-example/rust-hello-world_git.bb
+++ b/meta/recipes-extended/rust-example/rust-hello-world_git.bb
@@ -14,6 +14,8 @@ SUMMARY = "Hello World by Cargo for Rust"
 HOMEPAGE = "https://github.com/meta-rust/rust-hello-world"
 LICENSE = "MIT | Apache-2.0"
 
+CARGO_NO_FROZEN = "1"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


