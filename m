Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2BC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:00:48 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.413.1704729639892718484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJ1G2Fip;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cdf90e5cdeso237143a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704729639; x=1705334439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otKEyWsivNjsXHb/njLrpUmmziS5vjIABgnF9QopAcU=;
        b=lJ1G2Fip7Q40uP5k3nG4RFG5CBp61C7NTNRbGmnRnk268l3pIMbpP7gWh5QRYKox9j
         lQy3Sbuhmk2pgPSJiYtsvCWt8OIfE2+xAdMW0h+hn3ECiDaIW5BOMoSi0zZzqZ8rAxUX
         mh+g7G24URQuDLaXCqXNpOM0ayD4e6ow4Ypv/AlqqH4cA2YDSQCtiRtarAQsD6Jbde/u
         LZXsro2UvbGM6QkaMtf3JhDwx29dWieIQ3OOuj5VEjKVmAz3zgp0Mj8QqVJhZ4B/R/Ze
         8YYZdcufAEYWM85HmJSTKM+fuj56kPAnqfFCnKYd7boXzgNofBSV7wwl6Eex7Y4km+HQ
         AHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704729639; x=1705334439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otKEyWsivNjsXHb/njLrpUmmziS5vjIABgnF9QopAcU=;
        b=odgoViIWkS2X3B4voYwCHCqStJcG8WAoWyAkJ8snSLz708rTAorf2JYdcLY4pObcPo
         h52qVtv6XUWsklY3yO2Nv/Zkh7uNe3F5l+M2QTUwsWCwPDWsRi1K1gm1uojNi5UFVZEm
         WlWDMM8XZw7xpJJwOTV2y1LBNl1F+tpihl1R4zu00ppoC48AXJvimhWF23aVhFe5Lr5D
         pdZxVdVTM5aGRlTwi259jnZGjlOYn/gqMXl3OWawDSweR3dymahNOTQiHNkqv8Kf7LY+
         GAihXGqbVy++HkEyKptI5V1Bm8Epqafnl4ck0vmp7vckvMOV1TFHd0qpQ2PPPTuQc27t
         UE7w==
X-Gm-Message-State: AOJu0YwGMY/2RvTMVZnEaDpFLYWavKWZtM680xfHVCMaqRSs9dEXEsrK
	w0JQFVtioa00m9k29YLpz0rPSH0tihE=
X-Google-Smtp-Source: AGHT+IF+F/QXWuTraYsJWzSoYcKR5rSELhVlqL37Nv6scTAYPoD27usVIN9DVQNabjtNzuBCzMy2Hw==
X-Received: by 2002:a05:6a20:840d:b0:199:501f:a08d with SMTP id c13-20020a056a20840d00b00199501fa08dmr9086644pzd.2.1704729638765;
        Mon, 08 Jan 2024 08:00:38 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:63f2:cfe7:4b90:23c])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001d331bd4d4csm74301plf.95.2024.01.08.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:00:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Upgrade to 2024.01
Date: Mon,  8 Jan 2024 13:00:22 -0300
Message-Id: <20240108160022.3188035-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193414

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2024.01.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2023.10.bb => u-boot-tools_2024.01.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2023.10.bb => u-boot_2024.01.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2023.10.bb => u-boot-tools_2024.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2023.10.bb => u-boot_2024.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index c7190d5cd479..a41547cecc39 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "4459ed60cb1e0562bc5b40405e2b4b9bbf766d57"
+SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2023.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.10.bb b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.01.bb
-- 
2.34.1


