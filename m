Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECBDD116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:09:51 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9916.1764688182508179615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YPy7F5DG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso4465308b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688182; x=1765292982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ew3xD+1mKi1cWLJ2zx2oKUsD2M65mZAja7Fk/nHOec=;
        b=YPy7F5DGkkGeaJU59Bh0BVH6FwiLDCGHc5+ldK1OtRuMHw/9iHPPrVY4024Bjjrtjs
         6yqAWlIN3nVCcXW7/YCUgJ2cZVXmw0eXwsB1xUWKlR6PIsQ7ZfPaYVK+jKS2le63huza
         tZH1KzmXn0jUVwwKJ4525gaMkvtd7AVyCZW48VTqgzMlZ/SyafRRbDTOmHN1hZ47lYgP
         NfFaFT4AK0Hlv4GjIGV97lD2xHplNA8iU5VwglL8wHaHcZb+3C6iJYnRhyTb0TQkt03A
         Q3fBRvNbkt6COoH2uAhuU8iKKBohK+kJh6wiVMTNNGZLNPkMNDBTw/iKmfFt6okID/KR
         JS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688182; x=1765292982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Ew3xD+1mKi1cWLJ2zx2oKUsD2M65mZAja7Fk/nHOec=;
        b=v6yPSoGB0K+0ra3R7E019FyKVxbpuQ0f+vlNNQOBWpgZijMaDJfyZspaWPbEEc+x5+
         yOuv4fUY5AMUKKcYFsiujvxeBNsdV6FyrsWr5H0DkXO/RZndvAHZzTPKD+igMU2qR45i
         14iaNHzFNlaymgjlvtR993bClZfRnzWO3sS37JHrDjBtoil6uvt+5PAGVCJbwbrU9jzs
         0tTq9X8qZtLW3vR0v5Kgr/WFFfIeD39Ye2gFSVp6M5SrYhtBgZ7PcVkXY13GsxulBAyh
         DV/Z/ugFX1JLZWA0EyYCkIoOuZRZcLMLWuGpY51oxYfiSmmzKh4tyhvkY0C/uXJRt+ib
         iwXw==
X-Gm-Message-State: AOJu0YzvP5ToxnCATPMBSywNUG32i9JSFYJ2+YhaAnAfTmNn+h9koD+x
	VTIJ2SiMy5fO8J8KUjrTnYc9Nyjc5KkRX8NZDeSgxH+dqb+Lob6IvBtnMS3ISqvagyHFldItsXo
	mpjwR
X-Gm-Gg: ASbGncszQzHAyv9kMF3JLfYw6yEGE+j5FiZItaZQ+4Uh4I7QqMmi9tZjTnwY7aZadu8
	Sm3Z7D2usOp4RX8n/phAC69CTAQrprjEd7QdRd1s1vwoRSTJ/8tHXBTg+IkgOyxVKPwhvI6UqDg
	av5K6tgKvpEDW872QjktjIvRI4Xb6nLqu41r44FhigmbEwbKnkPzuyXhD+KC4JEiUyV8TWwysEw
	Y+7k06WlbZNnRQQaoUtSAL8WV/KRovwSy8JlpVg4B0VbXVuuyhgku2CEdV20PUAxh3VOxIE2b1x
	oGZMwM/ZobwdPmWpVmkDdGJ937QoFFQfcvAcnbMRc9Me6KNg2tyZgcdMAo0h0N0QcbX3YLqcR2Q
	1cbZyPAKeT2OGXUfboxL4m0urexipxVQnGHIayvDbRIR9/VMnfwvugFWEypYFJObKDNqlrvxF7J
	uSTw==
X-Google-Smtp-Source: AGHT+IGzwooeYraE3a7fZsJSp2GGttq+BguS/lnVsn0tbRemXLITmcRXxJKqMTAcAT+EtFv+/Wbo6g==
X-Received: by 2002:a05:6a20:3ca2:b0:35c:f727:8a89 with SMTP id adf61e73a8af0-3637e0a589cmr33177654637.41.1764688181435;
        Tue, 02 Dec 2025 07:09:41 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] gnutls: patch CVE-2025-9820
Date: Tue,  2 Dec 2025 07:09:24 -0800
Message-ID: <946f776b6f7ceacf76a643c5776b0efedb000efd.1764688053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227160

