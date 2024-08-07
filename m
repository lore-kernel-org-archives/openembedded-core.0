Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE63C52D7C
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.36792.1723045421043011770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=RPtKovzj;
 spf=pass (domain: baylibre.com, ip: 209.85.219.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e0bfa541c05so1684992276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045420; x=1723650220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4fzpP/4OEjTlOZPjnXFLsl7gK0roG1VlU0dX9JlM8c=;
        b=RPtKovzjvfl2sTm3Nn3a/epuAL5nw+YJXrBj2y0sq70W0Ny/95XDVoBXdmHK6wr5b+
         6BwiNdNJwkO3h51U+QvjUX0ZEK2JaJqdAvd/s6xlA3E1g7+6q4ILqlfZ1fzO8dzFfKly
         a9TwgQokyYMuZ0vTh6t3sl+mkzNBGYza3jf3KC5iZHdIix6criYunvXsdSbYClm30su0
         orgByrGC5iijIfQg9YzQp3Oiq7PNXydT0nikenKCpkoNewvMNUw4C1E3J/FNyUhlrcCB
         mV9V8h6wrXpsQKvBlXgYzitOckHzRl97fzfuy9mTrtAXA/qwMo2xUoPVkcacgrPecqbc
         8oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045420; x=1723650220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4fzpP/4OEjTlOZPjnXFLsl7gK0roG1VlU0dX9JlM8c=;
        b=U0dGhxzGQ6+OiRaxEWtwRLnU+4W1MOOFa9ur9AH2OLDGG0SSp2cdFiNAoFOgQgv4n6
         H6a3zH6zb5i7hUDmHDUw4QmdYceWHaFemmpuAQXvTZR5giTDNiMCXSxaFkXgdRZPOmoM
         59eaL5y40A4MNVShD6WXqiBg4ZwWeI1LqosuZBIOian91uHOsPlcS/T+7pYMo/O8N00a
         R7SMq19fnTpKKL39mzL23JicXPVqlJ2ozxVkeJaEysX1/pK1PH2uxGKmzjRRukZC7ZQR
         Ystnf6yhzoDLh7YIovNO2/DSXiq8n/+Sl4bk+UOpD0lQnyYQoQC1g1GGvZD1w1gyCEpC
         4jqg==
X-Gm-Message-State: AOJu0YwcODZg3ozuyVxDjy1mAw69LU/zFE1IIvDN7R115wx8fc49sBkl
	2wTZSoDEqjzlRxK/5n+UnUHbEvM+jPpv1y8Uj/4vhSztaUaFQzQnHoVcekKU1tQBqKeXwl4XW1j
	+
X-Google-Smtp-Source: AGHT+IHwv8suzC+9OJyNmdRJUizs6dhdmq9cALLw5yHOTN5wqKMa99k43XqabqWJdCTvhullpXamAg==
X-Received: by 2002:a5b:68d:0:b0:e05:9f9c:5516 with SMTP id 3f1490d57ef6-e0bde35a43bmr19515677276.19.1723045420078;
        Wed, 07 Aug 2024 08:43:40 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:39 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 4/9] python3-sphinxcontrib-applehelp: upgrade 1.0.8 -> 2.0.0
Date: Wed,  7 Aug 2024 11:43:28 -0400
Message-Id: <20240807154333.533180-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203083

License-Update: Renamed LICENSE to LICENCE.rst

Changelog (https://github.com/sphinx-doc/sphinxcontrib-applehelp/blob/master/CHANGES.rst):

Release 2.0.0 (2024-07-28)

- Adopt Ruff
- Tighten MyPy settings
- Update GitHub actions versions

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...help_1.0.8.bb => python3-sphinxcontrib-applehelp_2.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.8.bb => python3-sphinxcontrib-applehelp_2.0.0.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
index 67dd299b72..686a4a17ae 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "sphinxcontrib-applehelp is a sphinx extension which outputs Apple help books"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "c40a4f96f3776c4393d933412053962fac2b84f4c99a7982ba42e09576a70619"
+SRC_URI[sha256sum] = "2f29ef331735ce958efa4734873f084941970894c6090408b079c61b2e1c06d1"
 
 PYPI_PACKAGE = "sphinxcontrib_applehelp"
 
-- 
2.39.2


