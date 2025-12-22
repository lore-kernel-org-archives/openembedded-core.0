Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F410E6ADE7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87829.1766434126079226955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFq0Y71Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79ea617f55so771307066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434124; x=1767038924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thR0XL03J9kltcywcHTggoO/1pOzwegPpCyyOjrr8xo=;
        b=SFq0Y71Y/gXht3Ed6cffjQ/15PnxbLHnqpFpuwP2PjDhAR9fCbS1+T8AtlpU6NbSiW
         xddRPYwUIlLxTq+jD5B+wBeZ1Gt2QQsCnF0kIqI+GgxqbDQfh2yyUuheT5urdwvkQffQ
         cFH5/JmJEqjqk89hUGwk7/foX1XwKiLs3WqxU5vac1YH2iPRPYdMJMqSCrLq0qtdBUIg
         Gyrv4gU8am1Ly4yhdckJ09J54HJ3pljzthuP7y4k7Zu80XBk4ygak3I7n8yZsV4aLGHK
         n9A6rnIm9/1XIc8y8sTt10Ny9qklhdKwhvATxHCpEa5WYFBfyZpbXRcoRTKhZqVVEaKO
         pJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434124; x=1767038924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thR0XL03J9kltcywcHTggoO/1pOzwegPpCyyOjrr8xo=;
        b=bMkM+weG03cmARiiCvuGywtfxp4t5dmt3Ei0m6mSBSrHxoUrGNtHm/NDOqnVxs0KF5
         /84IywCfcChAmErZTuUGI6aON0iyTRSNH7BVNCr+nohvX6A14e+d+MN4xBdEOTqD1eTh
         5uLiJCkZ0u+HuD2FKaq3z/is+Y8LHniKInD7BReLM9A/tInSYlaybAtyYcUcg3Oko6wM
         tYf0efshB4VTINAX0QXyiK0Wje6t9gJLpGWM/7iRpzyiUdG0RfxY0j3LhmDjHaENuayl
         48F8WInQSva4am6VkCZGYuWB3RxPllrTbfDmc1xjzGIQVqUCLSGuimFTh2L18lAoN+Tk
         B1Kg==
X-Gm-Message-State: AOJu0YzX612BLNKAPXIkf9SyDoWLUwYdD8MP8ZmnPKgvr/32IEYJ6dAM
	SwLhYQohizE+1fH+k7suX6vRE+aMfMbQNxGTMzDR+Jb3jx+KAMEuEkPP7qfRCw==
X-Gm-Gg: AY/fxX5zCz/NWU/E7P9teZGaY+70m9AmQVitXcxjIFfr8Hv40nE9BM4RaywVhwi8mWh
	DfYfmNFGZrz0TU6VWTptjkpo1odScbyVGqFzfHS3mrYmwEpZotbZJn4194aMU76dNq/YEzKRDST
	78U3Vov9hsz7/McF4KUHLHSgq+gTxVn60w13oZHY2R2NQFP77Zk4QV+vQsuTKbZ5GEaO+jD7HSC
	4DHZGPbjlLvWCow5djUTm8RtfaQvcNlo6qJ87FUgVDK7NQ89yuYagMIWXIjRSHL02t2liEJY0Ta
	AZ1MxEaU3p8Pb5/O99hhHJgg1399AbDTLeraXZzrseYyDoa0lqWb7DLFWcj3Ztx3/uG/ardVhWS
	8hqmBKIPbpCoG+AEJnnEqhbddUl/Ythr9klanhUgd6FvIoV8AfBX4PHTyqXWmZeIcrcmHQvXLmM
	6L0mD54eZkzoINFBsf6OTPbvgeuNXplXEEQ0ZHuNlOmFLTsrY=
X-Google-Smtp-Source: AGHT+IEW/0aUYbVGoGTLG6t3kl2pe1G4dtjeuGVkoG0k4TOtRFUqYD32o4lraZYM/X2w7KOCmHIwUQ==
X-Received: by 2002:a17:906:9fc7:b0:b6d:9bab:a7ba with SMTP id a640c23a62f3a-b8037178753mr1296255266b.42.1766434124247;
        Mon, 22 Dec 2025 12:08:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 086/114] python3-wcwidth: upgrade 0.2.13 -> 0.2.14
Date: Mon, 22 Dec 2025 21:07:08 +0100
Message-ID: <20251222200739.2278706-86-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228411

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-wcwidth_0.2.13.bb => python3-wcwidth_0.2.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.13.bb => python3-wcwidth_0.2.14.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
index 71bb1a2703..da2dc60263 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
+SRC_URI[sha256sum] = "4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3