From: Peter Marko <peter.marko@siemens.com>

This CVE is announced under [1].
Pick commit which mentions this CVE per [2].

[1] https://www.gnutls.org/security-new.html#GNUTLS-SA-2025-11-18
[2] https://security-tracker.debian.org/tracker/CVE-2025-9820

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2025-9820.patch         | 250 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 2 files changed, 251 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
new file mode 100644
index 0000000000..6ace251fed
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
@@ -0,0 +1,250 @@
+From 1d56f96f6ab5034d677136b9d50b5a75dff0faf5 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Tue, 18 Nov 2025 13:17:55 +0900
+Subject: [PATCH] pkcs11: avoid stack overwrite when initializing a token
+
+If gnutls_pkcs11_token_init is called with label longer than 32
+characters, the internal storage used to blank-fill it would
+overflow. This adds a guard to prevent that.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2025-9820
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1d56f96f6ab5034d677136b9d50b5a75dff0faf5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                      |   4 +
+ lib/pkcs11_write.c        |   5 +-
+ tests/Makefile.am         |   2 +-
+ tests/pkcs11/long-label.c | 164 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 172 insertions(+), 3 deletions(-)
+ create mode 100644 tests/pkcs11/long-label.c
+
+diff --git a/NEWS b/NEWS
+index 0ae3c9991..d6df70ee6 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,10 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
+ Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
+ See the end for copying conditions.
+ 
++** libgnutls: Fix stack overwrite in gnutls_pkcs11_token_init
++   Reported by Luigino Camastra from Aisle Research. [GNUTLS-SA-2025-11-18,
++   CVSS: low] [CVE-2025-9820]
++
+ ** libgnutls: Fix NULL pointer dereference when 2nd Client Hello omits PSK
+    Reported by Stefan Bühler. [GNUTLS-SA-2025-07-07-4, CVSS: medium]
+    [CVE-2025-6395]
+diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c
+index f5e9058e0..64b85a2df 100644
+--- a/lib/pkcs11_write.c
++++ b/lib/pkcs11_write.c
+@@ -28,6 +28,7 @@
+ #include "pkcs11x.h"
+ #include <x509/common.h>
+ #include "pk.h"
++#include "minmax.h"
+ 
+ static const ck_bool_t tval = 1;
+ static const ck_bool_t fval = 0;
+@@ -1199,7 +1200,7 @@ int gnutls_pkcs11_delete_url(const char *object_url, unsigned int flags)
+  * gnutls_pkcs11_token_init:
+  * @token_url: A PKCS #11 URL specifying a token
+  * @so_pin: Security Officer's PIN
+- * @label: A name to be used for the token
++ * @label: A name to be used for the token, at most 32 characters
+  *
+  * This function will initialize (format) a token. If the token is
+  * at a factory defaults state the security officer's PIN given will be
+@@ -1238,7 +1239,7 @@ gnutls_pkcs11_token_init(const char *token_url,
+ 	/* so it seems memset has other uses than zeroing! */
+ 	memset(flabel, ' ', sizeof(flabel));
+ 	if (label != NULL)
+-		memcpy(flabel, label, strlen(label));
++		memcpy(flabel, label, MIN(sizeof(flabel), strlen(label)));
+ 
+ 	rv = pkcs11_init_token(module, slot, (uint8_t *) so_pin,
+ 			       strlen(so_pin), (uint8_t *) flabel);
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index be4966f4b..8327c90ca 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -485,7 +485,7 @@ buffer_CPPFLAGS = $(AM_CPPFLAGS) \
+ if ENABLE_PKCS11
+ if !WINDOWS
+ ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
+-	global-init-override
++	global-init-override pkcs11/long-label
+ tls13_post_handshake_with_cert_pkcs11_DEPENDENCIES = libpkcs11mock2.la libutils.la
+ tls13_post_handshake_with_cert_pkcs11_LDADD = $(LDADD) $(LIBDL)
+ pkcs11_tls_neg_pkcs11_no_key_DEPENDENCIES = libpkcs11mock2.la libutils.la
+diff --git a/tests/pkcs11/long-label.c b/tests/pkcs11/long-label.c
+new file mode 100644
+index 000000000..a70bc9728
+--- /dev/null
++++ b/tests/pkcs11/long-label.c
+@@ -0,0 +1,164 @@
++/*
++ * Copyright (C) 2025 Red Hat, Inc.
++ *
++ * Author: Daiki Ueno
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
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <stdbool.h>
++#include <stdio.h>
++#include <stdlib.h>
++
++#if defined(_WIN32)
++
++int main(void)
++{
++	exit(77);
++}
++
++#else
++
++#include <string.h>
++#include <unistd.h>
++#include <gnutls/gnutls.h>
++
++#include "cert-common.h"
++#include "pkcs11/softhsm.h"
++#include "utils.h"
++
++/* This program tests that a token can be initialized with
++ * a label longer than 32 characters.
++ */
++
++static void tls_log_func(int level, const char *str)
++{
++	fprintf(stderr, "server|<%d>| %s", level, str);
++}
++
++#define PIN "1234"
++
++#define CONFIG_NAME "softhsm-long-label"
++#define CONFIG CONFIG_NAME ".config"
++
++static int pin_func(void *userdata, int attempt, const char *url,
++		    const char *label, unsigned flags, char *pin,
++		    size_t pin_max)
++{
++	if (attempt == 0) {
++		strcpy(pin, PIN);
++		return 0;
++	}
++	return -1;
++}
++
++static void test(const char *provider)
++{
++	int ret;
++	size_t i;
++
++	gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
++
++	success("test with %s\n", provider);
++
++	if (debug) {
++		gnutls_global_set_log_function(tls_log_func);
++		gnutls_global_set_log_level(4711);
++	}
++
++	/* point to SoftHSM token that libpkcs11mock4.so internally uses */
++	setenv(SOFTHSM_ENV, CONFIG, 1);
++
++	gnutls_pkcs11_set_pin_function(pin_func, NULL);
++
++	ret = gnutls_pkcs11_add_provider(provider, "trusted");
++	if (ret != 0) {
++		fail("gnutls_pkcs11_add_provider: %s\n", gnutls_strerror(ret));
++	}
++
++	/* initialize softhsm token */
++	ret = gnutls_pkcs11_token_init(
++		SOFTHSM_URL, PIN,
++		"this is a very long label whose length exceeds 32");
++	if (ret < 0) {
++		fail("gnutls_pkcs11_token_init: %s\n", gnutls_strerror(ret));
++	}
++
++	for (i = 0;; i++) {
++		char *url = NULL;
++
++		ret = gnutls_pkcs11_token_get_url(i, 0, &url);
++		if (ret < 0)
++			break;
++		if (strstr(url,
++			   "token=this%20is%20a%20very%20long%20label%20whose"))
++			break;
++	}
++	if (ret < 0)
++		fail("gnutls_pkcs11_token_get_url: %s\n", gnutls_strerror(ret));
++
++	gnutls_pkcs11_deinit();
++}
++
++void doit(void)
++{
++	const char *bin;
++	const char *lib;
++	char buf[128];
++
++	if (gnutls_fips140_mode_enabled())
++		exit(77);
++
++	/* this must be called once in the program */
++	global_init();
++
++	/* we call gnutls_pkcs11_init manually */
++	gnutls_pkcs11_deinit();
++
++	/* check if softhsm module is loadable */
++	lib = softhsm_lib();
++
++	/* initialize SoftHSM token that libpkcs11mock4.so internally uses */
++	bin = softhsm_bin();
++
++	set_softhsm_conf(CONFIG);
++	snprintf(buf, sizeof(buf),
++		 "%s --init-token --slot 0 --label test --so-pin " PIN
++		 " --pin " PIN,
++		 bin);
++	system(buf);
++
++	test(lib);
++
++	lib = getenv("P11MOCKLIB4");
++	if (lib == NULL) {
++		fail("P11MOCKLIB4 is not set\n");
++	}
++
++	set_softhsm_conf(CONFIG);
++	snprintf(buf, sizeof(buf),
++		 "%s --init-token --slot 0 --label test --so-pin " PIN
++		 " --pin " PIN,
++		 bin);
++	system(buf);
++
++	test(lib);
++}
++#endif /* _WIN32 */
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 8c8e08855b..e4dd47aea4 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-32988.patch \
            file://CVE-2025-32990.patch \
            file://CVE-2025-6395.patch \
+           file://CVE-2025-9820.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.43.0


