Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D952DC4321E
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.746.1668452478176462713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SLg2/Fa/;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso8620884wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/zU+0UAzMrb+9kBECftICMCrBYrk4fRO0EFysmnD2E=;
        b=SLg2/Fa/nLVZcKjBux5rlme7zkjZD2GNdzL8FOaMQpdt+zm5nfmV/NjXZrN2FXyK0h
         +w5yVrAunjibSfzlVS2tiMN7g1mX7IomM2YLoIZxYGFoIG5efO45hW0kLgUL3a1Vq/q6
         LFK4unk0rQyiSz/3nd0pWTSrXCZBneueVRbhPWjmphC34cqgxh1fLMvjlfzaBjDIvt88
         br2kfAunTxFN+mgawVu4iVoxoqSfsGCj81/9CwfYN3QHoSkItJJiVlBs1GBd7N9yis5O
         aiIQGAartOMiiMhy4SHiEVxXvYD6ePFKJWcLEjQ5SiCJEO4srWcICqwwG2D/yTBFTkWg
         bDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/zU+0UAzMrb+9kBECftICMCrBYrk4fRO0EFysmnD2E=;
        b=VrmwR/3GbjflUm4sEkEesIak92A2tpY+H802tkJZ8pb6i/Y5R0ctgzEN6/o+pszMvw
         2239W/Q2PzruLTt8moHDrzvlEQzdETQs9ZgvTb/5QzewIPZAdiqz/9OuUs7xpmM4Nu2M
         jYYHpR1SpPENQBvGw8aFesiVFQ3YPHafj5DnTBkF6ewLrW3WXoiFugPL2bm0ltNZDH3b
         gMzhf/6Jv3wz7Nu1/35/odCjnQzGO2gKIMGkk9GsGXZyUSTTIuUb4cuRBExtKzyaJvlf
         7fiYAnbCZCGurAczKLyyBBvry/EQNe2+49dMd8XmLo2TjiaEdyQP54hqLW+6tN+M0YE8
         TCVw==
X-Gm-Message-State: ANoB5pngP/c7M30BE0o0TGpNUDqiMsQMVEsgBuUSgp4ScXP17CWqmGct
	kyk9e3yGwRN6e7HkqHbBNHx7qjr96XM=
X-Google-Smtp-Source: AA0mqf4HLjZ/N6Z5gxxkkp5B3KlAuQS4IRgooRydWfH6xCyzn1rYAE7sPrIX2Rx1iQj3N2JTDimunw==
X-Received: by 2002:a1c:cc01:0:b0:3cf:a9c2:2b04 with SMTP id h1-20020a1ccc01000000b003cfa9c22b04mr9010681wmb.152.1668452476679;
        Mon, 14 Nov 2022 11:01:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/8] llvm: update 15.0.1 -> 15.0.4
Date: Mon, 14 Nov 2022 20:00:53 +0100
Message-Id: <20221114190056.2612669-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173258

zstd is a new compression option in addition to zlib.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 154a9a4ab0..4345701443 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "15.0.1"
+LLVMVERSION ?= "15.0.4"
 RUSTVERSION ?= "1.65%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 1f47e5d0fb..2d346b70cf 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -8,7 +8,7 @@ SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
-DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
+DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
 
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "15.0.1"
+PV = "15.0.4"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "b73d2c8c720a8c8e6e73b11be4e27afa6cb75bdf"
+SRCREV = "5c68a1cb123161b54b72ce90e7975d95a8eaf2a4"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.30.2


