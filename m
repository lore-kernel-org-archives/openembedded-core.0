Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CBAC54E42
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:53 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.455.1708544443744782814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O362xtn9;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d28468666so757917f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544442; x=1709149242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19bkzy+F+oR2d8MER+I4CjV+XhDWquBlzUwA9Solcro=;
        b=O362xtn9FQj/m3rPkcuoxRnYoaypAf8dotY5AtRZIT6bHBxvOiQlhAJIeljqbSXM43
         xdrvdkm9zgekjGHRLhU+B8k7tIVr2WJiyAVMedg2qmBKm/UcdCeNU7E6+b7tN2jNHpK9
         hYHf/UQzOAxT/8OoqfPhzyn78JpZTxg+AmIiZH7an4d8dfwsVqiOfpFp/EQIo6SDv/uT
         DUUdAIVjcD3Dyee8rFxMBN6EUjcOK3W650/VI4rkHZzyGJnok+BCVKKwj2mi6OHPZoJq
         dftfNp96CGEb8hcyie/6xQ404/Uq++74xsdHtlbYGexiBNXK1tXYyeHeKv6KlLSFqK4e
         osRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544442; x=1709149242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19bkzy+F+oR2d8MER+I4CjV+XhDWquBlzUwA9Solcro=;
        b=nueocbM9+0kUa4C2GqmUAA2EGTS3UnkiVqgCgeu0Zkkf21pbgdp1FYmOJg/sCp6IZj
         As+vMwe9101NtZE6h5ZXcCx+H9e65gX1Se3t7pKUzD3zaHU1lJWax6OKAaNb0ZkDceQn
         9+rXlBSgRp6xSI0OpWAPPadnBdEPj2wrh1AJc+9inY6klZ60XvZ+UCYqPiibJapMEzuz
         ea66A6IV0tfwVzOIpgRIEEOGjlZuOStWOHN1RA8F0TDEOURTmSIAiZNAyoR8U8jBBhcz
         9XElwVi7W3Daq/45JNsBNDugq5UdcGxJvCsrxo/GstGUu9PYW+4FVIepcgtVXvGjOIf0
         T1iA==
X-Gm-Message-State: AOJu0YxatNJhmJn1guVNfaMlN/YaDLmtVuo300LtEKiGw+Oq+BZfNijW
	xsFOxr2dJPAx5FA6ZoWzBoICMKPt3gi9ZU35wih7zcD/tH0LY44SRT9iM0Am
X-Google-Smtp-Source: AGHT+IHLpN1Pc/ClwbhtC6c+JLAQAnSJwllrKZxWVlng6hvJpkbSlTy5wmCyMOMozRTQyauhhTuvvg==
X-Received: by 2002:a05:6000:1f89:b0:33d:4bc3:e787 with SMTP id bw9-20020a0560001f8900b0033d4bc3e787mr8469027wrb.51.1708544441708;
        Wed, 21 Feb 2024 11:40:41 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 01/13] recipetool/create_buildsys_python: use importlib instead of imp
Date: Wed, 21 Feb 2024 20:36:53 +0100
Message-ID: <20240221194036.1804463-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195985

From: Chris Laplante <chris.laplante@agilent.com>

'imp' was deprecated in Python 3.4 and removed in 3.12. The
piece of importlib we use has been around since 3.3.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 457f0dad87b4e45a53865b5ad2c150215bd74019

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 5686a62d3f..a7eed3256f 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -10,7 +10,7 @@ import codecs
 import collections
 import setuptools.command.build_py
 import email
-import imp
+import importlib
 import glob
 import itertools
 import logging
@@ -561,7 +561,6 @@ class PythonRecipeHandler(RecipeHandler):
         return deps
 
     def parse_pkgdata_for_python_packages(self):
-        suffixes = [t[0] for t in imp.get_suffixes()]
         pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
 
         ldata = tinfoil.config_data.createCopy()
@@ -585,7 +584,7 @@ class PythonRecipeHandler(RecipeHandler):
                     continue
 
             for fn in files_info:
-                for suffix in suffixes:
+                for suffix in importlib.machinery.all_suffixes():
                     if fn.endswith(suffix):
                         break
                 else:
-- 
2.43.1


