Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487DFC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10324.1787155069346837434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YKQecqxh;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4815bce4652so771663f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155068; x=1787759868; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=istQEhrxfvxKENC/LPuaNQX9ubPzRjIV0+lAg2keYvg=;
        b=YKQecqxh4tnaRqCUBkf9O9FIi+55OZxEi19ikipDHw3cU+FFJ1TZ+i0L9R1pFX/1PN
         LlVtxlw32q1P4I6kiQL0/qfrzrv89gd0/XBlvKzIZL7uZX5gKzkJDZdtm0TJRVyQPh+F
         hk63eM6yfl3FPtshXf29PxgkGdcZRsH7tpX6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155068; x=1787759868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=istQEhrxfvxKENC/LPuaNQX9ubPzRjIV0+lAg2keYvg=;
        b=jfqpkJKnsoCm9G1KQRPF/rgUGNq1KTGeo/xAdsJN/gJn1l94Zre5BLLGJB4F+EI6Kt
         99uwJt2aWTYziSD6NE/GrwXGIrOX025L8l5anum2QNdvNsq9HRUyh3jS9d5i2QeJ9Z5B
         quMZ+bV9RBTO9b3ZKohWyWoqCo4Ucyg0hSG1ha09f/zwkzf6M3SgQjjQzpL7rs5cZ9K1
         e88wQnSUqOnMlKJ++fHIFHA7YQtWIVz3lbwtxNM/2ZDYX77uZnRaUghD6eXT1si0eBGR
         F/0QoXr6DMGhdS3AwlgeOxThM4jDAwCPsfVDzjB6Xmwk7VnPN7cJzWQ4Q3BfPsB8o5BY
         Zsww==
X-Gm-Message-State: AFuF++ml/9bi3U/xU2OIKt+icJiImaiUmyZ4rNAPNabClcE3xtYjV05T
	1VPDNPHeTx2XydGtQEAbFeLpHgHBFvz3dDeAuGH/LImW6CVSyIyVbUP0cbCzI3ugybFuubiiOkU
	uX973jlA=
X-Gm-Gg: AR+sD11XnaEcZkokLZxpeXlPDXUlHx1GwCH9CeclhaHJYBgwpy5OaUtCtZypouG0uSm
	z/Y6q96KKPouXFYLOwJpdyfIIJ7ecJ31Wf7714dsz5D6Q9KlXKRWo0IdcUMko1vznU0IsT7UQEx
	d26ZYYmrBKbjA0c/QgkNDguJql3shmgNYRPylQj1eiQcIE7eaJbyjIvsgiWiG0m/T5YZve8upf6
	2AyUiHBJhCK+GCZd/t3EKgepzQ7y3mrPCI40+fYWoCG3+9ynL1I3sIid2rJKpMNSoYOYpqpOj1b
	CXBtDMFesywRpWloWdgd0Tv2m2n29zX1hXUZbQBKJlGRzbAGnggYIAtv+5Nu6p4OXXy1q/vzY6D
	Fo0/yZILXPtiw8jvJ2/amQijBSDLkST45nqT3LKRbje6GNBRV50isKjxVyXrEvJT4Zy9GUThaDW
	RkTUHYYOl4miF4So4AGKz57IWHwxAi+46wfoePDmvFdAfTLg20KxbuHioWOOl4tBl0mYFAcT2Pg
	ojHL+qyEpY6dzY2PtDuTTZs2hJ0yoMQBxUH/39pbY8vco/zB8L8HM2Ulh1JZZjr0JGHYm1L/rCF
	ScpNv2hIF5yQU4tR8CgBPyYYOLCmKSVd/Ix9XhVvMipBa00GJS0=
X-Received: by 2002:a05:6000:4811:b0:47f:8fc8:a8b1 with SMTP id ffacd0b85a97d-482b1fd9d3dmr10694218f8f.14.1787155067508;
        Wed, 19 Aug 2026 08:57:47 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:46 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/37] python3: fix CVE-2026-7210
