Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8ABE6ADD3
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87828.1766434124126934666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SVKoJsE2;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79e7112398so703552666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434122; x=1767038922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov5yUKo7f51G0fwWdwPvLSp+2aBXjjF89r2WeqVSTjo=;
        b=SVKoJsE2zOgYYgBX4+8hWQGhRvhBDjt1WtAaqb6ft6c4BLhWK3AVPqME8jhu5Umfzt
         xYE7B+4yrBvbETqHgFU3XA7n5WIDsZSh/4apk7XKZxkxawyUNCyJeoUBJI9VRh/WFel6
         otMDCcX/kJTrGq6FVFAvbTZZw0pMxCOs4u1o9StCqCvVF8nT42YuCRmPYUmb2N+jpaat
         1IO/SMG+0ta1+uw3p00yDfr5z+gZbL95YUxZDDtDMjUZxm1zzomQwPVvC6UQPwb52s+m
         WRV9baa1njnC9LYoLGo2ElYstKkhziRHl2yvJDXISz5v1BWob++T4fhpCGnDEanBwA/9
         rLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434122; x=1767038922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ov5yUKo7f51G0fwWdwPvLSp+2aBXjjF89r2WeqVSTjo=;
        b=kS/9lqnUbOZ1VxL8mwZfeTFjlF4l70bU2A8hTjp+XpQgSG6qFWBZrMDRs04tHzu5D8
         9kmyYflJltlXbYZ2wQmhBz3adc67UJsV653WH94Jb7AL3JMvY3co+IK8K3u9hyz8QQDf
         QG8NfqnQWyrdQrdaRabnFS2yrWNfNsEiNYzdUeOyHbtHFP7y8tBBdldXrtNEiD37VUvz
         jVfD1JA3bfUOjr+/rcaMrjff5V/QCVBq6pUfhKhS8ptSdb+Pw4+Weh/T6nT5ZtCbAMzK
         tmjV6UD78z/vvAk1d9AhZY95he0Qp7IbVBsQUwyY0JOHJC0SE6k9DNcWBYVvMAhJqnUg
         wDQA==
X-Gm-Message-State: AOJu0YzuhF0ckZAzYmiAqR0EnGYI6MlMx88xEEtWKOSkc3CEWMwOcuZq
	WAaOlwjr71lLuaQpNJ6VYon5IeUxtorFTGT3bI88UE6sO6uOaaOqrawPQXRGNA==
X-Gm-Gg: AY/fxX7tgQnDygyNjL3INzjyQgA5Tkd4Oi6ANVivorIgMySIn4ZJPgsM2Ye4Bq8CDBC
	1bsuXaTDJieypuppJefwsc9zO8JhjfhwW2r/YbQ715CIfcUyiMpgaIijfixz4e7U9AqB3DHayUb
	s+EMl12c/jGA9dEPvvpai1hH4+JRGnsCcAJxG3GIRIFPNvyYNwQ4W3gjl3eATrRQ7vLDeajbIy3
	lc5EPjYZ8ihUuyY2mXHD8yFsfuthyLVb1Zmw0DtqXSrQn/AWxer9wG3dC3krodoHGprTEV1W89f
	JxvTes9u/2JUH5ZEqJgmnxx5gXCecu5OqgZzhVF1f7vnBejem4wnZBnL8k6h6PkefoNUtDkHOk+
	8lFWiWxL7AD9Mtdmgf64wrRJhh/PwdXSf234tC7NPzEafGLiU/fn2I3NCln+P35BWG4e5+Ci8zj
	dIrUumtk814p98BcaTHZxZToM/oyTv6eW6nBTplohlDaL0JE8=
X-Google-Smtp-Source: AGHT+IFoUh1TYYbtAzBlEGd+TfFm19Tr6vAWD5pWom5xG72Eflm8wJJGjgCFlRJ/r58dsRRnNYMkUg==
X-Received: by 2002:a17:906:f58f:b0:b7d:3728:7d11 with SMTP id a640c23a62f3a-b803719967bmr1374310566b.50.1766434122375;
        Mon, 22 Dec 2025 12:08:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 083/114] python3-testtools: upgrade 2.7.2 -> 2.8.1
Date: Mon, 22 Dec 2025 21:07:05 +0100
Message-ID: <20251222200739.2278706-83-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228408

From: Alexander Kanavin <alex@linutronix.de>

License-Update: additional files and contributors
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-testtools_2.7.2.bb => python3-testtools_2.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.7.2.bb => python3-testtools_2.8.1.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.7.2.bb b/meta/recipes-devtools/python/python3-testtools_2.8.1.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-testtools_2.7.2.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.1.bb
index 8d7759b4a7..29a28d80da 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.7.2.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Extensions to the Python standard library unit testing framework"
 HOMEPAGE = "https://pypi.org/project/testtools/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fd7d57d2bdc8678de824fb404cb1a4"
 
 DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "5be5bbc1f0fa0f8b60aca6ceec07845d41d0c475cf445bfadb4d2c45ec397ea3"
+SRC_URI[sha256sum] = "da5102b02b6d9924607d31dda6deb26a085a78afa78826bf44e3b8717fc77208"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.3


