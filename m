Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7B2C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 10:35:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.126538.1680690909401696667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 03:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=wzkC4M6h;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id l12so35668038wrm.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680690907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apjJH5vWLCpxJc3dD9HAtcdVZRld4Cl6nbI0fznlNTM=;
        b=wzkC4M6hRofsOyCgW4TwD0fJwipnML+UCdjiH4VYtzv5nriAiAnuS3JwSiXtprgFz3
         12T9KJGWQjAZdhbBaKLuPGM8fB/hzKo/QpEtgfJBrCHxQPAc75bY2Nr3DFww1Z9HLZB4
         3sdIxmBowGCmEPt5smiXcmCav/r8pJEvtWvZWaBKsG98ojNclB+NOlKC7GFqpyV1ziuF
         dHv48OTl6Gb1JNoKoZOYUDROmX2vbicEF3Lu4EDKpRvf21oPXU2g3efURkNz7oToM1YR
         uy1CyUiMaodfSdkdFLcb5n+XHLODzos3R5RL0Ge7qIHdmx/3AMRavjOsilZQ6oChEtlW
         oqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680690907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apjJH5vWLCpxJc3dD9HAtcdVZRld4Cl6nbI0fznlNTM=;
        b=GCdUu9teizox/1nX8yrzu771Cb++6QH00rBKeKKxnhtm9GgHCOp4/t8dbqhfb65aFo
         Ja6hVxOqEukeR/zbouJ7Rxt6WT+MVyBiGnLzOlEO0ase255OsrBLhPg2tQX3key8kluZ
         G64aMFGXBPRKnDJDyEwxHD7fWvF+Q3kJ5jURhFauj3hDu2qR/GX4EM5T8blNMFHvO7TO
         LQer01UPYSbWKkdEHX8+3m2obwSBdBPlipu/j164h/73ZfsCADakv8mRML0y9HK2uy1i
         gXESn3IFejsOdOOANf+rgvFgEciZBKLnZFMShQnnAxyTpyhjbhktDA/mIA0y0dHmcKhs
         lhBw==
X-Gm-Message-State: AAQBX9c6d/z2sUTh/inYDyaHQzWda6q4Gs3+2DSfSxAWqxjdZ1s6WVG5
	2OeXXkwL6DLqwdfnk3LKWejJSw85cmfbUl0yZBo=
X-Google-Smtp-Source: AKy350aCltjB9yRJcZsaXk3NUVD3oZBMRmBR5HjmPnIjXx5lxmk6TN+iLtl5pS2dApMnJ8nmvDaZMQ==
X-Received: by 2002:a5d:6112:0:b0:2d2:59cf:468f with SMTP id v18-20020a5d6112000000b002d259cf468fmr1511001wrt.15.1680690907185;
        Wed, 05 Apr 2023 03:35:07 -0700 (PDT)
Received: from P-ASN-IGGY.home (2a01cb0802a81d003f7edd470f5e6aed.ipv6.abo.wanadoo.fr. [2a01:cb08:2a8:1d00:3f7e:dd47:f5e:6aed])
        by smtp.gmail.com with ESMTPSA id h14-20020adffd4e000000b002c71a32394dsm14604047wrs.64.2023.04.05.03.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:35:06 -0700 (PDT)
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] cve-extra-exclusions: ignore inapplicable linux-yocto CVEs
Date: Wed,  5 Apr 2023 12:34:54 +0200
Message-Id: <20230405103454.9146-1-geoffrey.giry@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 10:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179732

Multiple CVEs are patched in kernel but appear as active because the NVD
database is not up to date.

In common file cve-extra-exclusion.inc, CVEs are ignored if and only if
all versions of kernel used are patched.

In cve-exclusion_6.1.inc, only ignore CVEs that are patched in v6.1,
and not patched in v5.15.
Recipes of version 6.1 should include this file.

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Geoffrey GIRY <geoffrey.giry@smile.fr>
---
 .../distro/include/cve-extra-exclusions.inc   | 53 +++++++++++++++++--
 .../linux/cve-exclusion_6.1.inc               | 15 ++++++
 .../linux/linux-yocto-rt_6.1.bb               |  3 ++
 .../linux/linux-yocto-tiny_6.1.bb             |  3 ++
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  3 ++
 5 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.1.inc

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 71e9714c6d..76992c5b46 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -136,6 +136,16 @@ CVE_CHECK_IGNORE += "CVE-2022-1184"
 # Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d29
 CVE_CHECK_IGNORE += "CVE-2022-1462"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2022-2196
+# Introduced in version v5.8 5c911beff20aa8639e7a1f28988736c13e03ed54
+# Breaking commit backported in v5.4.47 64b8f33b2e1e687d465b5cb382e7bec495f1e026
+# Patched in kernel since v6.2 2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
+# Backported in version v5.4.233 f93a1a5bdcdd122aae0a3eab7a52c15b71fb725b
+# Backported in version v5.10.170 1b0cafaae8884726c597caded50af185ffc13349
+# Backported in version v5.15.96 6b539a7dbb49250f92515c2ba60aea239efc9e35
+# Backported in version v6.1.14 63fada296062e91ad9f871970d4e7f19e21a6a15
+CVE_CHECK_IGNORE += "CVE-2022-2196"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2022-2308
 # Introduced in version v5.15 c8a6153b6c59d95c0e091f053f6f180952ade91e
 # Patched in kernel since v6.0 46f8a29272e51b6df7393d58fc5cb8967397ef2b
