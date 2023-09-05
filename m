Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329A9C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 19:34:15 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.31807.1693942451624560234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 12:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=bvxFF3O/;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-414a929a6f9so16213431cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693942450; x=1694547250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQ0OG82pPpiOSVUDNXwInA8tiacvJVuloDgt6EFc47Q=;
        b=bvxFF3O/5mXIjzp2tGXxM0WWqqeiBjNzHwyau2Ep69zNLIzNEeoYy+FBXCxHwDpTvN
         yyHojEivns/H5ckR2cajm73iPZF8vY/KymSakWPiK2NbjpzmDmFvJdQll5Qklt53D7Uh
         KDbjHHBXuvwqxgPx9HrJC/j+H9om2yaRy70af5/u5xbVieoBoqrbgpVDJkasIweZi57P
         uZ+hJzGmDlASquxRvz/W6SiKhHbZ1DOLj9JvFuwle+E7uO4UI974gocvpKR7XQLjNnsE
         sIsH9+Z3nLO/EhIQMlH+3gS6hVTP47V3etaCLV7+as2Qceoins2JCUKzkIq6OAnRDKRs
         f4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693942450; x=1694547250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ0OG82pPpiOSVUDNXwInA8tiacvJVuloDgt6EFc47Q=;
        b=ONq8Xc2REYs0QRQa9+2JyY4nt0QD28lFkqicNN1+xQ2DJUSNi0uk7fG+PA/gjvPCa7
         OaqeJbtHaI8c9+FhJ7/KEC1Nyq7Ebr8iYp5VAYwabjVVSHSPvSUD5/LjID7XFDCxZkmz
         Qs+P+x/r4yeGBY8jEGyqZz26t4EvajDhcJHNqjCSsOrFMakvEsz3A6RowUqCEuIHOqNb
         lZ0ZFM9Hsn1n7PqFu13qpDv3lxtBeEV+pizCcp9uifJeUyc6mBrXw1A41eJO1EHebTHp
         Y193xr423IN+we8f10RkSBVEmp0lrBfaW61HvW8tILLYDUK7sBkTfHcgw46U5X2gq+MO
         kaew==
X-Gm-Message-State: AOJu0YzL0R/eABhtP3E5RpOfzR8RdHHeIYD5vpexXc8Zp55SAOPnE4zK
	HPWCnw2qlUCPKjVxyGDJ6Zit9XOjlxIeqd2CCS8=
X-Google-Smtp-Source: AGHT+IF7xTDGxidhl86OoQ7QYnXOCDM0+B5ry+XC9l9JPqYMy6Apv/7KQ4BgmRvO2aXYqgAF2U82Cw==
X-Received: by 2002:a0c:9d46:0:b0:649:b37f:46f9 with SMTP id n6-20020a0c9d46000000b00649b37f46f9mr11826899qvf.19.1693942450477;
        Tue, 05 Sep 2023 12:34:10 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf591000000b0063d4c39b3dbsm4764315qvm.112.2023.09.05.12.34.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 12:34:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-sphinx: upgrade 7.1.1 -> 7.2.5
Date: Tue,  5 Sep 2023 15:34:08 -0400
Message-ID: <20230905193408.2602331-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905193408.2602331-1-tgamblin@baylibre.com>
References: <20230905193408.2602331-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 19:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187254

Changelog: https://github.com/sphinx-doc/sphinx/blob/master/CHANGES

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-sphinx_7.1.1.bb => python3-sphinx_7.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.1.1.bb => python3-sphinx_7.2.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb b/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
index 92d6012692..f55cc5a3ec 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
-SRC_URI[sha256sum] = "59b8e391f0768a96cd233e8300fe7f0a8dc2f64f83dc2a54336a9a84f428ff4e"
+SRC_URI[sha256sum] = "1a9290001b75c497fd087e92b0334f1bbfa1a1ae7fddc084990c4b7bd1130b88"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.41.0


