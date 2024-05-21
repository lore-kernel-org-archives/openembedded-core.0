Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D669C25B7E
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.1252.1716311093010437189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2cf3IGfa;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-792e4c2a002so30786885a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311092; x=1716915892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V/aVZtuK0lnEmCktcNsbLMS3Sx5pyTf0ixJaS6QqLo=;
        b=2cf3IGfaj7yOgjG5ed4G3kHV4IObj2EWOc7HbKJqbBaI4x5ASHb93mMtRcsaeMDoXZ
         Xz7eSA+xq/LgbbnK3Rp3c6WOW/D1KZhciFYPnadmyosrpq9vEiJmhDFVunOiGet5KAny
         NuUaexiLeHD5dkT8S45emKFm6Yh3pKkx8uPJKnwId1qyYf5a5NEqCcx3OBRMxMHIJ3B8
         FJA0beEVdmCp5Yavdey1wGxFing3d9lJLGnlbVXFi3bzznKBmCCadY7VrcNuMOy2sen0
         Q6wuKYORgDC9zxAW+H0TjjVeKLIfce+0BGEv8hARv8+kmFaOYYmE6jYI2RkUAm9YNQdh
         9m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311092; x=1716915892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V/aVZtuK0lnEmCktcNsbLMS3Sx5pyTf0ixJaS6QqLo=;
        b=BITUp/mBZ5HAqLxXQWB/e3IWyM+iaLjXdLqmFOe/fyN0CZc6JoRhqLFo30JBoOUxgY
         rJz9FwyEwIHy0iUPVEP3WrvyAlZ2/Sc74AzN98jG2mLgfpwaErlvSaE+gZvNZXA4SuL+
         kEaGCi0AfO+Fe4JFrlSi1BcRorHPdkiAsZJsUFB9BPxKEHWzKbBdqsnKPwS8SDctkIQ1
         LgQCTLXEHJo/LjIoMxjLSfj3vrxo8gm9TNBLx6WKmR+NXNDhKqvcfBX3xUBDadctfa1I
         JgxQY9T4GYd7alvKAAQz7pJX/NakN53okuc5btRcXQFHKDvltO/BKbfJi5batijt6YDt
         Ss8w==
X-Gm-Message-State: AOJu0YzzGAlP7aArg+PLBhirfpC3J83br4A3zYL7qJDTePumxXV6FL8S
	dW0gsevRXs5Z2Sw0hpibCjcP8OWivYdsApvXNoqaEX3jFLV2br1KQyxyVqn1HrgZgju23NRmRKz
	q
X-Google-Smtp-Source: AGHT+IHfoJEq/f2UbiG7IQmD3GttLEuof+vDCqIZr8jXUhSn/7M/LZlP6BTxKEZNynQ7cibgFM/mjA==
X-Received: by 2002:a05:620a:1272:b0:790:979b:c20c with SMTP id af79cd13be357-792c7577543mr3705354185a.12.1716311091927;
        Tue, 21 May 2024 10:04:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 07/10] python3-setuptools-scm: upgrade 8.0.4 -> 8.1.0
Date: Tue, 21 May 2024 13:04:42 -0400
Message-ID: <20240521170445.1892398-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199663

PYPI_PACKAGE is updated since the upstream now uses an underscore in the
package name.

Changelog: https://github.com/pypa/setuptools_scm/releases/tag/v8.1.0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...etuptools-scm_8.0.4.bb => python3-setuptools-scm_8.1.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.0.4.bb => python3-setuptools-scm_8.1.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
index 64b5050c3b3..ea65b476fcd 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
@@ -6,7 +6,9 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7"
+SRC_URI[sha256sum] = "42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7"
+
+PYPI_PACKAGE = "setuptools_scm"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.45.1


