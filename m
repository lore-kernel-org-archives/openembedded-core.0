Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BF6D0EE27
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 19:17:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.20462.1728674220886499895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 12:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=PfMkl22a;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso8093035e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728674219; x=1729279019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pmNS4tpxrMzrxbNbOadmgMtH08zO6PJdMRg6sO27Bqo=;
        b=PfMkl22aObbIujemay/NU6DRCgNpTL2599EBpA+Na4B9SWREz6xnXJ9SwxMCzePoHr
         zhKsKMVNMU22XHsTDqFUmvl1McEvYP1YJuzaZHTIkLTaf3VTv2iHdlmQ4FM5wiIrg/PV
         roXtl740sV/+YTVSPkd80T0+M/pwDwGB/NF/1j3a8gdhKKXLr/qxrrvspejbSnH4SBA6
         U9ol4T/hhFEl0WkPbVDg9N5tQmDDpnGrgtpj1NIyXyZNZfhpRQ6rcPnBtTuag7GdgGgc
         4P524vqUJg6BpSpVvP+vOLlWJ2P9xDbK1cC49A/n817Az0DuQ32x08HjUBxQoZW83XIS
         zjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674219; x=1729279019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmNS4tpxrMzrxbNbOadmgMtH08zO6PJdMRg6sO27Bqo=;
        b=bwfJ2j5QsnvYDyRj6BEZayTk/cP/M4zHge4atguzhXrIQ8zJXy3CysVqvKoboME0rq
         y8bcXOMXuBBkIMxn8bGAWKfPSEax6XHoovSDjPUYs48AabGpHJj3gjU90UCVKfmukau7
         pLvC39G6LDfRFONZCyGwt8O0z5rq/Atuw2IuNh9CwzSHqGJaPyuOyb/ZYnEra1fHawZP
         3HZcOATV94tsFTozN/ZUkCaXJ8/Tak9tTjiLxi8mxQZqNtRnHvnj2kS+iHT5ZPZ2iAu7
         jcT+soKK31Fq+/AInfcKSEuTgiv0OmqMsPOb4yJnN493fC0BU4eYsd+zxXAbYpNb4ML0
         oDdw==
X-Gm-Message-State: AOJu0YywuA6e10RgK936HhT2QvuWlNwB/KwyzHGGoUEozSAZQLDkExIO
	yaaAJ7Xq6AHKIts4kbdF5OEf3x5t1XwaTqLlw60OMgxhly7a5/LFuULjIXwr9b3/aOkKkmIbE1q
	s
X-Google-Smtp-Source: AGHT+IGksIsf1lepGdxbvVEE5Vj1bx8nZdlt9vjDS1+84EphsfcNY3YqSmOeCK++aJ7ck35surT/Fw==
X-Received: by 2002:a05:600c:3d89:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-431255d55edmr3659305e9.6.1728674218868;
        Fri, 11 Oct 2024 12:16:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:68b8:bef:b7eb:538f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835c4fbsm49421265e9.39.2024.10.11.12.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:16:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH v2] python3-pip: add missing RDEPENDS
Date: Fri, 11 Oct 2024 21:16:54 +0200
Message-ID: <20241011191654.40935-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 19:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205696

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pip3 package is missing the runtime dependency on tomllib. Add
python3-tomllib to the recipe's RDEPENDS. While at it: order the
dependencies alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- pull in python3-tomllib, not python3-modules
- order RDEPENDS alphabetically

 meta/recipes-devtools/python/python3-pip_24.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
index 5e1a467990..bc164415fe 100644
--- a/meta/recipes-devtools/python/python3-pip_24.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
@@ -31,16 +31,17 @@ SRC_URI[sha256sum] = "5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf3
 
 RDEPENDS:${PN} = "\
   python3-compile \
-  python3-io \
   python3-html \
+  python3-image \
+  python3-io \
   python3-json \
   python3-multiprocessing \
   python3-netserver \
+  python3-pickle \
   python3-setuptools \
+  python3-tomllib \
   python3-unixadmin \
   python3-xmlrpc \
-  python3-pickle \
-  python3-image \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


