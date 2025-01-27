Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E668CC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 23:20:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.5747.1738020048957880796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 15:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=WV67vUzV;
 spf=pass (domain: foundries.io, ip: 209.85.214.173, mailfrom: ricardo@foundries.io)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21654fdd5daso85439575ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 15:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738020047; x=1738624847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/AaL2ZfDGwnWrauvE/qfSerKIqv/t0FvKXFw5QS9wtw=;
        b=WV67vUzV70HA5WPun1Rb9JVAzh5hXhDMgGsaBQKBOef3DzaPxlw2YSJXnegNzE9SnU
         8GJCxb/YyKr1sdGe/m3Xe7d2jKRONK76voic67xe9Y5J7dUIYwnM9gLafGNAFbEoXtOr
         QbT/DyR/T8RTt9N8O2gTPXoQ8HM2UmBbjWlBCbhjV+01Xu6GTD/B6mh2cvTWkAJqN33i
         aLfXk+m9qLqdi9cN/2DPhdQ090huR8HDR0aSCHUSYRZ6UdS01hNI1FSdHAiS8gp2TnXt
         Uuu+0PUOA/iLRuMBknTCQxk4L9jBUClWkItA6SXso/Qh6gxLiKAaK1P2ALyJlpjF20gd
         lXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738020047; x=1738624847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AaL2ZfDGwnWrauvE/qfSerKIqv/t0FvKXFw5QS9wtw=;
        b=AAD45mWjo/9ufV7gzJhA1u8mnycyM/LicQVHNFjGuEjjicZ+pOdiabgVxc9wod+UTi
         I2be3WVVyenk1ZI7PyU2Jj70fbwSKak4U8dVDgxwMXbjOYtWbCCgL5Ghg/MKVMMa3tHY
         n/d+5eLbrEh/e8pIEjZbkwI//Zo68TE7LLhmlfMnv5YdGhuTP8R+58BGiXW+2AgpAYn7
         W+EnMuyUhF2okRxE5nXH8LQ+C4QW55afOGg79BFyGl2+urvi/E1J2XxI2jrQxIrH22i1
         6vrxaRPPyg//nh/mRzmGfRV+XOwCzJwckJmxIL0uFpzjDy0QG41kdgDbXVgPwQpwIdK/
         jyAQ==
X-Gm-Message-State: AOJu0YyeRE1O1vq4d3hbjsctpdwufiXDTGqo6OjJvt+ZtMi9whNoSfGz
	96jxrkmsZ5JmjGZPQthgeOq03yzMWjBRI5bQtwICVBOaXRUY7iHVjVPi854wHdKTzZtQ+SG+ihO
	sGA==
X-Gm-Gg: ASbGncu8h85hqkqgV0bkZmN+XrsWThkvTXcMuVoPLwZAIxS1j1dUPZdupygVfygRGf2
	PUlggvYPx++mp1QJCloxTeBnRsoBEQrSVpfUwiGwFpm0+uL32/Iwmkz23zNDhHVDGmjG45frL6i
	i7M7zMQ99ruV5plSFshukD+7wsqScZ75Z03/iDpHqzVzwr9o/tg6onQbjgSsiSPwESYk6H2FnsG
	angxqUmC8J0hdtlbNjFSz6cvBbDhjcFi4BCJMTKyVelJ85wi7at2hAsyzFs9gWaAt3WyliVqkfD
	f7Lr2PiOkL7C
X-Google-Smtp-Source: AGHT+IFut/c8Zt05s8z+K7nsM+0FPFrafadacqq4Zr7vYD8bQRneodXA/eQraZwJa9tbqviMCvu/+Q==
X-Received: by 2002:a17:902:d4c8:b0:216:725c:a11a with SMTP id d9443c01a7336-21c352c8145mr715009855ad.10.1738020047215;
        Mon, 27 Jan 2025 15:20:47 -0800 (PST)
Received: from evatuf.domocacupe ([179.89.218.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424e7c8sm69257155ad.229.2025.01.27.15.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 15:20:46 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] efivar: enable support for riscv64
Date: Mon, 27 Jan 2025 20:20:40 -0300
Message-Id: <20250127232040.4090484-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 23:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210309

Release 39 includes support for riscv64.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-bsp/efivar/efivar_39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index fe213326a4c..b052e3838fe 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/rhboot/efivar"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
-- 
2.34.1


