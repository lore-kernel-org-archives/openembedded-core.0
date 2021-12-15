Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1CAC47082
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.2685.1639608053771830187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pPVdTgAA;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id o13so40661323wrs.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysAbSyoj3m4UISux2iQXQbn+bDxkMEiGH8nVyiYZj2s=;
        b=pPVdTgAAqfQYpFFRBt2qwWcTS4BoF0PAWh1Fa94URTvosaoijSurF0GLj7C/7YRXUP
         tuM7GLofFDpxLE5uU6Why2bADXiAcBWbtRgn9hqV+2MQiX5b5LjrypR/m5dgToaC5Kwr
         EkHoBojao1cgRBFo53T3jhD+/kqhMT7BRNd3uUpoMDn3AzAwvDWHUTIns253uDdIp4qc
         ZaYupQaV+AszXPn5d9XXx4e48ciO0e1Uvlmi0um6AIIzLIxFtnoDjroom3B/xExAHkzk
         FiprJSoDXTrxXPHAiO9q1nmFaybhQL7JVHLhhZPYe+cnS07RsaEDq1WE8oDhL7/JD/f7
         nIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysAbSyoj3m4UISux2iQXQbn+bDxkMEiGH8nVyiYZj2s=;
        b=jj1CpEkYfln5arvbBvFFFbW37PweaSGWrxAWAMrKYxqk1bqTzAja79pzhNUwVgikRF
         USlPcM83jAyihh5yeJ+uBqROhOSx1x5b1WiPNafBCtc19o46vng9nTHAG7ZmNYLxFDBp
         WRo/8GUhB1Y7kehLNC8fRBrJxieVqyqCbe/Yxd/Zqt0WtpYYSMkCLBxYwhd6livhSpEy
         l7Fm795E7X/8Fym/ucKg+i/6UcueAqI5Wk7rJFmXXSsqK5Dy5SNM/IACIPTGOCf//p3o
         +NvRELdJ9xQtOM+DFvniaV/bTQPWbc3n4AeQPcVaQnNFZ5D/NkyUX/RvQYUGaDiVrxm2
         u5FQ==
X-Gm-Message-State: AOAM531w9ZUHGwUkyWZtZrge4jRldu8AA2XZCYx2xp5KsEfweTQTM5PA
	iSxJhCiMQlkUCZDwWNWzp2ymIhUa+5dSvw==
X-Google-Smtp-Source: 
 ABdhPJzxuwDW5jz7LcFoOSe7B5tccOXJ9M8iLlgktBJIymr9gR+WDXImCDysfZpsOiAOufr04clHKw==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr6734748wrm.524.1639608052394;
        Wed, 15 Dec 2021 14:40:52 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/26] diffoscope: upgrade 194 -> 196
Date: Wed, 15 Dec 2021 23:40:29 +0100
Message-Id: <20211215224034.1814148-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159763

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_194.bb => diffoscope_196.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_194.bb => diffoscope_196.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_194.bb b/meta/recipes-support/diffoscope/diffoscope_196.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_194.bb
rename to meta/recipes-support/diffoscope/diffoscope_196.bb
index 51d86ff052..62a1561a0d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_194.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_196.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3d28f0325e00effc6c23c50f916d153524aa393623df2fd1fc8ae0f6a12daf94"
+SRC_URI[sha256sum] = "d31fd0d8ac58d41cc111ef6a3bb0007f5f52543b932bf93584bdd0dfe029e626"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


