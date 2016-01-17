Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id F1EE573177
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:34 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id ho8so157839895pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rFVtDsiHNj29rNwTutaSoYe4M7E2wpCyQFYCd+9ZD5Y=;
	b=Mrqj5r5bm78yXJ89Q9dl1n0yFRBKz7f5lB5IKUzd12fi5fgX6xHiMr2WP19xY+iNbo
	vIw4EyfNZi+cIX0bI58fSCmRdik0QqQ6bZC+LVKJcnT6zAx2ouI4K7Lb+ZwkA2/feG47
	xRRHTUfH71AcUngTAiEm+FyZazz+J48Cd29Zl5XpTs5EaiveUoA8k43CfR+WR9R1UjgK
	kSxoprYlYGx5H2tS9JpIshb0vp9MMqSsQdDfR1N4G5SbXT6W+I21cj6SXckpU0gIWtA6
	BAbnPxL+9c7mEWUyzgUkgMaWG8rPD5P/EgDoP/fB3U5xSVezaqEl3DfdjHD25FA6duwa
	VQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rFVtDsiHNj29rNwTutaSoYe4M7E2wpCyQFYCd+9ZD5Y=;
	b=UbGKXpqkoRvAFc9endrT0Dihz3WpZtdKCclxiLjRmGnb0d9TM9oAXvn3fVEn6rzH5S
	WtXinJrLVqm3RdkymVznrPLLCdUBBo2fEhDiouMwERXG2ggh172n4fqManJWHSenjb20
	O8CbtVC5XQbo1DwB6c1e+sHAFXt5aLiZu2n5o/7gVT+Tzh9KpbxUqnBb7dg6Yz+N7tGF
	icdU7aWMnZQSJOiiF/E25V0hhv0JhwJnRffXDvyz+ZAZEcpvhVdewELjL05Y0FEDsOqV
	x2Rr8cEFO8j0Ov7QrFKd8eqEeEz/svdvJrKBYeBs2PLVr0rS37B/+9O3FGkWtN9NFoYt
	iPtw==
X-Gm-Message-State: ALoCoQn9GT9Vi69IHrXxTbit1GNpLCbyHnzY6/32nrHPa01tO1ah1+Lf+gJ8EcS5dexy7ez9eStOHxMTdf3lsqcvDvcOUpTcaw==
X-Received: by 10.66.102.9 with SMTP id fk9mr28288752pab.77.1453030655897;
	Sun, 17 Jan 2016 03:37:35 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:12 -0800
Message-Id: <a0bcc9473bc1fd760a749d5c2806a23a7686df45.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 39/73] libuser: Fix build when secure getenv is not there
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:35 -0000

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


