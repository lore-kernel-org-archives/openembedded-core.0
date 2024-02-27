Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E9BC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:20 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1938.1709071031595008604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1tMWqqXz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c132695f1bso2731774b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071031; x=1709675831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig4YnMfLk9lH9UyCMPPVihuSoTd9cKR5BAEbjcye/lQ=;
        b=1tMWqqXz7Ucl7gE3btv8BbqDoCZFMVrVar9V72tU8Z5MsEQ7I4hyCbm6VuC99CN6ub
         ZyguJr51DEIRZKq9DvOwtuvXbq61t1fdgp7QwEn51ZO27mJ7pjaFbAI83pVrsWb7ZnUN
         CPKSc+7JAyLe8QFfjhjPXo7d06wC9wLDXvhIkmzZeBVixoPyH88tMjtB8YXFfQUIv4v5
         +pmm9la9zE4C9QZ4S0GovH4yR4Ku91+UXxWeNmvJ72yQ1+BatTuo5oiW5FTZBbyvNvHt
         zur8mfvSpBf3+elFg93XUNebZkawwnA6Af087NDDf+Klf1mEWh5X6huAQiSAfvTi0yKU
         hSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071031; x=1709675831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig4YnMfLk9lH9UyCMPPVihuSoTd9cKR5BAEbjcye/lQ=;
        b=Pbi1wrXoVM0woz8eV7jHnz/ZgCWypei428B8sU8YKdIwc1G3JOtJhPBkhrhneJWF99
         /cpphMCPHxW9M7VTZux+pLHUFnUc94Yvaxg5NAdUDI6JwP5ygSiek9DsierjYFZwfKhr
         WJQHnpgZhattjof6gPeBnMSeEfyAZs7hQT+gOO141mgbGMwR/llK5asY2dxLFk8p2Im/
         lgf21j4lEdjUnxGBgd/75bzURLLrWnkvUKmtTYVJPkbrGY+cKoIIDxfwVpsjFyyYh7AN
         a2Pg30XgqZtq/Rkd8vgGg4ABH+heNhaKTOjCrsKaHiZcl4buQg7GhVmF7fk1BCW/YqSz
         feow==
X-Gm-Message-State: AOJu0Yx2eIWRWy1hHwER9hM09SFatLl7x3p7YeqqvnI+AXXXq7uBF7yn
	hKRswQ5blgfObUSclTfYb2dM566DdDh8ssdMbhQQGwetOC0MdZYya2KacsuVVYyhpAAaLnrAjju
	0gw4=
X-Google-Smtp-Source: AGHT+IHWE7opyP5uEeAinMDX0Exs8Hv+0BXEvxD8upQ9fZy3zY19VQF3t5Ffkyw+9Q/qHHoNK8nYcg==
X-Received: by 2002:a05:6808:e8c:b0:3c1:b1b1:2a19 with SMTP id k12-20020a0568080e8c00b003c1b1b12a19mr2316050oil.55.1709071030700;
        Tue, 27 Feb 2024 13:57:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] recipetool/create_buildsys_python: use importlib instead of imp
Date: Tue, 27 Feb 2024 11:56:48 -1000
Message-Id: <b9dcdf2346bb24866c5f3db96a3f79eba20e4662.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196300

From: Chris Laplante <chris.laplante@agilent.com>

'imp' was deprecated in Python 3.4 and removed in 3.12. The
piece of importlib we use has been around since 3.3.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 457f0dad87b4e45a53865b5ad2c150215bd74019

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


