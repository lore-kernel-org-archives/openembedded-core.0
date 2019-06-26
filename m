Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA007E692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 19:05:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c66so3230165wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5MKT8Txpc8OCTFS8tULG7kVOsEQkGR/qmV0Qv9ctClM=;
	b=XFdviWeOQ16F5hWO8ePYzsvS+y2ItJPOz/lSTY+ffXaPO46A3L4DYq7qn3GaZSWdVn
	fbnX5w20u7LrrSCYjjiruqaB0rxz6Ef918xjnovfsezQBVpu1sm1dfNmjq1lhYHTACDb
	hYl2c5DoJWHklZcytMdJi7GyPTdxBJ+jIV5NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5MKT8Txpc8OCTFS8tULG7kVOsEQkGR/qmV0Qv9ctClM=;
	b=nOYlspfV3QfEEWoj7/Rr8sqvFa5wEQFWM/iyh5Skhyj72szSnhVrwNe4oBRgmDBzlU
	oamw6pBwgvu+DRZLxLivR+5kioHWyC0/fZj+TE3OzwQxAFlNVmkjML7jyDXkemSyylqf
	Tajaz6qVU2Mq2kYhzp4IfQNujAIXUYoxAqYgPPHldtMTIT/VabpkhR9KDBcuL/y1vzit
	w0jzjJbHO/0fXQZq3EN7h85yJGpszk0dpZ7gtRLbBjGUEOKuPzL5HB9ele5H7UsEa64V
	54XRPl2z2LcN3oaV80QAYO/Est480GAktgGAJraiZhAL5Y31RNpHfyMKv/55u05+uLEe
	X3cw==
X-Gm-Message-State: APjAAAUcurdraRaFVCPDmw5Ma/p86c+8Ik5HhTojHU5g+Eetvk0n9wq+
	OGpw8c3hfAnvuQmh3qERkCE2NOvMicE=
X-Google-Smtp-Source: APXvYqxAfvomuekcvhum00l98ffAR5NoW5C5TzyzBAqlylLaRF03hNEttlXGfFoDRwsUo5CnZtuj5g==
X-Received: by 2002:a1c:7e14:: with SMTP id z20mr307359wmc.83.1561575919389;
	Wed, 26 Jun 2019 12:05:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n125sm4247203wmf.6.2019.06.26.12.05.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 12:05:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 20:05:17 +0100
Message-Id: <20190626190517.25680-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] multilib_global: Fix multilib rebuild issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 19:05:19 -0000
Content-Transfer-Encoding: 8bit

Building lttng-modules for a "lib32" multilib, then changing to a "lib64"
multilib with "lib32" removed doesn't rebuild lttng-modules.

This is due to the multilib pieces in RPROVIDES being added after RecipeParsed
which is after the signatures are generated.

Changing this to RecipeTaskPreProcess allows the multilib components to be
accounted for correctly in the task hashes.

This addresses failures on the autobuilder seen in lib64-core-image-sato-sdk
builds where lttng-modules was being reused from qemux86 world build's lib32
version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_global.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 19ce1a50915..11ac5b04579 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -202,5 +202,4 @@ python multilib_virtclass_handler_global () {
 }
 
 addhandler multilib_virtclass_handler_global
-multilib_virtclass_handler_global[eventmask] = "bb.event.RecipeParsed"
-
+multilib_virtclass_handler_global[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.20.1


