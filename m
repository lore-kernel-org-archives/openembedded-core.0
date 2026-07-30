Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF044C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 07:27:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6277.1785396469604999391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 00:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=absCdGLV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso2404785e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785396468; x=1786001268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvTHERjAW45DBJ6lLJ/2FlVA4D2p5mzsFzsRTY654VI=;
        b=absCdGLV/JyjlztHiTxH6eR/O1x/PTkYWn5f54QkwihWTmSu28sQb6KsSmXia8qna5
         Qej/jzBFTdDKHBBkbW6OEJBiAtHUiN8BgRtsJQ8NBJ+tFgISrRW/l17y2yW2FqWTeHHM
         y+U085NyCtVOSeqDe9USuFDtuoi4BfTbExQ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785396468; x=1786001268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvTHERjAW45DBJ6lLJ/2FlVA4D2p5mzsFzsRTY654VI=;
        b=sZ5o2KPRz9B2CzeIts9jOFeRZ52cyQEngcGtnc+1odHZNYFxeBDmPt2ceau9fntrwv
         hz3TgQhnNdQDETDKJgxmJGv0s2jBIgnsdTYVjGSwKqmuh6SZPkacv7GHEoo8DyBbr7rt
         n20/KWe4ZqbNy7qrxoGZ+9zY4K8hc9Hx/rcbcOf0DTCWW2A5D+MJYhBPq7eg2a2Z6lPI
         rfuzPXc75c6oBXlEugjrB6GKtgu3vjK7XssKmsTqLMu0GB8YNLn+bEhaDXyCNLQQKbxB
         0wKxIOeDZ4XvnHOyJKlwpqJCb/QMx7df8TZnDpYp0qvJvnWajDbWJlFV9F5/tsvIpFxd
         H72w==
X-Gm-Message-State: AOJu0YxMqCNMx+1RjQ3oiUUJ8vPtRfvAfgcUqFQiyrUCHbPeRXX2NqDK
	oxeaGBn43/mDiu3xS0iW8Ld85kQ7osbrvW51ZM89hyrz9RprFEVGosg6TwWEmQw/cLMLBJS20Lo
	PenYJAwU=
X-Gm-Gg: AR+sD10ep4PzeqLLqi/9VzOV/i7phRVNtmodAZaOj7kjEhevhlnTgaQssdM/Ir6QIBr
	Z+fLfSpHzNYN4POk0hGUK+9Lg7BcO7u08D/Q4NuvtYJcPGxXqNwHC1GuPWUiCkrKAc3wyHRyR9j
	3kcbmwSePGfurI1idhOYQBFAhQ/v+iXocWBn34/KHinlbCQl6VGIrnDSTs/eCaDDF63feo8u71o
	8uQUS62fdk0skkf3yjBVOy8voxsSDQjGK2mq0FWM36BWzNu871UtU4hBMJ7Ef80aUPXwrnlXOlh
	XHy6PAgO4Exac+QHckPf3pChWz9wCIGz5wpSHwwGxrp/sWP0gfRQHFCBNvulqYEsBcx7oclbw1w
	A5FkTlAbSyWgWyMD/SIfJlDD1igZqf24ByoRJaKPtKGuDfJdCaThYW+GztiAfloMUHX7aBgHxE6
	iAdZweIhzTl+0UAHV0UXWX+Q6zPsxdUGeKcNEGXqpvzXSLkUzkgq+m5DNsbcC+3eDqsb7dOxNUE
	Lolwmusu+mfFVWu
X-Received: by 2002:a05:600c:8b4c:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-49800e75828mr17131265e9.10.1785396467584;
        Thu, 30 Jul 2026 00:27:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498011f4eb7sm36903965e9.6.2026.07.30.00.27.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:27:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] spirv-tools: Upgrade 1.4.350.1 -> 1.4.357.0
Date: Thu, 30 Jul 2026 08:27:45 +0100
Message-ID: <20260730072745.3571297-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 07:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242324

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{spirv-tools_1.4.350.1.bb => spirv-tools_1.4.357.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.350.1.bb => spirv-tools_1.4.357.0.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
index b7ae50764b9..d9f6d292678 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
@@ -7,8 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "0539c81f69a3daeb706fd3477dca61435b475156"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV} \
+SRCREV = "9a49b0883b9b635689a85b5647dbfcb223268151"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV} \
 "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:

