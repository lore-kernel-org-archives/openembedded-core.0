Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D4AC02196
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:10 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.18817.1738252929332916600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASLLh3Ar;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6e9db19c8so93177085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252928; x=1738857728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXK/c/+1Ep360mEmWhC3r7P6aCQR4+MR0X0ESwtTPDA=;
        b=ASLLh3ArFp8hH0tFN7mESIdbrfSQY1snagiREaF+TVDHqnho79vX3PMla9VIgaIfl+
         MDFKEumxVB7Xh/sxP8L6ZA9rrAyrK1WlGYx6nw0NP07d3HNFWCoH/t+MQcYsAHkK1Arv
         z26FCh1AJWovpS2N4acDklF6SfBfuxQBx12DUH5Or7bHCgApYsn7CVGit4SJdkiYpm2f
         /CFgO+H3mmW34DCCvFn48gWREF09uZQwii+zKO7/PwEp1iyj633lDpXPjFwGhe4EcuH4
         1SHGqugS3g/XZQ7Y/6APeGvTu451te2zKrIngJWtRi+y+emMiW+y+4CGJ7rG7Pp9GLUd
         xBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252928; x=1738857728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXK/c/+1Ep360mEmWhC3r7P6aCQR4+MR0X0ESwtTPDA=;
        b=xL84CSKnDQKvdhsXgo87WrgwzZt5Olcs56IPR0o+w4l4AJWtAZqP6DRMTh+UhTL2Ky
         vp1b4qvgmpe4+0ZD1W4vkTy8/ujU91ZB80rNZZCte5x57jan43vU9e7ucMtqCcOfxdVd
         olmgSURw+cNXaNzGD71knAgoMTPA3Kh9l27YGyYfG9Z2qFx7hHALhTV97Lguc9bG54so
         h+3+bc7xA5XXicrIFk12w1oGQo4EMWDHIFQK8Tb/U5VJCvR6C1xV4hHq2V0cTI2wlwzr
         l4tT9poPqy/zgsozmLUbvHjgVXnJYQRVAXDOdK8EsSw1l6ulTA/VksyycXNXxC8Bj2aC
         Lv+g==
X-Gm-Message-State: AOJu0Ywpdrw8/XVX58YrHsmyhlRecS9B2ZtwHoyki/ueYnEbV//AM0FV
	hp/mh2QXtCyF50+2iHrysks2xSdoHp9oOAnhI1flWG/Bn+sfYh2/XrIFZST1Uso=
X-Gm-Gg: ASbGnctb5r5aFF2epV3fXkVuCl2TMQtPhfGXJ1xlDZnHWpp1SHD/qx7o76s13pT/VWK
	ijloHn7eeXnMEeRF1rAVgrxdLmWz6bLlK3OKLShfKyRyFr22OcA7Tpbu9+vT2LZ5942lFkvrABQ
	dpZki520+DlvwWit/H9fBo0le3GYXK5Z5UErenqqv+xnBHPDX8aUM3acD/+EufVUscNbrourYIO
	0VRfmV0SAS4gmikmBLJbyEdljKExVPieq1Duc9/0esEGjwBTYzWUoy819lwIszhSEc21Bnt11RZ
	+iXNz2D/YHDBKPjgJG+ziK1K92bez03tOuDOy+kronEhve2cKBHwIXa9V187lTS2gYyGqoxTsNd
	ycPtwVgD5regLKXXU
X-Google-Smtp-Source: AGHT+IFtQO0yRjoF9aHL9Tk3MHFl1X/dq0Rit4NFjvd7IHTiaxW2nVx3cvJoR+AMo7lRg7k5+Kt+gg==
X-Received: by 2002:a05:620a:46a0:b0:7b6:6c33:994e with SMTP id af79cd13be357-7bffcccaa8cmr1097721685a.6.1738252928205;
        Thu, 30 Jan 2025 08:02:08 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:02:07 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/6.12: bsp/genericarm64: enable PowerVR DRM and Intel HDA sound drivers
Date: Thu, 30 Jan 2025 11:01:55 -0500
Message-Id: <380a10ad2965ab57ece3bfe2644181c367adee70.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210461

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: enable PowerVR DRM and Intel HDA sound drivers
    Date: Thu, 23 Jan 2025 17:56:16 +0000

    As seen on the BeaglePlay, this allows basic (non-accelerated) output
    on HDMI.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index f5120d9180..600ff325b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b93740cee99b08c6c9c7268c6595eaa7debeb28b"
-SRCREV_meta ?= "9c34085a1b39aaba74176c64be0ef5081f81e1ed"
+SRCREV_machine ?= "b92676dff0434653b4f321a626b894be5e4908d0"
+SRCREV_meta ?= "cbe89aee4d05e11b15a928dfbc216fbdbdf062d2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 95da0514d5..0abb2c748f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_meta ?= "9c34085a1b39aaba74176c64be0ef5081f81e1ed"
+SRCREV_machine ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_meta ?= "cbe89aee4d05e11b15a928dfbc216fbdbdf062d2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b92d81cb9f..f83b870937 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5fdaf7068e5f256c3243d436524a4abd455d3acb"
-SRCREV_machine:qemuarm64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemuloongarch64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemumips ?= "b1c0fd52ddf62f20232698fd524ce3cf7a724562"
-SRCREV_machine:qemuppc ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemuriscv64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemuriscv32 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemux86 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemux86-64 ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_machine:qemumips64 ?= "54b3fb63e85f80e396ccccbe6106a9f83bba43e0"
-SRCREV_machine ?= "b37e2dde9b32bd7678b16d3c1c21c3e06ab2e785"
-SRCREV_meta ?= "9c34085a1b39aaba74176c64be0ef5081f81e1ed"
+SRCREV_machine:qemuarm ?= "97de3b6e2772d8f694107c1ee3a89fba543f81e9"
+SRCREV_machine:qemuarm64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemuloongarch64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemumips ?= "4a649d3eec0ace22715f0b6a032cd5cd09c288f0"
+SRCREV_machine:qemuppc ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemuriscv64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemuriscv32 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemux86 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemux86-64 ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_machine:qemumips64 ?= "ca06e8a2e78be9c42c22cb6da65a852acb3c0049"
+SRCREV_machine ?= "807165b1ec1c73b5c1c30e9dd376e9b568e354bd"
+SRCREV_meta ?= "cbe89aee4d05e11b15a928dfbc216fbdbdf062d2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


