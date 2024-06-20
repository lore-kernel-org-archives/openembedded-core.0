Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BCCC41513
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:08:11 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.48594.1718892490452659246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2BWe7k2z;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7954f8b818fso61216185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718892489; x=1719497289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie7pbNZloWaHWMv5f7oYU8ms8URlIJqu0QVn3NcWdIM=;
        b=2BWe7k2zGbgOV2F1eIvZAwdMg3cnXkJFa0E7tmqxytWB2qYdJ2MyEnAaaewKhvyZ/s
         GcSCRh1e1rphIv+wNh+D1EUfLY0iH1fjbh6lP2/KwfdHsoWW9P9hbfHM2X6+/NdL7OQ+
         x1fNtJ0yj9nuoyz7udWrVMARTq5b4D+AjQGhJ1jma2/gjjksZb5gjdsXaMmYowtrn+NA
         kfDOeQlve1w2I1F9a0eJ2TlhtD2VNU29pcbVCxmdd9ooK+c/7cMl5WAl6vDCYvMbpyVx
         Hl/vFdgxsFXSPrnxoMaOBJtJuaqK0DPSkpyDqPZH1E6qWLCVjczpniMrL5gAw08qj+Vt
         d8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892489; x=1719497289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ie7pbNZloWaHWMv5f7oYU8ms8URlIJqu0QVn3NcWdIM=;
        b=LvZlWkpBeHBan3Lfv9L3/CPKWrVZXmVmuMfHzSd/6Q6gMVTsE1EfQVvcmzp0va40nb
         ZoeQPEPaF5s51UXttOhN1AqogDpFNXsnkY4x7WIEjepkdYSw3b5hikfUQoHyJiRLufDH
         ZKEfys3nyckIDLykJfcsDbr2Nps7dN6qaWAlzuZjtCCQeukBdAB+GsiBmEY1xJndDrRC
         2uCa05ISdENcmNoLa7796C5BZqJUB8FxacU3ETPFPhJa5nlIA5M/l/gR4/Kad4JLUyS/
         /wnR0E5oXPr1Yco3THea3LyJS2SPAHUNhafhfmBt632kgJCNtJzl0JC2CKLssR8Xi/LV
         99Qw==
X-Gm-Message-State: AOJu0YwuAVgEtkzf89sZ+ePPMi/sgYOTUl3El1dEBkdBscB7OM4Bx/TU
	yZnae2mYJDti73Xgokfll63sIoCOvEE6SAA/i4TAnsjrti4+isgMAJI8Oq/pJ9GWc9yJZaTLl/K
	j
X-Google-Smtp-Source: AGHT+IGqeSrt3MVYBtQJ030/hXH0ojWlpnTqPJFrmkW9yR/U9qaiw+5A9ekioUm/xxj1BcuE9CXTLg==
X-Received: by 2002:a05:620a:2990:b0:798:1020:dd5b with SMTP id af79cd13be357-79bb3e6f5e1mr623671485a.46.1718892489313;
        Thu, 20 Jun 2024 07:08:09 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6efc7sm691579185a.131.2024.06.20.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:08:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 5/6] maintainers.inc: add self for unassigned python recipes
Date: Thu, 20 Jun 2024 10:07:52 -0400
Message-ID: <20240620140753.392220-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620140753.392220-1-tgamblin@baylibre.com>
References: <20240620140753.392220-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200960

Add myself as maintainer for the following:

- python3-setuptools
- python3-smmap
- python3-subunit
- python3-testtools

With that, every Python recipe in oe-core has a maintainer assigned.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 42599267c1..422a3751d6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -696,12 +696,12 @@ RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-setuptools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-smmap = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
@@ -714,8 +714,8 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery = "Tim Orling <tim.orling@kons
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-subunit = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-python3-testtools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-subunit = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-testtools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@baylibre.com>"
-- 
2.45.2


