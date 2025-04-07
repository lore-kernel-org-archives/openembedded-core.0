Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA63C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 23:15:15 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.61844.1744067710628185754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 16:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IysTgoH8;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-afc857702d1so2420394a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744067709; x=1744672509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=at9eWAR41Q2FnOd28ALk78oJ6v/e3vddQN2gCTwcR7I=;
        b=IysTgoH82Okksh2zO+K8eMdoxbs/IS3Bpc99BRY7LrknW3vVd4CDqRE+MBy8HxYw7f
         i2f201V321RRmidILj64gCnrze7rixdqnBhbkHZl5GVnMHr0uyRGpxgCQUIK5b7ET77u
         thNfJscQnpd52/V10AIRcrE1r3V5hL+fiiRLaBC8NCrlHM8oM+cOqY+xWt9RVlx4ZVxJ
         0lHtSNFhe5muXov6aydI/s34bwK3k7a/XYXH0ZTM9x/oR/+T+4UhCu8Izaoj2sPPNH6g
         l3PbuZMavCxUa4oxks7IkwX+w7l90xO52NhgTPuyLlyhxZhWLOQemLBJq9VU5nW/rOT5
         VHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067709; x=1744672509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at9eWAR41Q2FnOd28ALk78oJ6v/e3vddQN2gCTwcR7I=;
        b=PKVbfKcLoLHpmJqJwHe5x5ueas/xkY+exb6e3VowQEvEBDhnuGIN+JcKJ+rRaprywz
         qZMj2eUSAW1SeFGACb07CdpSsIutjH3qCVGkB8ASuVslqehKu7PgBFZuV1u4wI+ByRK5
         Va01DVO2tUw2YCUT4gjG7kJgPl4qDzh5gu+/5HOk7GYS7LNdYGUKdCYOLy+eADB2Lpiv
         UVAtl41PitX7589fPVbD/jktMRRfpWWGs3yI1S475Dn8a+TgmbENdRqqesbgtXPp8egt
         d95s98rSSId1s3EUH4st+amm8tQBzufkk0Cs1K+NBMj7StYqGiN2B4AEPjEACTdjgWcn
         AGGg==
X-Gm-Message-State: AOJu0Yz5Ch62R19SpKRYhBZMu4lSAM092VlHh2V/a86+jrmzkkOZ9xoA
	ljCGU/8yfsZ+PmZcwBcCFKsng5jWYpEHLNs/ZP0ybn8Fp/sjct+ZHCvC7A==
X-Gm-Gg: ASbGnctDbrj5Q5/Cn7T//y428grJDxV6IbeBjlR5mZ9PtrPABhTxXWD9Ervmzzeec9k
	oIkYM+bL2m30bi5FpKfqe+gaT0p3lT93rFJPT0s4N8JYDtSoBpgZcsZB9fwDPDpXZLveWWrKc1g
	zhZVb2yjrVKyh4XrIlfVr9VOThlZMFsAwaj5TaimdWtTqj19e5psABYZ2xINCAvLqNTfNSIuc57
	yVkoKKyuJzPJGYBZMHKYbX6xv/BkqtmhNzIoeqfMzNtkpyV4KvhisW5UFNgOHFlr7bDpfQ7jmr0
	bYUHlaFxD/VE/C5c2yEswbroV9vEM/jGtmmQ86ixEaBnLbanW0xEeen//8w=
X-Google-Smtp-Source: AGHT+IFzY96PmSzHLkPtAamzXg/MvfGhAr7eFTBfHKHBLC1btTfMnA5NXB7S1LNeWCbNmbzJ/cdKmw==
X-Received: by 2002:a17:90b:5445:b0:2ff:6ac2:c5a5 with SMTP id 98e67ed59e1d1-306af7b8030mr12778977a91.26.1744067709023;
        Mon, 07 Apr 2025 16:15:09 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ff7d:ec84:1a1e:fd81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5e75asm9743344a91.37.2025.04.07.16.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:15:08 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: upgrade 2025.01 -> 2025.04
Date: Mon,  7 Apr 2025 20:15:00 -0300
Message-Id: <20250407231500.421051-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 23:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214483

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2025.04.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2025.01.bb => u-boot-tools_2025.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2025.01.bb => u-boot_2025.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.01.bb => u-boot-tools_2025.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.01.bb => u-boot_2025.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fc860248ed..b0ea01362a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
+SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.01.bb b/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.04.bb
-- 
2.40.1


