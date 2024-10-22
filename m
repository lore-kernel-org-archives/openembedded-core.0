Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB50DD2CE06
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.23583.1729616290053057707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=b54k2UW3;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b15467f383so374311185a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729616289; x=1730221089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EiNUc7MA8taVeqeTw7gwzfXKGPp/cNQYrov0CmKP8yg=;
        b=b54k2UW3Oe/jzzh6dotAnb64w4o1QilQ0vjxVaDBWYTKILRp+abS/NxlqOXzrkHB48
         PSWitwNgGlgIS3wZKRxSJWh5KP+8mYbc3uLTah2lfWfBgiG+O2uHMMEL9zeTuFEFW3D7
         kdvC3he/fZJVFo/LTbF5iD6D42ccPHbX/Kz8bsOmjx5VQnAnDevWElHiMHMPOPjAo03L
         DlayijiCxGf07VqP92CSxJWqkDC/soVKicNO3LOCdIOFhlBGRduwSPeadyCkjtKMcOaq
         ZOCa878ttnKTgmv2I4m+A9Rb3ePZHBDeEY+6KXcmh3VG522s1VUV+N9OWFFDuFfr9OvH
         SBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616289; x=1730221089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiNUc7MA8taVeqeTw7gwzfXKGPp/cNQYrov0CmKP8yg=;
        b=dJsojklrPsxQuHoSXOGD+qr1GDYAC4naB72h4LshljN60P7TouOs8hfam2lA+TZIKU
         VGxxvoQKuiGBCqGeQOLI5iTj8mcWuCtxW+ThATSHF3jfz1iF5pHceRrSjuiLpwE//DOi
         l+XMQ5ysQbY2bYJOmpPIQBB2rSwFuhb8S76U5/+lsJr6N1SEKE1Y/ihAzpfbOTC6sMHy
         vUigVODDuDEXZPsdUR4weyjY6rIddTX3oVv35T+K66FnhuP5UGlzgVFMvvOtMILTjAJp
         SFubRuSjqbw5nTmLMsj0EuxSDrAcHlYlRnVCXUwjp7ttuGoIFJSDPgQRXZBbRj6uFZ7P
         iPoQ==
X-Gm-Message-State: AOJu0YxlWpwXCy8LhmhOaXyIDlUYQ/y6q23vJhI1/0k5itLTC50h0kio
	FPI3gmKL8oCwdWwSO26vQey2R6iaXZuMUzbtczH+++fdGLGeBisDlWvJ6waxrEIuVKAqvdKxR0n
	E
X-Google-Smtp-Source: AGHT+IEiISKhc7T25Z7pOD/92kgYZoNlZWHOYeEclHLrwtitd86ZS5Ktv9px0BxYrOLHZapY8ufFjg==
X-Received: by 2002:a05:620a:4629:b0:7b1:527f:cf44 with SMTP id af79cd13be357-7b17670a722mr402969385a.10.1729616288673;
        Tue, 22 Oct 2024 09:58:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b97f5sm297130985a.6.2024.10.22.09.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:58:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6] python3-trove-classifiers: upgrade 2024.9.12 -> 2024.10.21.16
Date: Tue, 22 Oct 2024 12:58:02 -0400
Message-Id: <20241022165807.2601020-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206161

Changelog (https://github.com/pypa/trove-classifiers/releases):

2024.10.21.16

- chore: update calver to include hour (#191)

2024.10.14

- Add Django trove classifiers for 5 and upcoming 5.2 release. (#193).
  We missed adding the generic `Framework :: Django :: 5`, and I'll add
  5.2 since it will be released in a few months.

2024.10.13

- chore: update github actions (#192)

- chore: update release github actions

2024.10.12

- Update CMU to include SPDX in parentheses (#190)

2024.10.11

- Add classifier for MIT-CMU licence (#189)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ..._2024.9.12.bb => python3-trove-classifiers_2024.10.21.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.9.12.bb => python3-trove-classifiers_2024.10.21.16.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
index c3a4eea1c77..9d841ffb524 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4"
+SRC_URI[sha256sum] = "17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.39.5


