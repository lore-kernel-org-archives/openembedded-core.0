Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EECBC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:01:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147685.1783335709800122928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=siphlxj9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2CC061A0E90
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 11:01:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF96E601A2;
	Mon,  6 Jul 2026 11:01:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E306911BBA12B;
	Mon,  6 Jul 2026 13:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ek93TSDcOSjh30HBdQPr7p+4ISOmZ46IXmTx7kd5M1M=;
	b=siphlxj9jYjOzyUSPJThIROchOYNkmKuSh0A4dR3Iu+uP555QCQiWPzolV8PricXzATUGw
	NrUXXXnZRi2rtYTpyNZeAkF7IYgjK8g8SWj2HgHm3KCW4sGJsIuBlboIADXGlN8ZGKz2Wi
	xJg5DF7j/sfRaMVXyoI7oS5Pxm4cUBbYS6yDF+hRlyikWU24+BTfy25NqHHhzj/QyLHptw
	IZPNR+M1MvupkHU1YtK73i9EppyTAkiR2eLl9jA16ZslTXgjvXN5jyi94O/b3s9E5BeagS
	EkMmR3G09AFZrDdt2Q2U8ZI2e05b3gzzArCDdpTy/rYpKOy6+b8oegyiOFAsrQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 06 Jul 2026 13:01:37 +0200
Subject: [scarthgap][PATCH 3/3] python3: fix CVE-2026-9669
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-cves-python-scarthgap-v1-3-8d51db14f7ac@bootlin.com>
References: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240255

bz2.BZ2Decompressor objects could be reused after a decompression error.
If an application caught the resulting OSError and retried with the same
decompressor, crafted input could cause the decompressor to resume from an
invalid internal state and perform out-of-bounds writes to a stack buffer.
This could crash the process when processing untrusted data.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../python/python3/CVE-2026-9669.patch             | 97 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.12.13.bb    |  1 +
 2 files changed, 98 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-9669.patch b/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
new file mode 100644
index 000000000000..933d6f410ee1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
@@ -0,0 +1,97 @@
+From 5b412e1f7bdb3e0667b2bc8b216ad216d59d8373 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 8 Jun 2026 11:55:32 +0200
+Subject: [PATCH] gh-150599: Prevent bz2 decompressor reuse after errors
+ (GH-150600)
+
+CVE: CVE-2026-9669
+Upstream-Status: Backport [https://github.com/python/cpython/commit/5755d0f083949ff3c5bf3a37e673e24e306b036e]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ Lib/test/test_bz2.py | 15 +++++++++++++++
+ Modules/_bz2module.c | 18 +++++++++++++++---
+ 2 files changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/Lib/test/test_bz2.py b/Lib/test/test_bz2.py
+index cb730a1a46e2..dcbf6a298264 100644
+--- a/Lib/test/test_bz2.py
++++ b/Lib/test/test_bz2.py
+@@ -958,6 +958,21 @@ def test_failure(self):
+         # Previously, a second call could crash due to internal inconsistency
+         self.assertRaises(Exception, bzd.decompress, self.BAD_DATA * 30)
+
++    def test_decompress_after_data_error(self):
++        data = bytes.fromhex(
++            "425a6839314159265359000000000000007fffff000000000000000000000000"
++            "00000000000000000000000000000000000000e0370000000000000000000000"
++            "000000000000000000000000000000000000000000000000000083f3"
++        )
++        bzd = BZ2Decompressor()
++        with self.assertRaisesRegex(OSError, "Invalid data stream"):
++            bzd.decompress(data)
++        # Previously, a second call could crash due to internal inconsistency
++        self.assertFalse(bzd.needs_input)
++        self.assertFalse(bzd.eof)
++        with self.assertRaisesRegex(ValueError, "previous error"):
++            bzd.decompress(b'\x00' * 18)
++
+     @support.refcount_test
+     def test_refleaks_in___init__(self):
+         gettotalrefcount = support.get_attribute(sys, 'gettotalrefcount')
+diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
+index 97bd44b4ac96..0b0916142f57 100644
+--- a/Modules/_bz2module.c
++++ b/Modules/_bz2module.c
+@@ -114,6 +114,7 @@ typedef struct {
+ typedef struct {
+     PyObject_HEAD
+     bz_stream bzs;
++    int bzerror;
+     char eof;           /* T_BOOL expects a char */
+     PyObject *unused_data;
+     char needs_input;
+@@ -453,8 +454,11 @@ decompress_buf(BZ2Decompressor *d, Py_ssize_t max_length)
+
+         d->bzs_avail_in_real += bzs->avail_in;
+
+-        if (catch_bz2_error(bzret))
++        if (catch_bz2_error(bzret)) {
++            d->bzerror = bzret;
++            d->needs_input = 0;
+             goto error;
++        }
+         if (bzret == BZ_STREAM_END) {
+             d->eof = 1;
+             break;
+@@ -621,10 +625,17 @@ _bz2_BZ2Decompressor_decompress_impl(BZ2Decompressor *self, Py_buffer *data,
+     PyObject *result = NULL;
+
+     ACQUIRE_LOCK(self);
+-    if (self->eof)
++    if (self->eof) {
+         PyErr_SetString(PyExc_EOFError, "End of stream already reached");
+-    else
++    }
++    else if (self->bzerror) {
++        // Re-entering BZ2_bzDecompress() after an error can write out of bounds.
++        PyErr_SetString(PyExc_ValueError,
++                        "Decompressor is unusable after a previous error");
++    }
++    else {
+         result = decompress(self, data->buf, data->len, max_length);
++    }
+     RELEASE_LOCK(self);
+     return result;
+ }
+@@ -658,6 +669,7 @@ _bz2_BZ2Decompressor_impl(PyTypeObject *type)
+         return NULL;
+     }
+
++    self->bzerror = 0;
+     self->needs_input = 1;
+     self->bzs_avail_in_real = 0;
+     self->input_buffer = NULL;
+--
+2.54.0
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 24ceeb30a416..fc9764b9f641 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-4224.patch \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
+           file://CVE-2026-9669.patch \
            "
 
 SRC_URI:append:class-native = " \

-- 
2.54.0


