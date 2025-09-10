Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E320CCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:51:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14405.1757501464095627790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LYKPSRVL;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45df656889cso7319295e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501462; x=1758106262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjZEZAdBwuDdHTcypxclAN/N+k6hVy/qJbgJwpvnFgQ=;
        b=LYKPSRVL1zU8ubJ/Joq/OQ7VmMGUgv2Xrq+zirD/9+H7vycU1Gy18UY8q98jm1Lteh
         EBTvyrIwf5NxnhMCKq6zIhpmXOu094Q3fpqvbmpngpYg93HmJcu3PyQ5eUSsRrwcJfMD
         iHhuIIap8DUc4TmgakGAWPyemyMQAFl26A4kp3X77RKFCH0wJQfOkINNV0DorYm2rkbq
         ZIZAp9+F9b2P3vF/83mSoEP2xEss6KxXZiEqeg1bUKLRxiU6Llv9V1qpqt7T08OQEY80
         7lRK9PIbwJkZes0S5u51FlwBfuMLVrP2MRnRWYIN4jEga+xGIq5C1pHDjVC6PPEC0v4b
         3BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501462; x=1758106262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjZEZAdBwuDdHTcypxclAN/N+k6hVy/qJbgJwpvnFgQ=;
        b=gPEanZqMqv5HHfOmWt6P42K9arW84tQi5TT/SsSEkAJ/7ZOuGry1ci17Yl0E0Z8WG5
         N1y5PmAc2az+/dcJkBrveRQNPTCcb3bdWP474kHtd36PLdMB4zJP4L8q7qMTl3ekvfT/
         BRMHFG5CuTFgBJZgld1P+dbUOW7tIWyrYybdi4kvzX6Z3qiISnKVX7k1lWSnX8kguxpW
         Gn+nw+QBvIH/eO8JbNknCb3Gbahap3EPJI8nD3d8DqGWu/2jhB/RgPzwJWpCIs9y0yvY
         Op8R5WlnxJ8hm2qinhAvQEtwU+iPX/b6EhtO/oSupuxRDWgpfUenxWezZRqC0N4UanfI
         gJUg==
X-Gm-Message-State: AOJu0YzaSz2ga9weB4c+8q3Ujl6sUtjXF5KUvQOYtrOzlI8MWV9eBNO2
	yG1tpItuyLnverf5FTCl5klzptsQGRvhASx8+DUnpS+apwOvZ2Ve0PezJbeZAg==
X-Gm-Gg: ASbGncsR/khJH1vtAYhJGfRVPin5lEHMu9h3FSfcENRgiZh5XXW9HommGchG6fjIxe9
	4ghb25gjbJh/C8ml4FgRrEIkGTtLziRLOo5D2DADSWzZn8CwM0m2gtvnREFA0kJryFHGyYgSlzk
	13MTSjgjOByMEbhuvT8+9ogKWUlsBHedjlJNC7t2RDniMfWPXRo7sQQj4zV1P8gC93ZYTovgYfJ
	PIk1aI7faA3Nf1OpXpJplNkVQATUNDC/KJICKDytNijQsy+Sgy/HBljnAaLYUjYwM4bf279ITC8
	tl0lZMJXHzxax9BVLYdKhnW/UOaKu1+s9741JWqo9M2PbHGdT7mDL4b7DuHm1IO+XyU104WyGZq
	sninlrCHNZ0xYZQwCCPU1QzEU55wv61LYsPcIK0YEHF8gXbfCw0lT0F4HxSK5V7N9HMtXNouXcJ
	vvke1NaLuupFxlZbR/k2Rdx+UParBri79lH3HBAENw4BiF2NlpZzdDthiFPubfbSo06tJY
X-Google-Smtp-Source: AGHT+IEvcMPTI4cBSjUuPTc4CPFFmvSDkpKZBxunCQucHEZ82RHxIkmclR2CuXpVP59lW6cJehphQA==
X-Received: by 2002:a05:600c:840f:b0:45b:6365:794e with SMTP id 5b1f17b1804b1-45dddecdacemr144910085e9.24.1757501462126;
        Wed, 10 Sep 2025 03:51:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247bdesm23349925e9.14.2025.09.10.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:51:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] maintainers.inc: unassign Zang Ruochen
Date: Wed, 10 Sep 2025 12:50:48 +0200
Message-Id: <20250910105053.315379-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223192

From: Alexander Kanavin <alex@linutronix.de>

There hasn't been any version updates or other oe-core
activity in a long time.

We're actually getting better and timelier updates when
someone sees a recipe has no maintainer and then goes ahead
with the update themselves.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8f230912567..2dafade677d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -169,8 +169,8 @@ RECIPE_MAINTAINER:pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ed = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangruochen@loongson.cn>"
-RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-elfutils = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-ell = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
@@ -425,7 +425,7 @@ RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-libvorbis = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libwebp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libwpe = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
@@ -636,7 +636,7 @@ RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-dbus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtc = "Trevor Gamblin <tgamblin@baylibre.com>"
@@ -673,25 +673,25 @@ RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.c
 RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pbr = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-pdm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pdm-backend = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pdm-build-locked = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pefile = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pip = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-poetry-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pretend = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pycairo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pygobject = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
@@ -715,7 +715,7 @@ RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko
 RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-six = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.39.5


