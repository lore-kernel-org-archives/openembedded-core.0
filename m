Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33611C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38597.1782742842364761252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M7ARB8b7;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924593f45dso44438595e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742841; x=1783347641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5BshBFA+jYvWOFgvR8eHBwTzEi871Wd0OvaMdvfkH8=;
        b=M7ARB8b73kA7jeQj9K+efGaHVTHCH7abqeM/oxElA5PEL5aSlWeQDeuGOiuVeUHQq8
         vxpMpC926/6MFKG3sdCgbuwlNNbSIdlTV3OR1Q8pLWRvf7dbZi8vJmK5oYJuOuuu9rk/
         4xEaklrTUatVAOVrej6sS8O5l3CJEihN90P9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742841; x=1783347641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5BshBFA+jYvWOFgvR8eHBwTzEi871Wd0OvaMdvfkH8=;
        b=nIGuSR26bKu4U4IgQwec5Ay67oDTUxEGyyv0e7q3Lj6L8akfZmQByAc/YAgLiRGjPo
         HqLQvfj6T1/4Iags+shJ9c9/px8gwwRusN0bUt4Q+BnwN9kEJSmrksxQ3dLR2nYX3O6t
         1hPjqcDvYCjrDGsgT5/kJtX5m/K+Z1uUxLWXHGfwwm+TUv8d+8ZtJF1rdaLs8TfKZcL3
         OgVCqys9GCDKF9eUtnBFagR5hQh0RTCILlaa0VBmzmkYHLJQ1ehECyLpffBq51jXyE4y
         dHCNMgwsqvF/yia5Ii51CQ++64gmP2DasEhbZVzSsvH3PN6zofb0k5Fe23MXJQh5XBxW
         qgtA==
X-Gm-Message-State: AOJu0YwVX2KPvL6TWDvUl02RZpw+IMrzFpy9NA07mLh9p6FWqs0HOMwj
	wPll78tXQDxc4vASvw2I6Vy1pBtBOSBMgXJ/O8pcSppdj1JCItLLF+GnHVEzfK46WbxAXpesPll
	FC18ko1g=
X-Gm-Gg: AfdE7clu6O4no4BJaISNnqmdhNGUCMGYeGYNbDHCTYHrgl/agyVjv8rRDxIMDmyHQmX
	aD1vsDFV19/gLhWAMfeCn8vVkHI07aCAXS/1UR3WM0PL+FDmgEg/ebe3Sp6c+2rPRlwMBKnvthi
	GzhLu+zqz47A61rwSpNfgkkBv/LBsaKuCmzIe/7i9iIOIl+SHoOPCzx02wnXPv8ec1oTHG84hRU
	STsR7RwBtEJ55v9t4klAJ5+vXwTGfIcSCItsHi4fBVdkiVKrSu1Q3aoD5a3GULJyv7lHBh02+s+
	ZEpsu96q53UD9QhfJYqYddLsjeCH94keh7k46EUCb/qSXFdq0OOtmWxCrgwXnVJF0wxuUjyW5bn
	W7VCVGggkVlwChtTZ9WY0AX0jSInC966cm/kYU5y6Wk4DF4wwTuQ7wMxeuLOexcPxQ4tGBTOpd/
	4mqXO1UqwA+K2VaVrqJgsxgel4Tn4r/6u94JIy1VouZsmiN9W0msixq7od7rniJp6EjyAje7NNN
	YPEdarLbCrw1w3/56vYkYw=
X-Received: by 2002:a05:6000:2687:b0:473:1a35:7aa0 with SMTP id ffacd0b85a97d-4731a357b3bmr7580631f8f.5.1782742840398;
        Mon, 29 Jun 2026 07:20:40 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/19] python3: fix CVE-2026-4224
Date: Mon, 29 Jun 2026 16:20:02 +0200
Message-ID: <046099f1fc88835dc7da62674403671c679f71b1.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239805

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-4224.
https://nvd.nist.gov/vuln/detail/CVE-2026-4224

Upstream fix:
  https://github.com/python/cpython/commit/642865ddf4b232da1f3b1f7abcfa3254c4bfe785

