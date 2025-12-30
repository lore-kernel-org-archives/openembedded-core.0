Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177E6EE499E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71900.1767125535338189617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=shwu2Phr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0834769f0so101046055ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125534; x=1767730334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MKw11FtL2VGAHTbK7jwcFrl7tIyCDliOCeXI5AGH1o=;
        b=shwu2PhrzCH5V0ifRmdwVRNXyY5yniHZMjs0rfbBlU7SuHAayi7M4Y5hrOvnjSXDCB
         dSDKSX4yGLo83oqBMdi5d2GWCNZByb/YKN2QFrrzjGHtrvGwjGo108anciOkLbRwPK7L
         09MXRoQiPxiCPRTMp+9m3bmYBHEW6A41mO1w74Qoe/RzcqWEpFSpRqOhsNlBvDmk+GC7
         4va+NS/TVPf3qtEyJg0SaHFSueADLtBbi3om+8nIfoGOmJu28W1U9IJGFMTIR2GxwILy
         X0U4IcWma+NhnBzanyzJAPPzThwWCgSjuZt+Oej1fC3MkBztw8b9FpetnSwvPcMyJCJv
         fn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125534; x=1767730334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MKw11FtL2VGAHTbK7jwcFrl7tIyCDliOCeXI5AGH1o=;
        b=HPWeexlls+Rg2Vef2Ci5KrCvBtTqgYZb+F6WISlxy/oWEYu4YcC/K7WA/kC6IIDPwr
         VvAmkzP8s34Q7LmCeDKx2f/+MELJLPStiwBAyUU3CtiGRCyFu4fHah/qwrepRAFoTW41
         IwsiciaybUitDJ5R94JMh+ljYjMzDHguVi7C5W6fKIixdIn7q08usi2EjR9xr7AJ3h3I
         5B/erGeoats4wYtibmOgggn1xsZbdMlAtE0xicB5DoKUv93H3FjU3pQKTphCMseuEu11
         hVJg3qpEgn9dndmHkAVPQserpOWZy4LnShDblUktStYdAnNtwSBlvkV9uZo9kXgesf3Z
         KEhA==
X-Gm-Message-State: AOJu0YwZGO2K11oaXGq7GA+6MH8yp6P3x5X5CVklXDYCMy2D67vunbdP
	F2nI0uvMjA5lv+bCyGcR9Kjsz6p+RUVQH7eOdtqI9G4dB7JBX0JPzaTizqtFHeQL1tXl2Ku5buA
	VPlcC
X-Gm-Gg: AY/fxX4/ghTXE4mz6fq+yii536kQcuHF4gPKk6z5BdCCC2sdUqE4YaSTeFZ0ACYyF5H
	YRuY2dycTXEIbU/A3MNewk9XYjVmfgMs5nbqln9uYAO1rNNtd7BCC0nVjzAaEYxpHYHLBLsoJ5h
	cYL1QWHlQdtBbD384VWfVCiuMECLVf8JKUlWncnOFKTqtI+LjnXe1FibbEDKXia51rDa5d9CmnC
	8RSwIBD060FG+yy2qccLL/5CcFohfOpqGgHMs5YWdCITTCHv5zccEOm+cUIXYrqJnVZtUcOnw48
	TlZEk97AXcNrei0vQLg0lo5pBzIpY2K7bzlfRfghlEnkay3ecBE5rynjPvHLtiQ3+/ViWtQ48Y2
	IjZI0rrPkhKSnvTUPeCZ5AD4V2BQ0pBY7WLd6B9dmnJUWLpW4OdGE4BW187DSGNtta6jBg5TMgN
	mf3A==
X-Google-Smtp-Source: AGHT+IG/gGMmqc4lFFJgPjhj/GvDLL4JPvE1llAjgKwu4ikeEyJIhh8zrkWhdnwNLjBOZKNkp4hQaQ==
X-Received: by 2002:a17:903:4b43:b0:2a0:bae5:b580 with SMTP id d9443c01a7336-2a2f2205524mr369946455ad.3.1767125534497;
        Tue, 30 Dec 2025 12:12:14 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/29] gnutls: patch CVE-2025-9820
Date: Tue, 30 Dec 2025 12:11:33 -0800
Message-ID: <4c2610000f3a48d593063843eebd25b5c956bdca.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228695

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://www.gnutls.org/security-new.html#GNUTLS-SA-2025-11-18

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2025-9820.patch         | 233 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
new file mode 100644
index 0000000000..e4f97500ee
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
@@ -0,0 +1,233 @@
+From 19ad448d0cc3dd6857b553a47728eead3ea8f445 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Tue, 18 Nov 2025 13:17:55 +0900
+Subject: [PATCH] pkcs11: avoid stack overwrite when initializing a token
+
+If gnutls_pkcs11_token_init is called with label longer than 32
+characters, the internal storage used to blank-fill it would
+overflow. This adds a guard to prevent that.
+
+CVE: CVE-2025-9820
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1d56f96f6ab5034d677136b9d50b5a75dff0faf5]
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/pkcs11_write.c        |   5 +-
+ tests/Makefile.am         |   2 +-
+ tests/pkcs11/long-label.c | 164 ++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 168 insertions(+), 3 deletions(-)
+ create mode 100644 tests/pkcs11/long-label.c
+
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
+@@ -1172,7 +1173,7 @@ int gnutls_pkcs11_delete_url(const char *object_url, unsigned int flags)
+  * gnutls_pkcs11_token_init:
+  * @token_url: A PKCS #11 URL specifying a token
+  * @so_pin: Security Officer's PIN
+- * @label: A name to be used for the token
++ * @label: A name to be used for the token, at most 32 characters
+  *
+  * This function will initialize (format) a token. If the token is
+  * at a factory defaults state the security officer's PIN given will be
+@@ -1210,7 +1211,7 @@ int gnutls_pkcs11_token_init(const char *token_url, const char *so_pin,
+ 	/* so it seems memset has other uses than zeroing! */
+ 	memset(flabel, ' ', sizeof(flabel));
+ 	if (label != NULL)
+-		memcpy(flabel, label, strlen(label));
++		memcpy(flabel, label, MIN(sizeof(flabel), strlen(label)));
+ 
+ 	rv = pkcs11_init_token(module, slot, (uint8_t *)so_pin, strlen(so_pin),
+ 			       (uint8_t *)flabel);
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index c8de4494b..f64f7b1c0 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -503,7 +503,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index 2ef71a1213..b07c166c0e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
+           file://CVE-2025-9820.patch \
            "
 
 SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
-- 
2.43.0


