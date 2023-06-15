Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD3DEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 03:16:18 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.10292.1686798972300671270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 20:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nzLtLxJD;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-75ec6ae7ffaso255458485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 20:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686798971; x=1689390971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pnZWkgl9ojxZBxSzsPJOaPP30JVbxSzkOwNimsIshdY=;
        b=nzLtLxJDmbfGi1WCtHQQaIgFz+FAXmx2cOW5lHJwGCZPBrQwxS5ylj3jYbcJoO/rf/
         ym/IR9WpVkD80HvaJNmWRPZMLBAXlZszVOeaT0a9Kx8nBq0TpH4PzlK+Va5WFISc5UUQ
         7EpfgmMj8b0c2V/t1xrSLv2QIXZfU0MhYxVlfZFAmiz2ECqlu2ItvkIe1Oh8PPxORRty
         kjQmBnKEcDqa1AvJkpimd3CO8cfydGbzEpNfdsqVLe1Aw+NvMaHs7Ri4n7NaT31TKbqf
         IwMvs7h+XkF60KdedGIuNDYtskLTsLa8JtkVvzRP9+lmu8XAMyrNZriVlipYaHsov/vM
         18HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686798971; x=1689390971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnZWkgl9ojxZBxSzsPJOaPP30JVbxSzkOwNimsIshdY=;
        b=c2v24FLTDkIYsKDZxj7H8ebSUA2NpZPTNpHBa4OsuC5GSTw+Bx2svQI8libweP1roE
         Fd2Hbq782RCp+iN6kwDNhtHKj7X4Scl6kfIgKRK1djs+oUeB5lzcKrUSltbrLUiPz0o/
         UgQTOOqe9CvxLerZuxFfzEt2fpGsjPwEsSawG7cDyhLOmTBq6w5/etjb9z5sWE2g2hQa
         jWF1DAnhXr+4gG6HIFVeKiETstutZ6lPlv+ctvVhDRFRPT2NBDN1SNKoyPkoP8+YruC5
         pSfRLk2204emaomFYLLKqjba2Mzy+CP5pixIVr8pXooHxiEizAmpryZAtbupWchflBg9
         JcUA==
X-Gm-Message-State: AC+VfDxIGb7Oa/ljgjrEWB77FwJmvSDSenjxBlO3fFH/CBems0+a4z0L
	lUX3B5yC3niO4mjT9op+H5A=
X-Google-Smtp-Source: ACHHUZ6J+yoyMiCkP+20LWF5TLfoiMZgX5UZXgXT7HiNajHnd3MMIC2m7AKsSaLOZBj40PAru0+LJg==
X-Received: by 2002:a05:620a:84c6:b0:75b:23a1:8e5f with SMTP id pq6-20020a05620a84c600b0075b23a18e5fmr18659783qkn.48.1686798971054;
        Wed, 14 Jun 2023 20:16:11 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id p24-20020a05620a113800b0076206d151e2sm943942qkk.74.2023.06.14.20.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 20:16:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.1: fix intermittent x86 boot hangs
Date: Wed, 14 Jun 2023 23:16:08 -0400
Message-Id: <20230615031608.29371-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 03:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182828

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The commit in question appeared as -stable backport in 6.1.28, which is
where we started to see intermittent boot hangs on x86.

Richard noted that others are seeing this is well, as can be seen in
this thread:

    https://lkml.org/lkml/2023/6/13/1460

We bump our SRCREVs to pick up the revert:

    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

As requested here is the revert of the x86 clock fix that is suspect.

You'll need to restore the other dropped linux-yocto version bumps
to apply this patch.

Bruce

 .../linux/linux-yocto-rt_6.1.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4a2a3ca4ab..1033d307f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6871194107bd40397162bfca0a9ef06661057c50"
-SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
+SRCREV_machine ?= "2993cbe41f0f859331c81d6ec8001b094f53cb9e"
+SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index bfc1c7652c..2be9eb9c36 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
+SRCREV_machine ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 53a583e0a3..f5554e26db 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -20,18 +20,18 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cff918ff5ee0001dec6493620535d8804f02cd8b"
-SRCREV_machine:qemuarm64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemuloongarch64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemumips ?= "7a59adc4cd39bea852101be2873855cfc835ef45"
-SRCREV_machine:qemuppc ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemuriscv64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemuriscv32 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemux86 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemux86-64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_machine:qemumips64 ?= "273e099163a72247262a495cb73889d2e0ed6d2c"
-SRCREV_machine ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
-SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
+SRCREV_machine:qemuarm ?= "93797f49c15b6ce9656a607626437e76a3b6c6da"
+SRCREV_machine:qemuarm64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemuloongarch64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemumips ?= "1279631d08d52a5b20044404da4b01205ba4b725"
+SRCREV_machine:qemuppc ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemuriscv64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemuriscv32 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemux86 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemux86-64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_machine:qemumips64 ?= "3b25f845f704021fbe223ef48ab22ff5fa3886b9"
+SRCREV_machine ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
+SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


