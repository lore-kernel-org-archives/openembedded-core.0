Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A763EC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 16:43:11 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.671.1750783387144940377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 09:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QbQun4L3;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d38d562a55so724253185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750783385; x=1751388185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grtmc++RzcbMqtH1+jNNSXt4Mnqure572GGaz7V+eBI=;
        b=QbQun4L3Pomdu6iTpePhshBu28t0MK5nqKQdXV1U59PmWMRXYCpMcQyKMmv8t+MyPI
         Y6FAUmexJJPzvK3UPZdKG8mZHnbPzaRkOSDXPwHUjiwDditkWs53LeYF5KrG4UL1zPPe
         gaCsRAoo99Hy9IzSpVkW9d6iP+vMC0mqAIHtulLta+mD9pgbd0c1mrTOV+j6QGB/TpYm
         y2jUQzOPqKwMPr8AMFwFTupME8ftN69I3KABhyDY4lGjupjMuwmRva+HVo1I93qrPBm3
         wuw0MRJOa5nyRcscUDmLx4MVcquHbzWNw1nqWOEyRBdtT9wSO7YXe8GaS8gj4ociBCfs
         6UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783385; x=1751388185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Grtmc++RzcbMqtH1+jNNSXt4Mnqure572GGaz7V+eBI=;
        b=ORrZsm3T/CVC6m1+ro33N1MPfv8L/MqZoTvcXFwtXH3i/jd+2KHjMhA5rq8cia5xCG
         D4I8guZu5IMv16Q8RnaLyIjlUr93QZ9vf4/ubo6ZhdaGDeYtHXXL50MeNy9QFW915bnP
         pjZjordTcqFdt0boa4FzO9LrUnXPaaGjECYPuigXqvhQbLCaCZgxuwwAD8vyplJqNzp1
         Wz1H5HjdfcmpmydD4GmlaQQuC1/TO2qjRqgSedwzwTjjDgh4OEfTHBeZUyJERlqP3Shm
         VbQZCRbaBUN/m32p5FMvjnXVt/huBhu0HsMoI8rolpyTS5i4RbmcFJ8RWQRRos0AeVTK
         pYBw==
X-Gm-Message-State: AOJu0YwNL2oAcJRxxNF1zFUOBY3CYhjje3f45JkJLhlMkRYbsD9/qwKP
	jLg3tSAMr1ZrLJkaRnvqUGQYMk6RHxM5NGwySLHKujJOcv6NROtcZLl8cLRfQ9I+z4tRdQ1qdjP
	p2Egq
X-Gm-Gg: ASbGnctLX6kpbzUmWizRD7g1x1+3Jye+HTuW+2DpUTwWEU617TEdtSFRU/JMM/2F6Rg
	tV3LyOqTeUSIz/x4nAmNVlZftUdfyUq3tY+3rjNTvQbqJ7Kc/O4i7Vd6kAdh8qIXfDWqlhTyzFc
	WEjlNiZQtUShP3tM9PH3zu2w7xMTAXh8XJH6MFgLH8AyUhNpeDeMN8NJGtpDd4QYd5hL43hhX/2
	ZHDV3jSiDDKcTT91woIM2ncxYmRi0KZeH7VVWVHkEU5BcwC8sKBmg4VpuZ2v7Tg5AInLQ94Ngsk
	4VCnkemrbxRT/ZkZEsVH6mTZn8IjSWFUFzTIeG93JhLcjPIUSP/gh9wequuSa4oAo8dTB/2TR5w
	n2kItxbRddErjHIQ4qSu0ow==
X-Google-Smtp-Source: AGHT+IHCsoFQsNXVT5A2lrf4kD7oc16DrDESTBstWGU65enwdMz6JwdSB7Jy6xEWjcxfiYYEaXB0kA==
X-Received: by 2002:a05:620a:2912:b0:7d3:b8eb:b32f with SMTP id af79cd13be357-7d3f9932a32mr2599939885a.37.1750783385392;
        Tue, 24 Jun 2025 09:43:05 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0946750fsm58395206d6.53.2025.06.24.09.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:43:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH v2] python3-smartypants: upgrade 2.0.0 -> 2.0.2
Date: Tue, 24 Jun 2025 12:43:01 -0400
Message-ID: <20250624164302.727513-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219276

Changelog (https://github.com/justinmayer/smartypants.py/blob/main/CHANGES.rst#releases-20-and-greater):

Release 2.0.2 (2025-06-17)

- Fix double closing quotes after an HTML block
- Fix regular expressions and tests for Python 3.12+
- Move documentation to ReadTheDocs

Release 2.0.1 (2017-12-20)

- use re.match instead of re.search to improve performance on large strings

The patch '0001-Change-hash-bang-to-python3.patch' needed a refresh to
apply on the latest version.

License-Update: Update and granularize copyright years

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds the License-Update line to the commit message, where it was missing
before.

 .../0001-Change-hash-bang-to-python3.patch    | 24 ++++++++++++-------
 ..._2.0.0.bb => python3-smartypants_2.0.2.bb} |  4 ++--
 2 files changed, 17 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-smartypants_2.0.0.bb => python3-smartypants_2.0.2.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch b/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
index aab16eaab4..63bd523cb7 100644
--- a/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
+++ b/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
@@ -1,4 +1,4 @@
-From e299bcb05405ff49450307bf3002c1fac14a866c Mon Sep 17 00:00:00 2001
+From 7425e49166e6f16743ec9528697d06bc4103dc5e Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Sun, 20 Feb 2022 18:55:50 -0800
 Subject: [PATCH] Change hash bang to python3
@@ -9,6 +9,9 @@ Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 
+Update to apply on v2.0.2.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  setup.py       | 2 +-
  smartypants    | 2 +-
@@ -16,32 +19,35 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index ff1ea76..96a8b73 100755
+index c183fc0..e10d757 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # Copyright (C) 2013, 2014 by Yu-Jie Lin
+ # Copyright (c) 2025–present Justin Mayer
  # For detail license information, See COPYING
  
 diff --git a/smartypants b/smartypants
-index 189adf5..0cca568 100755
+index 1dabf7d..20c130e 100755
 --- a/smartypants
 +++ b/smartypants
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # Copyright (c) 2013, 2014 Yu-Jie Lin
+ # Copyright (c) 2025–present Justin Mayer
  # Licensed under the BSD License, for detailed license information, see COPYING
  
 diff --git a/smartypants.py b/smartypants.py
-index a70575b..e53bd87 100755
+index 62c1472..a440d14 100755
 --- a/smartypants.py
 +++ b/smartypants.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
++#!/usr/bin/python3
+ # Copyright (c) 2025–present Justin Mayer
+ # Copyright (c) 2017 Leo Hemsted
  # Copyright (c) 2013, 2014, 2016 Yu-Jie Lin
- # Copyright (c) 2004, 2005, 2007, 2013 Chad Miller
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
rename to meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
index 9bb07eab52..a439f8a880 100644
--- a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Translator of plain ASCII punctuation characters into 'smart' typographic punctuation HTML entities"
 HOMEPAGE = "https://pythonhosted.org/smartypants/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ca325788d94ee694fef2a308c5073454"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "smartypants"
 SRC_URI += "file://0001-Change-hash-bang-to-python3.patch"
-SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
+SRC_URI[sha256sum] = "39d64ce1d7cc6964b698297bdf391bc12c3251b7f608e6e55d857cd7c5f800c6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


