Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.245.1621289827423721640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L+seuoqx;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id o27so7418154qkj.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DQv6gukmC0zfy0Ov5DlXQJr4kfgmDdyksgeb7uJEG44=;
        b=L+seuoqxigthOT3TbBpQJNtns4bdJbvo+/QhcH/P7BY3Nm4sPjS+Bbl4oaOCqYW/f3
         NCAShlsDR2iTyfFmS1EADQuQT/ffYH5VnC8QVrGJ2czN2/LXDhGwK4hP5FPLOPKAe67A
         P49Zo8W3u+lkMEfKP6uENYu3XXjLszeN4ivWx55JotxS5IXSmYrQs9NgegJSvHD6Ce5c
         edzqjapPxQmX40j7EuL/in8cntgVlpymF9ThcoWUgiR71ecB3Rw74GsCwN508j5NrJvn
         vp9DP+6vOWiXO0RTTbbBvKnA5zgC/3hVyyVst0t4HT6ZIJ9cpMc/+adF/YYJTAWoUy7O
         4usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DQv6gukmC0zfy0Ov5DlXQJr4kfgmDdyksgeb7uJEG44=;
        b=G1sNDVUZZwiEGaLPIl6StQ3kzzozq6J3HLWPXbCubq6ONyJat8PDMT9jvrpNmvRdEd
         XEucxryRPHPJgqQC8LODwZcBwYDTq1ZK2bjbG2jw264fOVOjNSWT1hE20J+pwegDR/+O
         JDvWa0oV7zYmY2+eEPsgWhxnd0QXX4x6f8ZrFUKqgQN+aZrYUqvJW61xplbcmMXowNX4
         fYsLQ5OfBQplf7egBuDoOhrWaQHLMyhgLeU8qzoa/L/oMDrlzknAv8v9dROMQGDa4+dS
         Icu2g/SluEaMIpr8maO7opASITIAFXuPUIqbqvDW8EST70V7f9fhd1Wyqq3GhZmVlYTv
         idlQ==
X-Gm-Message-State: AOAM530ow9VyS298EH8sbsBN1MRODOWi1M5TUpeYKCgnY3sMss3g287q
	4Dwu19I/uYzV1mtoBSMXu7w=
X-Google-Smtp-Source: ABdhPJwG5SAKzW0i/u0fwh8ZYexlppWpKMHLShzDsuyWOX+j6mZQOOH+IR1ddriaBkaenHIZw4qCug==
X-Received: by 2002:a05:620a:1316:: with SMTP id o22mr2130433qkj.351.1621289826584;
        Mon, 17 May 2021 15:17:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:06 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/5.10: ktypes/standard: disable obsolete crypto options by default
Date: Mon, 17 May 2021 18:16:55 -0400
Message-Id: <f67dbd1b9bd00a3a6ce5cf8fcece97005733bffc.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10.:

    ktypes/standard: disable obsolete crypto options by default

    CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is on by default, but really
    shouldn't be on in our kernels for a safe set of baseline options.

    This is almost never used, so we disable it by default. If something
    needs it, they can turn it on in a board specific config.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 69571df047..424dc83e15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eb1ac5022eed244fb3943b3e48b48bc863aaf5a3"
-SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
+SRCREV_machine ?= "fd84ed4cd5f8671db5ff31c00712c607c379a924"
+SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2e0d1b20d4..ea41d74add 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5bd2421ef6048de205cd3a86c6f14b6296dc79d9"
-SRCREV_machine ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
+SRCREV_machine_qemuarm ?= "9d4af32a2486acf5feb473b0d5656155cf80f115"
+SRCREV_machine ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cf6d19010a..1200cba942 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "71d9798b63a9d5a62708f746bb0a53583a8dfb5d"
-SRCREV_machine_qemuarm64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemumips ?= "4bad40a510831446b777042df43e349989ecbef7"
-SRCREV_machine_qemuppc ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemuriscv64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemuriscv32 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemux86 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemux86-64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_machine_qemumips64 ?= "554408244bec4f2121f4ec63b170ca38430b8f9b"
-SRCREV_machine ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
-SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
+SRCREV_machine_qemuarm ?= "f3a20db821a8802c1b3e71c0cccded36d89671b5"
+SRCREV_machine_qemuarm64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemumips ?= "c64120ac8b71098f6356a992f7e302caa75d4bae"
+SRCREV_machine_qemuppc ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemuriscv64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemuriscv32 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemux86 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemux86-64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_machine_qemumips64 ?= "b9a0cc14b51ac1bc5f2bcdcc0f53f6913e877e20"
+SRCREV_machine ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
+SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

