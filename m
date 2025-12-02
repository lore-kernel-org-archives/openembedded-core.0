Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E385D1267B
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:19:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.935.1764713986067418491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nTt03iCa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2956d816c10so61852825ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713985; x=1765318785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5htEAfREC8xB8bFuNLJBHLjcyIWjbBdBKtL+F8wvMA=;
        b=nTt03iCaQg0vli9Oi1FlrxUQWKL3pknfX+WvarGvZdI130hYGzuSmLoT1+Zk0MIiYO
         dc/NUwHkDN1xLBkTxcPd0ePHJGrKA+70pIpbk6fRljyDKN4xYh7sGI52OdqUzXbr712/
         +6NjqrG4s5lVsj0aQW8O/SYTWt5BXLlF/08+Ns5nWSLIHyY0pFL3XFHQISooncby7Yo6
         e2bZWjhJ+EPP5GOXN3kAJwWyTG1zMdWECpOMg//nvLTI6evrefXQSZ3yy6d4blXN9aYE
         MZ2XFwuc6aJkhBGHSCzrT9dKYhsnJhDhZbCeWqKVLm9JkcfTN/zXmfmceQzQtW+YCbnK
         2Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713985; x=1765318785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j5htEAfREC8xB8bFuNLJBHLjcyIWjbBdBKtL+F8wvMA=;
        b=HxI/YCoEfG04BDVST9oQOrpsZ64jnK//XPXBPs6LFi9UAiN1dg5SB30N2nqri3QB54
         NK9O6swABggDC/3cbpP3nKRELmg+kmQz7sMVNZRnaupc8T1wjRhBT9nOTJHbJhahZ49A
         LCn8OakFQ+oCyZ2VGSpPuHqi+6CUkZTthDgi9YLZDepWCu2eZIVBy3Ql0BElwsjYS4Q0
         7R2BxbBx9KOH5Sdmt/ObyVBZ2WB0o+DIprWTcv7Ug3hI0ycHGPul9UD/AKR62Phjfgvq
         emRVj6Cnt81xRfb0tKRrnzn0rKUYb5k/9/hfpKi+QrpRs80yRgWgMlb5oXfutyKuEeJQ
         ojUg==
X-Gm-Message-State: AOJu0Yy58JHqp1hhQe2QzVb9W/7Tpd4W5oyp6USB6UGkgelyp53reeNf
	2VrUqcLd+0ck/zlObLfSiGkZqM/XATsrLtUDdlhEIIhuoSrcvhvARGPjYNAXfEIhkozGEuSWpYr
	Zh3hr
X-Gm-Gg: ASbGncudm096StBrv91BJygfCkxeBmWaLVTYKlk5/955C8uogzUp9yxOsHe5/7CE670
	LLpQRSZvzYIp9pS/tTd7mgGjrkaGUEzxWDo67mKVtv61Pnx2dTieR4U+qy9wI0jDhnHx6BZuQ2X
	yShxKsyDaWOLipnx54bWK2MwF9LsO88SzPEZrcR8e+JPBbSN9O4TZmAZMKKuig71+bvRQFn6M87
	cJDx0n3VXKQXVIl6dUtT/5eSKWhphXpCXS1uXu5Bk9lv991AOUvEsX/Oa3L/CGMdompU18/iQIC
	y1oCXcHUMScQLxFIAfIkFdylfWhRr4m7ZzmE1kx1eeTqG9cuCxNqypuUqPnNK8C5URpbem3+dnd
	ylthWlXoeRCUhpEibOzh5Rh0HAy8XJ1Atx+9UfhkomR80+OUGgfCnodxlnnJyvrqR/Pn5Dcf2c7
	RyPw==
X-Google-Smtp-Source: AGHT+IHAxlWwlEFgZ3znYWaQvSv+uekHkXVKlDfbP6Ft24w/HZUxchXAW44AAe67W7lDqGB1eFmaRg==
X-Received: by 2002:a17:902:f605:b0:295:9cb5:ae2a with SMTP id d9443c01a7336-29d6833ced8mr1343765ad.9.1764713985245;
        Tue, 02 Dec 2025 14:19:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] gnutls: patch CVE-2025-9820
Date: Tue,  2 Dec 2025 14:19:24 -0800
Message-ID: <f9da4802414121457f8231ddd939bbc5160aa33c.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227188

From: Peter Marko <peter.marko@siemens.com>

This CVE is announced under [1].
Pick commit which mentions this CVE per [2].

[1] https://www.gnutls.org/security-new.html#GNUTLS-SA-2025-11-18
[2] https://security-tracker.debian.org/tracker/CVE-2025-9820

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2025-9820.patch         | 250 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 2 files changed, 251 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
new file mode 100644
index 0000000000..99a6c11ee4
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
+ #include "x509/common.h"
+ #include "pk.h"
++#include "minmax.h"
+ 
+ static const ck_bool_t tval = 1;
+ static const ck_bool_t fval = 0;
+@@ -1173,7 +1174,7 @@ int gnutls_pkcs11_delete_url(const char *object_url, unsigned int flags)
+  * gnutls_pkcs11_token_init:
+  * @token_url: A PKCS #11 URL specifying a token
+  * @so_pin: Security Officer's PIN
+- * @label: A name to be used for the token
++ * @label: A name to be used for the token, at most 32 characters
+  *
+  * This function will initialize (format) a token. If the token is
+  * at a factory defaults state the security officer's PIN given will be
+@@ -1211,7 +1212,7 @@ int gnutls_pkcs11_token_init(const char *token_url, const char *so_pin,
+ 	/* so it seems memset has other uses than zeroing! */
+ 	memset(flabel, ' ', sizeof(flabel));
+ 	if (label != NULL)
+-		memcpy(flabel, label, strlen(label));
++		memcpy(flabel, label, MIN(sizeof(flabel), strlen(label)));
+ 
+ 	rv = pkcs11_init_token(module, slot, (uint8_t *)so_pin, strlen(so_pin),
+ 			       (uint8_t *)flabel);
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index be4966f4b..8327c90ca 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -496,7 +496,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ if ENABLE_PKCS11
+ if !WINDOWS
+ ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
+-	global-init-override pkcs11/distrust-after
++	global-init-override pkcs11/distrust-after pkcs11/long-label
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index dde3bc3014..026ae650f6 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-32988.patch \
            file://CVE-2025-32990.patch \
            file://CVE-2025-6395.patch \
+           file://CVE-2025-9820.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


