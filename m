Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D838C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 15:37:33 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.56795.1704382643789544940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 07:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m7Nyv7o2;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-680c7cf2ab3so2854876d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 07:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704382643; x=1704987443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5PDwxoylGwYfXLomfvNW7byOritlM//R97iiCGsmDA=;
        b=m7Nyv7o23l7hwTCq3cy5BG6yv8jgiQN/3Ds6EcQ8bIROpj6fjK5SWQxrZfZQ8i95Ah
         5dHZWSj7pc8GspleCTYA/Oo/wmKE4aW2al4sxE71X1sv7Mkk1MoLyNE5v/m85z88NZFg
         93T18fHAaf5g9rQUsEi4YMveW6qqCPc9ezYSTIxbL9g4rz/GWwGkcMRYFp+AOGrxhL3t
         yDq6eg/UvHZmaLuDqWPl8uc/qDjVFOHAzNzzBhOeO844pvI6s2+/j97ZX44UK7mQuwYa
         IKDa71xWwkY56IOnc/MpVQ4lWSM8bHWWGeXmsHKSbpXxVqKOAgfL7wTrp08xk6ajYmB1
         uHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382643; x=1704987443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5PDwxoylGwYfXLomfvNW7byOritlM//R97iiCGsmDA=;
        b=Ct+PqKx7eRTnrlgTagHcmQoQsbsgtUzKkxr6z85UvmAXmnfk3/11wK6gSKJxssNxS5
         HNO/zWPtAgUAQCQLwV6TUYp4p1rvUXqFR9nSsC1QrFBIfpqKVlYwDMsABzXbI1psmFD+
         IDx3fKlc0v7HIH7UCHYZ8B/BBXxwoRJSAvhgXOp43lW2FXHwBOePVVcHtoPtsxH0ki4X
         jVZowWYn7kUJF2Lpzw5c7rrTaAjEhnLAMrXHtxJbSfqrI8otquzWKUR51kgyJpF7F6JJ
         E99NDDLRJW4EA3siofUSAjWwVFcHs8U2QHyb1Jm6IrGysX2P0w9crVgC4T2YSNjSybZT
         KHeg==
X-Gm-Message-State: AOJu0Yy4HbKCILy+ZiVPYdDwA1SaE9WxuV5xynMABAemv5HW6seh4UtE
	wltlFzsRHThSEpwpvBFcPG8=
X-Google-Smtp-Source: AGHT+IFP2/5p0xyoD3+DFytgm2UMe1Cmqbs75PfLIsoUKVbVONS6lC3Nnf2XJDbluUBDH9GxroURWg==
X-Received: by 2002:ad4:5f89:0:b0:67f:49c:4b6c with SMTP id jp9-20020ad45f89000000b0067f049c4b6cmr831061qvb.118.1704382642740;
        Thu, 04 Jan 2024 07:37:22 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a05620a005c00b00781d3196910sm2471700qkt.52.2024.01.04.07.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:37:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Subject: [PATCH] linux-yocto/6.6: arm: jitter entropy backport
Date: Thu,  4 Jan 2024 10:37:21 -0500
Message-Id: <20240104153721.2908762-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 15:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193330

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Stephan Müller
    Email: smueller@chronox.de
    Subject: crypto: jitter - add RCT/APT support for different OSRs
    Date: Thu, 21 Sep 2023 13:48:11 +0200

    The oversampling rate (OSR) value specifies the heuristically implied
    entropy in the recorded data - H_submitter = 1/osr. A different entropy
    estimate implies a different APT/RCT cutoff value. This change adds
    support for OSRs 1 through 15. This OSR can be selected by the caller
    of the Jitter RNG.

    For this patch, the caller still uses one hard-coded OSR. A subsequent
    patch allows this value to be configured.

    In addition, the power-up self test is adjusted as follows:

    * It allows the caller to provide an oversampling rate that should be
    tested with - commonly it should be the same as used for the actual
    runtime operation. This makes the power-up testing therefore consistent
    with the runtime operation.

    * It calls now jent_measure_jitter (i.e. collects the full entropy
    that can possibly be harvested by the Jitter RNG) instead of only
    jent_condition_data (which only returns the entropy harvested from
    the conditioning component). This should now alleviate reports where
    the Jitter RNG initialization thinks there is too little entropy.

    * The power-up test now solely relies on the (enhanced) APT and RCT
    test that is used as a health test at runtime.

    The code allowing the different OSRs as well as the power-up test
    changes are present in the user space version of the Jitter RNG 3.4.1
    and thus was already in production use for some time.

    Reported-by "Ospan, Abylay" <aospan@amazon.com>
    Signed-off-by: Stephan Mueller <smueller@chronox.de>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 05a6b5f1d4..90e5ead1f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bfa11b7b82a8d7a3c3f5a30813a8471be20449ab"
+SRCREV_machine ?= "7e43b4538ce1a9084c4a5f1b22372c98aa888958"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 372a8e962f..5d87855a27 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 969cbb8c26..dbe4db9514 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "30f04f32ffa4d5082530a2ce565387c09a98086d"
-SRCREV_machine:qemuarm64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemuloongarch64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemumips ?= "382508b55bd871d9a81ab6d187abed39e59b277e"
-SRCREV_machine:qemuppc ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemuriscv64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemuriscv32 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemux86 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemux86-64 ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
-SRCREV_machine:qemumips64 ?= "90d9017819a05360dbf3fd2f6471cbbb3fe78db5"
-SRCREV_machine ?= "50cd24ddb6f0bcae01623196515ce62527bb79df"
+SRCREV_machine:qemuarm ?= "b0567ccb83b03434efe6bc00d7d672a59d50b82a"
+SRCREV_machine:qemuarm64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemuloongarch64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemumips ?= "df19050d1276ce9418652a39c31b77925b18fb17"
+SRCREV_machine:qemuppc ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemuriscv64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemuriscv32 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemux86 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemux86-64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
+SRCREV_machine:qemumips64 ?= "2cab83c3f46765b9390918a91c4fc64a873a3443"
+SRCREV_machine ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


