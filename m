Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600DEC531DA
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.36794.1723045424266563592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mbw/1xJh;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a1dac7f0b7so3906385a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045423; x=1723650223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nXlKETf7vSMqcSzAfTUGd7R3kQj6TrpxGWcc+UpvQc=;
        b=mbw/1xJhxOxk6pa/4Tabi+pwcdrWzlzUezPYZVA+p0rx7iMU5HvTg5hRzOcWaj8qxM
         lnkeUmclForwtZ5mBXFmZqVZ7DLP7oOlmeYAQtQxE8KnP27V1ms05Sxx85wV/yxitDvg
         nKirPTv6rf96Bwcx3x53UtBYmy1dLnUmXcp0qWXasbOF42Fn+sL39ZW3f1phnEepGj8j
         W2kl6fWu2yxSfMxPb+imK3CQPFwQloLCyKcXQaK16AJGVsH/VNBJ2IbgYf3Tm98jbnql
         nLVwSTraPHeWJzHRzXRp5ksY/4PwLdX44wcskH9U6X1pGDeWYFLK/IlYSGHs38uFDavc
         sYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045423; x=1723650223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nXlKETf7vSMqcSzAfTUGd7R3kQj6TrpxGWcc+UpvQc=;
        b=kcdwcn6ffg8QYbDpnKCJfg+914pnbsTsYqWrpYOm7YCEq8Xh6G2+/eX1T8JtN4tKvm
         W165Lwwffzo7y24raQO4KP+3sNb7zAgaxVjrswkLegHXPqMjhyMiYC9i2kdLU3fsug8z
         4E/hM565K8UzyD/KMh1XyEY5h64FvffWJfc9EU7pjdfc5dTAY8QScuUkCERx0Ucv9yL+
         vDnMWHbqG8L95oGlTLufcZ76zvraPXjye0plJfnvHD02q6TJPDHUAMamffFalrAk118/
         UAdT069X5F4EpEyfMVHY/2EEQM+z61UVtFfwfmdXiv7P9SEGTQP7Gz4bzSKNKyk4Pjq6
         z/kA==
X-Gm-Message-State: AOJu0YwmnKvdTpLUl4z6UToilUWH168a09sYlU8NgrBdfWMdQLIQ5qTp
	TdP09ZbhIjr17gZBS/TVmwZ/2VRDyYGwjtvMYxPqFA6UcfT/4aPsuY8TGigEMz6ikqQlPSCeGeO
	0
X-Google-Smtp-Source: AGHT+IHHuSBHxiKsZskwCBt5TPvsQhz1PTyWqCQMhxZSpxe6kcPSKOOuafOk15KMTpZHHlRQZ3YA7w==
X-Received: by 2002:a05:620a:4448:b0:79f:6bc:d98 with SMTP id af79cd13be357-7a34ef53e9bmr2425282885a.36.1723045423078;
        Wed, 07 Aug 2024 08:43:43 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 8/9] python3-sphinxcontrib-serializinghtml: upgrade 1.1.10 -> 2.0.0
Date: Wed,  7 Aug 2024 11:43:32 -0400
Message-Id: <20240807154333.533180-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203087

License-Update: Rename LICENSE to LICENCE.rst

Changelog (https://github.com/sphinx-doc/sphinxcontrib-serializinghtml/blob/master/CHANGES.rst):

Release 2.0.0 (2024-07-28)

- Adopt Ruff
- Tighten MyPy settings
- Update GitHub actions versions

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1.10.bb => python3-sphinxcontrib-serializinghtml_2.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-serializinghtml_1.1.10.bb => python3-sphinxcontrib-serializinghtml_2.0.0.bb} (64%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
similarity index 64%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
index 49be5200f0..63c55d36ae 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = 'sphinxcontrib-serializinghtml is a sphinx extension which outputs "serialized" HTML files (json and pickle).'
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 
-SRC_URI[sha256sum] = "93f3f5dc458b91b192fe10c397e324f262cf163d79f3282c158e8436a2c4511f"
+SRC_URI[sha256sum] = "e9d912827f872c029017a53f0ef2180b327c3f7fd23c87229f7a8e8b70031d4d"
 
 PYPI_PACKAGE = "sphinxcontrib_serializinghtml"
 
-- 
2.39.2


