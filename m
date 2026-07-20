Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B49FC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2866.1784568215279355773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YxVDkBMS;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4955de8797cso7666125e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568213; x=1785173013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EKnZ3ozTblM0tAoDSBQWwjCMkG7GAm7qfTq2xZkPOP4=;
        b=YxVDkBMScrPGV6+KwuhvYDD7lXmbe4iV9F5n9b7bIR4XaQhk9ooqc2AcfBApQmZzJv
         NVQs0F/QGgbUxWTccn0JZ/nn+AXMadXR8RoICWneMt0oNbfFLKMF+COHggZdqdACnO/m
         KdCJqcxzzxAdJG19hQEIlnzoWh8jgmRwwpNYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568213; x=1785173013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EKnZ3ozTblM0tAoDSBQWwjCMkG7GAm7qfTq2xZkPOP4=;
        b=fTHKQtWbGuRHbGrds5qMezQyBRG/hizlEXJlMv6iU1Dm9rNjvkX0Q4jzhZIKDdlMaH
         Fb1GYKdzrGsMRJcdJpplV75DMHkfI4qh8oLbR7NBSchDEscTy5SDJT6/2x0HJPnrXN/2
         4MInMJB8NkH3MgtY0HCA9QHrfPNJjsxMrMa2Idd3yIrHLFznkobCNJkIJqpeIL8WI/Dm
         rrzMJ/ix/oSwn/YtVKo5zFA2e2UEr1pYEq8ExXpzF5fRPUjJ2OvnDe3vMY5qwoxXpUks
         3dGM+9TjeHn9jdPnboNQfp3T5AkhOkuLcmYO2uXQUIDhMfjGDmnGWJNsMxPtYHLLn7Kt
         aoKw==
X-Gm-Message-State: AOJu0YyS+OmHgCxOWZiSACsEMwzjOT/8CVEST3t6JRSOpf+yKt8TLstg
	hc2mjaNThG0XDpWOeQQoDaKaSUwJKtXDlnlLnx26USs8e5M3Soam+Gd1LG2+nMp1vmo5KLYRYyV
	DTTEJIxA=
X-Gm-Gg: AfdE7cltOgWat/TTpcB7e34i4gpauSyyQKdPPecKXQj4iyvPTyzWtAHKEREWqsxPohe
	lMXdroPQ/abUTciwbrG4xMfru4FgV0W9nrZHZNVxjKqG+UjmW2D8cS9vUhbG1uJff2Y6dtE0usT
	GuXbOvMj7u0seieLSXSDfJSw717VUPDJT8Zfr12C1rFC8gAiD51bSjUZsJPPo021Yc1rRvuFYMV
	nhBUfaLidDLMjYdO/rp8HgSp09/TL0q5If10ym51NsLEalr0mQuIE5LV2f8GlQEt1w5SKI64Nzc
	saOGYlwG0/zdQjgQa54MH0H0gqAbJS8stFAis9jG1QZneE/n6VdPiQVOAExAdikRy23xslwPzNi
	S/M8LMaiY6vyuZ1eaLDfc1PzJ29pymUjZpSSspzmoMG7Fol0Rf33UBiIdf2xle0r/3/lK6H804Z
	z+BudYrcEeIubRUu4eBBNCvRdTDU2T/ktCgsjDBsLlH7S9YEa+t7augpKzxgkTKbND4BdbXKyBp
	6Q96PQm
X-Received: by 2002:a05:600c:1554:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4954a3dc7bcmr187274065e9.16.1784568213458;
        Mon, 20 Jul 2026 10:23:33 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/33] python3: fix CVE-2026-9669
Date: Mon, 20 Jul 2026 19:22:43 +0200
Message-ID: <226831c16d13133e89d3405b5e2298bb6571bed6.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241444

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

bz2.BZ2Decompressor objects could be reused after a decompression error.
If an application caught the resulting OSError and retried with the same
decompressor, crafted input could cause the decompressor to resume from an
invalid internal state and perform out-of-bounds writes to a stack buffer.
This could crash the process when processing untrusted data.

This CVE has a CVSS 4.0 score of 8.2. The patch (5755d0f08394) is
referenced in the CVEList database.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-9669.patch        | 96 +++++++++++++++++++
 .../python/python3_3.12.13.bb                 |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-9669.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-9669.patch b/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
new file mode 100644
index 00000000000..266c8beef05
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
@@ -0,0 +1,96 @@
+From 5b412e1f7bdb3e0667b2bc8b216ad216d59d8373 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
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
index 72daee1d0ea..de174f7bfdc 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-4224.patch \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
+           file://CVE-2026-9669.patch \
            "
 
 SRC_URI:append:class-native = " \

