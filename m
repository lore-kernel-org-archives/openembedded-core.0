Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4053C98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2920.1790154700984996218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BVfej4Xm;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so493610f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154699; x=1790759499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7nLB7QdJ23Lxe1oIga8kwFF+1Iw6bJAx/zANuuaE0Ac=;
        b=BVfej4XmC3DzEAw2SpZfyVitpW0QBbPOYoVD9Zc2iXfCJc1wO2qAS5j+W7jQtQDPb8
         cqiQsJmWZTVU4QdFO/7BEwSqHRXHRFHar3+eaCegDi5LIFLIVJ77FTS7Z28wN4Z6GGKK
         CMg5cIeVMDzeZjhNx4dkHXuyyYdW9nnOPp8yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154699; x=1790759499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7nLB7QdJ23Lxe1oIga8kwFF+1Iw6bJAx/zANuuaE0Ac=;
        b=SxA9iZHgKCH3Xg7FOb6aX4GpIYD6rwBytb0u5YSlE9VKaqTw1LM4m/pKzAHWfx+aac
         5tC8pcv5yupGThE1sAyrPiLBilWweQJKrw64oc3MnbA8E3smOFjVBGtKO+fGyyKgtgmh
         za7Xy1EULz2UGLz/nQl2ir9SYVLm5vzQEZnxNEwMQYHEQvOrPeafU5Yi4Ph0GUvDBq7D
         jnIOQS9An2uGBmzTch66pCTCYyCIgPrn+82WPA1NUdPkUbRPqsIpK9kGLYrbIhwSMk02
         C2LY4mVPd3cedV15DHTqlIkk9D5XhHE4GVVl3aJLLphIUvlVcgR6Fxg6UZ7tfJhy0fjB
         5odA==
X-Gm-Message-State: AFuF++nTigihkrjaaRD3GQMU7BvsLKPStqlnhAklm4g2GHMNrhTQIG8h
	iut4HH0wb+5Vu59DLIpLW7x4lJ0zeVw4rFjaZBHoIuu29ngtsUM1b4fQkuDU5RoUQwWTCti8IWr
	BLh2HRQE=
X-Gm-Gg: AYBFou0Jcmw16Wd1MGbSTJa7AZ6RdykvPp97JN20jzqyGQnbZjQ2o5IbTAW79qpqvrD
	4+6BxtFB8Gfw1LsXBfcZNdABfMY9hVz+RAo4aTlRheaemgq+63kJFTpZ4PgMLleFqVxFMVlAcUT
	G9fJ/kmLdgz2rVcex6HDEHoE0MvnGQjcvfIvamnBVQWN0II956Ak4/LfkQIvviTfeE3xiWp7nSC
	/mcChnxcw9lPvi5mj+bkpaEJ2I2kEnIbedCxEmctIM18GQYHTBpdfVg9goxSQou4ihZ1RllQOut
	QkVP05r+zIODK5J6n6cTBlOlFMKwG2m7PZumVPNK5uuwowhj7GaXohzktOzVJ/QTgu4eQS+uPL/
	g5Ds4qNbj3Dl1NsFtg+zisDsF5A7xKdxRU7R2uN7wUWCcDoXhO1tg/ZgSzHwOdXi5kM2zjRBb2S
	zB5+LVOSk2vuv7dyi4PBGGmr08DLfUAi4kqu9nljfiVibgbtHsVWM5T3hRhsBtblvYmT97qU1FR
	y3sMNFOhUXQm+Axwpmo9qtyjsYfcraxpVDTu7GxSpGd1e1H5XT8FNAQQGuG9LEbKbdpakkJXcgC
	lIW+1CTlVH6iM09ROw==
X-Received: by 2002:a05:600c:a06:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-49fdec980bamr28645805e9.0.1790154699193;
        Wed, 23 Sep 2026 02:11:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/48] gnutls: fix CVE-2026-5419
