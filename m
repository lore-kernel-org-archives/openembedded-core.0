Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD33AC27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:43:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1914.1718131417099087419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GFNem2D0;
 spf=pass (domain: konsulko.com, ip: 209.85.210.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-701b0b0be38so5622624b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718131416; x=1718736216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vgc/uWaGeVKaqzv1X6Db9WwP07E55PpEnv5YWTSjrk=;
        b=GFNem2D0dI6f0f/KhP32ImcT7C8QPHbGriWg3CaPL+JQFLUI/Nv1tq38RSSVkxCMyo
         PKjP4vTnAhS3l2NVsEtYA1spGHs87bMfdSVU0DfgfKx81EBUEpSvfilzVTS/r2DBaaJ+
         2v5Z6+rsBKliwK2d0fX6rce4edkpyQSqE96P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718131416; x=1718736216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vgc/uWaGeVKaqzv1X6Db9WwP07E55PpEnv5YWTSjrk=;
        b=h88Zg0TVDNPCCu/u8Sj8+lRoQkIHed+9XzYDwPRAGGdle8WzJ0N9bdmH4xuu6yV/bP
         +7n/13F/Pz8r9xktbZlKPCToCkycZ62O8+g5xCeQnkdOjQevKgDe0xUVjVlW2KNYYUkN
         ePPbnrBfBJCKOBRrezYaaOVthpj5voo1WAbk6msrzoZPqSxpejS84p79IaWmZBz2zN0z
         8aa4dZAMGkMoid+kQ6lthPmYBnMh6m4bOwUx90VgA83uvUeIhGMzSAVemXZRtmPQrZUq
         uo7cl2dap8f9OubxA1VRbMe08rIII8ZPwla6v2svlxDDeAzIlXuw+TTblRcJfKNB7r58
         iW2A==
X-Gm-Message-State: AOJu0YxY/N9TE4GMVjAbrWt34+bQAnvhLeoLgSePSo95UJhYG+1gJVYd
	VFkf7g5gfCmWWvedpwYq5GWT6cJD2sX/k8tVUvHCSMPkpUMtQhBZebh+U0cnJCOnTuBcgVPAxxX
	Gvgw=
X-Google-Smtp-Source: AGHT+IG7AAfWNpAKsPk6mS7rpoiWTqlMO+6bTTn3yHLDyWYzRrc7h+IfqLYi0chzLlp0ClFY2RXl6w==
X-Received: by 2002:a05:6a00:14c8:b0:704:3231:99d5 with SMTP id d2e1a72fcca58-70432319ab9mr8924888b3a.19.1718131416107;
        Tue, 11 Jun 2024 11:43:36 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705b62aaf36sm770973b3a.200.2024.06.11.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:43:35 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-packaging: upgrade 24.0 -> 24.1
Date: Tue, 11 Jun 2024 11:43:09 -0700
Message-ID: <20240611184308.3049727-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 18:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200547

From: Tim Orling <tim.orling@konsulko.com>

What's Changed
 - pyupgrade/black/isort/flake8 → ruff by @DimitriPapadopoulos in #769
 - Add support for Python 3.13 and drop EOL 3.7 by @hugovk in #783
 - Bump the github-actions group with 4 updates by @dependabot in #782
 - Fix typo in _parser docstring by @pradyunsg in #784
 - Modernise type annotations using FA rules from ruff by @pradyunsg
   in #785
 - Document markers.default_environment() by @edgarrmondragon in #753
 - Bump the github-actions group with 3 updates by @dependabot in #789
 - Work around platform.python_version() returning non PEP 440 compliant
   version for non-tagged CPython builds by @sbidoul in #802

https://github.com/pypa/packaging/compare/24.0...24.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested by building and running core-image-ptest-python3-rpds-py

 .../{python3-packaging_24.0.bb => python3-packaging_24.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_24.0.bb => python3-packaging_24.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_24.0.bb b/meta/recipes-devtools/python/python3-packaging_24.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_24.0.bb
rename to meta/recipes-devtools/python/python3-packaging_24.1.bb
index 0942eeb15e7..596250b066d 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9"
+SRC_URI[sha256sum] = "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
 
 inherit pypi python_flit_core
 
-- 
2.45.2


