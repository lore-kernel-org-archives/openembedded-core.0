Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD390CD98EE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5748.1781637400230815763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YPb0lZMb;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-461edb387ddso551105f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637398; x=1782242198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTztiCN+S7+apGW9tdUZCR1nhTg4+siAdlibmZpP5JU=;
        b=YPb0lZMbC1j1vXjC5PFrwXtybHJDAUfqqj81scWyj+UYbNrOmmqjf8DrWxFbA6q/lu
         FNcADgLzeuhX5KWRkL5DxvfM2yzNuQejqVfw2biDVXW6V67FiMYPtrmNQPvgtfjohfos
         Cp4GpMo+X+5M1AUgkM9wcDgWZPWqKqzp1/uAsYfeqfHpXByIovnhy5+BNBw5oGvz13jt
         CBl+Fot9wEQUKBpukTLg3NTGabTlJ3B2wjTz4jXJjeLbY9xmha3qCtOJm2hCPByQ/nuU
         qzqdA7w0ofOBZ8yYQlKrq1BvbA9CtAI4xIB8pTJKUa1hKItVzc6nW669RTO8Xw+mqgXu
         NADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637398; x=1782242198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTztiCN+S7+apGW9tdUZCR1nhTg4+siAdlibmZpP5JU=;
        b=aqLtKYMC4t/5P8ipwD6u1sJDhe2BTcqj5CldFISKsTJr9U1cxpdT+u2MG2daSqGtqJ
         vgjwdg8HFiCbGwN0CLeYXvQWii0a3D9mOBwE1ar+OrNTx1nSSULxcGyBNUOMHDA0OlXQ
         dztFEwf6oFGN3z7HiBqDAnlOKTGijNAFz9mIfPUnuLe3v046nUloFxw0gYRz0NzhbNHx
         B78P9VwpMVBsTk3YfF33AiZRFyH3qYw2YJWWsEMiA3hTh/98Ii6BMvdU5WiNYA+84c3k
         dIoWgQK3XYWv/1s88vfim/XtQPmFLbRcVN3AMwy4JvefKQsDX+iBKBl5kr2a6SI/cEoK
         AxbA==
X-Gm-Message-State: AOJu0YzT611O65Q40WuGmUgGSECEgVRRMjbqqOaXdalWpzGQKJIHOjxJ
	jfRWANJu5Zi1enALSKdewmrTeq5AgnAmQpPBQ6tDX5Amvv23BimFnJ81MhQJZ7Ng
X-Gm-Gg: Acq92OEF/Buxfo29kq2ioMVp4kNpSW9Mei6s29mAHfvDzASRMAYi5fPpjSZpZTAbOtO
	58pjb/oIwghEOTJlIxN95qnqMv0eZlYR9PxFNtN1RM4m/4ouGKl+akaL/no5ezDYRIV8r6j2WTH
	kZwCTgDbVnwuD9PZA+jalkQUSlwsnAcv7ox2mdzRQvPLLKn1HMNpGYLp8zutX6yQihh4BsbK0GI
	KSFqyeM66EMNnbc6BYOe7k2iznkPEfT/dYdi9w7thEVRH5e6nKHoqYJBIZ9jvgQXAf5F6yNzD+w
	m+YS+bL02qIjotutBVg0asc17INNcVsN6MRISWMElBsBdLK41TESYIthqf6gO1nYrarcvS+GlRn
	swX5MXHUv8BleKPRIK5gv3EnWoRwaeI9/+TaauD+hTnB9sFIbJfThKHE9Lj1Wmlga0KWBsgfMSE
	cFJsqXtaZ+zKbEMEmMQTp/7b9PzQjA6UYY3ifnhWc3ZLi3Cqz5gCaRdo56J/A=
X-Received: by 2002:a05:600c:6214:b0:490:b106:4fe8 with SMTP id 5b1f17b1804b1-492333f71c9mr12683795e9.33.1781637398430;
        Tue, 16 Jun 2026 12:16:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/30] vulkan-tools: upgrade 1.4.341.0 -> 1.4.350.0
Date: Tue, 16 Jun 2026 21:16:02 +0200
Message-ID: <20260616191628.2014553-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238931

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{vulkan-tools_1.4.341.0.bb => vulkan-tools_1.4.350.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.341.0.bb => vulkan-tools_1.4.350.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
index 69c77f66e8..ece9961c71 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "48a4bcbdf619e57204783f8c1a04c76c160ddd5b"
+SRCREV = "1cb3a319969cf0d3e2315b0a87a27447f55b4167"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.47.3