@@ -169,6 +179,15 @@ CVE_CHECK_IGNORE += "CVE-2022-2785"
 # Backported in version v5.15.65 e9d7ca0c4640cbebe6840ee3bac66a25a9bacaf5
 CVE_CHECK_IGNORE += "CVE-2022-3176"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2022-3424
+# Introduced in version v2.6.33 55484c45dbeca2eec7642932ec3f60f8a2d4bdbf
+# Patched in kernel since v6.2 643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
+# Backported in version v5.4.229 0078dd8758561540ed30b2c5daa1cb647e758977
+# Backported in version v5.10.163 0f67ed565f20ea2fdd98e3b0b0169d9e580bb83c
+# Backported in version v5.15.86 d5c8f9003a289ee2a9b564d109e021fc4d05d106
+# Backported in version v6.1.2 4e947fc71bec7c7da791f8562d5da233b235ba5e
+CVE_CHECK_IGNORE += "CVE-2022-3424"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3435
 # Introduced in version v5.18 6bf92d70e690b7ff12b24f4bfff5e5434d019b82
 # Breaking commit backported in v5.4.189 f5064531c23ad646da7be8b938292b00a7e61438
@@ -382,10 +401,12 @@ CVE_CHECK_IGNORE += "CVE-2023-0266"
 CVE_CHECK_IGNORE += "CVE-2023-0394"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0461
-# Introduced in version 4.13 734942cc4ea6478eed125af258da1bdbb4afe578
-# Patched in kernel v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
-# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
+# Introduced in version v4.13 734942cc4ea6478eed125af258da1bdbb4afe578
+# Patched in kernel since v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
+# Backported in version v5.4.229 c6d29a5ffdbc362314853462a0e24e63330a654d
+# Backported in version v5.10.163 f8ed0a93b5d576bbaf01639ad816473bdfd1dcb0
 # Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c9d6
+# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
 CVE_CHECK_IGNORE += "CVE-2023-0461"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0386
@@ -421,6 +442,32 @@ CVE_CHECK_IGNORE += "CVE-2023-1077"
 # Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
 CVE_CHECK_IGNORE += "CVE-2023-1078"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1118
+# Introduced in version v2.6.36 9ea53b74df9c4681f5bb2da6b2e10e37d87ea6d6
+# Patched in kernel since v6.3-rc1 29b0589a865b6f66d141d79b2dd1373e4e50fe17
+# Backported in version v5.4.235 d120334278b370b6a1623a75ebe53b0c76cb247c
+# Backported in version v5.10.173 78da5a378bdacd5bf68c3a6389bdc1dd0c0f5b3c
+# Backported in version v5.15.99 29962c478e8b2e6a6154d8d84b8806dbe36f9c28
+# Backported in version v6.1.16 029c1410e345ce579db5c007276340d072aac54a
+# Backported in version v6.2.3 182ea492aae5b64067277e60a4ea5995c4628555
+CVE_CHECK_IGNORE += "CVE-2023-1118"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1281
+# Introduced in version v4.14 9b0d4446b56904b59ae3809913b0ac760fa941a6
+# Patched in kernel since v6.2 ee059170b1f7e94e55fa6cadee544e176a6e59c2
+# Backported in version v5.10.169 eb8e9d8572d1d9df17272783ad8a84843ce559d4
+# Backported in version v5.15.95 becf55394f6acb60dd60634a1c797e73c747f9da
+# Backported in version v6.1.13 bd662ba56187b5ef8a62a3511371cd38299a507f
+CVE_CHECK_IGNORE += "CVE-2023-1281"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-28466
+# Introduced in version v4.13 3c4d7559159bfe1e3b94df3a657b2cda3a34e218
+# Patched in kernel since v6.3-rc2 49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
+# Backported in version v5.15.105 0b54d75aa43a1edebc8a3770901f5c3557ee0daa
+# Backported in version v6.1.20 14c17c673e1bba08032d245d5fb025d1cbfee123
+# Backported in version v6.2.7 5231fa057bb0e52095591b303cf95ebd17bc62ce
+CVE_CHECK_IGNORE += "CVE-2023-28466"
+
 # Wrong CPE in NVD database
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3563
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3637
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
new file mode 100644
index 0000000000..ec7ff9c1a7
--- /dev/null
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -0,0 +1,15 @@
+# https://nvd.nist.gov/vuln/detail/CVE-2022-3523
+# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
+# Patched in kernel since v6.1 16ce101db85db694a91380aa4c89b25530871d33
+CVE_CHECK_IGNORE += "CVE-2022-3523"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2022-3566
+# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
+# Patched in kernel since v6.1 f49cd2f4d6170d27a2c61f1fecb03d8a70c91f57
+CVE_CHECK_IGNORE += "CVE-2022-3566"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2022-3567
+# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
+# Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
+CVE_CHECK_IGNORE += "CVE-2022-3567"
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 5f79bc617b..2cf1b048c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -2,6 +2,9 @@ KBRANCH ?= "v6.1/standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.1.inc
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 58357d00c7..ff3bcad5db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,6 +5,9 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.1.inc
+
 LINUX_VERSION ?= "6.1.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 6f33032c00..033bc10e55 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -2,6 +2,9 @@ KBRANCH ?= "v6.1/standard/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.1.inc
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.1/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.1/standard/qemuarm64"
-- 
2.30.2


