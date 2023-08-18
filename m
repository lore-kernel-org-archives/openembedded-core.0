Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D178EEE4993
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 19:13:30 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.2911.1692386009642136653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 12:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=yk1q5Axn;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76d71798f9aso77402185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692386008; x=1692990808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fQWRDo/KFS7R/Rh3svg72XAhG6VLRv3QKMSuhokBuU=;
        b=yk1q5Axn46aYPDqanKPF7uX3XvaauPgy0DPp+v4qUBnf4uJoYvXv/4HdilQbEijgM8
         V8rlM0rbYf7nUBTbBi3jXYqfs19aBd/xD32KYll12oAC+qRecIQ2Yn57pBv2DLY957Md
         J/XcYOEmnyCgRvXPJTrIeuni8J0e+67kYarRgC6WRsF4SkRKiPyamuvJgZTE/YIZYeiB
         u5O9TGxo4FWlqqM2BN2mf/4+Waog4b+QAT4Whzc0vdcI/gT/L/YX+RhFfAEFtfXDu71u
         KPF1Ww/pNfvMa53sQw+2oZMlJ0tVZLOcfoZ0J+Swwuk4ed3fofl8MuV8LkEtwDaNtUu2
         I4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692386008; x=1692990808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fQWRDo/KFS7R/Rh3svg72XAhG6VLRv3QKMSuhokBuU=;
        b=TYbtbyhoHzU5S5GWBPLjeZolTG6zYnQx7AHNuBgXb361O93U+99O1ghgW4gg4dEI/F
         615jEWyun4mNAR//qDtGV05Wd86Ile/arhcrO3bRaViU1BmVvVbwWKuDlO8vUyu3uAaf
         HCveadYm0pfuOK/JIKKH9i+dcZekl7ZE/Qf09cjWMZ+fN25YGT+iFmy/8ZYp56dC2e+Q
         Esa3QK33wlbB8FsMXkgP5KhrZaNHjPjdYBv1LTgzH1X1A27O9LDNRkAoO25EspAialrP
         F6uie5NDvbRpn/KQob1dDHiOPA/Wp9YmHV9sKU+FVBLvarwHkHcg+aAdjqkUUlmCeeuA
         OE8w==
X-Gm-Message-State: AOJu0YwRbY31KF2kETZqB/piXA/yWlENt6eXO2c0JiZ+VX3A857wd8Jd
	h176bbuiA1BmPthsRbGGEt2S1tbFEQK+90J/sZM=
X-Google-Smtp-Source: AGHT+IFizOo0HRUwaCWVg/kYpEDkL9/EYu8cD4JbgeDolfV9F5lv6CPNFhNtQKj427+FSaZ3UrAetw==
X-Received: by 2002:a05:620a:a52:b0:76c:e6c8:937e with SMTP id j18-20020a05620a0a5200b0076ce6c8937emr104698qka.61.1692386008620;
        Fri, 18 Aug 2023 12:13:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cx18-20020a05620a51d200b0076cb0ed2d7asm720732qkb.24.2023.08.18.12.13.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:13:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/5] maintainers.inc: Add self for unmaintained Python recipes
Date: Fri, 18 Aug 2023 15:13:24 -0400
Message-ID: <20230818191324.1959527-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818191324.1959527-1-tgamblin@baylibre.com>
References: <20230818191324.1959527-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 19:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186397

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 202e5739a0..66755ce769 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -596,7 +596,7 @@ RECIPE_MAINTAINER:pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pulseaudio = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-python3 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3 = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-alabaster = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-asn1crypto = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim Orling <tim.orling@konsulko.com>"
@@ -610,10 +610,10 @@ RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-cython = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-cython = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
-RECIPE_MAINTAINER:pn-python3-dbusmock = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-python3-docutils = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-dbusmock = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-docutils = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtc = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -621,10 +621,10 @@ RECIPE_MAINTAINER:pn-python3-editables = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-extras = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-extras = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-git = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-python3-gitdb = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-git = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-gitdb = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-vcs = "Ross Burton <ross.burton@arm.com>"
@@ -633,7 +633,7 @@ RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-iniparse = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-iniparse = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-installer = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -642,12 +642,12 @@ RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-mako = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-mako = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-numpy = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
@@ -666,7 +666,7 @@ RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pyparsing = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pyparsing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.41.0


