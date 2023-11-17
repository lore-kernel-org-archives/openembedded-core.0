Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691D8C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 19:49:16 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.4860.1700250554637400277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 11:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1g7kIWMs;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77a453eb01cso141245585a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700250553; x=1700855353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+30jx3beDYHsrlm5qzxV6v0McBSy/DWbvRs6nQSxQw=;
        b=1g7kIWMspswOK2CDRrCwPIxs3iMw8+SY64qGn48xiLyhyKzyDoDolYF8Pof+7MZrPy
         fikmThLL7qH27ili/GtINMKH3DSgYldxrHs5/wa6RF9Zk7QTYZXgJFEiLBahiiZlwdYO
         tOOQ3sLJjYBwZKdswTmmK8ibyRLA7thj32AGfUQFWPCI6/xOF81fFTXnXFKqFgGBkHhS
         K6ivpkdqQUNkKmtfQueEbZhAo/Oy+9Oio0ynp3W/eOaKx8AMlFZhxvirMB6KKnD1w6Ig
         77x8DX/QY30ooZQHI05TYryhy4qH5iuHCfEKtf9AU70O7WmgXJG4E9axgFxUl/jWlKi6
         CLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700250553; x=1700855353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+30jx3beDYHsrlm5qzxV6v0McBSy/DWbvRs6nQSxQw=;
        b=NMz7QWR2eCyAW39zotPzVdTcGdPey/p2OxeMlbmSyvE0Xc3wzOiJnIjDO++mrLZgVa
         lHyRjjdUExJ2XestoicNbkMW/lBSNkZGZ8vNrKq80AXAEQhlSdkueOKwhaXdyCpAoGwo
         XDZa7QPlOPtwBrQ/grFs5q91nN5hFFzkazqe+vHzdBfUNMOHot5BlJy3FcHeQJ0jrDIq
         xr2kEizawIN6kB0QgYcrnWALLOj1IGKGvK8Kdy6UyNE8fvphNNrZJmGOd5kOqdijs5CJ
         GQpHirqN1llRI0FmEPYHt5fXaPiOvwPwKFXx2IbqsfOGr3W4cr+r6pcDnMqngjVejesZ
         peiQ==
X-Gm-Message-State: AOJu0YySBcDO3c1Zy+TEPQdSH//VyM1CFzddBLX/JAcFNVlFPOOooGdW
	y9MHn4Q+IHnUNzXVcJ3aDa9UskxiVvJgY9ba/ayvjQ==
X-Google-Smtp-Source: AGHT+IHUmvrGm5Jlqb9y+tbg6dWAbsOLaVPq0FUkdlrIWFaOtUh0SJHchDeVKpMEq1NnCQ51BPBJ5g==
X-Received: by 2002:ad4:5bce:0:b0:66d:ad78:130d with SMTP id t14-20020ad45bce000000b0066dad78130dmr93823qvt.21.1700250552950;
        Fri, 17 Nov 2023 11:49:12 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cc34a000000b00677f8d80f76sm533481qvi.90.2023.11.17.11.49.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:49:12 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] python3-trove-classifiers: upgrade 2023.10.18 -> 2023.11.14
Date: Fri, 17 Nov 2023 14:49:03 -0500
Message-ID: <20231117194905.2080320-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117194905.2080320-1-tgamblin@baylibre.com>
References: <20231117194905.2080320-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190858

Changelog:
0b8493f Add `Programming Language :: Go` (#159)
68d983d Update release.yml (#162)
bd86b09 Update release.yml (#160)
44d951c Added PySimpleGUI versions 4 and 5 as a Framework (#157)
29ca293 Add Odoo 17 trove classifier (#156)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...rs_2023.10.18.bb => python3-trove-classifiers_2023.11.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.10.18.bb => python3-trove-classifiers_2023.11.14.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.14.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.11.14.bb
index b0c1b84cc5a..a6c7e95c515 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939"
+SRC_URI[sha256sum] = "64b5e78305a5de347f2cd7ec8c12d704a3ef0cb85cc10c0ca5f73488d1c201f8"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.42.0


