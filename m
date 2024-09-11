Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60925EE57E2
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:47 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.35252.1726097023610924891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c7zVdt3n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718e11e4186so277713b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097023; x=1726701823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZN2XB5Hv+TnbiojahCd6pMcEVUeM2ps8gr8/6o7roY=;
        b=c7zVdt3nRI49Q46RFsKEDOn4G8i91Vp9r6aGhHgyJI4w1Y3fvGcixoUe8bI5PateSI
         h7KRO+/YpduouDn8+hTPcGddxLfEtZ8yhHTNnw0GUDxYHBoBHxViD5d4lXOt2O5OLEqC
         cDi/pPxrKDLf0EkbiY7bdGjlaRs1uZvjbi3mLOiQvHbf+tOzMlaHUtpwbu3CGegUUy3C
         ep03nT6h49mBTzn9U2zWcOFV+jpKWtWMtwammfPQ/PdmK3U8/ruhN7qkwTRMcJ5AGDP0
         /cz0HLpqKor7R31iZ9iD8HwAKBuODrHQ0D6G015IBe0gaR9783Pdvd94TYpTJZxLL6d8
         l73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097023; x=1726701823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZN2XB5Hv+TnbiojahCd6pMcEVUeM2ps8gr8/6o7roY=;
        b=qbkcwvcWoY1EueesSUQmg79l/GBU7uTD/DJfz23Nyun+xXe2Q9HaIYgve2vjYn2iCm
         +6pnO8z230H9yy7/Gx7pXQ6OAfefoz+OMvhWi8Ot7kzs73uK0WeIfJH3xj4+CsSwEGu/
         xM/xAFxIloVNBicxYbhejk36KBYdD1sguZCTCEm3EnF5SVCxECvn3yhPgY66g14p769c
         JZf9cxExtGa44G4bOXe71q+b1vxJFKzcRIUSzyXRBs+oROJYjfoWYZFY7cdFlJkREEXK
         R2UYYdTimgoXAqZ5qbOZwbxz8dwEf1stp4I02Kan4gpdqNQ4R1Vfch2atRcUFVN+3p/+
         PrEg==
X-Gm-Message-State: AOJu0YwrTjLUSvB0me+m9v+xjgNwqWZtO1FLoxFuL1GD3uvYerJmMx3M
	Val6LVDASqXsEaw/dKksNgnTWFXYZoCN2xx37OKR5HJiN05T5clwL25gvLQAyAkQ8GbVBpqE3c1
	5
X-Google-Smtp-Source: AGHT+IF2TdADGJtmFw6ZVyHKe9kc3bfrX/HNBqhQBiUW4vFAQ+8Xy3nSUzHcOqzbez6MfPJYMFerhw==
X-Received: by 2002:a05:6a21:670d:b0:1c6:fc39:8968 with SMTP id adf61e73a8af0-1cf764c41c4mr1238925637.46.1726097022799;
        Wed, 11 Sep 2024 16:23:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/22] linux-yocto/5.10: remove obsolete options
Date: Wed, 11 Sep 2024 16:23:06 -0700
Message-Id: <1f3046818f6f93366ad5ef3fb17cc1052f075b3d.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204403

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Wenlin Kang
    Email: wenlin.kang@windriver.com
    Subject: net_sched: remove NET_SCH_CBQ and NET_SCH_DSMARK
    Date: Tue, 18 Jun 2024 18:41:49 +0800

    The two configs have been removed from kernel source in commit 56a6720d9bc3
    and 3fa31e7a9d3a, so here also remove them to fix warning.

    WARNING: linux-yocto-5.10.216+gitAUTOINC+c658f078fe_bcf06546f5-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:

    [INFO]: the following symbols were not found in the active configuration:
         - CONFIG_NET_SCH_CBQ
         - CONFIG_NET_SCH_DSMARK

    Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9c37ea8a15..bc4e49ca08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6ed671f36a091fc09ca9ee804ff959bc7d6eb4c1"
-SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
+SRCREV_machine ?= "421ad32504cf202dafd09394bae1ad6521539a49"
+SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2cf94cc9f6..d2e540847a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "a897f5860a61c0bd5eac9780b292dba2f158a33b"
-SRCREV_machine ?= "5506a25c2de1ff6956b79138000301f344a6e869"
-SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
+SRCREV_machine:qemuarm ?= "cf393a05f2ba24f3bc5f3727a5fe9dc63ec247bd"
+SRCREV_machine ?= "9f2e7d21741259c175f6186577bd82f82cb1f96a"
+SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 97772390b2..cb03649545 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "590d7093102d1def24e8034ee0be799797b62a5f"
-SRCREV_machine:qemuarm64 ?= "b1dc4c88ed9dd6e6abe2886bf765ebb741070c7e"
-SRCREV_machine:qemumips ?= "c09fe97a7469eb7a20cc60e9fb759ad433a78b91"
-SRCREV_machine:qemuppc ?= "9f1cff9c0409729a3aa098e411e4b20cf1d94001"
-SRCREV_machine:qemuriscv64 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemuriscv32 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemux86 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemux86-64 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemumips64 ?= "9fc7eb5bd92e22ec62caa3a1896b967109095916"
-SRCREV_machine ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
+SRCREV_machine:qemuarm ?= "ebf8b0d0c68aeca12d7f7a2fa35c2991e23f5ae4"
+SRCREV_machine:qemuarm64 ?= "9837e97ae4ced4fdb9250acd275ad1decfde6e5e"
+SRCREV_machine:qemumips ?= "18f0ddf9859784df80af64e4d6f9a41c49b8b1f4"
+SRCREV_machine:qemuppc ?= "c0adf44845851025b1a18c50927af16a7d049ab8"
+SRCREV_machine:qemuriscv64 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemuriscv32 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemux86 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemux86-64 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemumips64 ?= "5341a9dbcda59f3c95aed519a6b86e96cd6fdf65"
+SRCREV_machine ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.34.1


