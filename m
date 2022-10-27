Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1499FFA3746
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.2218.1666901787691181296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BUy26j4e;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b12so4769513edd.6
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS3sQ8xF5WopqSl5MryYpODhrOEXwAF0qQp6sEiD6ns=;
        b=BUy26j4erMK4owV/LBofkcWnHq9FYm+C9h9tntVNqVkhh8XIOR/1nSIvBkapglkeX3
         rv0ENpqjoWLKhZZBoiAxTrmaOcg65uir3kLWZjTrK1LypjiWSx1hUWn+bT9rE5FUiMV/
         MgF6qcqlbGNj5gMmMi3KTuBEqaGSspgcMJiUH7SD/U8n0OmGMxJX65WTU6+9L7IzPRg2
         NxldIyKx9qrVhGncwqB7QKrv0UYOs9RVgMxqZRJGr7fe2SQLGamT1B/Qjb1AOjYrL1/3
         GV74Wia//hs2Pk9qvt5xnbunuCe69WNG/oGq8IWACHcGvaI5YVs/KbH7leUw6/QkLZ2T
         l/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xS3sQ8xF5WopqSl5MryYpODhrOEXwAF0qQp6sEiD6ns=;
        b=o3Jlm0MK86JjWv5zk9icW8rsSVXyjNK3Zj4gdzvTM48kaOzTCWgfT0nBznGVooJzXh
         vkXY0A6HL6daDOZe0uEFqXIZSXO16BB95r6a/LAhpLDDX/p112LHl8iuL9HsQ4GHMtVE
         HUtinaXq1uxXw/DfJnDj3o8DOY7ZpQ/OkxGqP0V/TnmLY3A+GtIKecvRXGWAFRZvNCq0
         vPUOnBWRD3NHJXWALWMBAAFnJ/erZklrAGE4KwAD1MGuwY70VIpV07M55Ujg3S9pb5nQ
         Jd6nXNpaHPDesVeKgY3sEaI5u6Lr7aDsO2k+91Do06yZDMwoHl7LsViNXvApJt5hHbRJ
         ryHg==
X-Gm-Message-State: ACrzQf1L+0boi6m9KYE5B1bUynF0nECvlds/eYcoOsJCUvsDQXUsRse9
	EsFDvED+WaiouBdV44xx22Br3nec5lrINw==
X-Google-Smtp-Source: AMsMyM4h9I1Ax8gWoUoSqdyVd3bno/uFAPZYVqGAVtdweqFCvSv8u5CzUBL3ZeHs2NL6GcnLizHPlQ==
X-Received: by 2002:a05:6402:1a42:b0:458:b430:7e70 with SMTP id bf2-20020a0564021a4200b00458b4307e70mr47468023edb.293.1666901786212;
        Thu, 27 Oct 2022 13:16:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/23] llvm: update 14.0.6 -> 15.0.1
Date: Thu, 27 Oct 2022 22:15:52 +0200
Message-Id: <20221027201611.3644334-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172208

'Release' type follows standard practice elsewhere in core, particularly rust-llvm as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6bba92ac96..f3e282077a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "14.0.6"
+LLVMVERSION ?= "15.0.1"
 RUSTVERSION ?= "1.64%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 25c0a433d3..1f47e5d0fb 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "14.0.6"
+PV = "15.0.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "f28c006a5895fc0e329fe15fead81e37457cb1d1"
+SRCREV = "b73d2c8c720a8c8e6e73b11be4e27afa6cb75bdf"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
@@ -80,6 +80,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
+                  -DCMAKE_BUILD_TYPE=Release \
                   -G Ninja"
 
 EXTRA_OECMAKE:append:class-target = "\
-- 
2.30.2


