Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E3CCF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 19:17:18 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.38170.1728847028599765479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 12:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1xL1l+a;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so1313409a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728847027; x=1729451827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0zg5zF723nCsK6xkkSJQCmxfi5LVG0sNQ5tcfY6dZI0=;
        b=Q1xL1l+aHUwo4ke5IHfzV6+/uVU9L+QClIx1xOsFh3uUiwGqfGxytJIkeGzR9VpZQO
         4VvE88hX+vtcVjggrgKJN2/Csdey5hW5snPNicYJY1/aXRKn6Qm/iFmy9RZICeRU3M5k
         XKzceuVX+X1EaF+V4Yyi24KglUHrjqkI7mj8M4VS8ogwxM1iPX2Nfr5QwbXcx4UW8999
         wnhjE8Lpx1oN5FLup71bvrQNP6ZtJCrglgDD+7KwnhLsaogpvnznSAGzWm99/vqV9hPy
         WIuTM3wdroTA/Ddn5Ehm4UefVy8moQOVDhc7eODhsEfATCbb26hgeP1r7Ns989uCAHS9
         up5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728847027; x=1729451827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zg5zF723nCsK6xkkSJQCmxfi5LVG0sNQ5tcfY6dZI0=;
        b=TgXeFoTDLK7jyzvDrmaDcXEwwhk4KqXyn68YqisfWajuaSNa2DA3uiyzvmlgIpZ87C
         Tdmm14+h5o3BjjANvNQsjqu1j/acf8wJa7Lring6ZBOVs4d3V3sYBPS80YBlQ1GvdD+D
         4FxZ8CU3QrFSue/nttl79FntYivdYgDiAaW9xb/3cjyCb65kCmf8kCBu+gNWzN482vvj
         zFGCE2bGqbdRMcYmHySpfJJcd1qWKFNTnYTeITsYdqvBrOdp4ZOu1VMWiXyQYZSXbRd+
         efS73OlvgRjPs3OsFKgsINMUIhoPO76kkTgnrtG2wAEIg5QMZWHKa02MqzZVqh/vVcPr
         Brog==
X-Gm-Message-State: AOJu0YzbbUTl2X7xQNdbLJYGtSxhHPOOlBr/2HtJ9Iu5LUOCoBC4Au8H
	Fv2xnaMsATpFmAYv5kLJga/xMJM/jwLq1emTylxIb4GZwq0HCfqFC1Karmrm
X-Google-Smtp-Source: AGHT+IG9/LBqV5StmPwGwMcqSuTwfZEmrOLw3hFQV9lgZ1n1thI4EnC23EhFqvggIet9DmilyerxUg==
X-Received: by 2002:a17:902:ecc9:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-20cbb2aae51mr109422425ad.56.1728847027156;
        Sun, 13 Oct 2024 12:17:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d2b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8badc69bsm53334345ad.17.2024.10.13.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 12:17:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] ffmpeg: Disable asm optimizations on x86
Date: Sun, 13 Oct 2024 12:17:03 -0700
Message-ID: <20241013191703.317096-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 19:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205724

disable asm code if PIC is required, as the provided asm
decidedly is not PIC for x86.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index af66104ebf3..3c66851b8d2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -129,6 +129,8 @@ EXTRA_OECONF = " \
 "
 
 EXTRA_OECONF:append:linux-gnux32 = " --disable-asm"
+# --enable-pic is used and x86 assembly is not PIC on x86
+EXTRA_OECONF:append:x86 = " --disable-asm"
 
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2', '--disable-mips64r6 --disable-mips32r6', '', d)}"

