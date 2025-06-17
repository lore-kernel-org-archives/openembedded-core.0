Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D0FC7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:53:52 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.22825.1750175630908458496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 08:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Iy3NLcc1;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6face1d58dcso91270646d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750175629; x=1750780429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUqah1u4O7w90Uie9P1Dr5Q+dXAxSTfzZGzTlamU3yo=;
        b=Iy3NLcc1reoPSwHqnl6hZr2dGalIzY6dVhYZRDSGmxJqs2VDF8aiWqeAhwNCCM9MYw
         2kpNxJb6qXsTHbAIqV/Cqpaq0dJOE+LspSTfaUWj/DY/azBrBP8LO6geBBYuEwuhMsnj
         NFhQrN7hEM3l8HaAUt4uFL21ouej1oUG2FhGyi9BKWohAMFrZFEgyY2DkU8CMkpiV4FV
         /Of/ILF4FKl85zMUI4iGCnxF/F48DaqZ/xkgqmAnGNBWXl1ZnaNDZcVRZfFBtNo+sb94
         F/mFZO4fVKqKkPnyx1EEHNAC/cn3lo5Nc6DdsdrhTn99P/RF3kuJOvuO17oGxynl/Rpk
         /g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175629; x=1750780429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUqah1u4O7w90Uie9P1Dr5Q+dXAxSTfzZGzTlamU3yo=;
        b=VkMcCqh+xjSyae8X3TnL/AmpwhEU1FTpGJXClZiRTWbIiYVb6S8bUxkBotHAYeyXvK
         EleemofKRBGYbv8pV/da5Ol/PlctryZ2S1Of1rcpZgSmhV4VNPRcey/ITWlnjleu48H0
         8YU3thO9bAGo/uVcchzruoHx8Tvwe2suf2rvf6sodf77BUpnAwEovKjs2KCSCq7Hq0Yv
         zDfKNO/tQOIvla9mAc44TDIswlsoAzpPhD2UZgRtiFLKtQVOu1RGrY8oBvMgpC1ZafVk
         oHAuZlx0r2uTqVoPNjkijQ8JOBHXseOJclR7KrM171PxyHQmprgrZ8X68/YIGVsZtc1i
         iDLg==
X-Gm-Message-State: AOJu0YxlhDYXD7VSohCwrFp3hsGNltYRwAeUp8LY8vn5rqjR33iJvw6s
	3Qj348wkCwYDp36X7O81zN/VBWENeT7BHH43URUI+HJC4QVyLds4OiBpMEbojjsLuTssG2oWOFM
	/uLqQmUw=
X-Gm-Gg: ASbGncuS0wz5yYhEZL2PnGKrvfPQcv8ykiwCKcNP27xMkLlzWWJYg0H6lO9qTATYa92
	Ztck+7hLavNkg6p6e9bO6DyiAuXtfdpa9v6NUmjTEEOMZ/fTkFfGeGrppziOHgNasGJREDU14tf
	sstrzunMC5a/SKevtqxUJF6YszF3PGg9iV2ZVJvHs/+G/afs5oLdoHFLLlsuHV19tuacOWegz1X
	XeQ3hK0mCW1uGiM43YRLWMchjDeXU8jSXeN8W2HDCq2JAr68Qbapgy9WPltRnWNr+SlCcccPd+G
	Hk8qzlTZf8KMpwISZkT487cC4m3//qfOjzl7/Kjv/0JCz/kMZo6f2J8EANA2ed8otkk63m0tzvO
	4E4ihCdo1Gws76REEilgxCQ==
X-Google-Smtp-Source: AGHT+IEgZ0ObqRbQ/MoO99Q5ujQMkCFBUu531a7ywlS1n0Qu6WM5a7TtUQHcK/Tu8Ei7/4I6jbqoOw==
X-Received: by 2002:ad4:5c42:0:b0:6fa:cdc9:8af7 with SMTP id 6a1803df08f44-6fb47773c7emr281050526d6.7.1750175629360;
        Tue, 17 Jun 2025 08:53:49 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb4ed60787sm34171626d6.48.2025.06.17.08.53.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:53:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/5] maintainers.inc: sort Python recipes alphabetically
Date: Tue, 17 Jun 2025 11:53:39 -0400
Message-ID: <20250617155339.1305652-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155339.1305652-1-tgamblin@baylibre.com>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218887

There are a small number of these that are out of place, so re-sort the
entire list to clean it up.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5d2ac05b27..870c81e85f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -623,11 +623,11 @@ RECIPE_MAINTAINER:pn-python3-beartype = "Marta Rybczynska <marta.rybczynska@ygre
 RECIPE_MAINTAINER:pn-python3-booleanpy = "zhengrq.fnst <zhengrq.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-build = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-calver = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-certifi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-click = "Wang Mingyu <wangmy@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Trevor Gamblin <tgamblin@baylibre.com>"
@@ -638,29 +638,25 @@ RECIPE_MAINTAINER:pn-python3-dtc = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-editables = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-vcs = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-installer = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema-specifications = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-license-expression = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-license-expression = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Trevor Gamblin <tgamblin@baylibre.com>"
@@ -686,12 +682,16 @@ RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests = "Tim Orling <tim.orling@konsulko.com>"
@@ -717,14 +717,14 @@ RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-htmlhelp = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-subunit = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@baylibre.com>"
-- 
2.49.0


