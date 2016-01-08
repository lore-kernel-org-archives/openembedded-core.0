Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2837705E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:56 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p186so118758325qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rFVtDsiHNj29rNwTutaSoYe4M7E2wpCyQFYCd+9ZD5Y=;
	b=T57d/Xd8dDHeToHqSEmuBSDuKaW9aBQPnsjRRYm3FGLq4rxHeKESAp2H1E1K74pRJt
	jWLmJ079PAAcM0Lb6qn58VsjbpXN8j1eXsmW4xo/qHVzr/+CUX1W65yTGVJ/Ilx9dkN0
	PtqERNObVXlRUIELj2BnVf0g2WhHedDX99awhZuCWsvoda7M7RvJAQbzZc/k1xGMdNUS
	Cq7Vr1AZzXcMGPULeGpmwqrPi8GGNzkSFi8ddQSNf3MJMFzZIB727kygDne8NZKthxpq
	Yn+U4xLFdG/uw1x2N9u5IYnVtMTbbL1UlaG7JTZshWXgRrd0ff4jvGJBl6teKpHQUv1b
	ScLQ==
X-Received: by 10.55.71.195 with SMTP id u186mr143177748qka.38.1452248397221; 
	Fri, 08 Jan 2016 02:19:57 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:12 +0000
Message-Id: <31b3314b4994ff0e9b190522776a85a34900cd22.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 44/53] libuser: Fix build when secure getenv is not there
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:56 -0000

Fixes build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libuser/libuser/0001-Check-for-issetugid.patch | 62 ++++++++++++++++++++++
 .../libuser/0002-remove-unused-execinfo.h.patch    | 27 ++++++++++
 meta/recipes-extended/libuser/libuser_0.62.bb      |  4 +-
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
 create mode 100644 meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch

diff --git a/meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch b/meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
new file mode 100644
index 0000000..79756b9
--- /dev/null
+++ b/meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
@@ -0,0 +1,62 @@
+From d0537cb7f2dc5877700ad78dfd191515379d4edc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 02:22:51 +0000
+Subject: [PATCH 1/2] Check for issetugid()
+
+If secure version of getenv is not there then we can use
+issetugid() as aid to call getenv()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac |  1 +
+ lib/config.c | 12 +++++++++++-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1ded1a2..ee19e1f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,6 +125,7 @@ AC_TYPE_OFF_T
+ AC_TYPE_SIZE_T
+ 
+ AC_CHECK_FUNCS([__secure_getenv secure_getenv])
++AC_CHECK_FUNCS([issetugid])
+ 
+ # Modify CFLAGS after all tests are run (some of them could fail because
+ # of the -Werror).
+diff --git a/lib/config.c b/lib/config.c
+index 29e7120..30f9daf 100644
+--- a/lib/config.c
++++ b/lib/config.c
+@@ -44,8 +44,10 @@
+ #  define safe_getenv(string) secure_getenv(string)
+ #elif defined(HAVE___SECURE_GETENV)
+ #  define safe_getenv(string) __secure_getenv(string)
++#elif defined(HAVE_ISSETUGID)
++#  define safe_getenv(string) safe_getenv_issetugid(string)
+ #else
+-#  error Neither secure_getenv not __secure_getenv are available
++#  error None of secure_getenv, __secure_getenv, or issetugid is available
+ #endif
+ 
+ struct config_config {
+@@ -59,6 +61,14 @@ struct config_key {
+ 	GList *values;
+ };
+ 
++static const char*
++safe_getenv_issetugid(const char* name)
++{
++	if (issetugid ())
++		return 0;
++	return getenv (name);
++}
++
+ /* Compare two section names */
+ static int
+ compare_section_names(gconstpointer a, gconstpointer b)
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch b/meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch
new file mode 100644
index 0000000..4bc0219
--- /dev/null
+++ b/meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch
@@ -0,0 +1,27 @@
+From 4b2f81f307ffeac12956e5c16e894e5ebb937ea5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 02:26:00 +0000
+Subject: [PATCH 2/2] remove unused execinfo.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ lib/error.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/error.c b/lib/error.c
+index a5ec30a..443e601 100644
+--- a/lib/error.c
++++ b/lib/error.c
+@@ -18,7 +18,6 @@
+ #include <config.h>
+ #include <sys/types.h>
+ #include <errno.h>
+-#include <execinfo.h>
+ #include <libintl.h>
+ #include <stdarg.h>
+ #include <stdlib.h>
+-- 
+2.7.0
+
diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index 4caa8a1..2d5bd35 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 SECTION = "base"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
-           "
+           file://0001-Check-for-issetugid.patch \
+           file://0002-remove-unused-execinfo.h.patch \
+          "
 
 SRC_URI[md5sum] = "63e5e5c551e99dc5302b40b80bd6d4f2"
 SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b"
-- 
2.7.0


