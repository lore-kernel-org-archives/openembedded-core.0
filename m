Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7ABC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10313.1787155058010867537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RRk/tpj7;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1090911f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155056; x=1787759856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q5wCc2XeA9HDNJnAnDeakmyWJQHX9iNXNjizQ2URTig=;
        b=RRk/tpj7fjXBqpBtpJ1qLMv9zouxBdu24DmUjiJAB4TSFd8367xItKy/zqO7mAhSD/
         IFK0SZYCbNqmLARKOBm8vSsHp03piYRsMPkOLJrAoZoJ56SK27r5iV85M113b9kVK6sS
         Lgf8Kafey1Nj74lAXkg5171s4ypjB4PkM3G1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155056; x=1787759856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q5wCc2XeA9HDNJnAnDeakmyWJQHX9iNXNjizQ2URTig=;
        b=hQiCZdm0sc5cpchYYNM+vtryPrfcNsMsNJlZL6X7ddBg15Y/9ZZTKchT6KphISDFMX
         b7QsBoeOHIoEUYGxUqg0PIhMBe1sDk3VTC4x1ssZDAI34x4fn5cFtdvZySKTTKMHXyPA
         pwZGEc5pcyeqiC2TlUae9/Ew51wBMYFwCTJYBHmKGu3wquPccpaDCNbSuzNm/QAXACei
         fwzOVrOExuHoR8n5SVsggOJ/Pp9bVHnn5sqeuppP8AnKPbv3NeWvsNAVXCOzVm146vB6
         G61wW0VDrsfBQ842306ER2WILu1gl2dfNL/8+cqh1K3wBVvTPwxTYZG7OeTicy1N8Lyu
         uO6w==
X-Gm-Message-State: AFuF++kUcauXt42zVYN8P93uJB7+zA8jEZO2C4OaKQM3wKyGUQSfZI/u
	gtF38vh2vXyCOrsq06uBnWy3vT88o0minbbE65LxLlvuhvWw3mNRWIWu9JOBzbsE/Gag+SixPLM
	tsgOOQw4=
X-Gm-Gg: AR+sD12rdJoXxDvpfiAKIzMjOqTO+S0Yze0pO7OHjvV+Nc1ydQ868GRkKgIcAprlg/e
	JS+RSbVAbLBdY10x4NBInBMqas6nFgi3zq4tTsc47U11RNfVc+dUqtCQBzQNKm91y9dlVkSa8Te
	pLKY/O/PeiJrXhGxAICKhr+JwNONUks465YYUV97J3ZQZ/0YPaNpxEPz4oANv+TfGbhKf/Ad5Po
	9A0Tb6CiyzO2r6J5kSta+kFAvLybF8diIRmMYOcbtLPzZ3PVKGWl3OhdhudT9h2y0BnDthzHys9
	F/4hR9OhXX+goAzBAOgTY4Ma2ZmG0kBe34SDMZmE97F1VdSlnUYNtly98h28Mck4C5WUri8QAmf
	d4VmxzT143LvSYRWuCAJFE6yoJINFdbJfeBGO4csuHSfa2GKgnzyTooHRfwknQAgBggt5uK52Kc
	yp6HGKoMjpIgyd07FmSoQiqoYG9nE9u95glN/RJC5gGNSrKmTK9mo2o7SqVVE93fsW/ZKkIswkq
	CRwNoJ5OsOnVpBjqNJ3bk4Ma9lFNMmIqt9YRIHQnUgXdoOrUmCb36CFtwBo5sw3W12Gn4oznqzL
	Xg0wAAamjlBtu1i3axkIFkO7JkU5z5552sUmDOdB
X-Received: by 2002:a05:6000:2881:b0:47f:97e9:fe60 with SMTP id ffacd0b85a97d-482b1fd9579mr10143245f8f.15.1787155056130;
        Wed, 19 Aug 2026 08:57:36 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:35 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/37] python3-pyopenssl: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:32 +0200
Message-ID: <a909ac52853d29efbaa333f76d0fcbf25e2ce573.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243737

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyopenssl matches nothing in the CVE
databases, which have used four vendor spellings for pyOpenSSL over
the years:

* CVE-2013-4314 (jean-paul_calderone:pyopenssl)
* CVE-2018-1000807 (pyopenssl:pyopenssl)
* CVE-2018-1000808 (pyopenssl_project:pyopenssl)
* CVE-2026-27448, CVE-2026-27459 (pyca:pyopenssl in the CNA records,
  pyopenssl:pyopenssl in the NVD CPEs)

Set all four vendor:product pairs.

For scarthgap, python3-pyopenssl is 24.0.0. CVE-2026-27448 and
CVE-2026-27459 are fixed in 26.0.0, so this metadata change will
expose those CVEs as applicable/unpatched. The fixes for these CVEs
need to be handled separately.

Note: Original commit was for python3-pyopenssl_26.0.0.bb. This is
adjusted for scarthgap where recipe version is
python3-pyopenssl_24.0.0.bb.

(From OE-Core rev: f6cc7e0c0a4a906244fc8cd4b45706d42a931fce)

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3d752e577004f871fe7f4235e2625410140a08)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index 94a70aa17d1..ab00730b570 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -8,6 +8,7 @@ DEPENDS += "openssl python3-cryptography"
 SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
 
 PYPI_PACKAGE = "pyOpenSSL"
+CVE_PRODUCT = "jean-paul_calderone:pyopenssl pyca:pyopenssl pyopenssl:pyopenssl pyopenssl_project:pyopenssl"
 inherit pypi setuptools3
 
 SRC_URI += " \

