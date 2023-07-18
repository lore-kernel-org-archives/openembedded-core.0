Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A0FC001E0
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:34:46 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.74.1689651279820919082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Gbh5bdg2;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-403a840dc64so33166261cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651279; x=1692243279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajmhvqHnQw1bWOECAA1pHJ5yMdpEx1YYenvqcTIvoQ8=;
        b=Gbh5bdg2CtJ3gkrWcT3NtKNOR1/UxuDWx+vJP1sKaPxd5VjE/tqSM3ixwY1oPv/6lx
         fBD6LpgRWr3ARH8jebtyUhT2xWxs9JvatqAj41bKywlSlknKOicS+RtdhwxDpEwLWFoG
         FeGRW2zyYi0wxTu+sowU0eEjxncSVrws/nAU2TPRRZPIrdGPV2vx71HJMaty5fwNPL1u
         m5izSty52YrkWQb6QEP+VYYU2vmnFpRi4Q3b1s+4pf8sxc9ihJis6YRC9t9LxMe/Gxtc
         V+W7nCW/rgmbcNu+/dUgKxZOE8QjJE3AX9wYkHjFa9Rr0/500HMfFVNC8DCe8VxU/Wiq
         Pj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651279; x=1692243279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajmhvqHnQw1bWOECAA1pHJ5yMdpEx1YYenvqcTIvoQ8=;
        b=YG/3/1MmSqrfaFK6Fz+UIuzSTwW5Fq5KCo5sYzol0/kSepVqNR2gVATQ3VjUnSMEFO
         2Wdmuw7ncp4wHzPkLFTUR45FXPJnrObS3aoCdr0emdakGxZg0iOSCYA+gLRZAL1PflDi
         vuSDAhLT7O7i/3RTSW6Y1VpiWJVXZjkTEdszbn/dUl2qn3utMvD6GRpAsoHI2a3MxVcH
         yWooHqWz6TghUmeVn9JwZdU6hAAFORn4DjBU3zRczefyZ/TwrEtlWYgR3F8TgKTSpcp4
         ZTBVBdHRAbp+a6M2rn14kVnvE/jUC2h5BLkunGcVBCD23gOV4lXOlAQgORkj8N9niEEZ
         4B4g==
X-Gm-Message-State: ABy/qLZLRSeoMpTveEx8vdTFbTw4aiotVbUFSNU7lk7tCi2TCvJcvPMC
	zAtl2eNErkHzBe+HUGXtI1ZE4moXoEiGWg==
X-Google-Smtp-Source: APBJJlHj2CZh5QahXuSlH9Qyj3pPt+incjU78Zjs3urIy/zwamFDH+ok2whdeaNnKbp83QF4zWfVzQ==
X-Received: by 2002:a05:622a:14f:b0:403:ae69:e6cf with SMTP id v15-20020a05622a014f00b00403ae69e6cfmr18305882qtw.28.1689651278847;
        Mon, 17 Jul 2023 20:34:38 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k5-20020ac80745000000b00403715e4cb7sm356633qth.79.2023.07.17.20.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:34:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/6.x: cfg: update ima.cfg to match current meta-integrity
Date: Mon, 17 Jul 2023 23:34:33 -0400
Message-Id: <c3fc71357562b98ab9d47109ac68ffa82d85fc2b.1689651113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689651113.git.bruce.ashfield@gmail.com>
References: <cover.1689651113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184490

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

    cba89f406c6 features: update ima.cfg to match current meta-integrity

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 30fcbd8e86..d4488b360c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "efb2c857761e865cd7947aab42eaa5ba77ef6ee7"
-SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
+SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index acd41b1b4b..4a048b19f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0c7d2016a3a548fd8f7caf7b1f46abd71008cd5c"
-SRCREV_meta ?= "fa08cd6bd6f9415c91da0dd72f4338bff3c68c68"
+SRCREV_meta ?= "d40b8461761ed3a7a52c53a2b3129d5dbad04f41"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index be27537dbc..4e45e25975 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
+SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 88a29bf0cb..67bea2223f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_meta ?= "fa08cd6bd6f9415c91da0dd72f4338bff3c68c68"
+SRCREV_meta ?= "d40b8461761ed3a7a52c53a2b3129d5dbad04f41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index b6a275c363..a76d2dc404 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
 SRCREV_machine:qemux86-64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
 SRCREV_machine:qemumips64 ?= "6c6b1170464e1f64f78a45cf7e78d5c678f38f48"
 SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
+SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 95ef005a14..0252543c35 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
 SRCREV_machine:qemux86-64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
 SRCREV_machine:qemumips64 ?= "4dddf5763b3a26b7892ed75d02bcb9c25a3fe703"
 SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_meta ?= "fa08cd6bd6f9415c91da0dd72f4338bff3c68c68"
+SRCREV_meta ?= "d40b8461761ed3a7a52c53a2b3129d5dbad04f41"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


