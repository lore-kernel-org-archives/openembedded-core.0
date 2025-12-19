Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AFED7877B
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:47:49 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17009.1766152068980342202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kwBK691V;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2d56eaaceso213698385a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766152067; x=1766756867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=kwBK691VQM3BAfarQ9kMF6orJeMsrQ4wODRkOkiuUvUOIHRcWlrisRQuLembK+oSRd
         E19ImTuPWrvLkBXkxHtmeVmnIuHunT0ioAbaK+W748Q5zyvzPvyS7lF7Yma2EN3RY0ah
         /3F3GEnrJGk9D/QgSrc68MjOvdUuHnALHVDhdbrWGl+Jelnm2tR/5lKfLDmFVSSfBKJ/
         dBF9qv20ytbSxkdH/tSraSVFqrrQjeh11HzKCn/yJ173NoMLTgKIDq9/nAtKkHX8m3bl
         +3rfCeq25m6iR2Oqnl5SYhTO0qFGDWVTVc7gN66XteQv3LCVKdpdEr76rkWFy51/6QI4
         ACtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152067; x=1766756867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=gBazwBhmeolyC/NknsWHbO3cKwmFZc/S9E/34fWauwzxEMOg3sSTF48HejTV+b9efb
         wpbklcPfWELRg8RnGwv5QNXF/kpUHZ8tLHfHfen5jpPGftK9ZVnOmC0G3CEjSdWtXAk+
         bEQ4g4semdDUfo9umfJnoRP9yF135ZykK3su32QHUaMpQUpTvBdhw1ia2ydnf1LqtUUk
         gzun6zzsbyDmDlGhxbDLicvcYWX9JivOIC9xFW/ArmUUcMqOHhUuWZ6nGSpuQDgFfAjW
         DvnGlDpCv+L9EpWB9ICYAJRYhaw8klXfF9MS6BHLZriv/3wfCG+uVPz2XdXBUvOl99eu
         BBtA==
X-Gm-Message-State: AOJu0YwS8YE5SWxVmY/Vtbkmu4VR4rRYwyLDCijFYLFioCy4Jsq8FtgG
	UogzzgHHCjAXH/xm+peUCNO3z7RjuXhCf5qQ26N93H0UTFSwShRaGDti9G/JLYwx68b+/bNLF25
	Lv7nJHqg=
X-Gm-Gg: AY/fxX7C4JtGQ8ZPHNswHwWlKzuoclZfY40ySdsFIOpjivqi9q42HbnS+V9vtAF7rqe
	UJk3+IPOpHpSuXethz8A4yzuvrA4/nGg31QghbfmJJuXADFbfcIxnlWxOvGqI6C2D7CFpKscYDb
	15qeJ4VBCpWhnKUItu48mT2ARbM0pUUqRDDbyC53F+9CGZBV1JgvkBr5QpR5eOx4YvHU2TWGy45
	dXLgBr+/TuBEfzCFVEBoaUImJMY6JTgaBZQ1aFupj5jnMG11bzsCJv0zOMa2qormjc6AblM8pBH
	Q7+RSo/YRfkks8GKHX+RggNo6JmGb21TWgZuZNITbT+GGjz3b3RdllOdN2tjVcmHA6BdMys1Nxr
	IKTmSA6m3Rc+VWLmJ+okEqXM5mHsxO4QLDCwJs96a0t8aSGcdAvKbBbVHQQJE/Q6ILnnCVhBnOS
	bKc8tehVJ9bKu9I8A=
X-Google-Smtp-Source: AGHT+IHgaVOk9qPH3JsXFq/3VdrQfpl9UMTxh0/vCyXe6d9Z6xmxCTwqwQAQLHL9n9/fp7fS2Pm61A==
X-Received: by 2002:a05:620a:4445:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8c08fbc1f3bmr465096985a.81.1766152066967;
        Fri, 19 Dec 2025 05:47:46 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66865asm17659521cf.31.2025.12.19.05.47.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:47:46 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5 v2] python3: add _py_warnings, annotationlib to core
Date: Fri, 19 Dec 2025 08:47:34 -0500
Message-ID: <20251219134734.842422-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219134734.842422-1-tgamblin@baylibre.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228237

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


