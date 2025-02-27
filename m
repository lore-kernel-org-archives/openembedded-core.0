Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE929C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 05:38:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4614.1740634686110970054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 21:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aBnCLK5R;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22337bc9ac3so8604255ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 21:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740634685; x=1741239485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ygJFt8IxdX7qkq2RsV5s7iE5zIanR4c4Ape/VGISKb0=;
        b=aBnCLK5R947LhjgCuFuzlR7eEBM9ENrKje+rNBgWAq//bT1m+ezo5fmiKrHqtgtyHB
         IjRVvp8yYL1zyrg1TuwZ+xAr5KdKT5VP98mDSSwohsRfwV9q97adB2u8TjlMY59wZU6N
         byI/YlpFqMSEZXLPcrhxMGlKaxbd66y4PSzsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740634685; x=1741239485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygJFt8IxdX7qkq2RsV5s7iE5zIanR4c4Ape/VGISKb0=;
        b=lRCIyihQ4nKm5DdaUDwDr8CyRVMhOQedmEpIy143XDQkvrg9/MfsUy5Tpv0NdsMeD0
         G8yYGf5K59gLjsoUTGVyoPwQlYZ2cbYB+EgsGw9un4qiVsFuSAnkceh2z+RgdjQrAmeQ
         um4lf1ApSNtjNryQEyarT0dbkqxUlSB+sXDVlStEYRhqGNCQUoUl8cY93I5lV2R7FUaS
         FkojDgYh421tja5bqY6oTRYJMmsUTbR3HCQ9uzhCKFD8xciqsWRSe58qXsnzMglu5+6O
         E0hEEKwHZ2a5Zc8JFugI0BskBRRibZCguLIwD2URzQYxkO2l2d2Cq0kXYq60Z2oaJv7q
         TdGA==
X-Gm-Message-State: AOJu0YxreKxBEHBszoiGY9he2QhGWUlGVM8/OEMXrUnPpIX68hKctt3d
	dYfJjcVPXkBrjY0eNOAPPZ034nyBf8vWnb9RMVEm5BrYjTmun7JNimhew3o/LoiYEafrFGviOwI
	+1K0=
X-Gm-Gg: ASbGncteOlyC2bdIRS6HMS344UbfPJnFsh4Cg/6N8xskCW+EbVBsjNggLADFLHpeZCd
	uFHSoXgTeedkjGvqzmVyMo1JqPAAQCLf965tyqSmKk1j7z5LR/PhOXLRZEl1fK99e0ycpRWJFDK
	6cICF2XG5khvuWHuUY6liV4DHIZZouj18Sy7SRbixsCrX4vTf4r6ph4YcZD42rzjminHHAKSkXB
	0wHLSRyrs+klELhhKsQQK5Xp4E+0jkorMBlnfKwTahEEX9axvhvmB2FH+c15InG1d3QLbfgvPZ7
	RyNPCJumjWMslcW3pJCVs5805C+VLYlpijw=
X-Google-Smtp-Source: AGHT+IG8vJbj3jTiKCulsItfAS6N0vBfyveY6q1J12dSeLtsdvQUjq6aAzLYNR+HV+QKHAGO0si0DQ==
X-Received: by 2002:a17:902:ea0a:b0:216:393b:23d4 with SMTP id d9443c01a7336-221a0ec9a77mr358974895ad.11.1740634684488;
        Wed, 26 Feb 2025 21:38:04 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003e28fsm592677b3a.127.2025.02.26.21.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 21:38:03 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] xwayland: upgrade 24.1.5 -> 24.1.6
Date: Thu, 27 Feb 2025 11:07:53 +0530
Message-Id: <20250227053753.12463-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211978

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix

  * CVE-2025-26594
  * CVE-2025-26595
  * CVE-2025-26596
  * CVE-2025-26597
  * CVE-2025-26598
  * CVE-2025-26599
  * CVE-2025-26600
  * CVE-2025-26601

Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
     https://lists.x.org/archives/xorg-announce/2025-February/003586.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/{xwayland_24.1.5.bb => xwayland_24.1.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.5.bb => xwayland_24.1.6.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 19a6384087..350b8e93cc 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cb4bd170e6fa6b545ba0567be8f693d2eeccfc62d04c67037dd14f06daad361d"
+SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


