Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8014EC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:30:38 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12277.1788960629167981921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=hFwP0ERf;
 spf=pass (domain: baylibre.com, ip: 209.85.221.170, mailfrom: hfranco@baylibre.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c65093556aso4522067e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788960628; x=1789565428; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nAylMiKRgB0SV7T9rf8ZL2ZAQQd61wyOgUJlufQbfR4=;
        b=hFwP0ERff/KDA2uvPiXtWC2zAOrFL1gGR0SvTWOsl4lKloo+aKrxODgla7HilgRH6b
         wmLlLBgp2lXlU6pZS/SlEgQT2o/qXAxtToS34eVCAlNIdTr9w2b/A94YtjRr7TENgEr4
         2dcUjoP/g6otFEWv5L+gThLyqodDgB/jfP1/3/y8MWmlyercQMhrA9XQO1xgp3ih8/+9
         lNE+ejnSmlstbyUtftjPpeR3s9yv0KuuU0MTA8JB9YoIFNWt7GOM/BS8NqYsNZLpwnxj
         i/lAxKfHndmxzbTQQkYmYgKURJyWlD7Ky0vuFdy8E5OWZ3KPu22shXcEAZDYK1lWYgbU
         OUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960628; x=1789565428;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nAylMiKRgB0SV7T9rf8ZL2ZAQQd61wyOgUJlufQbfR4=;
        b=bMXx7vETPjHZwDog9ajjffLXsBNYyN60SlJuQ8Ko+rKg96xgNhZDBbePxScjcsYPMG
         cPQkqGsa60jsSdZNu/ItgwJyRME05pMkMv4XJ1K/6d0b1lA5pf5O9YuHpQWaZ4d15nEf
         VC+uDHu0/MY8EzLLI+3QqMm3jL2GlgqqI5/PhxVAC0h2d4SGId0T0J23NPVnzL7EhQHg
         z3WkCVYQ9H5r222EXy248zn+LO8z+hYqTD4+4yYhKaIKV8jWfpvjszqBe8mkgIhFHZcG
         Dj5JCZn6DnBwf1GtBxNfUekmkYK3/DL4plAtk3IbNLDyMeZimFx3kB8eqAG/9WSRpSrA
         NDRQ==
X-Gm-Message-State: AFuF++krqu6cOo99mKB7J74vgTOOOmzaOJLuwphL4gCpW/VeGadKKxxj
	vjBRzq93OvxHQww6ZoShK5IDJw0dygVS8x9VtRshys+IDdL0g+DXiobRWL3uYLbx438=
X-Gm-Gg: AYBFou2VbcmUdtKQvOQ1mfp2cxJS/T90NWVYuQkc7i7AowE9vWgMDQF3snWfAxPoKPP
	YOogNd53Y6bQDKthNC8u7RdUg8JYkQhIhPbQjf3XM93Po5kEdLMASLFqIdAx+Lj6RAx3UKFcb2W
	9OQc7nK28uVqrxdGqRncPrvALHY5C6bpsfNll9IH7vJ+Us76ykWa/hkxYzmTQQxMOjHbDmggOJ+
	zg+I120Z5KDehW9fRHtMfdWgfAnSt9AdFjpoWVjLlv5myRS+y4B7+iLkGOYvUEzfu00rHoigEST
	8a2m7N2YzWc7on6Lb6sGcLLGkUxPm/iGDkhfQyup47DLAkU/84bjkHmJ5Des0PsGzoFLf0OS1A1
	wlCtl7uq+N81t3aC9LmwDuUfgyIeYXf6DNLs4GWmCMzf/X8DL7XwVSZ+MuGi/3bxykKfV6sS9eJ
	WN33l43Ykb30EpIJ1GqYzlf7aTAZg4LUJ2vs5EMCL78KVck+KpQwEzGi8LoqDAvrrz3nmMgqRg8
	FDTgRw/AiafauyOJjD4FJ5T/H/Z8vdVVrEsbrU=
X-Received: by 2002:a05:6122:e004:10b0:5bf:9461:91d with SMTP id 71dfb90a1353d-5c7ed7dd661mr7141460e0c.5.1788960627487;
        Wed, 09 Sep 2026 06:30:27 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::7f1c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c827384808sm2508661e0c.8.2026.09.09.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:26 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 09 Sep 2026 10:29:46 -0300
Subject: [scarthgap][PATCH] u-boot: share CVE_PRODUCT with u-boot-tools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-uboot-cve-product-scarthgap-v1-1-043b5552f230@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3MQQ6DIBBA0auYWXcSdKGlVzEuEAalCyEzYEyMd
 y+1SZdv8f8JQhxI4NWcwLQHCXGraB8N2NVsC2Fw1dCprldaaSxzjBntTpg4umIzijWc18UkbHv
 99MbpQXsH9ZCYfDju+zj9LGV+k83f5fgPJ7iuDyHIl82KAAAA
X-Change-ID: 20260909-uboot-cve-product-scarthgap-1698fad979fd
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245462

From: Devansh Patel <devanshp@cisco.com>

u-boot-tools builds host utilities from the same source as u-boot, but it
does not inherit the existing CVE_PRODUCT assignment and falls back to its
unrecognized recipe-name identity.  Move the mapping to u-boot-common.inc
so both recipes inherit it.

Use "u-boot:u-boot" for the CNA/CVE List V5 affected-data identity and
"denx:u-boot" for the NVD dictionary CPE and configuration identity.  The
CNA records are also covered by NVD today, but retaining both authoritative
identities permits direct matching independently of NVD enrichment.

(cherry picked from commit bc30a343627e2d207c38d2262a7b07f506259051)

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5f6bd44ab7..27e6ac9db5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,8 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
+CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
+
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 00dda93b4a..7935f2b4aa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -19,8 +19,6 @@ PACKAGECONFIG ??= "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] = ",,openssl-native"
 
-CVE_PRODUCT = "denx:u-boot"
-
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.

---
base-commit: 048f2f8e8864ae5861afe95ea52efc0354bfc18c
change-id: 20260909-uboot-cve-product-scarthgap-1698fad979fd

Best regards,
--  
Hiago