Tested with ptest:
Before: PASSED: 40007, FAILED: 0, SKIPPED: 1877
After: PASSED: 40006, FAILED: 0, SKIPPED: 1877

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-4224.patch        | 121 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4224.patch b/meta/recipes-devtools/python/python3/CVE-2026-4224.patch
new file mode 100644
index 00000000000..09dd2dda003
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4224.patch
@@ -0,0 +1,121 @@
+From ca301e24e20d1d9d58bbd432ff103cab2cb87128 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Wed, 8 Apr 2026 11:27:39 +0100
+Subject: [PATCH] gh-145986: Avoid unbound C recursion in `conv_content_model`
+ in `pyexpat.c` (CVE-2026-4224) (GH-145987) (#146000)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* [3.11] gh-145986: Avoid unbound C recursion in `conv_content_model` in `pyexpat.c` (CVE-2026-4224) (GH-145987)
+
+Fix C stack overflow (CVE-2026-4224) when an Expat parser
+with a registered `ElementDeclHandler` parses inline DTD
+containing deeply nested content model.
+
+---------
+(cherry picked from commit eb0e8be3a7e11b87d198a2c3af1ed0eccf532768)
+(cherry picked from commit e5caf45faac74b0ed869e3336420cffd3510ce6e)
+
+Co-authored-by: Stan Ulbrych <89152624+StanFromIreland@users.noreply.github.com>
+Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
+
+* Update Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
+
+---------
+
+Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
+
+CVE: CVE-2026-4224
+Upstream-Status: Backport [https://github.com/python/cpython/commit/642865ddf4b232da1f3b1f7abcfa3254c4bfe785]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Lib/test/test_pyexpat.py                       | 18 ++++++++++++++++++
+ ...6-03-14-17-31-39.gh-issue-145986.ifSSr8.rst |  4 ++++
+ Modules/pyexpat.c                              |  9 ++++++++-
+ 3 files changed, 30 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
+
+diff --git a/Lib/test/test_pyexpat.py b/Lib/test/test_pyexpat.py
+index 38f951573f0..37d9086f40a 100644
+--- a/Lib/test/test_pyexpat.py
++++ b/Lib/test/test_pyexpat.py
+@@ -675,6 +675,24 @@ class ChardataBufferTest(unittest.TestCase):
+         parser.Parse(xml2, True)
+         self.assertEqual(self.n, 4)
+ 
++class ElementDeclHandlerTest(unittest.TestCase):
++    def test_deeply_nested_content_model(self):
++        # This should raise a RecursionError and not crash.
++        # See https://github.com/python/cpython/issues/145986.
++        N = 500_000
++        data = (
++            b'<!DOCTYPE root [\n<!ELEMENT root '
++            + b'(a, ' * N + b'a' + b')' * N
++            + b'>\n]>\n<root/>\n'
++        )
++
++        parser = expat.ParserCreate()
++        parser.ElementDeclHandler = lambda _1, _2: None
++        with support.infinite_recursion():
++            with self.assertRaises(RecursionError):
++                parser.Parse(data)
++
++
+ class MalformedInputTest(unittest.TestCase):
+     def test1(self):
+         xml = b"\0\r\n"
+diff --git a/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst b/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
+new file mode 100644
+index 00000000000..cb9dbadb72d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
+@@ -0,0 +1,4 @@
++:mod:`xml.parsers.expat`: Fixed a crash caused by unbounded C recursion when
++converting deeply nested XML content models with
++:meth:`~xml.parsers.expat.xmlparser.ElementDeclHandler`.
++This addresses `CVE-2026-4224 <https://www.cve.org/CVERecord?id=CVE-2026-4224>`_.
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index 79492ca5c4f..8673540f358 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -3,6 +3,7 @@
+ #endif
+ 
+ #include "Python.h"
++#include "pycore_ceval.h"           // _Py_EnterRecursiveCall()
+ #include "pycore_runtime.h"         // _Py_ID()
+ #include <ctype.h>
+ 
+@@ -578,6 +579,10 @@ static PyObject *
+ conv_content_model(XML_Content * const model,
+                    PyObject *(*conv_string)(const XML_Char *))
+ {
++    if (_Py_EnterRecursiveCall(" in conv_content_model")) {
++        return NULL;
++    }
++
+     PyObject *result = NULL;
+     PyObject *children = PyTuple_New(model->numchildren);
+     int i;
+@@ -589,7 +594,7 @@ conv_content_model(XML_Content * const model,
+                                                  conv_string);
+             if (child == NULL) {
+                 Py_XDECREF(children);
+-                return NULL;
++                goto done;
+             }
+             PyTuple_SET_ITEM(children, i, child);
+         }
+@@ -597,6 +602,8 @@ conv_content_model(XML_Content * const model,
+                                model->type, model->quant,
+                                conv_string,model->name, children);
+     }
++done:
++    _Py_LeaveRecursiveCall();
+     return result;
+ }
+ 
+-- 
+2.34.1
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index bf0e1702d54..06dbc8e892d 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-6019_p1.patch \
            file://CVE-2026-6019_p2.patch \
            file://CVE-2025-13462.patch \
+           file://CVE-2026-4224.patch \
            "
 
 SRC_URI:append:class-native = " \

