Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C70EFD205
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 08:02:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41022.1772006557159634843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 00:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y8uz0ZYa;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f1defeso44407745e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 00:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772006555; x=1772611355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y26w5+w6UcpzFC8X4TX5F0nMGC0sHSWnJTsF9n8RpGY=;
        b=Y8uz0ZYa7pcUBFurxp0bohxuk+1UNa2/0jG98mq0q/NlMx4peSto7u1K0+MF6mp+Yd
         8nuqJPTATF5jEF3ktiqIzDL/B+07n4Lxh7smc0LgdLILvg1Uv/6uieCAq3K5BTjZb0bF
         mRlW+S9bEi0AJJVPf1cz/UucD2An5R9MkO0Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772006555; x=1772611355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y26w5+w6UcpzFC8X4TX5F0nMGC0sHSWnJTsF9n8RpGY=;
        b=t+ECG3PNzggSSNOQKQxW+/nrIHxc7KsuHEexqu8ZyAMU9b289cwCoR5HC7pg+URYc+
         zsm1nXvdNHxkT7Z2zTBfWCQTIPcskKExuqvsp4yVyDWgznIsC4QXfk8RQ6YZuZCVC97E
         V62+gwKTE5Y7wcquGFj48hq7hvnkWAxD0l/gdKOQrYjF8YgPEVv8bJEsKnId0KazPoui
         m7pSSFVXojNFExqyomvavMoXsiPQOkZzKmjsJkhIEgJFtV887x3KZJmhyV+d3s5w5Hwg
         3geIJQ4zWwJul8w0cRQk59w/v+cogH4ZxCrqG4jb45yptIyW3M6Mpl+kUpis5IC/ji3o
         dTJg==
X-Gm-Message-State: AOJu0YxWeZ5J/I7RbPKavFcy08M4qYYfG8HEImqTG8o6m0zKl4/d22NP
	le+zofjKkcY7NUSUk5esmQ/oRINZJxwiHUoPft7x9EFMEK2UEU4pcCqyXzNq550MSaSDI4q6CCU
	ENu2R
X-Gm-Gg: ATEYQzzowNTc3/Vhv+8EGzES3CtFjh382fxReaqEPDbpe3/i9aCAbiy8Ye0xf4748j4
	4Uuy7Eky16AKTM0LPmh+qAb7zozJAgTdonI5Voh1ly29Z7kkeuj5a7pHQbcrg8urDKuw5pXmOak
	Yefnmh6g4dQxpNGtpnqpg4jGSm55CYb9dZ3HqNWxMSeeV6oy7fzZnvGdpzl1o4R0jQKZHqG8Ozd
	AO0BJxSYokwTzswE2K/Y2Ymm+DPS8X9+GnBc6mu3395qMO4JWiD/+tsxQx4WD7SC6Sfe/5gQP83
	ZuU5RALJJ7HsqTaZWce8sEpkeVwT215fAbkOLoa73J9q+Z1jzhCPAoW+wPu+e/qfYD94OuDvCZ5
	dEDzeXw3t8iRpHM+ZPouT5RqTlVZaWHq9u4W8LjG/xPOAn/mrEYt7vlkTHjKmu2qivkYvrSPhry
	dUOscS1jnpSCMgQgI4Tae6VjasreDecsMzs/cc
X-Received: by 2002:a05:600c:c4a5:b0:483:a2ce:f461 with SMTP id 5b1f17b1804b1-483a95eb453mr242328235e9.4.1772006554805;
        Wed, 25 Feb 2026 00:02:34 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43986aa2f84sm9668184f8f.7.2026.02.25.00.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:02:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-wcwidth: Upgrade 0.5.3 -> 0.6.0
Date: Wed, 25 Feb 2026 10:02:28 +0200
Message-ID: <20260225080228.1385437-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 08:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231939

Upgrade to release 0.6.0:

- Complete textwrap.wrap() with 6 missing params

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wcwidth_0.5.3.bb => python3-wcwidth_0.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.5.3.bb => python3-wcwidth_0.6.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb b/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
index 8dd0584dcd..874b30b7dd 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "53123b7af053c74e9fe2e92ac810301f6139e64379031f7124574212fb3b4091"
+SRC_URI[sha256sum] = "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3


