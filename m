Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321AAC3DA45
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 23:42:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5672.1720741327900022359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 16:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XixVNWYX;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70b702be5e4so22357b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720741327; x=1721346127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95f9w601VfEZyzigpQF0qKllxoh4Oz82Lvx66mJ/PRo=;
        b=XixVNWYXl8cU9CrxeBGqKjqytVz7WkbmJCX+qkKF/ctnFu35k3lZAbvUTUIbq6em2K
         yRK8np8mQyobkzQi0fOPFNO9JFEl7H5V5OPDPK0G/k3X9MniJ8d0tUnIK0p8/C71M9qE
         drS6u/nFqYVTlPoWizxaDK/41wyQWQbFLka4tRuwXu8tTLa6T39AfbGYmcLQ5FOmOZh9
         RoWDD6joZIJO2JftwZW2GytcTGzEw9SQcpJRFUxlrbUIb+NtmKCi8ZOGGzbAhmhDhP6h
         L3cJPbb71xhQzu8Zy6OPWq70FU/u3DXFPU/RKUou4/AanpHqWvnZlzXelVY5p+GMymwF
         ataw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720741327; x=1721346127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95f9w601VfEZyzigpQF0qKllxoh4Oz82Lvx66mJ/PRo=;
        b=gGPoiD/c+ly8cOwP5bkulYVTZcVPhp5aJiTanW2cxq2Zf9UxC6nLKufTTMbrNsnHn0
         OD303QZOptXfRrHlkBGwbcQqPaBpqFc01iAtJ2ggJNZAl4bAtudyTDOsXf51PyGVxfyq
         xHr01yNKUWUsCYIkpgLkxDLTuK1HZI/6FMdZDbva+zbuGa6zm2X72ljm8ASJUIgy+AYf
         P/RnkAJJ0X5BCLamc7C6QzG6KciggCKcLojuvtxnfMr+6hvdx6yURUMmAF/BxL+Np92+
         CQbhmefTu2XekvT+Z9v0RP5EMRaxVXUo4cylEMuIYzhPnz7BXa/oPz8sUqg/Lkf1Uk6U
         U83g==
X-Gm-Message-State: AOJu0Yxs1tqwfNHUgnif2FFswGkSGRcM1qnm/83AIPa7VlyedgjlpOYb
	eNlKaUWMXbAkekdFR43wDyiIF7N570SaMB0QI8UmvmEJudALbOozr5I1IOLh
X-Google-Smtp-Source: AGHT+IGmFQ7Hma2Tnmq/0keEAtIjt1ZVCp9WTWyTSA58A0D89f3aB/gVivH2NR9KXFGIkN8FZKsjKA==
X-Received: by 2002:a05:6a00:2daa:b0:706:6b0b:9573 with SMTP id d2e1a72fcca58-70b4356fc81mr11787108b3a.19.1720741326920;
        Thu, 11 Jul 2024 16:42:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c49a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4397ece4sm6447116b3a.144.2024.07.11.16.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 16:42:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] arch-arm64: Use neoverse-v1 ISA for Qemu usermode
Date: Thu, 11 Jul 2024 16:42:03 -0700
Message-ID: <20240711234203.3841594-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711234203.3841594-1-raj.khem@gmail.com>
References: <20240711234203.3841594-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 23:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201796

With latest qemu several places where qemu-usermode is used e.g.
nodejs, qtwebengine, chromium, the builds are failing form armv8a
tuned machines (e.g. tegra) which is due to qemu crash ( SIGILL )
encoutered when 'max' ISA is used ( which is default ), max seems
to use neoverse-n2 equivalent features, which is evident that SIGILL
also happens when using -cpu neoverse-v2, therefore explicitly select
neoverse-v1 for ISA, which works and covers almost all (if not all)
cpu tunes for armv8 we have.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 832d0000acb..9639911d33b 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -42,3 +42,8 @@ TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}
 # support these they're meaningless NOP instructions, so there's very little
 # reason not to.
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -mbranch-protection=standard', '', d)}"
+
+# Fix qemu-user crashes while building nodejs/chromium/qtwebengine, defaults ISA is max and it generate SIGILLs
+# qemu: uncaught target signal 4 (Illegal instruction) - core dumped
+# Select the superset ISA
+QEMU_EXTRAOPTIONS_armv8a = "-cpu neoverse-v1"

