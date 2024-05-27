Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F3CC41513
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.3777.1716833545158362526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kECNnTIS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-529b4011070so22223e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833543; x=1717438343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG7X6lxoV3qY1l6OwpMLdpsHQB7zxQWu0NmTa4BBMRI=;
        b=kECNnTISVlZDBEFW7SbYZboo0HAUcajol0s3kYpg7zyxNbP2wQYttp2xLC1hcrYB/o
         sFLA7u3PQzqVHReqGSjz5372uK4sER7zteG0T/VQmEeDSSVAnWqMnvfkTFV84IQZ0p6X
         hN0HqWijvtzsOQD3N0I531jcY0pjaJiulLfG2XTmXtBhPbIXhd6j1wgQyGWRAEa9XTea
         NkLyBQI0b69ZpyMKYmOEms3RW/XvxAgxIs8DnHXlJ0D4MjMMYF+TF+jyTCmJsGigibFa
         eK15OZgXPXL9sZeLmCXITFzrYUs/92Rsgigx+wv/+3Obbvgdc9PvyF/n9npXgYNgn+u2
         /MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833543; x=1717438343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG7X6lxoV3qY1l6OwpMLdpsHQB7zxQWu0NmTa4BBMRI=;
        b=tG+x9T8gZkMWRQ2Z3//CTG8b8D5pljQnrw6xDmQYtMQeXXDXgz1Ybm/aBx3CGJZ0pB
         Plkmiiv2yXZZOdgs3PQTidaavoEEFxdnm1APszJlriQmS/FcsLjNvaCZzV2pMT+0M93k
         PQC0kYikcJRiva6bn0pY/1sZCXoCI/ughskqGw8P14AhbRNpzMf/KZpeFY7VIaNbl/Xp
         xFpkXWBojSlROip0/VOhTDCxbZUi2QSXZ/vbraTOk6nxR0d/G+SOnP4VGyjdR9JGQC1K
         lqvDi89r4IknJ5Ws5Eb5cMwfe3RGGYX3sS8YUzk+ron1LrURYgiKVAOYO0x6LP4fsVhR
         L5MQ==
X-Gm-Message-State: AOJu0Yy9b/LWCiGY3vkHID3FKGSM1e43jR6fESwWbEw4GR7pWFYEIOY4
	JDUXpHQeSo/BHoRI2MqkuA5dawP+UKokMLZIekG5XNST+BAg9aJQfeYoVw==
X-Google-Smtp-Source: AGHT+IGNUfhPJl2+jp6ecuwCunERI2YiIb68Mlht1xGjrIlhGNWI7gXuY+vVQ3oApHxlK9N8D9/3wQ==
X-Received: by 2002:a19:e01c:0:b0:51d:5f0b:816f with SMTP id 2adb3069b0e04-529646de43fmr5215376e87.15.1716833543182;
        Mon, 27 May 2024 11:12:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/13] xserver-xorg: upgrade 21.1.12 -> 21.1.13
Date: Mon, 27 May 2024 20:12:10 +0200
Message-Id: <20240527181214.1778037-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199926

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch | 3 +--
 ...ciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 9 +++------
 .../{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 11d55465374..e9cbc9b4daa 100644
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
index d05eec5bb92..d1516c2f524 100644
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
index 570e08d5ae0..1f18c22fa86 100644
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
2.39.2


