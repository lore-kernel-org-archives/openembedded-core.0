Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C93F8DFE1
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:15 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28254.1776378785478820512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vzpDGuym;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso954065e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378784; x=1776983584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4DGxj33M83tdzDTFm/C37grkZ67fTY0gJo5pUhvEHw=;
        b=vzpDGuymg1pNfBiHE5xFf2tRiWGPRa5LDZLKT7PLZKjXDTKCZa1fJkbFNnKU6GVsW9
         Mj00Ui/GA7Z4TfDcI+bw6pc/dfBXvDu3YuR4G+nBGAqJbHPTTw0YEe8pl0/Cim9d2TSs
         cZF4YRkcsZyG/7ApEUueKOWESVvp5Qt3bqEaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378784; x=1776983584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4DGxj33M83tdzDTFm/C37grkZ67fTY0gJo5pUhvEHw=;
        b=lZSpdNz2sg18OvkI4H8mHqOUstS6Ko0m+C3pCsrk3Da++Nw+QZ9rhoYvCZI+UUqCyy
         cA1dzhrpn5JecaZ2DrRgBSO9FDghe403rGQzK6RKEXHj3fhDQidN6a8sm8q+kYH7vqgf
         PkxT2A6/MJHAIcF2obIs5XOi9y5tu73YelCEWEe0rrhT8y1nSkocy9QW4oBXm8/GhcV8
         FnZKkOUy9EVkgT8IF7KJc27gFJ3Gf7YaD2aV0FKQVLs/hsWAkQJyAYLmZT4Yj7d9Kbhg
         Opcmzcc+zT8TcnwPz02OP0QQfQY9nj2gA4gWtaVpZO2sb+vs+3AQFiEvDFbWZitoZiG+
         STdQ==
X-Gm-Message-State: AOJu0Yx1m5NhFCNDXQE9OSk8+7UtfqwSiqbYtHnSs64FfLIrvdZ9nggk
	gs3zkMzdxcYn3lzpHVIwhi225IzBbcEpGLK3neQ9E9cPBU3dZc5IcN1xbWc+9oaZegYH0AiSfw1
	1qQnlPyj9a0d3
X-Gm-Gg: AeBDietfb4B7cKCHUCnoGUktmX2eCCC8KATq4HR9OwfqbKYNMGWQ4VxhXJD9y70s9WO
	v9hdn0A2l+Y6Qk96qClrtm7TP5H2sxczzE91S4gmuKMSxRBj3M6KlDXKoMgmcwge3a+5Bh2R333
	XmuyyfEyWeImp0zjVI7HrGLd1aOPVGHMMmaM7c9GlHA0EwOTzxBnJ4ww1gU23h7Ht5A5Z5B/CuM
	qycGVyZ/LxH8jaGHrACz92zsP+dD8R39HNAo0CMogt5lPmf892EDztZITmysQkvV6orhNfhDhoU
	S+/enN5p7aTTIYYtcyjJI0gqN428VL1q9jyoX8tAgVHmCBhmSoJCcfvIb67LVpUsRr1dUkh+ooF
	bC+CHAIDpaTl9U3yIk0mcRbjsDLXTJ/uZ+vPTphOa748Qqab4GSv/0BY3ejJfnZFMxL+yRvEA2L
	Yc1XPr/WKTGeHw2UrlGSO9trpbVPuvyzqdPcrIb0AZYwH31UZZ87cFXSPp+oQlppF3fkSQVMCYF
	zUv+1aKCk3jgfd1ErbJslKa8gQIdxzIlPFa7Q==
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488fb78e7c5mr4325355e9.28.1776378783656;
        Thu, 16 Apr 2026 15:33:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 08/51] python3: upgrade 3.13.11 -> 3.13.12
Date: Fri, 17 Apr 2026 00:29:51 +0200
Message-ID: <976d4764a2d676c2d477563123a9b96fa19a95be.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235437

From: Vijay Anusuri <vanusuri@mvista.com>

Handles CVE-2025-15282

Release information:
* https://www.python.org/downloads/release/python-31312/
* Python 3.13.12 is the twelfth maintenance release of 3.13, containing around 240 bugfixes, build improvements and documentation changes since 3.13.11.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: Full changelog: https://docs.python.org/release/3.13.12/whatsnew/changelog.html ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/{python3_3.13.11.bb => python3_3.13.12.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.13.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.13.12.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.11.bb
rename to meta/recipes-devtools/python/python3_3.13.12.bb
index 2bc2389b7e4..e30acebe20d 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.13.12.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2"
+SRC_URI[sha256sum] = "2a84cd31dd8d8ea8aaff75de66fc1b4b0127dd5799aa50a64ae9a313885b4593"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

