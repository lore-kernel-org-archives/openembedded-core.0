Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96552C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 14:57:21 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.10449.1644937040390180956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B7eaezfE;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id b37so9967366uad.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EvFy28OOpKyZGFZc3WQckz2wdO3RAX2xSoo1PZkhLmY=;
        b=B7eaezfEy8BYEzed2UfrODpyQXtjR88D+BJxDZc671y00RvmenZziPpgHJNP7cP/Rr
         +ElP/Q8I/UAoCeA911zZ2HKShfVjR/bMY/NOsm9XGYiiVTuSjLOmcnI8DvFeyYC+2Wfy
         /grKoOLZ/i5RymYzQQMMYBaY74fFJ4AYqR3mHe/EP/bVRLRRn9PAIAg2LYEIkAY1sRQy
         DTXTiHXtAk5SFnmido+oCJyYKzZ2v0zIgx0xsnxGJ9TiLBZ0PSgHpd7ajoP/LsCh379K
         1w0P0Ozk1vcSo7g0hi+U/lD0DWT3VN+CA0d73xs5uYuw5Ad6gSWxODW6mTFI1OrsFVex
         veNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EvFy28OOpKyZGFZc3WQckz2wdO3RAX2xSoo1PZkhLmY=;
        b=f4aojif3yIQhlujbNBsYR44YE928Dnu/dO2y0zF7luZr6ybHZtxSGeTrh2FBGbSauT
         JZ7SX6/5cUVyovpPMectqhJjWviyNhOA1GCz9veQzWoHFSmBJsRIbStYUw1J8J8TQLf5
         6+lsisRdk+TpihU74M1fqkF4s7cjJ3JuuBGVF/Zx/wkTFZS/WtGwvcAzRFOyIBWARDjn
         kWkMnvBkNUeWweqsBaAtz5k4lb4KmtMSkewjQmj2GDCJouoURAOuPFUYPS/cBDQw42T6
         zaBsuca+RADrzYyxiEbqgiZUZbTeQCMIb5K8T3XyTJSxvdCFxUumtRcgWHNJqETrJjPE
         Tuyw==
X-Gm-Message-State: AOAM532Vsk+8YaXiBZx32OlpK29uhn2TipTB8q6pu1FCuqLmEnXubJnu
	wqUYeAVtzK6iydQ6fp/sLWc=
X-Google-Smtp-Source: 
 ABdhPJw+uB9xMvit7RusgmhJaxSVyO+oR5AVXgoi54cpiqZ+U0pRztEdFsDwPiEWiX59vW4waXj/cQ==
X-Received: by 2002:ab0:3045:: with SMTP id x5mr1420112ual.17.1644937039376;
        Tue, 15 Feb 2022 06:57:19 -0800 (PST)
Received: from localhost.localdomain ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 e17sm6012167vsl.21.2022.02.15.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:57:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.15: fix dssall build error with binutils
 2.3.8
Date: Tue, 15 Feb 2022 09:57:16 -0500
Message-Id: <20220215145716.291405-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215145716.291405-1-bruce.ashfield@gmail.com>
References: <20220215145716.291405-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 14:57:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161752

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b52c1da342..9b652a797b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4e6023f9fa826a49ea6e1e66de07539965c06b46"
+SRCREV_machine ?= "c5b3006ccedbb8397aa58b667b981e0c2435b943"
 SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 389d6fd68f..754dbc7d60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ffb9a067ac8550ae1064ccd5bf73639e0cefd71b"
-SRCREV_machine ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemuarm ?= "66d56b3bcc1391639a84e35be3ef00c5197089a8"
+SRCREV_machine ?= "7f685244afb3acd13e94968312580b63d7296705"
 SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 60e09c9ecb..4b5e332c37 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7d3b6a747b3d2720f7ca4e6c1ac09c9b2fed553f"
-SRCREV_machine:qemuarm64 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
-SRCREV_machine:qemumips ?= "4b33e9d2ce28398756fd1d13f0bbc84e768c33a4"
-SRCREV_machine:qemuppc ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
-SRCREV_machine:qemuriscv64 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
-SRCREV_machine:qemuriscv32 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
-SRCREV_machine:qemux86 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
-SRCREV_machine:qemux86-64 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
-SRCREV_machine:qemumips64 ?= "506576e469f6fdc2b7e888afcace4437469b27aa"
-SRCREV_machine ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemuarm ?= "6be018aeb5fd86986bc560e2e6ca59b774784bdb"
+SRCREV_machine:qemuarm64 ?= "7f685244afb3acd13e94968312580b63d7296705"
+SRCREV_machine:qemumips ?= "2b861aef3af1f8b09f1345a308e6e6fe213e1fef"
+SRCREV_machine:qemuppc ?= "7f685244afb3acd13e94968312580b63d7296705"
+SRCREV_machine:qemuriscv64 ?= "7f685244afb3acd13e94968312580b63d7296705"
+SRCREV_machine:qemuriscv32 ?= "7f685244afb3acd13e94968312580b63d7296705"
+SRCREV_machine:qemux86 ?= "7f685244afb3acd13e94968312580b63d7296705"
+SRCREV_machine:qemux86-64 ?= "7f685244afb3acd13e94968312580b63d7296705"
+SRCREV_machine:qemumips64 ?= "1d269d782d6b6effed2437ad6b11ae4f4e789259"
+SRCREV_machine ?= "7f685244afb3acd13e94968312580b63d7296705"
 SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.25.1