Date: Wed, 23 Sep 2026 11:10:21 +0200
Message-ID: <40a2e6160bd450599ca6ebc5fb308d38e5e7a888.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246481

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-5419.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-5419

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a009997b081a1ab

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-5419.patch         | 247 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 2 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
new file mode 100644
index 00000000000..7a7f4469dd8
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
@@ -0,0 +1,247 @@
+From 0ff1cf201404afc6b227f9ddfea376866770a9d3 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 4 Sep 2026 09:16:30 +0000
+Subject: [PATCH] gnutls_cipher_decrypt3: make PKCS#7 unpadding branch free
+
+This tries to make the logic of PKCS#7 padding removal constant-time,
+by removing potential branching operations.
+
+CVE: CVE-2026-5419
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a009997b081a1ab]
+
+Backport Changes:
+- Adjusted the upstream hunk to match the GnuTLS 3.8.4 code layout.
+- Drop .gitignore from the backport.
+
+Reported-by: Doria Tang of Stony Brook University
+Fixes: #1815
+Fixes: CVE-2026-5419
+Fixes: GNUTLS-SA-2026-04-29-13
+CVSS: 3.7 Low CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+
+---
+ lib/crypto-api.c  |  53 ++++++++++++++++------
+ lib/libgnutls.map |   2 +
+ tests/Makefile.am |   2 +-
+ tests/pkcs7-pad.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 152 insertions(+), 14 deletions(-)
+ create mode 100644 tests/pkcs7-pad.c
+
+diff --git a/lib/crypto-api.c b/lib/crypto-api.c
+index bb5c3ec..7ae0ef2 100644
+--- a/lib/crypto-api.c
++++ b/lib/crypto-api.c
+@@ -497,6 +497,38 @@ error:
+ 	}
+ 	return ret;
+ }
++/* If succeeds, returns the number of padding bytes to be removed;
++ * zero otherwise.
++ */
++unsigned int _gnutls_pkcs7_unpad(const uint8_t *block, unsigned int block_size)
++{
++	uint8_t padding = block[block_size - 1];
++	volatile unsigned int mask = ~0;
++	volatile unsigned int count = 0;
++
++	/* Count consecutive PADDING bytes from the end, in a
++	 * constant-time manner.
++	 */
++	for (size_t i = block_size; i > 0; i--) {
++		volatile unsigned int mask2;
++
++		mask2 = -(unsigned int)(block[i - 1] == padding);
++		mask2 &= -(unsigned int)(count < padding);
++
++		/* MASK is initially ~0 and will be flipped to 0 upon first
++		 * non-padding bytes.
++		 */
++		mask &= mask2;
++		count += 1 & mask;
++	}
++
++	/* PADDING == 0 is effectively excluded here, given COUNT
++	 * will never be 0.
++	 */
++	mask = -(unsigned int)(count <= block_size);
++	mask &= -(unsigned int)(count == padding);
++	return count & mask;
++}
+ 
+ /**
+  * gnutls_cipher_decrypt3:
+@@ -532,22 +564,17 @@ int gnutls_cipher_decrypt3(gnutls_cipher_hd_t handle, const void *ctext,
+ 	if (_gnutls_cipher_type(h->ctx_enc.e) == CIPHER_BLOCK &&
+ 	    (flags & GNUTLS_CIPHER_PADDING_PKCS7)) {
+ 		uint8_t *p = ptext;
+-		uint8_t padding = p[*ptext_len - 1];
+-		if (!padding ||
+-		    padding > _gnutls_cipher_get_block_size(h->ctx_enc.e)) {
+-			return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);
+-		}
+-		/* Check that the prior bytes are all PADDING */
+-		for (size_t i = *ptext_len - padding; i < *ptext_len; i++) {
+-			if (padding != p[*ptext_len - 1]) {
+-				return gnutls_assert_val(
+-					GNUTLS_E_DECRYPTION_FAILED);
+-			}
+-		}
++		size_t block_size = _gnutls_cipher_get_block_size(h->ctx_enc.e);
++		uint8_t *block = &p[*ptext_len - block_size];
++		unsigned int padding = _gnutls_pkcs7_unpad(block, block_size);
++		volatile unsigned int mask;
++
++		mask = -(unsigned int)(padding == 0);
++		ret = GNUTLS_E_DECRYPTION_FAILED & mask;
+ 		*ptext_len -= padding;
+ 	}
+ 
+-	return 0;
++	return ret;
+ }
+ 
+ /**
+diff --git a/lib/libgnutls.map b/lib/libgnutls.map
+index b02babf..f269ff2 100644
+--- a/lib/libgnutls.map
++++ b/lib/libgnutls.map
+@@ -1551,4 +1551,6 @@ GNUTLS_PRIVATE_3_4 {
+ 	_gnutls_pathbuf_append;
+ 	_gnutls_pathbuf_truncate;
+ 	_gnutls_pathbuf_deinit;
++	# needed by tests/pkcs7-pad
++	_gnutls_pkcs7_unpad;
+ } GNUTLS_3_4;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f227e92..32c5335 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -238,7 +238,7 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
+ 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
+ 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-free \
+ 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
+-	 psk-importer privkey-derive dh-compute2 ecdh-compute2
++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 pkcs7-pad
+ 
+ ctests += tls-channel-binding
+ 
+diff --git a/tests/pkcs7-pad.c b/tests/pkcs7-pad.c
+new file mode 100644
+index 0000000..d4c3798
+--- /dev/null
++++ b/tests/pkcs7-pad.c
+@@ -0,0 +1,109 @@
++/*
++ * Copyright (C) 2026 Red Hat, Inc.
++ *
++ * This file is part of GnuTLS.
++ *
++ * GnuTLS is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 3 of the License, or
++ * (at your option) any later version.
++ *
++ * GnuTLS is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with GnuTLS.  If not, see <https://www.gnu.org/licenses/>.
++ */
++
++/* Test that _gnutls_pkcs7_unpad is branch-free, using valgrind */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <stdint.h>
++#include <string.h>
++
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++#include <valgrind/memcheck.h>
++#endif
++
++#include "utils.h"
++
++static inline void _gnutls_memory_mark_undefined(void *addr, size_t size)
++{
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++	if (RUNNING_ON_VALGRIND)
++		VALGRIND_MAKE_MEM_UNDEFINED(addr, size);
++#endif
++}
++
++static inline void _gnutls_memory_mark_defined(void *addr, size_t size)
++{
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++	if (RUNNING_ON_VALGRIND)
++		VALGRIND_MAKE_MEM_DEFINED(addr, size);
++#endif
++}
++
++extern unsigned int _gnutls_pkcs7_unpad(const uint8_t *block,
++					unsigned int block_size);
++
++static unsigned int wrap_pkcs7_unpad(uint8_t *block, unsigned int block_size)
++{
++	unsigned int padding;
++
++	_gnutls_memory_mark_undefined(block, block_size);
++
++	padding = _gnutls_pkcs7_unpad(block, block_size);
++
++	_gnutls_memory_mark_defined(block, block_size);
++	_gnutls_memory_mark_defined(&padding, sizeof(padding));
++
++	return padding;
++}
++
++#define PAD 5
++
++void doit(void)
++{
++	uint8_t block[16];
++	unsigned int padding;
++
++	memset(block, 0xFF, sizeof(block));
++	memset(&block[sizeof(block) - PAD], PAD, PAD);
++
++	padding = wrap_pkcs7_unpad(block, sizeof(block));
++	if (padding != PAD)
++		fail("padding should be %d\n", PAD);
++
++	/* The last padding byte exceeds the block size */
++	block[sizeof(block) - 1] = sizeof(block) + 1;
++	padding = wrap_pkcs7_unpad(block, sizeof(block));
++	if (padding != 0)
++		fail("padding should be 0\n");
++	block[sizeof(block) - 1] = PAD;
++
++	/* The last padding byte is zero */
++	block[sizeof(block) - 1] = 0;
++	padding = wrap_pkcs7_unpad(block, sizeof(block));
++	if (padding != 0)
++		fail("padding should be 0\n");
++	block[sizeof(block) - 1] = PAD;
++
++	/* The first padding byte is invalid */
++	block[sizeof(block) - PAD] = PAD + 1;
++	padding = wrap_pkcs7_unpad(block, sizeof(block));
++	if (padding != 0)
++		fail("padding should be 0\n");
++	block[sizeof(block) - PAD] = PAD;
++
++	/* The byte before the first padding equals to PAD */
++	block[sizeof(block) - PAD - 1] = PAD;
++	padding = wrap_pkcs7_unpad(block, sizeof(block));
++	if (padding != PAD)
++		fail("padding should be %d\n", PAD);
++	block[sizeof(block) - PAD - 1] = 0xFF;
++}
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 6dbd11abaff..641289be134 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42011_p2.patch \
            file://CVE-2026-33846.patch \
            file://CVE-2026-33845.patch \
+           file://CVE-2026-5419.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