Date: Wed, 19 Aug 2026 17:56:48 +0200
Message-ID: <f7fe7c7a4732523b52620cd56aa4567c743f1c4b.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243753

From: Amaury Couderc <amaury.couderc@est.tech>

CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
An attacker can craft XML input that forces O(n²) hash collisions in
libexpat's internal name dictionary, causing excessive CPU consumption.

The previous mitigation seeded libexpat's hash function with only 4
bytes of entropy, which is insufficient against a determined attacker.
This patch upgrades to XML_SetHashSalt16Bytes (libexpat >= 2.8.0),
providing a full 16-byte secret. Older expat versions fall back
gracefully to the legacy XML_SetHashSalt via a runtime NULL check.

Backport patch to fix CVE-2026-7210.
https://nvd.nist.gov/vuln/detail/CVE-2026-7210

Upstream fix:
  https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442fcd495391e4

-- Changes from Upstream --

Replace compile-time version checks with runtime detection of the
XML_SetHashSalt16Bytes function using #pragma weak. This allows using
backported security fixes from expat even when version macros haven't
been bumped (in thus case expat 2.6.4 with CVE-2026-41080).

- Add weak symbol declaration for XML_SetHashSalt16Bytes
- Convert newxmlparseobject() version check to runtime NULL check
- Convert pyexpat_exec() CAPI export check to runtime NULL check

Tested with ptest:
  Before: PASSED: 40019, FAILED: 0, SKIPPED: 1882
  After: PASSED: 40020, FAILED: 0, SKIPPED: 1882

CVE: CVE-2026-7210

