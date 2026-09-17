Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48908C982E4
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1568.1789682878085068626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ia8bL24z;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so650845e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682876; x=1790287676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dpp3t7n7ijUwiNXRGahxvwJ9QCSQogxtbKES7nGqS+s=;
        b=ia8bL24zqM40/SwcthS3KnL/LtrMQljL1assqoR+/agFpDPGCWNoKdDaIWc1vTV3VO
         pp3Tlmaa/9tagbrDhdtJJ3pA3Tcfl+TZkfGbGk6iJQkZ/FjCxzRsY2ajeIh6IAWaicjf
         VyoYiAVdqWe0qCTfRhz8iF/hMvx/2ppIqRSBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682876; x=1790287676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dpp3t7n7ijUwiNXRGahxvwJ9QCSQogxtbKES7nGqS+s=;
        b=VmSPk+1WwZ63egCJ+5gSvOBReU/wmSz5Fl2Mx+EJOIK1zdD1hA2PCZzoSfxKO0Tzx7
         AXzmkUXFkbvpxr5lGjtvlC3QTUKzkdHEhuT0V3I+GDF0y+KAlmcZXj6mi7J3GvXcZJSt
         B3qDezwmXNbTT7ittwwSeAJh6w3/K+ItB9B9cvj/9E/u/aghcwbNhatoesZ1Jn1B5xtt
         RLj9QO5WPxcF5jkQko/YlQylhOfno3tGlODW3av60Txu4WFfl7xL9WH5mV1AVQv5u/Pw
         L+ykZ3gNREZvQ8NYbFz6MrZjn6/E48PLxy97inMWE5FvcB5zZ/KlBb7DOBeso6YYuJiW
         e73Q==
X-Gm-Message-State: AFuF++mRQ9zIcsjJMZ//Hn4U0dIBT6b6G7iLpdF6xQtXacvyQ0rNPXeL
	LaGC3mr+EoUbUqWQK4KiRC/5sBqJ5wF07k9e/VK9SZZuGppJztLHYZLT9m6ApafX3auyduJ74j5
	zT2Xj7go=
X-Gm-Gg: AYBFou2baBpbnIp8wh4M2z2+N4/lE7+1ec/Dx/PWTM7q+NUAQlT57rouK1XXEe/ASI3
	yyRmseqbzBpy0WqaIbvIVcOcFCluXVgL+Xi9QNCUSHu9oNTd+D1vvk5BOEnirYv9mOQR1kSlGgS
	Mu64ET2rJU1pscFgTiyd38XK0pD0Vlw8MBsyNdiHPlYdupUdpt+orR+CekX6NJOCNnjfJxiFsAA
	CXP+TZzox6id//Hx+9Kkh2FitUjYgFKlNLvArRT2MLouZLFYuw6B/nqTNTUkgqm8+XdpyHNAQ7I
	7ExSCQdvhWO4miRgs5K8ng4pUh9UqDQ/Wle1JhbTMI4LOEzKp7BHHVHLcbQ/nbTCSYsno7WCokH
	tP/xTIYM9/evdKEOw70tQgZWeEuYJ+xTgbS1UqYwz0Sp+4tJDCsn7Cz35QcOtuistotk8jSHcw4
	S8OPK6XBu/btVDU0ci+RXlfybbRi8AvNwOnJoUgEFF8AvD6ssVkVMdt3fsk8mxpibUtlWrH7j9X
	k5wS+tK70WluBaHqrHGjhpxnpUm7jyOqFgWPybGm8mOrRRany5L/PJEkYlR78BsXez0fJDBrZ0=
X-Received: by 2002:a05:600c:81c8:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49fc58581bfmr2403965e9.31.1789682876344;
        Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/79] gnutls: fix CVE-2026-5419
Date: Fri, 18 Sep 2026 00:05:58 +0200
Message-ID: <3fd9a75370faf690d9936e13cb541be2b78a4d0b.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246108

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-5419.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-5419

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a009997b081a1ab

Tested with ptes

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed patch unneeded changes]
---
 .../gnutls/gnutls/CVE-2026-5419.patch         | 248 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
new file mode 100644
index 00000000000..714814eee2c
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
@@ -0,0 +1,248 @@
+From 2f3732538d7d8e1ae255ca68c20efc61a1d5b3e2 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 4 Sep 2026 09:17:32 +0000
+Subject: [PATCH] gnutls_cipher_decrypt3: make PKCS#7 unpadding branch free
+
+This tries to make the logic of PKCS#7 padding removal constant-time,
+by removing potential branching operations.
+
+CVE: CVE-2026-5419
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a009997b081a1ab]
+
+Backport Changes:
+- Adjusted the upstream hunk to match the GnuTLS 3.8.12 code layout.
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
+ lib/crypto-api.c  |  54 +++++++++++++++++------
+ lib/libgnutls.map |   2 +
+ tests/Makefile.am |   2 +-
+ tests/pkcs7-pad.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 153 insertions(+), 14 deletions(-)
+ create mode 100644 tests/pkcs7-pad.c
+
+diff --git a/lib/crypto-api.c b/lib/crypto-api.c
+index 01539d5b52..32143e9de0 100644
+--- a/lib/crypto-api.c
++++ b/lib/crypto-api.c
+@@ -498,6 +498,39 @@ error:
+ 	return ret;
+ }
+ 
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
++
+ /**
+  * gnutls_cipher_decrypt3:
+  * @handle: is a #gnutls_cipher_hd_t type
+@@ -532,22 +565,17 @@ int gnutls_cipher_decrypt3(gnutls_cipher_hd_t handle, const void *ctext,
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
+index 955704e..5cc12c8 100644
+--- a/lib/libgnutls.map
++++ b/lib/libgnutls.map
+@@ -1574,4 +1574,6 @@ GNUTLS_PRIVATE_3_4 {
+ 	_gnutls_pathbuf_append;
+ 	_gnutls_pathbuf_truncate;
+ 	_gnutls_pathbuf_deinit;
++	# needed by tests/pkcs7-pad
++	_gnutls_pkcs7_unpad;
+ } GNUTLS_3_4;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index ab2685c..1304d2f 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -241,7 +241,7 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
+ 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
+ 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-free \
+ 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
+-	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 pkcs7-pad \
+ 	 mini-dtls-fragments
+ 
+ ctests += tls-channel-binding
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index d513752072c..538fd9c9e0d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42011_p2.patch \
            file://CVE-2026-42010.patch \
            file://CVE-2026-33845.patch \
+           file://CVE-2026-5419.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

