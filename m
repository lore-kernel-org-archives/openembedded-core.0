Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3E9C7EE39
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 23:14:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2796.1750806854471886701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 16:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YOXsfvJv;
 spf=pass (domain: konsulko.com, ip: 209.85.210.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6675150b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750806853; x=1751411653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty9LORQv9WQjDGT0lkxqwzlX4yEUhJG6dfvnLyvo/QY=;
        b=YOXsfvJvbEr3b0JTiJVKl+yUDAg0CUdXrQoHWzLayMXopN6JXTNQhsmUvNqYn83765
         myMkBySn0iPU/TV3QN+ncHE37uNIDfZw3BMC3dkZvCLWFK2CIcA42Zx5yf2I43XXHOlR
         /XHzDh7eVl8+zvBozw2mcU+zG29Ki9wB5Rq4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806853; x=1751411653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ty9LORQv9WQjDGT0lkxqwzlX4yEUhJG6dfvnLyvo/QY=;
        b=NHXc/D1iHvAf4134fweizQ5he/lrgXU++kM0gmFEZEnnO/UH3/5m9o6yDYxIMaxkZo
         M9MqkRm8GHDR9nWAL7n+vjch3spR9t9iyympO1zPCvB7a0JqmXijl6y+TkZobYTKTa+7
         Kg25U8/LHtIRQF5mF7AtFpAvsIxvfiOqLhHepGw6s+zU8lRh8lRi7uVp1bmiSv5TUAbO
         vdly3VKM5+krYniAHXLRElVFVffOCCRaHLygUKMN04oUFgTmdcBbif6aE9fBapJHD+E5
         fVLGNG0VvZ6ghYmw77HjeMjTe20BdpPAW3LHT4j8BqAjC+i+Q9FvZMGUnbI4JKvq8vFG
         nCMw==
X-Gm-Message-State: AOJu0Yx/83tOOeU/2fYqU5MdR0U5W/55U0prTHqFn4l50vbPP2E3cTGJ
	siDH9M/mFLWyEPjWxYIgf0pAz4G0dZOkaMDyB5p5/DrGwVuQyUpQtGKZjrW1aizKH4x5SfZo/g0
	1bgChsWE=
X-Gm-Gg: ASbGnctKSOhC0s2qqJCuOht9fY1YmbX1vhqamcDwetiaAsGMMzZ93SN0lARyAXXbLcN
	/jkj0irp3zEQtKfKllL7JTwM44EEMvudcLEJK3TNPm7KFyI7HtKiRoocVIXEjqhJ0teBZ5T1jEJ
	wuV8ZHWwevvKeQ6/MZs/Uz4W7bbkCgWiikLNZvidrKNX2NI+708HX1edRICVtMyltwNBRpq0+Wv
	I+yyGNszbHGFtBByJ6g48LFX9AJV0qF4oC3wzant/+gUe6Do4o0FkUUnMAEEdVoXP6T/qbfbJKo
	HVr94SUXGYoxswkeHHfQtPjxOix9tjB8hXdkMqYA/oeHKlCeZ9+gyvuj7TCE0np+coMsEORR3LZ
	kcFcHNCg8kHeXgn0m+Z5K8AJyBw==
X-Google-Smtp-Source: AGHT+IGTw5gr/LPpZvUU9Oi2LcuJ0reo4qrjSM1daiEEBBbtt4g99MWRboE96XOWuO9Fi9P+rGKgDg==
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ad45bcfa8mr1276714b3a.18.1750806853536;
        Tue, 24 Jun 2025 16:14:13 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882cdc4sm2831835b3a.84.2025.06.24.16.14.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:14:12 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] python3-certifi: upgrade 2025.4.26 -> 2025.6.15
Date: Tue, 24 Jun 2025 16:13:55 -0700
Message-ID: <c4e1bba0d3756bb9e9c625aa8cb6d0890742409d.1750806216.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750806216.git.tim.orling@konsulko.com>
References: <cover.1750806216.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219294

From: Tim Orling <tim.orling@konsulko.com>

* Switch to PEP-517 backend with inherit python_setuptools_build_meta

Commit log highlights:
* Declare setuptools as the build backend in pyproject.toml (#350)
* remove code that's no longer required that 3.7 is our minimum (#351)

Comparing changes from 2025.4.26 -> 2025.6.15:
https://github.com/certifi/python-certifi/compare/2025.04.26...2025.06.15

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...hon3-certifi_2025.4.26.bb => python3-certifi_2025.6.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.4.26.bb => python3-certifi_2025.6.15.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb b/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
index 07f9f3bfc84..e8ad8da4869 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
@@ -7,9 +7,9 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
+SRC_URI[sha256sum] = "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


