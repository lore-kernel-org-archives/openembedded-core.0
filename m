Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695B8C48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4915.1708035439187353618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=faM+XVaj;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41239bbab1aso543415e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035437; x=1708640237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19bkzy+F+oR2d8MER+I4CjV+XhDWquBlzUwA9Solcro=;
        b=faM+XVaj31Gs6yQS4DON7JtjpqCtRiCti1KJhmojnFBpb0O47D4NcstVZDTUXpWnEf
         DE/yxTW9RmEANrvgqhp9C/QBS0hPnHjz2Bj2hVS3AjtKl/d8VN71murLHKxn9P8q6JL9
         SHP3SIFhQ5wd1rDa6HjCHyZNKh9EBTZtYhQS/YGkshING0jn/f052tYOQv/soptVIamT
         wbtAmMueEkXfUE0U6PoW3buhuUvkWG/irQMeTm1fNb91heus5CDPYLycA2mfa9y0N1qN
         ZarzfKC3arlen+Fm5Xslown3QJY/XmAe3+5rojGHa+Ai2x+ZOsLfxYFO+x149Kg3lSx5
         rLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035437; x=1708640237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19bkzy+F+oR2d8MER+I4CjV+XhDWquBlzUwA9Solcro=;
        b=wdB++XtCw1UgrYa2MyHC48J5t2iEdXsoP0XtOGLdi4GU6wZn2g7keQxwn8qzZ7zdct
         zJs2I2IaElrnAEUpGyh8vEUx+fXiRWJN5tibgF7osSBYw8IfzYy4A221e8+Vzn9fKvvc
         89iUkm81x29xM51b8FHE5e5KLh8H8WnJi2vPPbnGuAmBM7nm4+78aBk7FHqx7CdID7Ry
         K6+FWBr7/ejl4eqR/MLoLj0Q3ylomAPxmJaZSTBrwuifDDe5TbouG3YHCywfw1ATNzKw
         EnNh4BZo+Y7HQ3lbhP/UOBOPkstPI0zqeCJG6qbfIaWjNWZ9eErq4pPpb46DDnL3V06B
         wdfA==
X-Gm-Message-State: AOJu0Yz8cpEdcO8l03NmX9IIJp4jspdju4gKfQO0c/1dTS9HVVXeu2HR
	N+Eo1P4Aj16nH/wNW+w/RJenGWJWZsnJ102Ua8n1YdkimJTq7P1d6vjnQApgs1w=
X-Google-Smtp-Source: AGHT+IFV9w8tGz642i8+aiwiGcITUq4oBBQSuspN7eZxmeqQ/cYzJGmQwYWTtohJJVHm8sEkjQU6Yg==
X-Received: by 2002:a5d:6652:0:b0:33d:15c1:cfcb with SMTP id f18-20020a5d6652000000b0033d15c1cfcbmr696524wrw.40.1708035437350;
        Thu, 15 Feb 2024 14:17:17 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 01/12] recipetool/create_buildsys_python: use importlib instead of imp
Date: Thu, 15 Feb 2024 23:13:47 +0100
Message-ID: <20240215221711.332614-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195712

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


