Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EF3CCD195
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 09:07:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4462.1761124063392393857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 02:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3UBpvWj;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so36834385e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761124061; x=1761728861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WqA8lKrLVxzUHdodfC/KecKxDov/0BnGypSLlGGFCk=;
        b=Q3UBpvWjtTYdl3C0zQbCstZiZ/Ph5o6t2pmWkPZc//FC9E5KyAdCZWo96yg2SopfQm
         MAl5XzTsUIb0ulB0oGuJ/HYYRD52V7rdfOJ1HG/J4EG1FT6UuJyPmxPnayeKQXf8+1ib
         eKjpID19NiOKXEn1S0/otrVEPzFYVX9nB5O0Xv1kFMVXXu8r59ZYFbmCwvRfwIb0xC0K
         SMZECrfu+CZeKGV3aywuRjBk1Pa1LEqHNIy2doZrrXGXvS21c6rgSe1BtKqLcvu3+BAQ
         HKg1EAMn0Xwmu7zwaQ//nOLRNr9Mw3EzFe6MVEMLzJBatdrYq0QpxFa2mEcICL5TBwkN
         fYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124061; x=1761728861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WqA8lKrLVxzUHdodfC/KecKxDov/0BnGypSLlGGFCk=;
        b=BDZxvcAx/WIiHNWyK7tdGRxbAqf0uGkoib/cboN5ENfImTzZuW7A44XheLZzNZNWuc
         5UVKRHAotSEBjjznq7fudAwSQCEN990VI2WOmEXfWu113LvPi1oYnDtRxhQFTQV4ssfj
         xd2QrEkwo5SK5M2CUmZFlj49BjPRKXRiGW6HzDYsMZyVG7ORC+i9j+BuwqKc5iIb4StZ
         hpgNzpj/z9hs+yMHZwgEyD9a6BUVhAd1AnV/273e5xxz4lRsZFEjhDQVyLjB1QvnVDUp
         4vwlaopXMHesITdEJKVJZw1rlKrKHzxXhT8V7y+Uoo+kxaVotrm39qMC8vVda97oJo25
         4yEg==
X-Gm-Message-State: AOJu0YxkrMUXk2qBPLhKSLumC/ZiNcn2TaPiMlEZe3p6xFRIE5wlNI5Z
	sCAp995LYd6jTMmgyOsUByPYIt6YpFhkMKHaGkfgea71kAyw4vC6wiTpn9chsgMt
X-Gm-Gg: ASbGncuPNnRwQxEc/4yOGRO9LdavVlESY/nIHTRj6ovyBQCBdMtk7P2Sq0BTCKtk8vo
	xer4XQpRYmDzO9cpcdSZRM6ljw9057qzwnu9c1E9yV02u+qhVcG0ut70zG9McbFpaOALzrYRN/o
	0rLnZD7flyalXsW/bXx+9+qkrRU+EgVvQ7rUL8l17b5TvRkY6Gj2dJhPy3EEYs0Lu1948wmFJgi
	AQumfrteRIEoIQaqM1VGN4+qlN79zpUmyoXPSoVRh1XOScKCwqdB8WpqiHYjobHlht4oPL+saCI
	61liWd4Ei5sCfas/FBDHjDBbFLDdGcIq9VNIOzxQ/pLdSBAYQB/Y2PuPhNb4rPZ89X/dflCC3Ip
	5Uljz50znumrihuOtlHoiApWWOzUpVCWT9OMkpd3rFggq/i7iXQFOEysqwbPWf9NgGIfi1yKwoT
	NdgBCZSjusSqvG8L1Yfdus
X-Google-Smtp-Source: AGHT+IGdDnBRflGUT+eFkOiG9uqqR98LU3tz4F7fmo3M+iPmxWyJ2UdZmLKI4S4JpWHxKN7rX+h1Ug==
X-Received: by 2002:a05:600c:37cd:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-471178774dfmr108628675e9.13.1761124060093;
        Wed, 22 Oct 2025 02:07:40 -0700 (PDT)
Received: from fio ([185.228.162.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494b365adsm34165275e9.6.2025.10.22.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:07:39 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH v2 1/2] spdx-3.0: replace SPDX3_LIB_DEP_FILES with SPDX3_DEP_FILES
Date: Wed, 22 Oct 2025 10:06:47 +0100
Message-ID: <20251022090647.419543-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 09:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225179

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

We can have more files types in the chain of dependencies and not just libs.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 6 +++---
 meta/classes-recipe/create-spdx-sdk-3.0.bbclass   | 4 ++--
 meta/classes/create-spdx-3.0.bbclass              | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index e0f1766bb7..636ab14eb0 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -36,7 +36,7 @@ do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_rootfs_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
 do_create_rootfs_spdx[cleandirs] += "${SPDXROOTFSDEPLOY}"
-do_create_rootfs_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_create_rootfs_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 
 python do_create_rootfs_spdx_setscene() {
     sstate_setscene(d)
@@ -54,7 +54,7 @@ do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_create_image_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_image_spdx[vardeps] += "\
     SPDX_IMAGE_PURPOSE \
     "
@@ -77,7 +77,7 @@ do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
 do_create_image_sbom_spdx[cleandirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
-do_create_image_sbom_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_create_image_sbom_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 
 python do_create_image_sbom_spdx_setscene() {
     sstate_setscene(d)
diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
index 855fb3d09f..e5f220cdfa 100644
--- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
@@ -8,14 +8,14 @@
 do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
 do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
 do_populate_sdk[postfuncs] += "sdk_create_sbom"
-do_populate_sdk[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_populate_sdk[file-checksums] += "${SPDX3_DEP_FILES}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
 
 do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
 do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
 do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
-do_populate_sdk_ext[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_populate_sdk_ext[file-checksums] += "${SPDX3_DEP_FILES}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
 
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c0a5436ad6..3a8a97eca4 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -133,7 +133,7 @@ oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCH
 # SPDX library code makes heavy use of classes, which bitbake cannot easily
 # parse out dependencies. As such, the library code files that make use of
 # classes are explicitly added as file checksum dependencies.
-SPDX3_LIB_DEP_FILES = "\
+SPDX3_DEP_FILES = "\
     ${COREBASE}/meta/lib/oe/sbom30.py:True \
     ${COREBASE}/meta/lib/oe/spdx30.py:True \
     "
@@ -159,7 +159,7 @@ addtask do_create_spdx after \
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
 do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
-do_create_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_create_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 
 python do_create_spdx_setscene () {
     sstate_setscene(d)
@@ -183,7 +183,7 @@ addtask do_create_package_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_package_spdx"
 do_create_package_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
-do_create_package_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_create_package_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
-- 
2.51.1


