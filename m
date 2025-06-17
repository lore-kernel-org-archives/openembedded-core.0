Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D2DC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:53:52 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.22912.1750175627124167478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 08:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hnjdBjvx;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a6f3f88613so58551541cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750175625; x=1750780425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1Ok+ux8BAdOyHuwuqCHVjLad8pKKCr0C3EHg9095aI=;
        b=hnjdBjvxbxPNhlT1g6Wrfyxw39QvtbP8wgrRHsvwYq8dPYop0DKWJ5Pdvl+pGT2jEV
         FmgqOtyvQIDW+PrXRvpNMvtipe5UGji6VD08WZhMeYRxE0VLmCmpvPOaYJR9WqDOnFpL
         DPrBSCmPxbztr4FGm5g3sEBy+LuWPQCVUivg8i77T9BB+bgMNwVtqNIeqiKqIrb7e7ee
         XygwWMCNLb13jebL0ssEY6mbIaEqQTBr3PAbznZ1/UQsbw151gY3RdXIiomZ03+Oq1JJ
         9ZzdRVuSGhbhmsPDPeJHIQaOCU1ZdKww7ha7cMVPV5zpGCufZ5IM0njDI2U6w1vvqG35
         7NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175625; x=1750780425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Ok+ux8BAdOyHuwuqCHVjLad8pKKCr0C3EHg9095aI=;
        b=QlC4ewe+bi5QNqy/MpkXuw9frbgQTmpsz48PevJNBT22SZYjjpm7N9FlyXpNkTnTdf
         VnHnj56qXpUZVNHs4iHLNYnqWZbEte+UU1Iak2Z+xXUk6bH43DDLQFvd8ljXxE9Ii7q/
         A6/b8SXoxmqAc3uwHicljYFqmglLhDYxib38G0XBkL0rCv0kYni8V1lfTPoWfikDXPOB
         VzmJouspYUiNUhn+HBwH5KQ/dSB4XSE22wgcp0mk9JYPGlhjsoa5Ije7OtRoVFBP5qb4
         SCaSxlGvhlbqUJLps1KGHSWXmDB0rGB5QvBMfa5ERJp75Myjuwhrnu8MlsAEiEv0rdFQ
         O6Gg==
X-Gm-Message-State: AOJu0Yz6auUHc1JAU/opzRpizy9pSX7Y319n+NFgw4NP+lKUo3DfT+eI
	kn1XI9rwO4IHUY7DnxI8jla5E75tDgFCPqbJIDnltUmcLYEnh4ESjHuViu/5SXyrSaRGJlbQgt4
	OxwPSGpo=
X-Gm-Gg: ASbGnctnEYyT5C1/M4VUM/RXy7alcTYwzfHbzKL4Bx5eLV6UtVKb2oipVDYhWirc9Qi
	VZ/hjrt78rznpsoAjYpm2JwY1BtqCYYUJ0/KzqdOsRDjaRHZZg6nDzFtokl8Uy9Eu7MXnJvCNzd
	hY4lJiMm77ydT5ZthJDO/dEvs24wEMM67PVLCHTilHxB2WRyfEHBBPYnsmpjeFjopjjg1KESTVM
	iGZ7/SzlxAB4rnapZn8otWwlkpxbS7UpIZLN2Qo9s3arx9GHNGxFNp9OK4l3kbn80tU6L/5pP5z
	+MrN+QLIqUjN1PQkRcnCOkQYtOmQIp8UBp316+wyU8AuhOHGuTzQoDjNFF+KqTefvnkY2//r+j9
	9wViR4OnBcmGeJinGLQ01KQ==
X-Google-Smtp-Source: AGHT+IHHboN3qZLuVXhUNrF1JFgUrs1BAuTuLlC5Wh89oL+E6iomgH+avqkj4ma6jY3T4oazL8cN1A==
X-Received: by 2002:a05:622a:1348:b0:4a4:3606:cbec with SMTP id d75a77b69052e-4a73c51f88amr207739221cf.8.1750175625444;
        Tue, 17 Jun 2025 08:53:45 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31566sm63865466d6.61.2025.06.17.08.53.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:53:44 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/5] python3: upgrade 3.13.4 -> 3.13.5
Date: Tue, 17 Jun 2025 11:53:37 -0400
Message-ID: <20250617155339.1305652-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155339.1305652-1-tgamblin@baylibre.com>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218885

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-5-final

ptests look OK:

|443 tests OK.
|
|Total duration: 2 min 43 sec
|Total tests: run=44,050 skipped=2,309
|Total test files: run=471/480 skipped=28 resource_denied=9
|Result: SUCCESS
|DURATION: 164
|END: /usr/lib/python3/ptest
|2025-06-17T14:05
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Reproducibility OK:

|2025-06-17 10:34:28,071 - oe-selftest - INFO -  ... ok
|2025-06-17 10:35:04,539 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-06-17 10:35:04,539 - oe-selftest - INFO - Ran 1 test in 1429.952s
|2025-06-17 10:35:04,539 - oe-selftest - INFO - OK
|2025-06-17 10:35:08,924 - oe-selftest - INFO - RESULTS:
|2025-06-17 10:35:08,924 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1393.34s)
|2025-06-17 10:35:08,925 - oe-selftest - INFO - SUMMARY:
|2025-06-17 10:35:08,925 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1429.952s
|2025-06-17 10:35:08,925 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3_3.13.4.bb => python3_3.13.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.4.bb => python3_3.13.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.4.bb
rename to meta/recipes-devtools/python/python3_3.13.5.bb
index 5b49fee3bf..eb1f358eb3 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.5.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "27b15a797562a2971dce3ffe31bb216042ce0b995b39d768cf15f784cc757365"
+SRC_URI[sha256sum] = "93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.49.0


