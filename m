Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43132E63F29
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:58:56 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11250.1771333130716458270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=B5ecpAti;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824a6f2d816so1980322b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 04:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771333129; x=1771937929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2G2qalh3sCSrmVzsIg4mN0w2+Y8+UPGC0h4b/Exj2Ro=;
        b=B5ecpAti1ShuaS92XmtuwSnHktPqv2JJbdKBimSp1oIdkTfiqhLxl/1vowC1K9zpZ+
         KeL0gMrdhvxs92P+1l04+AcwebWa3JOC7ddYGPv0rFGNjMRe5767tjwiWnRGNzHsJZZw
         d2rwf02qePxBg0HFdht+oIPJAOZ46ovI2/uYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333129; x=1771937929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G2qalh3sCSrmVzsIg4mN0w2+Y8+UPGC0h4b/Exj2Ro=;
        b=cA+0f5Nh0VB0Lz6X9yWhD4jSOHAsxch7wQgR+LLxJnjrYPFP3uh2+TsT0Ix7YdZu1m
         VGkcLv8MHxaRDwhuGRq/p/h+2uwjZNsBWeEJCZZgSX5Znzv82fzbdvOuMQ66/zUKZjPG
         s78NIj1xnM1MOjWC1Nzwm7AL8N7ru2ifxafRKCjKwWIANUJqpqtdXCma/pVuYlhBYVaj
         vkLX7jpdudY2Zn3R3+Y0kKKIqoGO6yIxgiR76+DeFhVY7dnJrsggwmj0LCH2XBiAJBf6
         3HpPWV0HUPRSbQVykZNldEJ49/rxwaudES/wuZ/bF/3BtOvpCtAuw3D00h/8PTQreuMU
         GviQ==
X-Gm-Message-State: AOJu0Ywd5G1JAsfdp6Dtq4Eh8cRHq9hvxdQfvZzS6cy5q5rfdsLrkvjn
	0+udKudjygZHpjxh/Kp1uPCMtGddHbO7w/UNKYjrBZClzARLDj+X10nMPk9JIIuv7YczN54bHBU
	zgeUH84s=
X-Gm-Gg: AZuq6aIk2o+8CVo9HRok4raAxH+uVep9ARPipNKKn4KMQ8qlYGae8UClyHpGDXT4nvg
	oMuslb4Cj5N+sTUTdETtPFP1gawqyHXtKbZBDSLCP9DpOLKnW2cO+JC1AyRhXFnhgWE4vbgqscW
	PRlK3hYKahv9t5Mi1d4+GCgrpDtfB1E5GzLi2yhCBO9652WoFZEL7el6smFdI9J3Idf1QUzSh60
	i+g0i4uodcz8ttIV8LEjJRRood45IulHs9d+jLheAHkc/1ZWgLwqfDyKAc3I8BA8OIzk4IF2AF6
	61z+EXUZfUWA1Ezh/w1tcFOaSx+A18E0ZARt0GTcVYzW+Lj4kNy36+6xyaiqbEkKr33qyHDLUgz
	AabX6gj4u/cHubqVWH24lO5LCMw3755wFSa5WrRyE/FgtJLKiPbtGXZTyOMo5O66YCI2fiqbNIS
	B5y44lIUBWwOEABq3jfjGfrMuwG/2aWy+gj+E=
X-Received: by 2002:a05:6a00:4c08:b0:81f:4046:1490 with SMTP id d2e1a72fcca58-824c95c1847mr14788209b3a.44.1771333129335;
        Tue, 17 Feb 2026 04:58:49 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:795d:cdd7:ddcd:102d:80c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824cc22f4d9sm12641588b3a.39.2026.02.17.04.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:58:48 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][patch 1/4] gnutls: upgrade 3.8.10 -> 3.8.11
Date: Tue, 17 Feb 2026 18:28:27 +0530
Message-ID: <20260217125830.2907750-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231247

