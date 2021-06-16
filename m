Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.17.1623876543583490551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 13:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lXDxRYMO;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id g142so901048qke.4
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EXCH5EnOVTVV5Rn+GIdziWHpL3OGRmGLQrw8dUucK2w=;
        b=lXDxRYMOGqJO1DDxW3FMSx3uqdOwqRGyQPp6dnWuoLe4SwSd4aNLbM5lIpDE4o8T+7
         VMQD0O2oDtf1Vw7j9bHCm7c69QrC3aWt7cGgR89POPwXm2dnv599p2NqFhlI2vUCPdi0
         hPNrdxYuqfo6eF9R6VQHSI83GmxbFIQHnrlo/KFIoqn+g1HEfeLEsZbwGAvPtDVF+/pF
         y/8dGLW9Qeep0KN+dNeZqo9iKtS/l9ErHi7uLDDmjooC2vXbtMrCm0p6ALyyaO7rZVzT
         50f2SFDhUaupJmWaYltOBEbr339PK5xRxKweTTRiX/lkaCBv/dfuggj2L+MY35eaJ75I
         mr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EXCH5EnOVTVV5Rn+GIdziWHpL3OGRmGLQrw8dUucK2w=;
        b=kl3YKHnSwxY3MpUg9lOvWy/vOrMtKwUpCx84uHm189cHnF/8GlWxBUsohFTz1LrqQ2
         w030tLaorBXcT6QNw3iDmWtXykaeVlOZUOeS22qdI8oqdDl5temk0xkjsLf9RPiRsk9F
         N8uyFE1l6vVCAdauhy9bc9Qwco7pYM3VqRmYmeAz9BZbVsHGEr/+9AfggQUVsLT3ZQtG
         FFK8jq5EpiSdzJ9PHz29GZD3hCaXay3jcEFJTmoGLGwCqd52oJbBVjG07fti0IW9QYsx
         nvyBk0Uqlc7qTMitiljBUs/xjynqPpai7NrKr9BSNufjo2wC4hyRD8Xw+OTJokLrCwlz
         MBsw==
X-Gm-Message-State: AOAM5319/K3MCaLOlJbPLy9LNApYAWj1zc5QqOC0OZutYSSkVWQnNSk7
	ywgval7XI7BknE1dDfd0ayU=
X-Google-Smtp-Source: ABdhPJwzCs1ItNasLZ0Q9nK0V7BSmmKT/o2SwHQzAN1DIiuqSAo7tBDMeOgSPqnmhjCbJkX0TGylRw==
X-Received: by 2002:a37:693:: with SMTP id 141mr215288qkg.453.1623876542700;
        Wed, 16 Jun 2021 13:49:02 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id d10sm300237qko.73.2021.06.16.13.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 13:49:02 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/5.10: cgroup1: fix leaked context root causing sporadic NULL deref in LTP
Date: Wed, 16 Jun 2021 16:48:54 -0400
Message-Id: <1db65215a20070df9a9fe63f547112f3e9c0dba3.1623876372.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1623876372.git.bruce.ashfield@gmail.com>
References: <cover.1623876372.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    ab49d2db98bd cgroup1: fix leaked context root causing sporadic NULL deref in LTP

PaulG tracked down the AB intermittent issues and generated a kernel
patch.

See: https://lore.kernel.org/lkml/20210616125157.438837-1-paul.gortmaker@windriver.com/

While we wait for it to loop through mainline, we'll integrate it into
our 5.10 branches.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index d1ff473e3c..877e8d2946 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f458a6a097da0e7c535361dd30037499a48699f7"
-SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
+SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
+SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 19aa7ab7d5..b44deb6f32 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e2c5237e9be3f4c69e86d7b990347454e2b8dff2"
-SRCREV_machine ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
+SRCREV_machine_qemuarm ?= "9c63dda7dd5834bf731747d6ae03ae13d48e20e3"
+SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7205df2a61..f99782c1be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "592f67240407a1f071d1b90e0af74df07deac519"
-SRCREV_machine_qemuarm64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemumips ?= "0f474718e48ea5732875db2b71cf3f5dd3293e31"
-SRCREV_machine_qemuppc ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemuriscv64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemuriscv32 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemux86 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemux86-64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_machine_qemumips64 ?= "a3c3c412a703def1f5c8f94f2c0fcc2cb908693a"
-SRCREV_machine ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
-SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
+SRCREV_machine_qemuarm ?= "2fc3409cf8c2a6d684929576fd409949060a0bd9"
+SRCREV_machine_qemuarm64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemumips ?= "5cec6d1ab35feb99f023b233871cafa29e3c3682"
+SRCREV_machine_qemuppc ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemuriscv64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemuriscv32 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
+SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
+SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

