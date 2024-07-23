Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F93C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.43723.1721740413321746578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yJabUdVi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc587361b6so41918405ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740412; x=1722345212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO46Dl/OAKrN+86QYrl9+HDMHeOuPTiWWmVKOl0Su0U=;
        b=yJabUdVii0n2/aJ49B0DXWqgTc8GVxFypwdk470dWrV+QokATythGpX3Id9Q4slQvf
         drGFoEeiCBsoTyp8LHIkaV38jFrzroQw2bCdumC/CxPHiDOevGZNxgiL+GxF0YkSJ4ws
         glPZHUzzH3hYyqiAl2h4eMKDgl1BLFDWTqf1aBtwLaOGxCOsWKg5QQ/mCAETeayr3avJ
         GaYZcUGSiMG/mrM6KAAcgWbq8EHjZR54pEidF3disYdOTRHVK/ep2u8YMrhlU3gKwEQm
         k3FLYwmTHt0qM4zSPHp9WeTWFXkmNIBYaz8MsgeRxghbc3eY6PWMSf7/V11XJCR2x80i
         wxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740412; x=1722345212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO46Dl/OAKrN+86QYrl9+HDMHeOuPTiWWmVKOl0Su0U=;
        b=Bic0Stc+bYWc/hyCax3izZz6JG1ItG003mkO1cUbjECe6HASdhUpnY+cjyYlEhzGY3
         TL2QITENsUgrXdZy+c1oN4a+T9Q0PO8BjX89WlDTIBQ3rwwob10INSHndVXDC56H4r2j
         F9ngtQ2bMzZ9Kf6L6UKOM5fvIowKaNitLOTsG1BNhDMKjRZvn7lnKcBEkeI2gsWb1Ot8
         8JExcK1+n3JBYBPpsA7A7XeUju5vKVim9i7R7UUC/wLIxE/xiUVqc5nZUkwBm7wTDBBk
         pjtp2SsnhZQY72crA4uMfHUIit1Jg0bE/tzw0KjCOEBUF0a17MofCaqAV2VddpJuW3ub
         eAiA==
X-Gm-Message-State: AOJu0YxcS5GyX92ivU8rbp5G3T0KLnlok2tuQjuW6DisBpAWQcOx7zEo
	wt5Ey9dxg6+XkvJNTRRUBFCub2e5toDcA7dPSwsyFhrEC4OU1mTxoc44mudNHHVi6PhTbSefVqT
	gpn4=
X-Google-Smtp-Source: AGHT+IEoi/zjocGd6TG/5/SjoneQMWxCyl4SzO5ya6/wijvrRIbEpz++hohuNnjSIV4Hr+WQl/E4KA==
X-Received: by 2002:a17:903:24f:b0:1fd:6677:69bd with SMTP id d9443c01a7336-1fd7466aed6mr74780055ad.41.1721740412473;
        Tue, 23 Jul 2024 06:13:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/17] xserver-xorg: upgrade 21.1.12 -> 21.1.13
Date: Tue, 23 Jul 2024 06:13:04 -0700
Message-Id: <9c00034001c27a17658ae8ae6a75d0c115a1a16b.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202350

From: Alexander Kanavin <alex@linutronix.de>

Changes:

render: Avoid possible double-free in ProcRenderAddGlyphs()
mi: fix rounding issues around zero in miPointerSetPosition

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78dc14599a65075a40c26df4bf9d2bb33a237ca9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch | 3 +--
 ...ciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 9 +++------
 .../{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 11d5546537..e9cbc9b4da 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From ce3b8a230a3805c9b557c1f106795675bd034860 Mon Sep 17 00:00:00 2001
+From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 17 Aug 2020 10:50:51 -0700
 Subject: [PATCH] Avoid duplicate definitions of IOPortBase
@@ -10,7 +10,6 @@ compiler.h:528: multiple definition of `IOPortBase';
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  hw/xfree86/os-support/linux/lnx_video.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index d05eec5bb9..d1516c2f52 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d77cdc5e1eee26821ab98c947abea53fb7b18fe5 Mon Sep 17 00:00:00 2001
+From ad8967de36e6e2a185b71ce1d701448cda4ef3e2 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
@@ -20,10 +20,10 @@ Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
  1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/hw/xfree86/common/xf86pciBus.c b/hw/xfree86/common/xf86pciBus.c
-index e61ae0cd4..d70c99197 100644
+index aeeed8b..db705bf 100644
 --- a/hw/xfree86/common/xf86pciBus.c
 +++ b/hw/xfree86/common/xf86pciBus.c
-@@ -1173,7 +1173,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev,
+@@ -1174,7 +1174,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev, XF86MatchedDrivers *md)
  		case 0x0bef:
  			/* Use fbdev/vesa driver on Oaktrail, Medfield, CDV */
  			break;
@@ -48,6 +48,3 @@ index e61ae0cd4..d70c99197 100644
  			driverList[0] = "intel";
  			break;
          }
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
index 570e08d5ae..1f18c22fa8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1e016e2be1b5ccdd65eac3ea08e54bd13ce8f4f6c3fb32ad6fdac4e71729a90f"
+SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


