Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F43BC25B7C
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.1256.1716311095204802436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=nOEBjGe6;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79476195696so23908685a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311094; x=1716915894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7n3Q5C4qAMVunakB/2PZ3my4EMt1fmr1KbcDLTP1HU=;
        b=nOEBjGe6l0wSIMJnb5EVR35juVk9nDem8MVkfYu7+9KH9tFVf/VYO283KTyXDMLus3
         44jyCLV3OGFZIiWRSEwHmzKvAvbY3/Ll/5Eo3Q6SSVd1MXbHdmqxgsIvyeWiOPh8WGte
         7eMIZZpyFIDnZz7ZQ2yWH4pCdhGw1UOpLE5dCYIfprZ1v1aHbuxuEftfNhtU9SHZF2FK
         slq8ecNf4KXJ+5fGUTs+HBhpEuXFP3vyhXk9ZXltn1WiTsYTSROX9x8fZnW9M/xDCQwW
         kFXikLC/B0l9Lsx/3sVTyyy55oL0lHXUWoIORvm6Vm3BftJp2GStERELyyViblKYkbU/
         9IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311094; x=1716915894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7n3Q5C4qAMVunakB/2PZ3my4EMt1fmr1KbcDLTP1HU=;
        b=KVRkT4D8aEKkAmdlSsBDU+WcHIOEyWCuSEXrR6zGCLqnoZqovgB0BOSfPk13xoq5Dj
         QVUllR3AcQ8pnQ3iCJ45IrVTTIVpIhd310mbkbpNNg9BjxsfV5Dbm8Ia8XfGBovE6SYi
         Kn9iKCjT5O+878DGXR/Kvt18mibsEhmqOVYHq7YP14V1xc7bbkNZrX0qlKoAbCmr4Eq6
         BRrcpjMjAkFPxg6xRmhbj+BYrA2hfuR03dwQ8or12He2sZbkLVelISH9xUifM7w5fmAS
         I6rRo1YtPGwbymrAJZg27slTlV6ACh3zArSg9fynpOFLzcLhenKZZ/kKfQM3bOmPwLCL
         KWmg==
X-Gm-Message-State: AOJu0YzArysd+HXfhAIeDZpGVXFTQ5AKBBv6y2N4ToQyZz7QOcqbJIt3
	oOcwVLJZbzoAf4qU+uiTeOVveB+MVXLtMBQA1f74Yl1yjNtKvphiMalpBV/mQwPScUXX8q1O5Qs
	t
X-Google-Smtp-Source: AGHT+IEClQ2N2WTBchrjcM7fiTSvklENH6GnfojVM8AR3dpOStNB/1ybFeE63UteGaAYjKCvTSAoXg==
X-Received: by 2002:a05:620a:1653:b0:792:c6be:dcb with SMTP id af79cd13be357-792c75aff79mr3421955085a.44.1716311094073;
        Tue, 21 May 2024 10:04:54 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 10/10] maintainers.inc: transfer some python recipes to tgamblin
Date: Tue, 21 May 2024 13:04:45 -0400
Message-ID: <20240521170445.1892398-10-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199666

Change maintainer for the following recipes to tgamblin:

python3-hypothesis
python3-pygments
python3-pytest
python3-referencing
python3-pyproject-metadata
python3-setuptools-scm
python3-sphinx

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index aab53c22eb8..2124f3e7ec6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -627,7 +627,7 @@ RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@
 RECIPE_MAINTAINER:pn-python3-editables = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
@@ -636,7 +636,7 @@ RECIPE_MAINTAINER:pn-python3-gitdb = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-vcs = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-hypothesis = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <tim.orling@konsulko.com>"
@@ -676,19 +676,19 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pygments = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pygments = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pytest = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-runner = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rdflib = "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-python3-referencing = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-referencing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-requests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -699,14 +699,14 @@ RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
-RECIPE_MAINTAINER:pn-python3-sphinx = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-htmlhelp = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.45.1