(From OE-Core rev: d753c46085c9d31f3b68d59f863855c909a6f400)

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../python/python3/CVE-2026-7210.patch        | 148 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
new file mode 100644
index 00000000000..029eb713e42
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
@@ -0,0 +1,148 @@
+From 2ed6138dea0bc94c726f879501e4525712e885d1 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 10 May 2026 18:36:26 +0100
+Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in
+ `pyexpat`/`_elementtree` when possible (#149023)
+
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442fcd495391e4]
+
+[yocto: Use weak symbol detection for XML_SetHashSalt16Bytes instead of
+XML_COMBINED_VERSION >= 20800, since our backported expat 2.6.4 provides
+the function but does not bump the version macros.]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Include/pyexpat.h                             |  3 +++
+ Include/pyhash.h                              |  8 +++++---
+ .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst |  3 +++
+ Modules/_elementtree.c                        |  8 ++++++--
+ Modules/pyexpat.c                             | 22 ++++++++++++++++------
+ 5 files changed, 33 insertions(+), 11 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
+
+diff --git a/Include/pyexpat.h b/Include/pyexpat.h
+index 04548b7684a..d28d6828975 100644
+--- a/Include/pyexpat.h
++++ b/Include/pyexpat.h
+@@ -57,6 +57,9 @@ struct PyExpat_CAPI
+         XML_Parser parser, unsigned long long activationThresholdBytes);
+     XML_Bool (*SetAllocTrackerMaximumAmplification)(
+         XML_Parser parser, float maxAmplificationFactor);
++    /* might be NULL for expat < 2.8.0 */
++    XML_Bool (*SetHashSalt16Bytes)(
++        XML_Parser parser, const uint8_t entropy[16]);
+     /* always add new stuff to the end! */
+ };
+ 
+diff --git a/Include/pyhash.h b/Include/pyhash.h
+index 182d223fab1..ec359bd2f35 100644
+--- a/Include/pyhash.h
++++ b/Include/pyhash.h
+@@ -39,14 +39,14 @@ PyAPI_FUNC(Py_hash_t) _Py_HashBytes(const void*, Py_ssize_t);
+  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
+  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
+  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one Py_hash_t
+- *   ........ ........ eeeeeeee  pyexpat XML hash salt
++ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
+  *
+  * memory layout on 32 bit systems
+  *   cccccccc cccccccc cccccccc  uc
+  *   ppppssss ........ ........  fnv -- two Py_hash_t
+  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
+  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one Py_hash_t
+- *   ........ ........ eeee....  pyexpat XML hash salt
++ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
+  *
+  * (*) The siphash member may not be available on 32 bit platforms without
+  *     an unsigned int64 data type.
+@@ -71,7 +71,9 @@ typedef union {
+         Py_hash_t suffix;
+     } djbx33a;
+     struct {
+-        unsigned char padding[16];
++        /* 16 bytes for XML_SetHashSalt16Bytes */
++        uint8_t hashsalt16[16];
++        /* 4/8 bytes for legacy XML_SetHashSalt */
+         Py_hash_t hashsalt;
+     } expat;
+ } _Py_HashSecret_t;
+diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
+new file mode 100644
+index 00000000000..d1b5b368684
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
+@@ -0,0 +1,3 @@
++Improved protection against XML hash-flooding attacks in
++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python is
++compiled with libExpat 2.8.0 or later.
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index 56d1508af13..941376613b0 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParserObject *self, PyObject *target,
+         PyErr_NoMemory();
+         return -1;
+     }
+-    /* expat < 2.1.0 has no XML_SetHashSalt() */
+-    if (EXPAT(st, SetHashSalt) != NULL) {
++    // Prefer 16-byte entropy, only expat >= 2.8.0. See gh-149018
++    if (EXPAT(st, SetHashSalt16Bytes) != NULL) {
++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
++                                      _Py_HashSecret.expat.hashsalt16);
++    }
++    else if (EXPAT(st, SetHashSalt) != NULL) {
+         EXPAT(st, SetHashSalt)(self->parser,
+                            (unsigned long)_Py_HashSecret.expat.hashsalt);
+     }
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index 79492ca5c4f..47e3a1b2c00 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -14,6 +14,11 @@
+ 
+ #include "pyexpat.h"
+ 
++/* Use weak symbol to detect XML_SetHashSalt16Bytes at link time.
++   This allows using the backported function from expat even when the
++   version macros have not been bumped (e.g. expat 2.6.4 + CVE-2026-41080). */
++#pragma weak XML_SetHashSalt16Bytes
++
+ /* Do not emit Clinic output to a file as that wreaks havoc with conditionally
+    included methods. */
+ /*[clinic input]
+@@ -1388,10 +1393,16 @@ newxmlparseobject(pyexpat_state *state, const char *encoding,
+         Py_DECREF(self);
+         return NULL;
+     }
+-#if XML_COMBINED_VERSION >= 20100
+-    /* This feature was added upstream in libexpat 2.1.0. */
+-    XML_SetHashSalt(self->itself,
+-                    (unsigned long)_Py_HashSecret.expat.hashsalt);
++    /* Prefer 16-byte entropy (expat >= 2.8.0 or backported). */
++    if (XML_SetHashSalt16Bytes != NULL) {
++        XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt16);
++    }
++#if XML_COMBINED_VERSION >= 20100
++    else {
++        /* This feature was added upstream in libexpat 2.1.0. */
++        XML_SetHashSalt(self->itself,
++                        (unsigned long)_Py_HashSecret.expat.hashsalt);
++    }
+ #endif
+     XML_SetUserData(self->itself, (void *)self);
+     XML_SetUnknownEncodingHandler(self->itself,
+@@ -2257,6 +2267,12 @@ pyexpat_exec(PyObject *mod)
+ #else
+     capi->SetHashSalt = NULL;
+ #endif
++    /* Detect at runtime via weak symbol */
++    if (XML_SetHashSalt16Bytes != NULL) {
++        capi->SetHashSalt16Bytes = XML_SetHashSalt16Bytes;
++    } else {
++        capi->SetHashSalt16Bytes = NULL;
++    }
+ #if XML_COMBINED_VERSION >= 20600
+     capi->SetReparseDeferralEnabled = XML_SetReparseDeferralEnabled;
+ #else
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index de174f7bfdc..b6ceb0c6343 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
            file://CVE-2026-9669.patch \
+           file://CVE-2026-7210.patch \
            "
 
 SRC_URI:append:class-native = " \

