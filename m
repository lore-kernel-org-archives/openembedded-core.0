Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CCFC52D7E
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.36821.1723045422748494163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=N6/kYyhi;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a1da036d35so3748285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045421; x=1723650221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGq/8bK+rloPibPmbF5mWJpbkv9simV+htu9qTbLBpY=;
        b=N6/kYyhiE7jReOfEeHchK0SwUNbz7UAmj2IA30xy/J4E65ZbzWwfAjvypcOgIAJ9+v
         wfZOB25jAedxIfcQPlt6AkmPs7MjBKy1frWL1A5x59YInzw366quKbDbpQE982yO/2Ge
         9A0EnpymFfoyfjymuGI2+PZ+HXpRPrTUp7ACGe6fr7+BdH7ZiFiekNGu4bAsLvUOY7pw
         ej2fBWNIkgh16GUlj4emmDwk+VbvGkmRDrj0Aagh1MwY15ctwado5V4feW5Y43WDKYL+
         tEgwkp+i/n4oXhKCv3iVdmYUiR1mvh/kr2v9zPocquXQGoeQSaZLtEycdQYulQpp80Hm
         dSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045421; x=1723650221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGq/8bK+rloPibPmbF5mWJpbkv9simV+htu9qTbLBpY=;
        b=DwNML7gqAzcJpB04ZciIUXu6DP5nRygWb2LGALNfYyQO8e5tN00w1UQBMRHBaLkPwZ
         VWeaqnk0Er0n/n3ozs4IV8dflF2vpss5V2G5Wb3P+iPgYwLAKZglEKYGYb55RKSsbTMK
         kSKVlphtbeuGBXfkPC/G+2ZD7ezmfOkdRx+CEALE0C7sfPV7reYNQf0sqdrihjdXFafC
         nIrHpf5e60SplCORyLIEY4Ng8titJaldsDwQUCB9V7Z26Rqjf3tcweXMdhCF0j7NvStX
         mQ8+PzwCUp2vgOXBac77hB0tK7Umt29yi3uMhRErxJrvLADfT/4iBtxpUpAqtatm4oku
         OrWw==
X-Gm-Message-State: AOJu0Yyf+GJ0V0AXMYJ5dRVFs7HZ4STlO7ZoILzpFXyBopDP8D9Zewpe
	Jc30nas0i9/y/rm7g9uyJbse0EbpyUfuffjioCV3nArvaNWkTHePSHaecP6f3SuMAF+nUdE99eu
	4
X-Google-Smtp-Source: AGHT+IENjnXK7XP83XxhbFwJ5FSyLfMfusm05r4RgKI2cqr76+yatzhpMYY0Iri7PO/HGfZUBB4s2Q==
X-Received: by 2002:a05:620a:4485:b0:79d:6d4a:a964 with SMTP id af79cd13be357-7a34eeb8396mr2197567285a.2.1723045421626;
        Wed, 07 Aug 2024 08:43:41 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:41 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 6/9] python3-sphinxcontrib-htmlhelp: upgrade 2.0.6 -> 2.1.0
Date: Wed,  7 Aug 2024 11:43:30 -0400
Message-Id: <20240807154333.533180-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203085

License-Update: Rename LICENSE to LICENCE.rst

Changelog (https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/blob/master/CHANGES.rst):

Release 2.1.0 (2024-07-28)

- Adopt Ruff
- Tighten MyPy settings
- Update GitHub actions versions
- Escape HTML entities

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...lhelp_2.0.6.bb => python3-sphinxcontrib-htmlhelp_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.6.bb => python3-sphinxcontrib-htmlhelp_2.1.0.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.6.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.6.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
index 95b5981c06..1a15ccd0c4 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "sphinxcontrib-htmlhelp is a sphinx extension which renders HTML help files"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "c6597da06185f0e3b4dc952777a04200611ef563882e0c244d27a15ee22afa73"
+SRC_URI[sha256sum] = "c9e2916ace8aad64cc13a0d233ee22317f2b9025b9cf3295249fa985cc7082e9"
 
 PYPI_PACKAGE = "sphinxcontrib_htmlhelp"
 
-- 
2.39.2


