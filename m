Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0604D2CE0D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.23586.1729616292814630418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=b/tmOr5O;
 spf=pass (domain: baylibre.com, ip: 209.85.221.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50d32d82bd8so1147449e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729616291; x=1730221091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q60iAQcxJWtySoAu/jNz1bYfWcmtZQC1QNUsnLbDFb8=;
        b=b/tmOr5Oc/3YeUdKT3SHyjC+uwWAPAQpHFowU6CLNwcFDM7RYmSOnqz39GY1/MDaV2
         7CiqkSxsG2j+Fz+mgtMj9W5XQ6StQ2WXUUS03n7WCJEpF2ZGvOipkRFp+EuTVc+XZ+Fh
         tsIXugNUhFokHzN2jiCcRLgtH8o7K4fmJ24at3WlopY492eDe9c2ezo2f6kdURLfVvM7
         bodmPgoNSkjPKYC0dmrsZdmsEQRyUjBzgzIb5mCnDq18elU5o04XY8uvz/YxuvQ50P3N
         OpEK5RVTHq6IlAesfQR1gt/Xt7Q3Jfp0NCuh4m8TFr9lilpM+6Saj0z9bYGPLmdJY2oS
         wAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616291; x=1730221091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q60iAQcxJWtySoAu/jNz1bYfWcmtZQC1QNUsnLbDFb8=;
        b=tLM6mrYsv/daiNYDtF5FYiDz6Oe2T+IZo7IRvkKaN/S3qOJfbbjxeCGxeZzgBiKuQY
         IYUzXm1T51xFadtbDNo2ucWAehhFUF+L/O0dRYgYsj0s4hycotLsiYPLWGixDISwnIad
         Ypioiue1tqGEUFJ9/MRxUe7Leb57/oL5L71b5VqU/wIexjY9UjAszPhRJi90NakU8W/3
         bVTwmVj254CE5TTRHwC6rbl4nF5cxB8umNn6SQSmLxeQ6bZhB5LJLgU48R1VwGZnBTll
         ZvAfrGfKMKnQsRsnWWWiibsGdpd89orGGhM2jR2oRjTf+U0TCxi9QHwESEtggPpKWZcF
         Hr9A==
X-Gm-Message-State: AOJu0YwNcKH37G2mJ4rPdaSWUYOI0JORH1J3m8Dvt7VQTtovs49767VW
	wTFeuHAg0V54eMR6jV8IKcpPDYXmHX1guGzh6Z8FtHf7SymnS8RBZDvw9h7unyMgtok5e1Ua0NT
	e
X-Google-Smtp-Source: AGHT+IFjjdZi1NFbys46ABCGILsZBJYrUokRj0/XIrmpkDdeW/e2BS9q+EKRx0K8vYm1XrzTTY46uA==
X-Received: by 2002:a05:6122:3c83:b0:50d:35d9:ad55 with SMTP id 71dfb90a1353d-50fb62db1d4mr3914045e0c.13.1729616291355;
        Tue, 22 Oct 2024 09:58:11 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b97f5sm297130985a.6.2024.10.22.09.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:58:11 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] python3-pyproject-metadata: upgrade 0.8.0 -> 0.8.1
Date: Tue, 22 Oct 2024 12:58:06 -0400
Message-Id: <20241022165807.2601020-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022165807.2601020-1-tgamblin@baylibre.com>
References: <20241022165807.2601020-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206165

Changelog (https://github.com/pypa/pyproject-metadata/releases/tag/0.8.1):

- Validate project name
- Validate entrypoint group names
- Correct typing for emails
- Add 3.13 to testing
- Add ruff-format
- Actions and dependabot
- Generate GitHub attestations for releases
- Add PyPI attestations
- Fix coverage context

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ct-metadata_0.8.0.bb => python3-pyproject-metadata_0.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.8.0.bb => python3-pyproject-metadata_0.8.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
index 8d00826f86c..545a5efeda9 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455"
+SRC_URI[sha256sum] = "e6b494d4fbac8007ed0efd3a08df067bb28a299fb113b885ce77e492ad1f0600"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.39.5


