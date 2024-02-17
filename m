Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC60C48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 20:51:18 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.5405.1708203074678016914
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 12:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2qqkpt8;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68efcc49d24so17964456d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708203073; x=1708807873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iXVsBXK6ckhaNsq2SoIioNUVphSY44LoGV8rV3jFM2w=;
        b=O2qqkpt8q52m/F267CKxCgkN45BsEK4101vqu4SeFashCTIFeFy1r4ExyFYXpcsja9
         c8cMIPbyjUozqPsM23Zgwy5twCAvXMdKFrzXeXo3Rmt3qLZ47HTomj5GyCwnyupBAg84
         /mO10zcQzJbW6FGkB+QYYwGmmcK5CQ0pn3e86X/gDs16Qo5I21aeuqlwP1J3UaXJGACS
         Wo86K+FXEuOT0kB6zlV+e+GjudPnDVLGbJU2USrgQ5ER68tchfRFz0eHf5u2HrLcOssK
         4INDqQUQ0h9Uxc1IIhlcKFRZIUU+7GM9ufVH5KNN5l221qanl7wGbeaEZRF0Rd6RnaLg
         wNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708203073; x=1708807873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXVsBXK6ckhaNsq2SoIioNUVphSY44LoGV8rV3jFM2w=;
        b=C359VrAZa/l5W3hDWHNeCKa84K2SKN8L3ZYU/A13B5M7IMJdCn8Cj/oQw7/V1kYmuG
         a/ce30YUYc3v7Gp1rkzuA9WxcB7b3xFw1qncnLDkNvVEqRP1qlnqCIjYgSVU6Kf+dOJZ
         nRXBeTRT/NeUO4lPXDNJBr7aERwA3M/9ZPxBMHGOzzeO1JqguwhGfuDn274oGmT9IXku
         AD7RGVVTZ+oGmA4adl5UdkNvYo62d0Dj1EXJ7gfm4YUXqvbLPzJ6APBsU/AeJVpSd4eY
         wHQ5SOjfhME3Ye8eu/p4IWYNXh0EbsVMVUj7o1qxyTDUmNHAu/pfhuOe0ZbwJzhUsthj
         8aOg==
X-Gm-Message-State: AOJu0YykJka9uE7dgpgHN1sNVUXsBBBqamtLkv6UpM+YI0yHlJA4hU5e
	ucs3DyozZleyCM42GmbKemmtX/Z7m/lDFgW6/Ncc5D2axV846xLC2qQk8q6P
X-Google-Smtp-Source: AGHT+IGTfDA8l+qMwbhIgseDWfJqb1WmQHeet5galelKD+3S12DxqRkdafT7EpuMUpflPiSsFbdNjw==
X-Received: by 2002:a0c:c990:0:b0:68f:3eba:a48d with SMTP id b16-20020a0cc990000000b0068f3ebaa48dmr3954050qvk.41.1708203072598;
        Sat, 17 Feb 2024 12:51:12 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ml22-20020a056214585600b0068c776b01fdsm1382354qvb.65.2024.02.17.12.51.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 12:51:11 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: allow sizes to be specified in sectors
Date: Sat, 17 Feb 2024 15:51:03 -0500
Message-ID: <20240217205103.27285-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.43.0.76.g1a87c842ece3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 20:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195816

The partition layout of boot devices for some SBCs (e.g. Rockchip[1])
are specified in multiples of sectors (which are multiples of 512 bytes,
instead of 1024). Therefore allow wic to understand partition sizing
specified in sectors as well.

[1] https://opensource.rock-chips.com/wiki_Partitions

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/lib/wic/ksparser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83ddce..35681bdc8d13 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -178,8 +178,8 @@ class KickStart():
         # --error, but since nesting mutually exclusive groups does not work,
         # ----extra-space/--overhead-factor are handled later
         sizeexcl = part.add_mutually_exclusive_group()
-        sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
-        sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
+        sizeexcl.add_argument('--size', type=sizetype("M", True), default=0)
+        sizeexcl.add_argument('--fixed-size', type=sizetype("M", True), default=0)
 
         part.add_argument('--source')
         part.add_argument('--sourceparams')
-- 
2.43.0.76.g1a87c842ece3


