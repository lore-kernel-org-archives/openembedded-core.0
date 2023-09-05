Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A4CCA0FFB
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 17:30:54 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.28126.1693935052233515729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 10:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rKIaFmOT;
 spf=pass (domain: baylibre.com, ip: 209.85.167.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a76d882080so2178086b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693935051; x=1694539851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+gc2NK6PL5fQ7nNvdfixKHz06Q7aGe9UZsnebdMN/I=;
        b=rKIaFmOTItf9bmCWFwDcqkwk53iqjel9PsWeU3MilhomQKNmdfCwo6WXZ7+PYCvRPR
         mpvsKExpfsSIVWebj3i+qUUtYlgA8s2Lw8Z+Yw9/5qbgRAueoF164lHhdAgu2f3FMoS5
         YvEzB4wo+2D6pqCuJwtgxT1VBQs3nei9gcNcjDKZIQOnCJrbCwbHAyJ1OJU3ruLx9aP5
         4vL00c4DbO5qi/0OjR4jjbSNxjMxJcddX/mcSaNdX1I7aTHsdUxnXOk4cSVO5r3SVE8R
         Pbl150DVHbhlK/Y17ELUkUYEhQRIH/+7ToNdtAzWly1OusVLymfz0xn9tsHkgq43Dr+1
         +7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935051; x=1694539851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+gc2NK6PL5fQ7nNvdfixKHz06Q7aGe9UZsnebdMN/I=;
        b=cyCD6mnAvRvt/GPZm5/P12fYekMNLlZHLb7AbJ70YbqjAnmC+20gTeh9RXGo71mo3G
         HbsQ5KJ5us8yfewQciBG9fw1I8fCbF9oz0uaPmPvX5k8cmX7y7IVMaH41pWYGKUnz/WQ
         oq+iIa2apIXswwe1kQgANgFBtybGr/8+HGoQ235mtib0g0FTVW0qycq8BgXWoDStYYy5
         5YU/rR6TNPnry4fGnLsc0fbngxWkRYPIGIO7dCNBsC7tftny/tBHZtgf9CFBf4U0yfwM
         qOv+1m5kJkycVKnAJGCqpRUMdgWUa9kWK2snixUjJeXqIX9u+/7EorhTYAof1Yn5JB19
         yt7A==
X-Gm-Message-State: AOJu0YwOTz3f3QhBugRxU/h89VuHAGkUte6fl3neUyytjbgKNwRNCmwb
	euR3P/3MGxu9n0by/y/TzBRymWIlmg+8anDnFlM=
X-Google-Smtp-Source: AGHT+IF0Zjb6JWZAXCGIpoSNCGSfDo9nOenQAyQlypKmKWODqQkr/s/MlUIjUNUYr6PpA0kfvLK6jA==
X-Received: by 2002:a05:6808:1887:b0:3a8:2a98:2266 with SMTP id bi7-20020a056808188700b003a82a982266mr17651657oib.22.1693935051127;
        Tue, 05 Sep 2023 10:30:51 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id t15-20020ac8760f000000b00411fcc18cc1sm4479430qtq.64.2023.09.05.10.30.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:30:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] python3-poetry: upgrade 1.6.1 -> 1.7.0
Date: Tue,  5 Sep 2023 13:30:47 -0400
Message-ID: <20230905173049.2449088-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 17:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187247

Changelog: https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md

typing_extensions was removed in commit a06650d when support for Python
3.7 was dropped, so that specific md5sum isn't required anymore.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...thon3-poetry-core_1.6.1.bb => python3-poetry-core_1.7.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.6.1.bb => python3-poetry-core_1.7.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.6.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-poetry-core_1.6.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
index 536bc6413b..40b6355f4b 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.6.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
@@ -16,10 +16,9 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
     file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
-    file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "0f9b0de39665f36d6594657e7d57b6f463cc10f30c28e6d1c3b9ff54c26c9ac3"
+SRC_URI[sha256sum] = "8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.41.0


