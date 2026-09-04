Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3DCC79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 14:23:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14941.1788531831351027233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 07:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XBpQ1nT7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4957eefd361so8161525e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788531830; x=1789136630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SL2tfKVE55tqu9UIkjmX2u/trfDutglqtfoKzBCnLuE=;
        b=XBpQ1nT7L5cy/QB87zPrGQeS7W+7haKOErXVSpOqRrIv8z8jbu9/D4L4/Yp02xttkE
         VhTG0cWOBl1wFLQ+rklh4VYtG+3Op/u047We/YfW9hqDjK59zxt5MA458K0DLEFEhLpa
         zdFUPs3DSYsjAdetUyqkqyz7vDj21+aqs2Oeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531830; x=1789136630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SL2tfKVE55tqu9UIkjmX2u/trfDutglqtfoKzBCnLuE=;
        b=FoP9huCx3++HDNsYttEDCgZM2vMPSF1ppMQsLXMgWmY6vP8uFVHLw/HnJ4t0Y6pXRM
         qm5dF2zlK26OykKs1CB/PAC7QPui38z8fo7xKnOsIeQGIz00IIYZnFQuPl18aM0TkAtE
         fV0Qa/SKqxq0JkQV/1cl+Kzf+YjFv2H5SMTarD1AAZgJJRhTa28Qlwz0yJUIGMwKV3BV
         VxpHWMkMqaZnxPQvPHFr3ttxvg3M5mlAon9WeBWcX6aiQkbXwE0P2DZZUyo41QfjvS9z
         ekYrudCpIiuBkpblnxpfzkV4nsz/ulMw90eMk1mkZhNfnhkti08WQ4xynS7Tledqx6Kg
         SLnA==
X-Gm-Message-State: AFuF++ny0hVPrqCSeUlpWSe2c4yK95JhDfFUUDU2YJIrS76ybZpvmOn+
	hcvpcHZMz1hMEgEC6CsGuDCcyWxP6XThA6OrHZC07y4E0YtHvnD8P/AP/bE10hVWkHvqZwlP2Q8
	vCscOdpc=
X-Gm-Gg: AYBFou2csvqLz+jg52P8/PCsBvCb/1TXDejBh9Vvfc55xxoHsg1ffQ7AUB1TAaVZcpM
	RF9qPbP1zKeEY5galpgDlE/btcMIAqTeoSX4rsj7jFHSpdRAaKjszXqX3m22ExirGzvaQV66Kg7
	QPkiWfTCEufWBRlx9vhdKVS2Eah/1EBamDynovpb8pZ07Pkn5z8n0d87FFeR6GOJldOzRlcPNAx
	H8CgjATUxkfWKvbLpqFdKciu3sHbPmrZszRlJ+oIpfDBlkqnlVOzL+TdsGUXjGX7gBI7akcWDQ5
	1cM0P6YH/FGju6ZM4EpNtxwwu/7SMGzeKJX2jJpWzQRm/i23Y7Hd+HAtbDH7ZovXQi1MkmXZloC
	OciEut2IvZqVul+pZhle77dC8r0UlTWkacR5n3TMgZ1+/35kxfLQGzCzUu5P/Mr4Tobbu7cQMe7
	E79347eM3TkbYFlHTIApQXYDd/lrzECW4W+syPMEYrBEWp0zirHEMVNPOyWoniLEWgsUqzbBdIr
	jZ+rIxYml/ce4MSpw==
X-Received: by 2002:a05:600c:1d08:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49cf825168cmr72008445e9.13.1788531829656;
        Fri, 04 Sep 2026 07:23:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm137868375e9.3.2026.09.04.07.23.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:23:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
Date: Fri,  4 Sep 2026 15:23:43 +0100
Message-ID: <20260904142343.1608107-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
References: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 14:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245120

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
index 69dd761ca66..18cb4bf3534 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
+SRC_URI[sha256sum] = "b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d"
 
 inherit bin_package allarch
 

