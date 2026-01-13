Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DC7D2F355
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:58:14 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65684.1768327093268162706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=3ASBt/YH;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a367a1dbbso130967466d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768327092; x=1768931892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=3ASBt/YHhEyVqUxAPISdva/Gk/8sqabH8Xg4c65Y6pxdEGuNdIUyth82eeFNezdURF
         8kQW90Baa3nS6skPtlIXZhHiEGOp6nRiEVphZmjxFW/bnSxKJyZD35ms515ZkQg7lr2p
         uNdoo5hBY8lhB9JY8PgRFfXpt4DJpfCYnJmufSiHRu7wpKPz0b/kotFc4+dYXN69kC27
         IGCzBsxxX1+DWlyKvo5oyLUcFmU3NW7go+F/J+IVIJRDRZZT+OqGWgcvI2+8y/NR9rLW
         D1kT5TlMpztClBaFQ41xKLPRikZQPGuzCCeFVSX7nKMpBXKYzWDv0FtzJkuKjVH8svFv
         hEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327092; x=1768931892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=r13Ud1ng5lOeBi5QZ8KQ6xciNyu7MD8NNXn/Jg2/K7n/QZnNZkvfbELsx1ers8WjB0
         Gml3s8gvD8+2ZtI/FvCoOYOSNwqJDFUD7FD00KzOnOPg4oMOD3W+o3Fwt1iG8rEpxfeQ
         oqN1pxt+qRf7xLbtHvSlMZhqwG2Y5x2LKz0sNV75VekT0fveb08Tmlb3mluL1V+FXYh/
         RO6NyGGJo0zI4zkqHK4wbf16HirAV14hwpyUvfOHKrkzOgqk0iEZ8sKpcF0cgVAmksor
         sh1NteA0JYubLMvp7AYnCekfK7cKgtSY10fEUFueUzRnJHoEWbpmCn1UtAikafL7dRZf
         ZZzg==
X-Gm-Message-State: AOJu0Yw0YYWcWvRhCn1w0IlOm/6nJIEV2+ZMqJXTYx+FY4ebcoXp0Owi
	4rYv60AjoWQhqHTcLzaxvMP4lUAyikEv8lC8DgHsD3qXajv06tPri7Zv2FGXay0cAqun96Ic7RG
	63s627Rg=
X-Gm-Gg: AY/fxX7MxAjqhXzy/Dj25IRK45IuOMeA3q/eqW/KVb85K/uFfc7PtmeVwKaDnaF3LFt
	VFt9bP4NSVduM/0Wv9pIv1lV++xnXBh42D6kN61xkoAWrmko/voQxhce9l79ngWqZ+gwzhKPuCd
	PDBXZPZXWq3dq69LdK1QZERgQ7Z/1LBOspZQ1QqwgiHKQ7zWVfa809l68DqE7+rG0rVfR0Y/5tN
	wgIQmCpMQFHT5ceqkfHU2gXGLv2ttT6JlMMYmDkUl2wSrLIj7nNBi3HFPucM8mOKYQvxJX/fYiZ
	qGfn04ia8ARJ19YnGUZX/NeK5u9cm+NYzl76ETtiwRbaNiur11p2LJzEf7WtZ13uEVvTWidd1Md
	4ueJSlyQq6RBKiQPxuSeDMX5h86dckFT+oyIplM6CHlBS8AvI9RVw0hIxQl1imMuwVZc4/3N2pC
	7I9+gI7EFLHPMpESe1P6TMl9MKmg==
X-Google-Smtp-Source: AGHT+IFo5JfGb9URtUDjbhvxg44YSK+T1OeTmFHhp4hQfhMZjjVWiDKxhWSzW1E7FxBqYb9UvlwZmw==
X-Received: by 2002:a05:6214:3985:b0:890:2509:1057 with SMTP id 6a1803df08f44-890842759bdmr314592356d6.47.1768327091504;
        Tue, 13 Jan 2026 09:58:11 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm172113306d6.41.2026.01.13.09.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:10 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/7 v4] python3: add _py_warnings, annotationlib to core
Date: Tue, 13 Jan 2026 12:57:56 -0500
Message-ID: <20260113175758.1409859-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113175758.1409859-1-tgamblin@baylibre.com>
References: <20260113175758.1409859-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229285

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