Release information: [1]
Includes fix for CVE-2025-9820.

Refresh patches.

Backport commit to be able to build with gcc<11 (e.g. Debian 11).

[1] https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 0224dd73d5e462e3ab0958a63d631aa32e330d6c)

Dropped CVE-2025-9820.patch

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...ile-should-be-excuted-in-target-envi.patch |   2 +-
 ...dit-crau-fix-compilation-with-gcc-11.patch |  66 +++++
 .../gnutls/gnutls/Add-ptest-support.patch     |   6 +-
 .../gnutls/gnutls/CVE-2025-9820.patch         | 233 ------------------
 .../{gnutls_3.8.10.bb => gnutls_3.8.11.bb}    |   4 +-
 5 files changed, 72 insertions(+), 239 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.10.bb => gnutls_3.8.11.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 2dccea7859..0847dde8a9 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -14,7 +14,7 @@ diff --git a/lib/Makefile.am b/lib/Makefile.am
 index a50d311..193ea19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -272,8 +272,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
+@@ -275,8 +275,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
  
  all-local: $(hmac_file)
  
diff --git a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
new file mode 100644
index 0000000000..60960dad6f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
@@ -0,0 +1,66 @@
+From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 23 Nov 2025 18:17:19 +0100
+Subject: [PATCH] audit: crau: fix compilation with gcc < 11
+
+If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
+automatically detect an appropriate value for it.
+
+This autodetection is using the cpp special operator
+`__has_c_attribute` [1], introduced in gcc 11 [2].
+
+When compiling with a gcc older than version 11, the compilation fails
+with the error:
+
+    In file included from audit.h:22,
+                     from audit.c:26:
+    crau/crau.h:255:23: error: missing binary operator before token "("
+         __has_c_attribute (__maybe_unused__)
+                           ^
+
+This has been observed, for example, in Rocky Linux 8.10, which
+contains a gcc v8.5.0.
+
+The issue happens because the test for the `__has_c_attribute`
+availability and the test for the `__maybe_unused__` attribute
+are in the same directive. Those tests should be separated in
+two different directives, following the same logic described in
+the `__has_builtin` documentation [3].
+
+This issue was found in Buildroot, after updating gnutls to
+version 3.8.11 in [4].
+
+This commit fixes the issue by splitting the test in two.
+
+[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
+[2] https://gcc.gnu.org/gcc-11/changes.html#c
+[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
+[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
+
+Reported-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/2bbae7644a2292410b53f98fd0035c40bf8750a5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/crau/crau.h | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/crau/crau.h b/lib/crau/crau.h
+index 0d4f9f13e..53d33555b 100644
+--- a/lib/crau/crau.h
++++ b/lib/crau/crau.h
+@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
+ # else
+ 
+ #  ifndef CRAU_MAYBE_UNUSED
+-#   if defined(__has_c_attribute) && \
+-    __has_c_attribute (__maybe_unused__)
+-#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#   if defined(__has_c_attribute)
++#    if __has_c_attribute (__maybe_unused__)
++#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#    endif
+ #   elif defined(__GNUC__)
+ #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
+ #   endif
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 339d3d2f9e..d8b5035b38 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 843193f..816b09f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -194,6 +194,9 @@ dist-hook:
+@@ -197,6 +197,9 @@ dist-hook:
  distcheck-hook:
  	@test -d "$(top_srcdir)/po/.reference" || { echo "PO files are not downloaded; run ./bootstrap without --skip-po"; exit 1; }
  
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1491,6 +1491,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -678,6 +678,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -719,6 +719,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
deleted file mode 100644
index e4f97500ee..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
+++ /dev/null
@@ -1,233 +0,0 @@
-From 19ad448d0cc3dd6857b553a47728eead3ea8f445 Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Tue, 18 Nov 2025 13:17:55 +0900
-Subject: [PATCH] pkcs11: avoid stack overwrite when initializing a token
-
-If gnutls_pkcs11_token_init is called with label longer than 32
-characters, the internal storage used to blank-fill it would
-overflow. This adds a guard to prevent that.
-
-CVE: CVE-2025-9820
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1d56f96f6ab5034d677136b9d50b5a75dff0faf5]
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- lib/pkcs11_write.c        |   5 +-
- tests/Makefile.am         |   2 +-
- tests/pkcs11/long-label.c | 164 ++++++++++++++++++++++++++++++++++++++
- 3 files changed, 168 insertions(+), 3 deletions(-)
- create mode 100644 tests/pkcs11/long-label.c
-
-diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c
-index f5e9058e0..64b85a2df 100644
---- a/lib/pkcs11_write.c
-+++ b/lib/pkcs11_write.c
-@@ -28,6 +28,7 @@
- #include "pkcs11x.h"
- #include "x509/common.h"
- #include "pk.h"
-+#include "minmax.h"
- 
- static const ck_bool_t tval = 1;
- static const ck_bool_t fval = 0;
-@@ -1172,7 +1173,7 @@ int gnutls_pkcs11_delete_url(const char *object_url, unsigned int flags)
-  * gnutls_pkcs11_token_init:
-  * @token_url: A PKCS #11 URL specifying a token
-  * @so_pin: Security Officer's PIN
-- * @label: A name to be used for the token
-+ * @label: A name to be used for the token, at most 32 characters
-  *
-  * This function will initialize (format) a token. If the token is
-  * at a factory defaults state the security officer's PIN given will be
-@@ -1210,7 +1211,7 @@ int gnutls_pkcs11_token_init(const char *token_url, const char *so_pin,
- 	/* so it seems memset has other uses than zeroing! */
- 	memset(flabel, ' ', sizeof(flabel));
- 	if (label != NULL)
--		memcpy(flabel, label, strlen(label));
-+		memcpy(flabel, label, MIN(sizeof(flabel), strlen(label)));
- 
- 	rv = pkcs11_init_token(module, slot, (uint8_t *)so_pin, strlen(so_pin),
- 			       (uint8_t *)flabel);
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index c8de4494b..f64f7b1c0 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -503,7 +503,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
- if ENABLE_PKCS11
- if !WINDOWS
- ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
--	global-init-override pkcs11/distrust-after
-+	global-init-override pkcs11/distrust-after pkcs11/long-label
- tls13_post_handshake_with_cert_pkcs11_DEPENDENCIES = libpkcs11mock2.la libutils.la
- tls13_post_handshake_with_cert_pkcs11_LDADD = $(LDADD) $(LIBDL)
- pkcs11_tls_neg_pkcs11_no_key_DEPENDENCIES = libpkcs11mock2.la libutils.la
-diff --git a/tests/pkcs11/long-label.c b/tests/pkcs11/long-label.c
-new file mode 100644
-index 000000000..a70bc9728
---- /dev/null
-+++ b/tests/pkcs11/long-label.c
-@@ -0,0 +1,164 @@
-+/*
-+ * Copyright (C) 2025 Red Hat, Inc.
-+ *
-+ * Author: Daiki Ueno
-+ *
-+ * This file is part of GnuTLS.
-+ *
-+ * GnuTLS is free software; you can redistribute it and/or modify it
-+ * under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 3 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * GnuTLS is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with this program.  If not, see <https://www.gnu.org/licenses/>
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
-+#include <stdbool.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+
-+#if defined(_WIN32)
-+
-+int main(void)
-+{
-+	exit(77);
-+}
-+
-+#else
-+
-+#include <string.h>
-+#include <unistd.h>
-+#include <gnutls/gnutls.h>
-+
-+#include "cert-common.h"
-+#include "pkcs11/softhsm.h"
-+#include "utils.h"
-+
-+/* This program tests that a token can be initialized with
-+ * a label longer than 32 characters.
-+ */
-+
-+static void tls_log_func(int level, const char *str)
-+{
-+	fprintf(stderr, "server|<%d>| %s", level, str);
-+}
-+
-+#define PIN "1234"
-+
-+#define CONFIG_NAME "softhsm-long-label"
-+#define CONFIG CONFIG_NAME ".config"
-+
-+static int pin_func(void *userdata, int attempt, const char *url,
-+		    const char *label, unsigned flags, char *pin,
-+		    size_t pin_max)
-+{
-+	if (attempt == 0) {
-+		strcpy(pin, PIN);
-+		return 0;
-+	}
-+	return -1;
-+}
-+
-+static void test(const char *provider)
-+{
-+	int ret;
-+	size_t i;
-+
-+	gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
-+
-+	success("test with %s\n", provider);
-+
-+	if (debug) {
-+		gnutls_global_set_log_function(tls_log_func);
-+		gnutls_global_set_log_level(4711);
-+	}
-+
-+	/* point to SoftHSM token that libpkcs11mock4.so internally uses */
-+	setenv(SOFTHSM_ENV, CONFIG, 1);
-+
-+	gnutls_pkcs11_set_pin_function(pin_func, NULL);
-+
-+	ret = gnutls_pkcs11_add_provider(provider, "trusted");
-+	if (ret != 0) {
-+		fail("gnutls_pkcs11_add_provider: %s\n", gnutls_strerror(ret));
-+	}
-+
-+	/* initialize softhsm token */
-+	ret = gnutls_pkcs11_token_init(
-+		SOFTHSM_URL, PIN,
-+		"this is a very long label whose length exceeds 32");
-+	if (ret < 0) {
-+		fail("gnutls_pkcs11_token_init: %s\n", gnutls_strerror(ret));
-+	}
-+
-+	for (i = 0;; i++) {
-+		char *url = NULL;
-+
-+		ret = gnutls_pkcs11_token_get_url(i, 0, &url);
-+		if (ret < 0)
-+			break;
-+		if (strstr(url,
-+			   "token=this%20is%20a%20very%20long%20label%20whose"))
-+			break;
-+	}
-+	if (ret < 0)
-+		fail("gnutls_pkcs11_token_get_url: %s\n", gnutls_strerror(ret));
-+
-+	gnutls_pkcs11_deinit();
-+}
-+
-+void doit(void)
-+{
-+	const char *bin;
-+	const char *lib;
-+	char buf[128];
-+
-+	if (gnutls_fips140_mode_enabled())
-+		exit(77);
-+
-+	/* this must be called once in the program */
-+	global_init();
-+
-+	/* we call gnutls_pkcs11_init manually */
-+	gnutls_pkcs11_deinit();
-+
-+	/* check if softhsm module is loadable */
-+	lib = softhsm_lib();
-+
-+	/* initialize SoftHSM token that libpkcs11mock4.so internally uses */
-+	bin = softhsm_bin();
-+
-+	set_softhsm_conf(CONFIG);
-+	snprintf(buf, sizeof(buf),
-+		 "%s --init-token --slot 0 --label test --so-pin " PIN
-+		 " --pin " PIN,
-+		 bin);
-+	system(buf);
-+
-+	test(lib);
-+
-+	lib = getenv("P11MOCKLIB4");
-+	if (lib == NULL) {
-+		fail("P11MOCKLIB4 is not set\n");
-+	}
-+
-+	set_softhsm_conf(CONFIG);
-+	snprintf(buf, sizeof(buf),
-+		 "%s --init-token --slot 0 --label test --so-pin " PIN
-+		 " --pin " PIN,
-+		 bin);
-+	system(buf);
-+
-+	test(lib);
-+}
-+#endif /* _WIN32 */
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.8.10.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.11.bb
index b07c166c0e..faeb1a4ede 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
@@ -21,12 +21,12 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
+           file://0001-audit-crau-fix-compilation-with-gcc-11.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://CVE-2025-9820.patch \
            "
 
-SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
+SRC_URI[sha256sum] = "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.43.0


