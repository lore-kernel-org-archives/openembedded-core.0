Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D43C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:53:52 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.22910.1750175625615375226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 08:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=O4V80hJ+;
 spf=pass (domain: baylibre.com, ip: 209.85.160.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a43afb04a7so44243191cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750175624; x=1750780424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZyqKKwHnqVEP5lucKmbKKnANRWZz24pPYBSNOLFzXE=;
        b=O4V80hJ+w2MSqKjYzsWVFr7xgCTD/rAu6W2jysn7j/bAubaampBDlbgaw5ARlQf0y5
         CbtoeJwPh8UYNR0MwlzKy14+sfF1MuFB73eFk0vCYs+3fdj5woWI5DZDEcZ4NIK1BKtn
         VFM89DXUFuj27ncSetQ+3J2XgDjZWvewbxyFS5y4/S8W1yJI6LKonnu9lIZurxwSUueT
         6miKg/RUyUoJGHNMrshS+DbUTNF+Rv+F2PkbM+ur8W3usV9z016YYza1bAjwtcXZ8wDa
         MSGqHdVTIR5CDuBH0r+aCQE8e+7Op6Fn1y41mHWUvuCkejvigmSGt7I7kf9rP3GXaZYt
         G4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175624; x=1750780424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZyqKKwHnqVEP5lucKmbKKnANRWZz24pPYBSNOLFzXE=;
        b=hugnvUzRmq/6cShaiGl4WiSzZvQFuG0/cbX7iGcvd1z6XBb35mBjs3ehaaFMUWDTAM
         cO/MbzcLqvwOU77A4sQt4mi85ykrXOJ93Cnb/+XGZVaYp2PEB8f/XTnSFydPEkOCgvSW
         auubon/+9NHbshOIvY0ZtpLu9/uZWarwTMs/gDbhDgAWMvVKse13LmFzqgHTWRXMsM6P
         D1qXrxe2Nqeq2cahvpvZGIrs0gsp4IWJoZ/dJVaGf4hOcK8G0W3n4ITCsCM3VAHxjbxg
         zdKR8Q6JvKLnusXQGvlt9BKYjFxPiai093ObRDPz/eNQ6JRN5hXTfan174fkFITIt/B2
         bVvQ==
X-Gm-Message-State: AOJu0Yyt6P8wtfDELeOjLipRwIc052YcfKJtV+lUJClD2BmIg+/KeamW
	E7KsAAA99ysfkw0Ri+CiOVRJhSqPS766dTLag33imcZY8Rga4DF+YIitfXG9fIB2ysX6H9Hrnm1
	DxZmLpP8=
X-Gm-Gg: ASbGncvCzWmi30DAxQNS5vST3VcS3+ZCu+0ZUNFCBtCmIH4BxYX/kEUlAeXPwMMiVtY
	Zlh0+LxSwBEu2WGX/Bj6rW2QupbUjTz9kmMccidLu/4EQcBxRURcDgjL6Ldxl6AoZzlbw3GjxCG
	OGD9NBQRqnErhGtuZZfosr/Q0uxVIp93cge6tfMq8C8ApDlTrbeD972MU5M7fu26MXUtAuA+6fM
	KepkSlG9r+sBshQaKwWok/q2XIpngVkLyd5zJGCsgo+Z2Zmne4u8disC2hf6MheeR4zCeJfx8Ok
	uVNUdFrcrhpFu5oER23SELwvsZs1BAHKpaF9jkuEHQ6nmWBVshUCmwln8ikurONEPQnH2uvQZrl
	XWFAm4V955cLwKTvvdz6KsA==
X-Google-Smtp-Source: AGHT+IGO2AU0JkDkjH53RDg6P+0urkMhMB5dI2+PT+5k31eCq5YNRNwFO+GF0yI/NrBJYlxDHkaPgw==
X-Received: by 2002:a05:6214:29cb:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6fb47628c39mr204798076d6.4.1750175623744;
        Tue, 17 Jun 2025 08:53:43 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb54052f1esm25716926d6.73.2025.06.17.08.53.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:53:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/5] python3-setuptools-scm: upgrade 8.2.1 -> 8.3.1
Date: Tue, 17 Jun 2025 11:53:36 -0400
Message-ID: <20250617155339.1305652-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155339.1305652-1-tgamblin@baylibre.com>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218884

Changelog: https://github.com/pypa/setuptools-scm/compare/v8.3.0...v8.3.1

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-setuptools-scm_8.2.1.bb => python3-setuptools-scm_8.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.2.1.bb => python3-setuptools-scm_8.3.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
index e35ef7c25e..70eaf312d3 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "51cfdd1deefc9b8c08d1a61e940a59c4dec39eb6c285d33fa2f1b4be26c7874d"
+SRC_URI[sha256sum] = "3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.49.0


