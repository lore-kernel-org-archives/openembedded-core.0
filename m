Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E5DC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 11:26:55 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.10983.1670498807702722330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 03:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dQk9b3Pp;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so1273646pjm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LB5EDjP20HYm5b6QBEG7p2Tlm8BvqBBw2Q90YmSprGw=;
        b=dQk9b3Pp55KBuyBFta0rH+1b4Z8dVhJ5SDxU4aeJENEIZ2KvFXUvBeOAqbWb5Gjqv1
         IX82mnBIxEuceQHRg+w2Alx2hEEi/yUek0EUoC4YtJEWCJs+r+GkNSTd2Nc6g+iOLHg4
         wd9obvdYTgKirwGHY6ekW421vVUR0eC+EHpvUp+q5CDkX3rOBkjb5ggbcGkJpInn1N8A
         jyx8wehmIWtwybQeQmN2uK9ID0lBcHmCHLYBAhrLH3Y4s88HRPmmlsbOwOgEZzfyB3Yr
         g4SfZUpmuSWYfIqqwBn6vNTbgNM1qCkrDkaPGYZ9xHCsl71Cl/PLaIStcLLsGifMQL8p
         6v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB5EDjP20HYm5b6QBEG7p2Tlm8BvqBBw2Q90YmSprGw=;
        b=mKAPSGt4hbLjhNEqJoQUpyEzSAqI75QTGQdscWsihkGmIfDOn1RrcVVCnTfbjBJXZZ
         InvU3mkwxBdwUqvOM9DM+E8ylzAKqFujgYcczqrrFPH0a7UUejyVkDreybfLEVFJzPy2
         XD8xITQAn6Mj6fiCInXKi1291dzlcDKh5/ggbgXjyMUEkqjIT72bhFAVgsPNZJRIi8U7
         OJxVaKjz3wrbviE4d/ho8WfJYDyAH+cou582eatNl0b2rSLNaq4JG6t/uUJfhTqygCq5
         TPRSez/qs8xDn2BOecn1WX1mxAUA3PeLq5RKHCBc0khvBPfuk4sMYONoOI7k8Ls+FxlW
         FYpw==
X-Gm-Message-State: ANoB5pm8PebYNICPhLx5JqGLU7uavQJe/70NRBbNttcz7WUWGddnG9HR
	74DfgzxjmZictbsyTWcGZiRPOhEd6W4=
X-Google-Smtp-Source: AA0mqf7860oQ/v68cO4vTwDVJSmn5qmH8rKXag0AmQlwCcIHCMQZzTP3KS75yddd5HPiSYZS0gLc0w==
X-Received: by 2002:a05:6a20:4c99:b0:aa:45c7:fc94 with SMTP id fq25-20020a056a204c9900b000aa45c7fc94mr2562974pzb.19.1670498806603;
        Thu, 08 Dec 2022 03:26:46 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id e30-20020a63501e000000b00478ca052819sm5668686pgb.47.2022.12.08.03.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:26:46 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	yashinde145@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [PATCH] rust: fix for target compilation failed issue
Date: Thu,  8 Dec 2022 16:56:12 +0530
Message-Id: <20221208112612.3023718-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 11:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174396

Rust code compilation on qemu failed with with below error.
error: Error loading target specification: Could not find specification for target "x86_64-poky-linux-gnu". Run `rustc --print target-list` for a list of built-in targets.

This patch fix the issue by adding the missing json file to the image.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/rust/files/target.json | 39 ++++++++++++++++++++
 meta/recipes-devtools/rust/rust.inc          |  9 +++++
 meta/recipes-devtools/rust/rust_1.65.0.bb    |  2 +
 3 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/target.json

diff --git a/meta/recipes-devtools/rust/files/target.json b/meta/recipes-devtools/rust/files/target.json
new file mode 100644
index 0000000000..69dbbaa9f9
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target.json
@@ -0,0 +1,39 @@
+{
+   "arch": "x86_64",
+   "cpu": "x86-64",
+   "crt-static-respected": true,
+   "data-layout":
+"e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128",
+   "dynamic-linking": true,
+   "env": "gnu",
+   "executables": true,
+   "has-rpath": true,
+   "linker-is-gnu": true,
+   "llvm-target": "x86_64-unknown-linux-gnu",
+   "max-atomic-width": 64,
+   "os": "linux",
+   "position-independent-executables": true,
+   "pre-link-args": {
+     "gcc": [
+       "-m64"
+     ]
+   },
+   "relro-level": "full",
+   "stack-probes": {
+     "kind": "inline-or-call",
+     "min-llvm-version-for-inline": [
+       11,
+       0,
+       1
+     ]
+   },
+   "supported-sanitizers": [
+     "address",
+     "leak",
+     "memory",
+     "thread"
+   ],
+   "target-family": "unix",
+   "target-pointer-width": "64"
+}
+
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 956301023a..75473f967b 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
 
 S = "${RUSTSRC}"
 
+SRC_URI += "\
+     file://target.json \
+"
+
 export FORCE_CRATE_HASH="${BB_TASKHASH}"
 
 RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
@@ -217,3 +221,8 @@ rust_do_install () {
 do_install () {
     rust_do_install
 }
+
+FILE_${PN} += " \
+       ${WORKDIR}/target.json \
+"
+
diff --git a/meta/recipes-devtools/rust/rust_1.65.0.bb b/meta/recipes-devtools/rust/rust_1.65.0.bb
index dbf74cec8f..afef72e45c 100644
--- a/meta/recipes-devtools/rust/rust_1.65.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.65.0.bb
@@ -68,6 +68,8 @@ rust_do_install:class-target() {
         chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
 
+    cp ${WORKDIR}/target.json ${D}${libdir}/rustlib/${RUST_TARGET_SYS}
+
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
-- 
2.25.1


