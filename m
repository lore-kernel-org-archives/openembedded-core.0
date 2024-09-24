Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E7BCF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:12:24 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.15102.1727187136239950325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=H4if2ll6;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45832b2784bso45977721cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727187135; x=1727791935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18o2qPr9EO9VOnrogUZ42ZgfXlsH6k2hvVrSnXHfifc=;
        b=H4if2ll6yc0NnwLUHmuLSiyOPgavHfkEAAXTugY+jyYArQRLUVGdR5kOYtOQd6u6Yw
         zlgO0S+hShB1sqFU+AWiWH5akCET+PV4TUZLEpl//IZT+wd1Fy6+nIX+0f4CH66BMmVB
         Etul2Om7I+cPLhusG8+lnsv4DO0w4xaF4V/IrIB2fPuKlH9KyW2ySCBuArYM5LRUrrXn
         hJo411JBZ7mpWh1ttHd8ghFjjXRma1GpIc6ppNKBEP9469mocabQEHrbuHmGuzHHewRD
         XC3BPgtekBTZd0x7syBo70jtsCe754X4+RzFz4OCKOZeJFjBzrtXei9jDs8QGP/af11X
         Qa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187135; x=1727791935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18o2qPr9EO9VOnrogUZ42ZgfXlsH6k2hvVrSnXHfifc=;
        b=p4Yg9ezLJ2tHfBQIfq1Fa6WeAhEsLAeTjuwLQLksZbezX7mXJK8xIA60idS6XwjOYG
         5ZHzbrffx+e+FAOktGKLv5yWPvkm4PPMeoabsGdZftS8XXVuiTTOQl4yFqkv6NTpHjT0
         DeDN/IUC7w3I3k9/g+bnNpLLQTzZA3GM6FCZlN6tvoEsZEwuUuxiN/aWdSJkBDHXlK+S
         FiS+0LRa8APHlOmHoEFgOIiya8399tl3afQ/PRSSIUpIkA+ClSZHcH1Y/PEOjRA7Psgp
         zORjxjwBCe8jVpNztsbfxzb7+0YIfBhNWU4vcp5vS4lAbgJ2PQvfTn7Sc4X//Ar8Jj5M
         zA4A==
X-Gm-Message-State: AOJu0YxjXTKfI2c0BlYwrjHBhwc0EFC3ETQNL0+fqeEQR2u2U6MM94Kj
	p213/I/cSdTNd+n3XUvAXXhN1DlWidoE9pNZvNqLnL6s/fPoER9AMsmLPCDL1xGVao7JKMVsfdR
	nChw=
X-Google-Smtp-Source: AGHT+IG+2tqZsrF6uxi1aYOL39beki55Rmxdi9gMrozBImOBTpFAbnd327wfaCZSoMEC/W6xKBktSQ==
X-Received: by 2002:a05:622a:4e86:b0:458:4e4c:b692 with SMTP id d75a77b69052e-45b2050800amr241755971cf.36.1727187134902;
        Tue, 24 Sep 2024 07:12:14 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b526924d7sm6620711cf.87.2024.09.24.07.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:12:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] python3-pytest: upgrade 8.3.2 -> 8.3.3
Date: Tue, 24 Sep 2024 10:12:10 -0400
Message-Id: <20240924141212.2579675-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924141212.2579675-1-tgamblin@baylibre.com>
References: <20240924141212.2579675-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204866

Changelog (https://docs.pytest.org/en/stable/changelog.html):

Bug fixes
    #12446: Avoid calling @property (and other instance descriptors) during fixture discovery – by @asottile
    #12659: Fixed the issue of not displaying assertion failure differences when using the parameter --import-mode=importlib in pytest>=8.1.
    #12667: Fixed a regression where type change in ExceptionInfo.errisinstance caused mypy to fail.
    #12744: Fixed typing compatibility with Python 3.9 or less – replaced typing.Self with typing_extensions.Self – by @Avasam
    #12745: Fixed an issue with backslashes being incorrectly converted in nodeid paths on Windows, ensuring consistent path handling across environments.
    #6682: Fixed bug where the verbosity levels where not being respected when printing the “msg” part of failed assertion (as in assert condition, msg).
    #9422: Fix bug where disabling the terminal plugin via -p no:terminal would cause crashes related to missing the verbose option.
    – by @GTowers1

Improved documentation
    #12663: Clarify that the pytest_deselected hook should be called from pytest_collection_modifyitems hook implementations when items are deselected.
    #12678: Remove erroneous quotes from tmp_path_retention_policy example in docs.

Miscellaneous internal changes
    #12769: Fix typos discovered by codespell and add codespell to pre-commit hooks.
---
 .../python/{python3-pytest_8.3.2.bb => python3-pytest_8.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.2.bb => python3-pytest_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.2.bb b/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.2.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.3.bb
index 459d91f1beb..dbd984208d6 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "c132345d12ce551242c87269de812483f5bcc87cdbb4722e48487ba194f9fdce"
+SRC_URI[sha256sum] = "70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.5


