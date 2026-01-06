Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2091CCDC185
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 12:14:30 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88616.1767701664548162797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 04:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HPfe3DGM;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: festevam@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121bf277922so81462c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 04:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767701663; x=1768306463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yNsypZ/oTuh4aimGTXhMUnuHe7rlrxrZNH8RtRPFIo=;
        b=HPfe3DGMQUY8J7PfLQRXUrwiB7k7ksc6ZNyFojUidhBPUfpQE3Pq+bzabh4jJEYbqq
         D3lDrkXngmUkZWHVzm90AOc9rZpbLG9hb65ZEtbAC8KMiXBFGWIkyuR6cPv/UgVWJ/Jo
         TV/Mz4kK0he4xK9dIW98N4TZLD66Y5euaVQ+5+XzW6wemZk8A3ph7z78WzWg5hy2Axqc
         JySXL7RN6gLYtQ3Ua2LkB02du347dHxv6l/3kKRZicaZoeuhR/rGEBavcb7bydbO+zMG
         7QbOocAfJulIPPwsgrtpwb2vZPb56XVjN/4x1IUEcDrBvQMwts9eCJ7c0pffNcYcSZMm
         4Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767701663; x=1768306463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yNsypZ/oTuh4aimGTXhMUnuHe7rlrxrZNH8RtRPFIo=;
        b=bPdG800ASkka5HrrFohcesL9BIB5o3vu1siR0luessVCslap+xDpQkD+unOTW/a4tJ
         LxXJ3qxPXxIFdOe1CYYPERSlsgQbTDjLFUAYm/Yc38HBXoNWzA0I5IpM11K5ZSpKG9m/
         /SIw87tyUWAydKxf35gOMhpnnzhDPX4x7SqF+tkFP1A0vgC6VLjEVuLnnof7KqcfX3Ce
         7z9VkGiIzF6AuKUd+OCqsr8Oz+NxB8k+O7lDKhjyPRlgZCrSdJtjHyGnjQnprZDb3aXP
         JlLNUzjKkWJ8Dxst5YIRESkU+OZ97Y0VRFLkVMXyhs/75U3qkZceFEsrglgJHBZtE2l1
         vfSg==
X-Gm-Message-State: AOJu0YyMB2kBTHb6u2JAaWpPxQN82BOn/mkh6rQSynaFkkxd3TUJCyqU
	amC8ISd6gBnzKVXU8vkVpJqHcb8O8MYSHKuF2y3FzvnvuEYbysNaKR4K2wbuPA==
X-Gm-Gg: AY/fxX4nWu+vtvv8dP2wr2GdDkVEd09DI40MyNs6lQv80OhstCo51nV4uyziCex3CTF
	0/uVgbHOcBmcZ90rVAec+zvtBve3EC15FMG8tPrXxlrdp8kp2K+aZ+UzSKyDsUOoWjuoiQOqD0r
	Fr82/fMvBuilmIU4e8PVOHEGNQ0cG2+8WQHITnsuSN+z0bnousIbyuwSMPE8OM5ak9PmuI2cXd2
	+mJKV8c0VRMwOilR7FRBQoyIyb6slcP/1G5L+b8c/BF7XT8RhnzHX2T2oc+qxwqrIITvZWSSvi8
	enj6v4XKXorBqf8hyfvRyzMAvyTgUMQZRSvCiu6d8IDp1vViy6p8xJqflQCWnBqikwsCqxPs5xa
	UDElgmy1Tqe/yue1lH2QFtBVQNupSE1NJR/SqgMdYApz7bJ6CNQuQttYh/Y7KI+cCG1GkvWviPj
	BVvM96QDoyWo8lJAEDdNR7jWM=
X-Google-Smtp-Source: AGHT+IHqWeyc1l7pD8vIJM+IFe81wE4Jy3G5WVbGN6pVuMcXEb2itX4DOI3HwrnDwcKXo4rHJZvNAA==
X-Received: by 2002:a05:7022:321:b0:11d:f440:b757 with SMTP id a92af1059eb24-121f18e6a78mr2539522c88.26.1767701663162;
        Tue, 06 Jan 2026 04:14:23 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:28e:d1c1:731c:ded1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm4463455c88.5.2026.01.06.04.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:14:22 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: upgrade 2025.10 -> 2026.01
Date: Tue,  6 Jan 2026 09:14:13 -0300
Message-Id: <20260106121413.844461-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228887

Upgrade to U-Boot 2026.01.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2025.10.bb => u-boot-tools_2026.01.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2025.10.bb => u-boot_2026.01.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.10.bb => u-boot-tools_2026.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.10.bb => u-boot_2026.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 93ff0ca6ca..79ddde3f5c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e50b1e8715011def8aff1588081a2649a2c6cd47"
+SRCREV = "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.01.bb
-- 
2.43.0


