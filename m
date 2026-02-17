Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBFCE7BDA2
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:59:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11346.1771333146275908680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HsX/Uznx;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8220bd582ddso2126229b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771333145; x=1771937945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXG2BNjpl4sSB5O6miqgcENu+LwQMGhzY6fKR3nCgy8=;
        b=HsX/Uznx1gT/8YpLXzXhx2+1VIK959KBOBHJ0kgxG7lMCvSyl4sCCsuzZtdzOMw+N/
         oTvvMXJ5Nm6sLa0OY/Zq04pr/OToIi9GPyhp9DS5AcUGQN5z6JNVpzJk+YNCVZESdjmh
         CSIcNXuV1qyrJ3kKEYZEfOUS22fU91C9QQ848=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333145; x=1771937945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXG2BNjpl4sSB5O6miqgcENu+LwQMGhzY6fKR3nCgy8=;
        b=jcHOPFMkl8aSIgGggqJo60+zFcdPnAjc/Smy7LJg8KrXE3/78MG+wTpdpDxiPT1XCm
         CzFUG3kiUd/anF/OtPoLpp4ctEJmcfeYEv/G31UtLRBZZLLOLMIYrguy6gi3v9S4Gj4n
         cKDzjg8OackrmMuGePEq5J95VjWxO3F0YCopSSsQB44qmNMTJEBlYo2PWvJ4OxjA7xr/
         9sVHLRDSF6+RqAJzN1mqmUXGZ2jzR5ChF2oN/C1rxYEO8OJtJUEK78QALFMtZbn9C5tv
         3Fkte4J7pOkom4bboo1yqoQm8ldVRw7vS4bOsm/QlFMu54pjWnKEepF3xWWndGPM+IC4
         PGxw==
X-Gm-Message-State: AOJu0Yxg2OByTVt7k2g/LuNA940W4k/jeK8k3MBJkW4lkfLT4y4iD8y/
	GWqWuqNaf3RXJzhQO8XVff8X+A+tKTl4de2fjwIlutwHNaB7jZGUrq657oalEcydlYlYg7N5IgC
	OUZ0IhU0=
X-Gm-Gg: AZuq6aIfSnqWPuT2Cm0yJjmxpmgWNe1qd/KdtOu9oYEQmFJMIYJ7xMnMjN49RFhHbD6
	O1lBTBBp0LjjVnd4PMujQLWYWBFZfvURX/K1ATIoGagvSJNT9L0rE9vAY/kihYaiFMujtutqO6C
	pwmuhNUdK1DeXmjVkXOL5TCQ8ndG/PH7+NKyBzm5FlUiuzNKtxIpiIj8YleAXY/OSz5jhrKiODD
	iiLw9EjDm+GLn2jtwZ4opLHCV6Osb0nmoSu0nBurD7IrDQ6cCTzGQ2ILO2Nt1/pRpuU3VYquGKf
	hSnmf/6tJuUbuhqgLoRlI+JTCApC/ZB8CcGcwUWfS5wl28P6ZbPWnCHx/cigVOcRJQse2F+dh8w
	zUHzwVR/Q3PJjMkcril2x7GXC04jlYD38kKcq9HWaqpjOrGEQAWbF+zyZUVxyz3Krch8mCFl081
	7+N7EEHcmYzqfckW0PGEeB9TgBhZSTRxZSy14=
X-Received: by 2002:a05:6a00:139d:b0:824:ae74:571f with SMTP id d2e1a72fcca58-824c963ecb8mr14714938b3a.40.1771333145231;
        Tue, 17 Feb 2026 04:59:05 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:795d:cdd7:ddcd:102d:80c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824cc22f4d9sm12641588b3a.39.2026.02.17.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:59:04 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch 4/4] gnutls: upgrade 3.8.11 -> 3.8.12
Date: Tue, 17 Feb 2026 18:28:30 +0530
Message-ID: <20260217125830.2907750-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217125830.2907750-1-vanusuri@mvista.com>
References: <20260217125830.2907750-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231250

From: Peter Marko <peter.marko@siemens.com>

Release information: [1]

Solves CVE-2025-14831 and CVE-2026-1584.
Remove patch included in this release.
Add workaround for cross-compilation bug in release tarball.

[1] https://lists.gnutls.org/pipermail/gnutls-help/2026-February/004914.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 49f8a79a705f4ff3d0ba755c637ef8f6ac09d5b6)

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...dit-crau-fix-compilation-with-gcc-11.patch | 66 -------------------
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 .../{gnutls_3.8.11.bb => gnutls_3.8.12.bb}    |  7 +-
 3 files changed, 7 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.11.bb => gnutls_3.8.12.bb} (94%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
deleted file mode 100644
index 60960dad6f..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sun, 23 Nov 2025 18:17:19 +0100
-Subject: [PATCH] audit: crau: fix compilation with gcc < 11
-
-If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
-automatically detect an appropriate value for it.
-
-This autodetection is using the cpp special operator
-`__has_c_attribute` [1], introduced in gcc 11 [2].
-
-When compiling with a gcc older than version 11, the compilation fails
-with the error:
-
-    In file included from audit.h:22,
-                     from audit.c:26:
-    crau/crau.h:255:23: error: missing binary operator before token "("
-         __has_c_attribute (__maybe_unused__)
-                           ^
-
-This has been observed, for example, in Rocky Linux 8.10, which
-contains a gcc v8.5.0.
-
-The issue happens because the test for the `__has_c_attribute`
-availability and the test for the `__maybe_unused__` attribute
-are in the same directive. Those tests should be separated in
-two different directives, following the same logic described in
-the `__has_builtin` documentation [3].
-
-This issue was found in Buildroot, after updating gnutls to
-version 3.8.11 in [4].
-
-This commit fixes the issue by splitting the test in two.
-
-[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
-[2] https://gcc.gnu.org/gcc-11/changes.html#c
-[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
-[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
-
-Reported-by: Neal Frager <neal.frager@amd.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
-
-Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/2bbae7644a2292410b53f98fd0035c40bf8750a5]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- lib/crau/crau.h | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/lib/crau/crau.h b/lib/crau/crau.h
-index 0d4f9f13e..53d33555b 100644
---- a/lib/crau/crau.h
-+++ b/lib/crau/crau.h
-@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
- # else
- 
- #  ifndef CRAU_MAYBE_UNUSED
--#   if defined(__has_c_attribute) && \
--    __has_c_attribute (__maybe_unused__)
--#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
-+#   if defined(__has_c_attribute)
-+#    if __has_c_attribute (__maybe_unused__)
-+#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
-+#    endif
- #   elif defined(__GNUC__)
- #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
- #   endif
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index d8b5035b38..398c0464e0 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -719,6 +719,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.11.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
similarity index 94%
rename from meta/recipes-support/gnutls/gnutls_3.8.11.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 5b44c66dfc..d13a1365dc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -21,12 +21,11 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
-           file://0001-audit-crau-fix-compilation-with-gcc-11.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20"
+SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -62,6 +61,10 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
+
+	# remove on next upgrade when release tarball gets fixed
+	# https://gitlab.com/gnutls/gnutls/-/issues/1797
+	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {
-- 
2.43.0


