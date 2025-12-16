Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDE2D5E390
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:39:26 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24249.1765895959392575301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MXmSgab0;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ee1879e6d9so55491661cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765895958; x=1766500758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=MXmSgab0DI1guVGYCtOIerGqd0HyvYasdECeYk5c6Rfbb4gy/hv363jaikWWqOIbXe
         9NyAfU8gMnSdhb9KCguRCFbnfPQQyVgI4ROFVbQHATLXJvGIB7s5nveZoSusa5vtx4V3
         hU6HMeJ0kRdxSaJ+u4xufVnJ4WcRv+945Wv+74bVqj5K/RPKOmc8cwqbuHolXK5E4lsd
         zJsvT9kDwG0JhxEap+YyaTXjEFvDYmGesyKqiiNE5jWjas0ZdifIMxczRJdLkTOkHR6V
         Kvb90PhYlmksAwOJ637uZmFfT0bzBEKTIQLf8yUX8hn+yxVUX0l6Wj/+gu1kiSUHzUiM
         9F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895958; x=1766500758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=w5QzOubNBVIYxQdU1SXeBFt7xU1Cgd8yGCOtA3duU0iE1tEcj1nCBpCZGh+lIMEZcI
         +JshlpssxpZ1PNmDOyabCpjITgBqgDRFYJO4+mye8XUh5zzykOVlUsk+/fkXE5bSxFLN
         I+z9ERrwzQcOIJ+kkj7wSkYAiWGqHS9BQCi5zv+KNyW8h8zlZtJS5k0uVmFQQP7Bc4VN
         hPG9mej5sqMyhfZnmRvn0A0PNN0ox5qdwE+mwHGfi8Ch7i4GovmcEYGFqjcLj1SulKKM
         rEvEMxriTWwBuHyZw5x5fgHH8P07eUfpCq4SuwQfitFMNt1mgzRUkBHodkDMF+orx5Wa
         7Q9g==
X-Gm-Message-State: AOJu0YxelPNn5kJNDgHWY0wO2ertHomWT1yBNmXZCU+dYXAM2O5PXdJD
	LxKLUKxCrhD8HdH3yS8JwuLiHMjBKgAQ+aZ6XZjWiWW5qTtYMyMNmRXVZ+Ed7pDR93f+AO00i8o
	LkTdtS/I=
X-Gm-Gg: AY/fxX5IyQy9M0Eg1Mm21BIJLNvT5xcjEptQoz9JCBmFyButCtVCgvR+q585fzAmLY4
	gqHEHKSdrg6nuKHW0jcwYasSAXAEItIl0NkAjHBhYQiKDJcsme6zLBcRcwUC0OtdBJzgqmD3KMA
	2WCM0YL5ur6NcWUHgPFs45VoPP53bSWTcR79RSu1gWRSwoOhNQcWemtfiJB/5nLXH6MYmW1nHI/
	XTu3GOcfFiRKMxWhha9BdKSIJVX98z9AuP0AV4y9Vt48eBwtixB5xSALd7mkmgPNVINoXaEIifI
	i7YxiJ2rD6Yxd4s26fqAbNUCV6mhtyrxIRX1ML1ScejwQHyCjx5wxMprwWkTb8i8qYQkQM81Zrh
	J7ulBP3GbjbIm0CwxIKLI68dhI9WDSUq3IcR/wIigls8s+htWfHURCOan16i3jD0AJlQVC13uIP
	j0E1mypSl+uqsOe9g=
X-Google-Smtp-Source: AGHT+IHa8g/tLCbs1+J+9/oU3KTGJ7H/jHv4CO/EWWqRBNIiLeGRQjia/fRXKoegc055NV2P71GXIQ==
X-Received: by 2002:a05:622a:5a93:b0:4ee:1f24:8c43 with SMTP id d75a77b69052e-4f1d04d14bdmr197110821cf.31.1765895957590;
        Tue, 16 Dec 2025 06:39:17 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c542desm18448561cf.27.2025.12.16.06.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:39:17 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] python3: add _py_warnings, annotationlib to core
Date: Tue, 16 Dec 2025 09:39:01 -0500
Message-ID: <20251216143901.2542490-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216143901.2542490-1-tgamblin@baylibre.com>
References: <20251216143901.2542490-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227961

Without adding these, there will be numerous packages that will have to
add python3-misc to their RDEPENDS just to dispel some warnings, like:

|root@qemux86-64:~# python3
|Python 3.14.2 (main, Dec  5 2025, 16:49:16) [GCC 15.2.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|warning: can't use pyrepl: No module named 'annotationlib'

and errors like:

|>>> import logging
|Traceback (most recent call last):
|  File "<stdin-1>", line 1, in <module>
|  File "/usr/lib/python3.14/logging/__init__.py", line 26, in <module>
|    import sys, os, time, io, re, traceback, warnings, weakref, collections.abc
|  File "/usr/lib/python3.14/traceback.py", line 8, in <module>
|    import warnings
|  File "/usr/lib/python3.14/warnings.py", line 15, in <module>
|    from _py_warnings import (
|ModuleNotFoundError: No module named '_py_warnings'

Add them to python3-core rather than requiring another split.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3184bbe0c3..691fb22202 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -194,12 +194,14 @@
             "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
             "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
             "${libdir}/python${PYTHON_MAJMIN}/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/annotationlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/ast.py",
             "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
-- 
2.52.0


