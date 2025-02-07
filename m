Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337FBC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 19:55:21 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.144.1738958115749124108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 11:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uKlYpYxP;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7be8f281714so223738085a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 11:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738958114; x=1739562914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySe9MW0s+4mzHTAdg8PZbL2k1moCurmDkiTCWCDVndY=;
        b=uKlYpYxPhtR+PHGe3jPIL9rMJ8tvq2sa7+Sm7jY8yNnx0nNoaSWIMtPIZLlFl8pab7
         LE2v43kS6vydM7QWVCrrYCQTBCPS8t+NNIT4eKsIHswlR6W4UPc1z5tplMvM1LcsAmU0
         cC2G1dwUWmzjB6sHj+q34C2uWKVpm82Q+5zK1IMhxHdB+64nxP5tGG+QyA7e7oF84SFI
         cdY5jYKcjpbLmBxnZ6qLVx1oAlEccUY/XRbARYHFhu5BSvbrf1IiH6RRC1DJXZ6BVJvK
         bpzEW64iZXfIYSM/1lIQysxEvRD2j8026Ps0INN4e18BYXluQIZT7TiYBw7adyBJn4/0
         ibaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958114; x=1739562914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySe9MW0s+4mzHTAdg8PZbL2k1moCurmDkiTCWCDVndY=;
        b=sUdSQmLoxmSgPWjs0/LrAVXlK5VHmAcpgouQEtBilue2f1OwvOV5kQzXNoAB7xHqdE
         8tcxY50Wn9InK94nPeNSvrSlpAEza0heLJxd7EF+n1J7ulm00ieXDyFR1C0uA0rvPCJb
         wI7issZFM37rdxgUGbPL3xI3xhpZhKDcbNKyfIBLAZC2fXVzq4DlOqPpl3hmMIQg3uCa
         ryoecCK4Y6ieJpHtxgSyg4LOiYChW0NEM8XNFzbSXB7rdvxUj+0jAmrpfUQZ7TCARm36
         yo/8zVcCXum0yalR4szw7WEAWl6Xy08FVuc7+OH/85q6qmA+O6aXHc3QtxJORzMBaXEo
         q/ZQ==
X-Gm-Message-State: AOJu0Yx/BvyBf32VLXkhKW/z3T8kod+qTQRR5GnMJb+eFeWoHpwNZOic
	pWMGROewXX7aIDnXSGrac4fWvkQ0LXuV83sbUtBhODC1yYvckarCrhsK+LVyTAJlWoohjl5Tu9a
	LsMY=
X-Gm-Gg: ASbGncta7YSoaSrlbsFiXbn9r7u1oK8EJQdSi3OMnnyJZvGj/lu2icR56yDaohPgHUO
	NWCeuxe/lsUPb11Gg7aRCPKpZfajTFly/KW5iNoH8bVo/1fnpMfPNuPfYu8TmhkBVcwi+H2rbdj
	XE7TFFQR5DpETxAi/XG022uRLAJFIecY7XBehcG301a3couWFE6fRwTahOKOzCoZreEVJCKh5Dc
	0IoOTdxwwFoD0CqZKHpA85x/Po5QMsnQjmoJmC5cbNzh0buA/DyQDDsa7M5s+BemNZZPkbAh2T2
	8xNVnwd94X5uMIh8RKNZPrfGyhLYbcJmAlOoFvzDp7yb5PWLwkA=
X-Google-Smtp-Source: AGHT+IGIUnEQn5yYPvQalg1CgFxUxCAI7Yckmy8OB/lkadC2IbBpt+sSr3NbjsXbBREBMnAJ7v+WQw==
X-Received: by 2002:a05:620a:608a:b0:7b6:d252:b4ef with SMTP id af79cd13be357-7c047c953e5mr889154885a.53.1738958114168;
        Fri, 07 Feb 2025 11:55:14 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041eb7f89sm226218185a.110.2025.02.07.11.55.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:55:12 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-typogrify: upgrade 2.0.7 -> 2.1.0
Date: Fri,  7 Feb 2025 14:55:09 -0500
Message-Id: <20250207195509.3603590-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 19:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210997

License-Update: Update copyright year, attribution bounds

The project has changed to using a pyproject.toml with hatchling as the
build backend, so change the recipe to match.

Changelog (https://github.com/justinmayer/typogrify/releases/tag/2.1.0):

- Add ability to select which filters are applied (#1 by davidlesieur & barrysteyn)
- jinja_filters: Update import for Jinja 3.1 (by jyelloz)
- Ensure all available tests are run (by mcepl)
- Package via pyproject instead of Setuptools (by justinmayer)
- Improve testing, linting, and CI tooling
- Drop support for Python < 3.9

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-typogrify_2.0.7.bb => python3-typogrify_2.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-typogrify_2.0.7.bb => python3-typogrify_2.1.0.bb} (58%)

diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb b/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb
similarity index 58%
rename from meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
rename to meta/recipes-devtools/python/python3-typogrify_2.1.0.bb
index 8ba2788c9b4..0cb31468bdc 100644
--- a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
+++ b/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Filters to enhance web typography, including support for Django & Jinja templates"
 HOMEPAGE = "https://github.com/mintchaos/typogrify"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=12bc792d6f5415dbf421f3fd183c6dd2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b8558ebcc682078c1a44d0227573006d"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 PYPI_PACKAGE = "typogrify"
-SRC_URI[sha256sum] = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
+SRC_URI[sha256sum] = "f0aa004e98032a6e6be4c9da65e7eb7150e36ca3bf508adbcda82b4d003e61ee"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


