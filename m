Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA5ECA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 10:19:14 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.17474.1756376344598987764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 03:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Nex36Yuu;
 spf=pass (domain: baylibre.com, ip: 209.85.160.194, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-4b2979628f9so8242931cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756376343; x=1756981143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or6Vl1xEqJR/JmUlYzFIXxAdHRVHyfVWy4zS2y7LvxY=;
        b=Nex36YuuxnbfoN4DfAkaH0C6iYvJ4HqYsb2X5g5bJTqdXSL44Y0kvPmBCamgmcF72/
         MFW7I+abk04DqGpdc8+Yzbetv982RGGXgrqkXekTJX7hN4fhvJP0BBjEfFT14YsuQY+a
         i0iBWYItPJtRGdHa45HShEZWIVF+/ARhetpPP3Sk1fHmzHLGDySg7ftU6MkqS0f8EQnU
         ewVetcJheBf2IV+DU3DeR33pS1McRhlNs/qVaSWv/S1z/qYWgS5HhTl1rr2T2Nf/Oibz
         9qVhfU7meQRckay050o9Xjrhm1xODvHirSM9NIa6h43tAO81iTCzl9nt0a3nUSVk+2HF
         /HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376343; x=1756981143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Or6Vl1xEqJR/JmUlYzFIXxAdHRVHyfVWy4zS2y7LvxY=;
        b=rA8+PsmcBjFD9WJPg1bB8TPdZsPn8TGd90W1Hdyf+4+TJW20IE9jh+rI8kKOPxkNGc
         s6iwsmq0X8p/w+dhgn32bJfWM79JatVhTnkl3Ec9ZLT/fst9E3u0HizCO1rpPDR056if
         bHsTyDNZQgTCm5BF7plqnp5A/qNp9bhUAmQu1VdlnairFgbYneFozD8mDV2dZVDyENKU
         l0/bRHcOZFZ/dBaiXOdFCKflYM6BtAOMDUHkPGHEn/8OORuYECwpRKyid5K2wbkohAou
         PdeZTFcrVK1OFUNEsu0j3v2itF4PRNy+imTK3tLzvhr+9D2Zmh5SsogshSbJc6HkVdAU
         FSxg==
X-Gm-Message-State: AOJu0YycefCLLhhtrSY/idk20RyOMhauz2y8vv/clNJRc4XcEqFjc5BY
	30p2DYbUchvY0hjEQjzCBZ5UbFM5bQVw4rbokoW1CvoSEYM/Pr/uyyDkhMgPXOie8VBWz/aExsg
	wDZ2zil/L3+57
X-Gm-Gg: ASbGncvNBJy2VeWV78JT9eWZCBE/Lz2ltQj8cVc4oIax2/x+9qGDTS/x4VcgXDveznS
	xuJd06/FeyCj4GlhZ0u0B7vProNxdHXWA3fV+HFV6ZRYWZ05oo5qmrRDLskwznmveVTAG3UiSVR
	oUGDm48GOgR78Q8dcXb9MxL3pFWwLKq1w0cI0wt3gQ7ZDJ7G7IDCXVeAxHeQOpiuYIfKvxs/xLx
	6P7bXq9ZcqqX8l97xJY62ciuhIM48Pd88CHAC6kMs6PaGuKbaSpkUEEJKxr50jBo908KY9FYWcS
	QlRGQ+AkgWLyNTd1f13Y2807LbXDOsZ89wO14aMLRfuoltXAf+In+pf1dwkR5BwXj5XlYQdAlzb
	jiUkcAGFasZhIYO+3GqaR0nX6u3I1K1G1Mahr3cATG4HG1Y/MyJgVS9selg==
X-Google-Smtp-Source: AGHT+IEAat+M8BTpvE3G0XFOsZ2a6NcUmDcv7YAi8BRhnLf4WiuDsHU48zr0qDpwuZRdUwOBSj8oDg==
X-Received: by 2002:a05:620a:29d0:b0:7f0:5cd5:cd4 with SMTP id af79cd13be357-7f05cd51184mr1783710585a.32.1756376342765;
        Thu, 28 Aug 2025 03:19:02 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7f4eef7101asm493406785a.38.2025.08.28.03.19.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:19:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-cython: upgrade 3.1.2 -> 3.1.3
Date: Thu, 28 Aug 2025 06:18:57 -0400
Message-ID: <20250828101857.3947730-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828101857.3947730-1-tgamblin@baylibre.com>
References: <20250828101857.3947730-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222555

Release notes: https://github.com/cython/cython/releases/tag/3.1.3

Reproducibility OK:

|2025-08-28 06:15:01,526 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-08-28 06:15:01,526 - oe-selftest - INFO - Ran 1 test in 1173.893s
|2025-08-28 06:15:01,526 - oe-selftest - INFO - OK
|2025-08-28 06:15:05,831 - oe-selftest - INFO - RESULTS:
|2025-08-28 06:15:05,832 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1141.07s)
|2025-08-28 06:15:05,950 - oe-selftest - INFO - SUMMARY:
|2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1173.894s
|2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-cython_3.1.2.bb => python3-cython_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.2.bb => python3-cython_3.1.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.2.bb b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.2.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.3.bb
index 77dbbe8b2c..dcb61a3634 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
+SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
 
 inherit pypi setuptools3 cython
 
-- 
2.50.1


