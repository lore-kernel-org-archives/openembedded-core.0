Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CE5C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 19:04:18 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.4057.1685732651154416654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 12:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jRyoph6Q;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f6c014d33fso19659551cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685732650; x=1688324650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4CiCOupHDM1n3HiG8qDaOdBRaxeHPsYoeplfhJn9Y0=;
        b=jRyoph6QFtKM+MLdieQ01VVD5S1/fWtGhXsOXQmZkBIlXS+i0ZL+zBCu4DRC6ngX5W
         lt6K7eCDxvuRt/ThHKdL2rYQZpLQ02d+4gjyR0o9KBxzgWj8M7Dj0Z+Y93xLGXo/RVZq
         Y8X6ceCgvo1LdWYfETKUmoxldx7x0fYIIMX6lpa4XBY5Xih2AAaOe8aKAjxUZaffteh2
         1gdPoJ5Mwu1epbMg3JYoJh2pkUVvF/xMBLKoqIIoakVfWcFjfpWuCunY5Da9dm26IhM5
         SwFJ179i1f7Btq65AnCQy/x9BLIBx4MKYNdxt8CEEeU4HJenvi0v61T3/wfTVELh0vyG
         vdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685732650; x=1688324650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4CiCOupHDM1n3HiG8qDaOdBRaxeHPsYoeplfhJn9Y0=;
        b=XA5x2PWfYPBUx8MhSzBplO9cyr7Y+SE1JrQOCJRU27sWeGE4AHEtL7gMs2UssZeibU
         agUwxuihqbZ80iHrJPIp0m/oAmbZed+BfjV8q6IY43jZuoZzN/97xx+IYVSuwqN4k1Wr
         c3XAbSC1Sce7Iv6YSZ+N+xniaLhFtvthJQm7NRv1LzjoBm1q60mVEWS/UugAHSM0dqd6
         w3CmZHVtiBL5M/IcUh43aytWJUj0rdmkPh9RvOne67dlKQtHKxumvRBGRbhNfg5ViHsi
         Mabchtqapz85Lowz72bV2ZR0ySbNaugukikAn9af7S7W+721AdUbK1hMfKq5VU9Ivbqt
         mr+Q==
X-Gm-Message-State: AC+VfDwiNybZeDnfFHswQN9mb4OMZRUC7mLbpJjzVyjG+kzMs7IQBfE0
	qVXbbjlZ4IGumKnqgmNuuIMmSh15F6SosBUgUMA=
X-Google-Smtp-Source: ACHHUZ787wlmdwTFhXUNFcXcYoerm3OmTXzlOvnmKF/1dMcui3MMmdLEdi1Hja61bGBfAc/QNL1dGQ==
X-Received: by 2002:ac8:7d45:0:b0:3f6:ac8c:84f2 with SMTP id h5-20020ac87d45000000b003f6ac8c84f2mr17519277qtb.46.1685732649777;
        Fri, 02 Jun 2023 12:04:09 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id p15-20020ac8460f000000b003f7369c7302sm1079565qtn.89.2023.06.02.12.04.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 12:04:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-poetry-core: upgrade 1.5.2 -> 1.6.1
Date: Fri,  2 Jun 2023 15:04:08 -0400
Message-Id: <20230602190408.2644121-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 19:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182338

Changelog: https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md

Notably, the project replaced its use of tomlkit with tomli, so the
LICENSEs and associated checksums had to be changed.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-poetry-core_1.5.2.bb => python3-poetry-core_1.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.5.2.bb => python3-poetry-core_1.6.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb b/meta/recipes-devtools/python/python3-poetry-core_1.6.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.6.1.bb
index 738b978690..536bc6413b 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.6.1.bb
@@ -15,11 +15,11 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
     file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
     file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
-    file://src/poetry/core/_vendor/tomlkit/LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82 \
+    file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
     file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "c6556c3b1ec5b8668e6ef5a4494726bc41d31907339425e194e78a6178436c14"
+SRC_URI[sha256sum] = "0f9b0de39665f36d6594657e7d57b6f463cc10f30c28e6d1c3b9ff54c26c9ac3"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.40.1


