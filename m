Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF6C5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:21:39 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18669.1786317695208890459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HygRy9ja;
 spf=pass (domain: konsulko.com, ip: 209.85.215.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso651885a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786317694; x=1786922494; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Q5DlK6frOV9bnDfixy8MLr3BpGP9CVxGkHed+2BUmw=;
        b=HygRy9jakTKfyNFGnaFKyQzP2XIba99yaq3OBTqodvIyYW95xH/4x6+Z+gi9FlanRO
         AQ2ogK7enTiitT5q58ylPkI09iD5JmplaeLFsh8sdXXnR7fPCwes91OquLsIs2ODFO3s
         utT3dRMAQzg+mkZ9d1wvK24ZZL13vtRZXWKXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786317694; x=1786922494;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Q5DlK6frOV9bnDfixy8MLr3BpGP9CVxGkHed+2BUmw=;
        b=Z1zR5VQ7+n4K3eGdE57SFhybj2h9e/Bl0frUrAOaJ8byPVrDoYk4xgaVqg1mEsyrRV
         mG+O430MQNEEwKupVvn0Vf67h0FXnBrio9AeqrKwP4SnRSM4kxZSyJ8P4fo5Xb9SWgQ5
         DQUagxVKs/pgJNDVECcqm2rda7fOt3qY4S1ZgwrbEr65IC69mARTamnfTKp4inzgs4/J
         03g4ynSB2fus0/1AA+ElREyJQ/Svuc2Az+dVVS0D0shsbViN0509vCwGMFonXqd5beqM
         F5g7l4HMOK0Iczcly587f6/HjMnm8Ej0Y7FkUennEzEzbEpKqTXK8YVCqvHYZ674v19y
         S3Kw==
X-Gm-Message-State: AOJu0YwqT+uk4c1HRS7far2qy7JKvIMrwjWwaybUjYEtzPhOr+JJGvDF
	jGDyZWIw4gPkHgQ9G0lLMKgvq5CMOhKgH7zBtClDLcW1CJmg/jE2rEmTKQNyrYwFFWSNqkj903n
	DVEgl
X-Gm-Gg: AR+sD13beJ3ltVfWBdWTLLpazmXzyQwfI6LeIuFuclRGICRhHEWkm6NnYt5Sv1TnuYU
	eOOSDATtMI+7fUsMxf+NuRSa711bMEGSEzSKAN7F5ruCiQa6GkHuXL2L7nH+ofk6VnZkHl7F/Pn
	SBpqr3wnOQ4fVcIob3vVid5N4EY35278z4xtKnmyglMY36a0Mn6JIMb5EUwrw5C/QUYF92Jcna3
	gEkqiX/o4KHpPu+gzE8+AE2aqf+HC81im6ksukQTeE50X9nK+CxBhMmuHYvIiUuWpEVVFh9XLhf
	K2zLJKZeMm4wqHZbHdRNFcVgJcSzB2F9uCH4aMXPGMgzdmzZdeh1Zpm86O/Ql/YhO6K9kl/jN43
	GG+Buvct7ilZiZo9JOSXLS2zvFeH/pwlC2Ep6q6z6bvtKcNkmpmED4+PrSuLRELA0/Ae7GWsV+r
	r5+NriWqrTS8nfSmvXJtcFJfaZOxmGzpsePxm0nL/eLfSQF7N2AEb3fLU7jLnkzFxFAmlYKXH16
	kFQcQ==
X-Received: by 2002:a05:6a20:7285:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3cb85eea69cmr36517263637.18.1786317694529;
        Sun, 09 Aug 2026 16:21:34 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af992sm2950850a12.14.2026.08.09.16.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:21:33 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/5] python3-wheel: fix CVE_PRODUCT
Date: Sun,  9 Aug 2026 16:21:05 -0700
Message-ID: <20260809232107.367378-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243083

From: Tim Orling <tim.orling@konsulko.com>

The proper CVE_PRODUCT is "wheel_project:wheel".

BEFORE: python:wheel -> 0 CVEs
AFTER: wheel_project:wheel -> 2 CVEs

* Already patched at 0.47.0.
  - CVE-2022-40898 — DoS in wheel CLI via malicious input. Affects <0.38.1.
  - CVE-2026-24049 — malicious wheel file can modify permissions of arbitrary
    files. Affects 0.40.0–<0.46.2.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-wheel_0.47.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.47.0.bb b/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
index 88b54c2ee2..4320442729 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02f
 
 inherit python_flit_core pypi ptest-python-pytest
 
+CVE_PRODUCT = "wheel_project:wheel"
+
 RDEPENDS:${PN} += "python3-packaging"
 
 # One test is skipped but requires the "full" python3-flit, not just python3-flit-core
-- 
2.47.3


