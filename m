Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78149EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 18:00:25 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.2694.1689703224386530782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 11:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=MZehUY90;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76571dae5feso562645285a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689703223; x=1690308023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=57CZFDfRh5yTmF+WVHR55qaNhUZU206V9JJpYi5PoRI=;
        b=MZehUY90ParJKj+yRPO/DbYXCrNszwWl3A+wWhp6Rwhiz4E8XJBumdut4KcYVcGYQ8
         SdQoy8or9oIO3tO6i8ZLork8XwEvSTQTsVPBvhjpFNVhmv+MB9mqPskRqZvb2WTIuWCU
         mbHKCMShLUTYYldRTepT5BLvTdlv6gIX/pph4KFr+pdcm27/48s2D9ENI83Dq9w4daUl
         JN/+s5/K9sw1bBRKDqzUoZfi5NwKhcUZE5KVkw1PpA4QxMJfF/KI34OVkMF2wvZuUrIO
         vtkKn3+2XnnzV3d+RHmip5fnVEP9ll81mz/xUdoq3qfz4tFe5b7nMvuAAa2bFmXGP8+h
         U1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703223; x=1690308023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57CZFDfRh5yTmF+WVHR55qaNhUZU206V9JJpYi5PoRI=;
        b=UgRllZPzbqO2oiFjARn+YxyU0iFBkRl/EPtE2/oieasuBKc/Hy99Fxtz39UsK6AFbC
         ieBegLohou7ZnVSfwrv3GANZpOFTgNvykpshGBL9vDvntVkMDebjaYdn23lz3NGt+qVY
         23YCzKXn8AzBsxT22yljTVUpBg+/WXbEi22DpfsjXRx6/ecBeoSxcI6vrPDwTyz5tTMv
         ob0moYpBi+XxpLyquSMDvM8cYJQUHc9o1u4madyUCc0s2nxUWkMhF3pgLQWmPzgewOuI
         5nsOSCePo6wFtbWdsYaya0r5BWEJFldDz1ji2LbJIUpP7JvG//x8li27dVg3Lfu29N+7
         sZwA==
X-Gm-Message-State: ABy/qLZA+SwxfjQMMN30+kdFkCbV3JTM3Sacwobsf2wTFU87DTdoRRfe
	w9TEKmfdU4PLX3zT7ZtbEt88Y58Y54VxnQCL9jo=
X-Google-Smtp-Source: APBJJlFcQmDRa5B3ZVDHIGpZWAHTjxKI3hcVosAtqUSEnH8/ttvk901E8BMPEE+3trjcYeYsu2N/ww==
X-Received: by 2002:a05:620a:801c:b0:767:e8f4:11d8 with SMTP id ee28-20020a05620a801c00b00767e8f411d8mr554660qkb.23.1689703222711;
        Tue, 18 Jul 2023 11:00:22 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a21-20020a05620a125500b00767303dc070sm777277qkl.8.2023.07.18.11.00.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:00:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] python3-trove-classifiers: upgrade 2023.5.24 -> 2023.7.6
Date: Tue, 18 Jul 2023 14:00:19 -0400
Message-ID: <20230718180021.2934900-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 18:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184553

Changelog: https://github.com/pypa/trove-classifiers/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...fiers_2023.5.24.bb => python3-trove-classifiers_2023.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.5.24.bb => python3-trove-classifiers_2023.7.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
index 2d484d4b2c..7879dc2031 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "fd5a1546283be941f47540a135bdeae8fb261380a6a204d9c18012f2a1b0ceae"
+SRC_URI[sha256sum] = "8a8e168b51d20fed607043831d37632bb50919d1c80a64e0f1393744691a8b22"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.41.0


