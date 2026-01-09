Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9846ED1D48A
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:07:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11933.1767971225767995054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BFtWJhsk;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c0f13e4424so419958985a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971224; x=1768576024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=BFtWJhsk1dv4IC8McVlIrf1C2JzAaHep0gut9R90wH1X7rAsQZpmvr0CGzDwFRRvFq
         ln46HqV6SKT/LxPHgaHK83fAN0ctaTJqgwcQN06STD9Ai8QyD/zkwT+P9EcEBcpEqzgz
         4MH5fd5LxpSyjKE4D9VZcCqNU8SX6HHc9kN4ULrVxhVuQgHwtzUO58U64znpFbBgrABo
         7CobiYLbG4xtxDz68dUiCM245iJLAo/Rp3nfLOO1IJDKy6natAxz4IwKaxZ7T3bbHHHn
         A1zQRBGOwxtyBK5kYs/GoGV4OorP7lxCEa7AI9va+dQA7ZErk+9R4moC1Ud3OpZZPb01
         c5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971224; x=1768576024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igIZhkiGnNT7O/fHSGxpJQS63FwLOpkiBo/d90N4pL8=;
        b=r65Y97MwN/6EX9mY+rcR3C4HxuMSDpAkWKnvxd54Rzhpvbz8+d4uB9o76oRZhtxicL
         7MGAhc0zrcQvZex9C76e/QTcG7LfipjSfOCP5QsF7meTs2O37Bf2NCnlO4A/ycZcM8EA
         JXdUrJouFLaDKM0ed45RJYtLgR+hM4uNqcniiIbPqQbQuHQD7kWpKBtzhSz3aVB0JF/N
         q+htxeWcHS92QIYSM5VhTuXYhY2FOaVQDQyAhnqyCGOQonL/ELgSQak0+Eb0Do0Ows+W
         tD4PycdjCwJi2a6uRG2IyhX64kdvFhNYNgUdZr2PrIl9pw/y5tRdg7iblP5905T5y3uX
         8PVg==
X-Gm-Message-State: AOJu0YwA+efD08OsmfN5QcSU6rOhkiew4EwluzAQUo188mjoaW6qq8Ko
	n37p+Zy/+nHDA+HoY9soPmBAyK11rfJlg7qHS+OC97zlbAxXc0xd1V1osrj7rIztfxa/ReD9oUr
	7I46kYEo=
X-Gm-Gg: AY/fxX52ssq8Nyjkm7LjO+QVGPI/oh8wHZyBh6tR11JKB5QGwe3ur4mFySw+D5p6boB
	aFit7i4pRXpgulSakygBPWXkrbQUf2rW2q6QEAAk6uZcZxZmnBqGFdLDOGk7MvGLp63D1naUm7v
	vRs8K98lh54gv+i2woBAqZWowz8Aecus5fr82XkqjoemrvGXbyUUDX2Mi4vru1WsYtkJzZDnl8T
	GyRgddZkExco856bErDya5Vu5ApmmcXyIg19RUBgOhLqoMVGU3yHPDqHcKWhmErU4uGNcYfw2xP
	NNKrQsHh1SP68sYB7f17J68G6oboE8mR3mA+dCwJFGPREfhmWV+u3MGXwQHS2V9C1lnxE96NhM3
	CxzBzm13kWOp2mgYySlcyoWyT5fqCqiks4UzNRHDANCl/CpO++9NcxgBBoZNtG4I1KZeaUi4uCz
	SbLoSmbE4Jvyn9i6Q=
X-Google-Smtp-Source: AGHT+IEsC3nuW1kSctcLdR+oG5gPXXdRMr26s+w/3zC19E/3TI3tssraiK9Exh/0S4hUHo+RHRGxjQ==
X-Received: by 2002:a05:620a:440b:b0:8b2:62f9:9fd8 with SMTP id af79cd13be357-8c38940b8b2mr1211133485a.61.1767971224149;
        Fri, 09 Jan 2026 07:07:04 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53112csm876672885a.37.2026.01.09.07.07.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:07:03 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6 v3] python3: add _py_warnings, annotationlib to core
Date: Fri,  9 Jan 2026 10:06:50 -0500
Message-ID: <20260109150651.469332-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109150651.469332-1-tgamblin@baylibre.com>
References: <20260109150651.469332-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229131

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


