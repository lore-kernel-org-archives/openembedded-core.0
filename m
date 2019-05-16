Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDD37E054
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 17:16:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 454dP92w5yz7P
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 19:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558026973;
	bh=hEHIZg7Ydmm1+F88FLyNaKgUALipB1IN5fIVEZq8BLA=;
	h=From:To:Subject:Date:From;
	b=HRo6CkkEbHc4RoqtpY+ex2UJtyCBNSWsXic8rrTzSuH2fTmpGittedKsRZiaO4O7n
	PDde2T9xQpzXAgWnIvYxrxjreHRyspXs7DFvN+dDZ2j2qeg/v8RF/5W6I/II+egoph
	+ZrXRi1q64hV8BTt94pWp+oqowDxjNyhdwyhKQWTeDB+8/XfXJuJFZWlP04WZiS9Kr
	QGLFtgzsvWUZ1olBdm6b/HTqI3TQp/Ook+PK/Rhd+Yj/z+edMbSELgJJy/ikqMQphB
	FzoJfDzLZSC/LpJzYcEisOKUtCxmaPS515C3DRQ3lCjr91P6844beGj0eKxgDutJ1g
	flL2mn8jdie772+UUhtCxR5dhSPY/a8XGjVG6yd4VduhDdZ5i/f6/ovzp/J4T2O5jn
	5v01lGBqTIfnG8vTfLLkzdNlvcWhvVs6+fz1hEqT+9EhF6gd2Fweue3tdl8f2dMdVg
	pmAoZAc8SCMLfTwkSSWX9pXC5eR+WjsW6nGebH4cHIlJkNZMGqTJhlahrrkNBnzkKY
	17y/GiyaYaQashCw0bKvcLML6LMlsX3hsVEyTgvYMAHbpfcEf7wwLO6FbU/cj8ffJ1
	AU69/QCI0c9CIq+vwOJCzx0mrxorXXuuepFbTceWkpTsP0X6nVF6RQf41XwoxjWItj
	nlttHXcOPM28jffhOeRQIY74=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 20:16:11 +0300
Message-Id: <20190516171611.13983-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Disable idn properly for musl instead of NI_IDN workarounds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2019 17:16:13 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...n-t-fail-if-libc-doesn-t-support-IDN.patch | 38 -------------------
 meta/recipes-core/systemd/systemd_242.bb      |  4 +-
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch

diff --git a/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
deleted file mode 100644
index 1dedbd3b9b..0000000000
--- a/meta/recipes-core/systemd/systemd/0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 6a2cadd6b70cb40ac74fc0d0f8557b914bd38ac2 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 2 Jul 2018 13:22:41 +0800
-Subject: [PATCH 09/24] socket-util: don't fail if libc doesn't support IDN
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/socket-util.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
-index 904bafb..a7a009d 100644
---- a/src/basic/socket-util.c
-+++ b/src/basic/socket-util.c
-@@ -34,6 +34,16 @@
- #include "user-util.h"
- #include "utf8.h"
- 
-+/* Don't fail if the standard library
-+ * doesn't support IDN */
-+#ifndef NI_IDN
-+#define NI_IDN 0
-+#endif
-+
-+#ifndef NI_IDN_USE_STD3_ASCII_RULES
-+#define NI_IDN_USE_STD3_ASCII_RULES 0
-+#endif
-+
- #if ENABLE_IDN
- #  define IDN_FLAGS NI_IDN
- #else
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 73e03c7a77..20714fc70a 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -36,7 +36,6 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0006-Include-netinet-if_ether.h.patch \
                file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch \
                file://0008-add-missing-FTW_-macros-for-musl.patch \
-               file://0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
                file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
                file://0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
@@ -71,6 +70,7 @@ PACKAGECONFIG ??= " \
     gshadow \
     hibernate \
     hostnamed \
+    idn \
     ima \
     kmod \
     localed \
@@ -95,6 +95,7 @@ PACKAGECONFIG ??= " \
 
 PACKAGECONFIG_remove_libc-musl = " \
     gshadow \
+    idn \
     localed \
     myhostname \
     nss \
@@ -129,6 +130,7 @@ PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
 PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
 PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
+PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
 # importd requires curl/xz/zlib/bzip2/gcrypt
 PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
-- 
2.17.1


