Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51870C27C44
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.3773.1716833542436948808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I4LJBFeZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5296232e00bso16445e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833540; x=1717438340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbVcGki6mKrHpNh6mGPIAGdnxecEQpEA1FEY+p59dww=;
        b=I4LJBFeZw9Z6o3N4DfyWwucFHG+tsq90mL3yxhwqmCTzTm0n8GTSWxwyXBkqj9zKji
         VE+2ATz8u4dmL2t1J84U29NfcHuN/a1xTFpUszANDl4avqguwxI0v2h+m7lJQC0Csles
         2Rr3ucuo59a/5YOaFkdz6c3qLUSnCMCgrpkkTnbZXMAIz0FjhqqrbyzLc4UNuDjpuk2g
         cS3ssOYg0h1vaHzNCXwxU6QHYQr0/A63EyXxy5lEbL4tCRR8pFl2xbzFNM8Szw3yiDq/
         gDZdSdagQrm090ewIVmpUGPU9l+M3ijFk3R73aHQ/m0LsyGHY86V2AopNf5ynNOtluhb
         Vcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833540; x=1717438340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbVcGki6mKrHpNh6mGPIAGdnxecEQpEA1FEY+p59dww=;
        b=CS3wdJNLYjYHvoVbaxOlvpWcYmTZT4Iw+d1m8e3nrO53T4nzQoluZpf97CjKInf6yR
         CyzzgIaI8XCYgUrjPdlXz8fjCb0haF4qtTG+NR7b3PQs7s5EAklvP4G9rAQcjg1B8loJ
         XYwCEiKMTHjCWOCmzcHUbGMcEoMq1sSgaikrxSj1Bj8/kPi/3gS0Znkq1eEh5NGQh9w/
         IHFMZc50N40rkFgkJ0h5Oll2vEDBhVIUkT5Y+xGoRwReFuH8N2SXjpSMmrqAeEf5H2LP
         L8D+VDoFm2qXS6F1Y/ozknP9ynYwswmirXzCl8o9u+XA2AOMLt8TIgsPoLAgvt0p4huV
         D2NQ==
X-Gm-Message-State: AOJu0Yyc4M+WAn9ALvTxSsRAJxqx5ZuGEgRJAx/KRblDlvVAHwuGt68W
	gEAnH/xOQV4uH3AM6A3crrrCisHP8Mr6+pH7l0A8yEEo1AKTaTQAVYQqiw==
X-Google-Smtp-Source: AGHT+IFrJlcJyY6V8NWU7Yb4YW2a4j3IpS/YfKtoUyPUVTXjP4XlJEzb5HqbHMlloqySfLvxPFSAxA==
X-Received: by 2002:a19:e01c:0:b0:51d:5f0b:816f with SMTP id 2adb3069b0e04-529646de43fmr5215339e87.15.1716833540532;
        Mon, 27 May 2024 11:12:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/13] mobile-broadband-provider-info: upgrade 20230416 -> 20240407
Date: Mon, 27 May 2024 20:12:05 +0200
Message-Id: <20240527181214.1778037-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199921

From: Alexander Kanavin <alex@linutronix.de>

Convert to meson.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mobile-broadband-provider-info_git.bb                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index a4030b7b325..06ded459344 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,13 +5,13 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "aae7c68671d225e6d35224613d5b98192b9b2ffe"
-PV = "20230416"
+SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
+PV = "20240407"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit meson
 
 DEPENDS += "libxslt-native"
-- 
2.39.2


