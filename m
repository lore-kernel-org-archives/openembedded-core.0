Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4748DC369D5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 16:28:06 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.2295.1745512085218093754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 09:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=T45iPczw;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8fce04655so13056056d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745512083; x=1746116883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spRm+sXc9wrLBfXB5mIh61cSdAd1uNbKfO8UCe1GM6I=;
        b=T45iPczwagDDjTfJVky5J0kPGDqvzQlxmuZz6ubpQ4jCgfLgZVzh3YH07TjpuXZNTS
         ExDyC/904xujLmnPjZleP3cRqUMiZGY1JqKgklCFnZIIY0ZsuZ6/gOjcszf4nwuoEEDa
         OAy48q8B6FZy5WIndNL60Eilf2gsY3xFNi02X82xaHUlDnpv8YpcDiS86A3UzKJUY5rg
         jY0z99EszuvnbPQTuY5iz3nFlnbUzNOk0TQ8Y2ZXc8GFgN7ADnXKWlrp67UuGBclqc8X
         7S6rmA/A7qlHwuBtiy5M54sk3vsQeD8YdTzzonsBujZi/B80Jzwv9shC/Rq99vN/PZ17
         2Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512083; x=1746116883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spRm+sXc9wrLBfXB5mIh61cSdAd1uNbKfO8UCe1GM6I=;
        b=ckb0HAypgLwB12AT/txkOHOSJUo6py6DbvIyPn+vvpBl7uGQvCwc7aDArrdw1RxsKT
         mCHbpHDcMEZ+l5U57iEPeHE7a0KtIUiwsMZMVR1PudSYCy+Pixj1tqv5Bimakj0KEKRN
         7MOuAKAAUuHpTxtORHtjlZ41NdsoMollsGRCSqQ1kYc7DoBg5lwqIfhLXpwaqDE0WP+V
         nYcx3gc87cWGbGKb2Qw+uRVPeFG040zA9xZcESHWIXz3E8Mv1XjvOs/JDUt1lELAVI1V
         /H8D2Rc+NsxhggokvWrMIb4pIyvPxlrYXOIgpYjsNK/MUUr9GVIIfdmqRe3Mq2uGsW3I
         Bgng==
X-Gm-Message-State: AOJu0Yz9pcpLfySShlHBJh+/2rd//HClM1mHD13KL5wQ5HJHNBtcK4US
	649NCymDoLxdXRICwd0WjCyTHrGESbG8D/MYS5DVGr5QJuwuVQIl/CL1dTGwewNYyEWy10oAn/S
	EEko=
X-Gm-Gg: ASbGncszIpKV27pLxRxY7rLzHMSN//yhT2mBOf5dtaIA4Ca39l5Jxk0WIKYS2SXJ64F
	AIbITwBJXYYhHIuwbKaS9Oa0B2Xwo08dP5VKnS7iBW4i94WtOAFM+4KyRJwChW6CEdxiRCrwrDZ
	/93/KfzWHF76LpjI5ZRHfRH95/Nvr8YpqjTyyzIhPdv52ZVyN3eROpT142aj8282Ek6+ya4rP8r
	S7yGJ7ZfqdA8zyCZ8hJtVjM0ZsoHotuC8Cu3C5OKyzSk0nF/e38QQ9cpFsZpFCilwCFBumFEdge
	U7jw5XDSUB8BW9v1T4Rsq8lVCtJjfkEiPYlbSktLTdlZlKBz8N8PNWqWMLKw2htuUa5HAin3JzW
	N
X-Google-Smtp-Source: AGHT+IE3kqkQCVsn2BBWanc9Msk46K6zQPdk+cGAjq+18rU3aovbIl0EixU4vTuv5FVavuCifmJTSA==
X-Received: by 2002:ad4:5de8:0:b0:6e1:6c94:b5c5 with SMTP id 6a1803df08f44-6f4bfbbad69mr52818886d6.4.1745512083325;
        Thu, 24 Apr 2025 09:28:03 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0ab1131sm10996636d6.115.2025.04.24.09.28.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:28:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2 v2] python3-numpy: upgrade 2.2.4 -> 2.2.5
Date: Thu, 24 Apr 2025 12:27:58 -0400
Message-Id: <20250424162759.3892597-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424162759.3892597-1-tgamblin@baylibre.com>
References: <20250424162759.3892597-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 16:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215391

Changelog: https://github.com/numpy/numpy/blob/main/doc/changelog/2.2.5-changelog.rst

Reproducibility looks OK:

|2025-04-24 10:27:00,978 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1203.06s)
|2025-04-24 10:27:00,985 - oe-selftest - INFO - SUMMARY:
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1233.056s
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
No change in v2, other than to include the patch with a cover letter.

 .../python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index a2ee2b48d46..c6a37c0a85f 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
+SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


