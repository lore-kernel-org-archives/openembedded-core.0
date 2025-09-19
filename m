Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3589CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:02:59 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.123.1758297771163738680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eUMqsphL;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-827ec18434aso225509685a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758297770; x=1758902570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acW63fhbtqA6/5QLI2rU+sYomagKka+ZInhTPRBXq9Y=;
        b=eUMqsphLpGPSbeDXSzkV9RoVoLo5qvCYzLhiWWfyO77sm8j15vls+Mtg+HAMiKfapk
         4czBLQJwBMyb9PjpGEKFy0mVzie45yu3hDBqiMVhBF7niIdkzYv2QD5LCGhVe1XdZnYE
         cJQ6uLiXMtqhCYmOYQZ/D3EN8Ou2BJVKmocjIuRtTW08Q/N27QSsiGQOsy07Kd8+PSNy
         0jk8fhqqjT1b1oSyhqUdv7JpCEoX3l7dG9514N8R9rS/TyUIepfBQDafatAACG2wT6IP
         2O0sgM1l6UZEwx9KXEb8SPGbU16myYSxpUsc+dK1jaRIOG5K9qW8wGWcQzsJBZKXuOsl
         44QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297770; x=1758902570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acW63fhbtqA6/5QLI2rU+sYomagKka+ZInhTPRBXq9Y=;
        b=Fx1Bbpy7mBQdg0/1TbE0xLVi6rRKLb6ZXBT60fTy8OdiXzDadMrr9L9dyteZAOplaJ
         DuRMLDs1VCl+acwKV/KJqw755vz6B9nkZ+0UM2780a5/5hyEz/J7WYxEhIYmpEaw+xjF
         9suC+9kcGIXEdXiUFN+OLZcrMsBlqFh5OMD0kvYaYWRBCQt2hsCzPLd3V1oU+pgHnpSz
         5s5tPv8ccv2D3nnaJPkByiCtm0rpUDh1jhRNFK6rpSnPV4xO6ZluHhAeN/LMIDGSDPVD
         j4iJsaDpg/xjHWgfkoVZQTs2IOLMjPFX9dSQ/Mk/WokE6cCim2oR3eb7NHaPIvJT2Uoc
         E37w==
X-Gm-Message-State: AOJu0YyCg3G8DrSKI3cBo8cu09dHOJY1bgQucdGFCOcv8bMAonep/0O6
	J2BVwBVzbKtiVU5ZXOSXNJoQ9pviwlev3R70RFKg1iXtPjkj6yAw+U19xvx4PrbCCq0=
X-Gm-Gg: ASbGncvcGRVAd5T8gVf28ZHkkruyKhnYWeFNjnez5z6w2VKiy20BvcXlMA6zDHSjtzy
	nBS/NE9gPxSilnqLtv8UiT9NCfcE2h2IqB27crw3DRbxO+Yt3IHn29aFRtKq7k7B8P4Lk3LYIfA
	BpBNc5KYgPp+mYmIp0dcTYqWh8U+B4U20yocu0O+FNEMEx4VKEAaKrJ9Ra33b05VH2OW1Q3KGE+
	XzdonSrEAVyxLQpQZFPe9O9mr4Bhx+pDR2VvhjJ1P1EEvKh0zNodi2megih5rwBTVolzjjsN8Mn
	7sIofbJi9QTdHgDerV42LLagBu1HZ53Oi4SigBO7sAcuxubHsJjvs7CQzSPIBdVAEDiFl5AvJ6s
	1dNPFJSXREIBKpPeUcZqNMQ4oJMJqVdBoTFRrGiZOzzolxUqeSTDd7kl2Kmuu3tYawu/GfAQsdz
	A2hZ1oU6EgXy4mb9qHJqGYFKGNuFrQwqgb+SR1iZW4jksLpZxpVfgK79I=
X-Google-Smtp-Source: AGHT+IEuR4vCXta4COXFDDGxIe0/gYJy7JbvoRXI2+WZwV9xJxsP65wgQ5yXamkVWtlwGqXTYdDthg==
X-Received: by 2002:a05:620a:450c:b0:812:f563:92e8 with SMTP id af79cd13be357-83b97b7b8d4mr375573885a.0.1758297769806;
        Fri, 19 Sep 2025 09:02:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda12217ccsm30768911cf.3.2025.09.19.09.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:02:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: bump to v6.17
Date: Fri, 19 Sep 2025 12:02:47 -0400
Message-Id: <20250919160247.1816249-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223758

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Now that 6.17 is in the later -rc's the -dev kernel was complete
enough to be testable.

We cam bump to 6.17 for those wanting a newer kernel against current
master.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 3b10707209..6832dccea8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.16/standard/base"
+KBRANCH = "v6.17/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.16"
+LINUX_VERSION ?= "6.17"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


