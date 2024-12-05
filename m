Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A77E77172
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:01:34 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.13155.1733410887851178131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OGAxYICa;
 spf=pass (domain: baylibre.com, ip: 209.85.167.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ea696c4dcaso624992b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733410887; x=1734015687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htr8e1wF6VV8cMCYt0S4VNiCxn0y6QC3BtzpfuiAPwU=;
        b=OGAxYICaed89KG1DSqd22LKgB0REZ631KLGPpaFJPVZxCVyvM20tO/DwpxfRsx2/Tj
         Jjl9zdRPeo9w3LuDy84CuB6lahrsyO5ja94F+NgvzJjbx8H0KnfcetVfaomnfi1BECDb
         rbAZQtoZuIVb1HqbSRKGKxJAQvbZK5Ener/Yc4ZouvuXOBokBcPOAJ0SUwnZq5r9Wq3W
         OZD7ANfBOxRhtgz9YJ+VxFV/vS3eb6v2ghqr/82Pyh1sEs/VuzPdvRlRigQC7B8wUXCh
         5gpQFNhKXyWuxEq2KriAygKoziEa0IYuHPnT+LJDKLewb/taBhAL5L5nwU1xRQe+FkpB
         TSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410887; x=1734015687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htr8e1wF6VV8cMCYt0S4VNiCxn0y6QC3BtzpfuiAPwU=;
        b=ArTflbZdanUCQxQKkomsukRp06yUGC0v+9E6M/p9IhKodk1YZlNnXL2ohwmgM9zA8P
         qPU/VU0cj3h0QGTUq9k0jh81Y8d6zTn9TC5NXlyWIsnPl4ufBwZpYUwOIdRm0jC/Re0n
         IOrcX73tH4RuuJxdWkOBxvEtimZ2GrVaQhlLYEaKHKgi6O8wrulH5P+jPs/ulXYBL8+n
         afrW/Y5EM1dracIym7UV9T4Ymo3tyrRw0Kb5LF/uKD63CV4VX+pb9/jpv9mZchijWybU
         VKUUgcgMqZQK1nhCWHSP3zKc/GGMfSwIrdwo1BiGwgoL8wghM4ByD0X81vrGUZEwYARo
         2Byg==
X-Gm-Message-State: AOJu0YxIM9jauwP/IBqTP4XrVjIJKIjlcz0rCSjHU5EDOmLsNDUaTj4h
	zxHTxNBRQG5vh2Z1HTGd+Vm+n1rWSYGqv5ndWehlcPjFwZF5dI96vIrJkrjztScNuCZr1Nq+LU+
	v
X-Gm-Gg: ASbGncuz6OGqzGLWCtNJ/BmXeiz4jl2dUNvY9fHvo2fzCdC00x5P6TbQyTDSZ6v2NC+
	S6jiSPmlF6wzq2u+yOOzSFcO+uTW4iynovmb0XEIxOZu4/yv3U74zngfWHDN6lV1mMOxf5eBt56
	WgjFLlrnzh3J7T9mwJFNfLkVLjjP44q36tfTVl8hy4sZezXoRBOS4zpzsCSJhQzQ1Q2hSDcuT++
	Yg83CGhYkqFr/lwS91WFhjEh3zAFTA1o/Na3k+3lHEJBuGVV1Lt5Tsw/d5ypvA10Pr5H6tfg5aR
	o7B8tCNLPQ==
X-Google-Smtp-Source: AGHT+IHDk1ZK6nxXvQKmyEZh+2+l5Eenap+/OQkkBZYzQPBThA720RIr2a+xuBpH4Qjq77Hi/rNQVQ==
X-Received: by 2002:a05:6808:d4b:b0:3e6:5f6:c2b5 with SMTP id 5614622812f47-3eae505a109mr11230759b6e.26.1733410886135;
        Thu, 05 Dec 2024 07:01:26 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9ff947sm7193276d6.96.2024.12.05.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:01:25 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] maintainers.inc: add self for meson, python3 recipes
Date: Thu,  5 Dec 2024 10:01:23 -0500
Message-Id: <20241205150123.4160258-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208381

The following recipes recently had their maintainership given up, so
list myself as maintainer for them:

- meson
- python3-markdown
- python3-smartypants
- python3-typogrify

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 737c1c32663..4b914bbb788 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -510,7 +510,7 @@ RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mesa = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER:pn-meson = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-meson = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-environment-extsdk-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-extsdk-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -655,7 +655,7 @@ RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-markdown = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-markdown = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-maturin = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-meson-python = "Tim Orling <tim.orling@konsulko.com>"
@@ -699,7 +699,7 @@ RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
-RECIPE_MAINTAINER:pn-python3-smartypants = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
@@ -717,7 +717,7 @@ RECIPE_MAINTAINER:pn-python3-subunit = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-typogrify = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-typogrify = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-uritools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.39.5


