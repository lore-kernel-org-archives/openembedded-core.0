Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A68C79FB5
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:10:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6758.1788941424680502737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WmYfVHeo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482ea739de2so3805246f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788941423; x=1789546223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckhWOld87KhzyIRUcUdAH+vXV7Mpu0DsE/tu4eqyniQ=;
        b=WmYfVHeo+DCCZ0WNIsjZA+LseThJgx4eDEGBlYHHSAnjkyPdeDim0XGAZrI5ZgN4Q+
         uaXTX7+2vIMCC64W8J7Zw/wStQbmu7cFuoBD0W68X4tePdy9m3g9ReHO3HFqqSz3nE7e
         VJPaHlBbEkZ9lFfnUZh/Mjf145TbPWVZbN6dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941423; x=1789546223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ckhWOld87KhzyIRUcUdAH+vXV7Mpu0DsE/tu4eqyniQ=;
        b=XiRVmJEOAp3SvJuos9/SFeF8zzo5dVW4/SZAsy1AyMWedVOqLUObWfJ8GSpQJDeNKD
         hm4WUsni/3hvJkxvnWmGa7UQuCWKhjUxt3Qwf91FAXr6my2c2BvInb7N7rgE23dtAJPo
         TC9Rup1m7zdtR5Zwk3YqgrgqSt0Q3vfWnTBwh/CehZ288ZosZt9GigV4ILD1FeBQMYdJ
         fNuBceaqAuelM/COpOW308PpW4zxvxf7OD4fc3YTs5TZy4FShpPb98G1VdNouJTMAvUE
         GjL4AYlp4uousnuqxcJgBxx5OBEN6gZuvVgSBiixZq8jEklRG+z3j5q2jBB/BpgpVT7g
         /wzg==
X-Gm-Message-State: AFuF++lQ+A3QVIku78Dg6fqqS46miMVuKSYltN1bPG9X39KXg7Bsgd8o
	wteRLz1X2JR6EPbArfv1yjJiudjcXtlSQWOz4UnFAfKAwjSGHpMvXrtAxplk3Q3iKQqYyjCVG/3
	YYn+HjPA=
X-Gm-Gg: AYBFou1MXO7FZqbf1dU8vkzHLf8msHGG30VbAp1ZAlACvAutsIxk0q/zC6SQIHfPM8c
	429Tiwy1zkO9K2/EuqWg4reF8yIF4dQ0aCeevqQXdJyd3hxQrj3bjaP4SatDC7au+r+pZIrsz6z
	1+IqNRa1EztyKxjlPHzik1UFkhVIeShv7v5KXHiiwbrc578JicU4kujnLdWJFrix085ab54ttPY
	Wu/lR58ZvbBG52dtH84PVINQk0r8lJ15FexGM0F5dAGXPTXk8AV2uQJGGYypKvhCEcbS8KlXDos
	/2LzRkVNsCGMhJxw/t1722Wu1IjfhRzw+qXXr/GYgafpI+Jb9k6AvVIYlUQdoqzzO2UqG6cnaCF
	TsJb5RGdCb8wEZTl2LcPIeNMBHGMdTfeBKQyqs/sWygPPr/gnZlUCBg4caOcIWLjg+nOcverUKA
	y7mag8fRCB4BTenQ8+yeQxKBg1MUQ0YDMvk7G3yHDDC7Qh8atl2cMY8zofYpG4rx76+5vkBqiFc
	x5XBtDn9LlRq6zFe/tkY6oCfJ2s
X-Received: by 2002:a05:6000:4555:b0:484:36c8:ffb9 with SMTP id ffacd0b85a97d-48587290dfbmr28010803f8f.4.1788941422562;
        Wed, 09 Sep 2026 01:10:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9d9a:c76e:7178:6165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40855548f8f.16.2026.09.09.01.10.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:10:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-git: upgrade 3.1.61 -> 3.1.62
Date: Wed,  9 Sep 2026 09:10:19 +0100
Message-ID: <20260909081020.2238149-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 08:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245451

Source: doc/source/changes.rst

3.1.62
======

Security fixes for

* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-59cr-6r3x-644w

https://github.com/gitpython-developers/GitPython/releases/tag/3.1.62

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-git_3.1.61.bb => python3-git_3.1.62.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.61.bb => python3-git_3.1.62.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.61.bb b/meta/recipes-devtools/python/python3-git_3.1.62.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.61.bb
rename to meta/recipes-devtools/python/python3-git_3.1.62.bb
index 975579e656a..ad912886bbc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.61.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.62.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f51c24d8c0f733a195447385f5774a5dfe8767f5acfd7994a33755644c6ecc95"
+SRC_URI[sha256sum] = "1791de66309bc0c7cfca40bf8d2e3de7ca091cbf94e6051be1ad0722c61062af"
 
 DEPENDS += " python3-gitdb"
 

