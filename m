Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7C02C6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:46 +0000 (UTC)
Received: by qgea14 with SMTP id a14so10017927qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=2k/TLh77rBSwGc6pOwqebBEzbdWZ6KXndB3jmWjaJf4=;
	b=vIioaDU4d1ZbaizF1oSOh3T77bXycUOD68bU8kn1AYvgdvsMmu0XJXOdxOGu88TsgL
	ImRO9S0dzO+gAf0ledCaCvn8lGLn3EoTt5iYAKtUUN1BqSnVL+975zezVii4jYtFr1JQ
	pLWVNHRg+EX7hPvrP5StbL/StfypOwFpaaZyBJRLF7KOvYrsar1Z6xgng7H6uMO94swa
	q+d178RUd/nle0NBFTNhAdR3o/XoX040ELThmTgpCLWS+4TzWElI7fbhYMMFaNSt7nOW
	zp2MtLtQUWGmg6q8oKy8cGKCOZoTNDaaf44jFLoEEdDFc9U7VEVQukQaW/pu3WdtMme0
	/XWw==
X-Received: by 10.140.107.11 with SMTP id g11mr2739409qgf.37.1449562366985;
	Tue, 08 Dec 2015 00:12:46 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:33 +0000
Message-Id: <d8defb90c3618fcd6819dffd70795401c2b86f99.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 13/13] attr: Add patch to account for use of internal glibc header
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:46 -0000

based on suggestions on musl FAQ
http://wiki.musl-libc.org/wiki/FAQ

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr_2.4.47.bb           |  4 +-
 .../attr/files/dont-use-decl-macros.patch          | 56 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/dont-use-decl-macros.patch

diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index ad40c9b..44eee39 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -2,7 +2,9 @@ require attr.inc
 
 # configure.ac was missing from the release tarball. This should be fixed in
 # future releases of attr, remove this when updating the recipe.
-SRC_URI_append += "file://attr-Missing-configure.ac.patch"
+SRC_URI_append += "file://attr-Missing-configure.ac.patch \
+                   file://dont-use-decl-macros.patch \
+                  "
 
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
 SRC_URI[sha256sum] = "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
diff --git a/meta/recipes-support/attr/files/dont-use-decl-macros.patch b/meta/recipes-support/attr/files/dont-use-decl-macros.patch
new file mode 100644
index 0000000..9d4b892
--- /dev/null
+++ b/meta/recipes-support/attr/files/dont-use-decl-macros.patch
@@ -0,0 +1,56 @@
+Use extern "C" instead of __BEGIN_DECL/__END_DECL macros
+these macros are defined in sys/cdefs.h for glibc and this header is not available on all libc
+
+anyway they defined like below
+
+#ifdef __cplusplus
+# define __BEGIN_DECLS extern "C" {
+# define __END_DECLS }
+#else
+# define __BEGIN_DECLS /* empty */
+# define __END_DECLS /* empty */
+#endif
+
+__THROW macro is also not available on musl, defined thusly
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: attr-2.4.47/include/xattr.h
+===================================================================
+--- attr-2.4.47.orig/include/xattr.h	2014-04-02 00:01:30.252091280 -0700
++++ attr-2.4.47/include/xattr.h	2014-04-02 00:12:57.985428099 -0700
+@@ -30,8 +30,20 @@
+ #define XATTR_CREATE  0x1       /* set value, fail if attr already exists */
+ #define XATTR_REPLACE 0x2       /* set value, fail if attr does not exist */
+ 
+-
+-__BEGIN_DECLS
++#ifndef __THROW
++# ifndef __GNUC_PREREQ
++#  define __GNUC_PREREQ(maj, min) (0)
++# endif
++# if defined __cplusplus && __GNUC_PREREQ (2,8)
++#  define __THROW       throw ()
++# else
++#  define __THROW
++# endif
++#endif
++
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ extern int setxattr (const char *__path, const char *__name,
+ 		      const void *__value, size_t __size, int __flags) __THROW;
+@@ -58,6 +70,8 @@
+ extern int lremovexattr (const char *__path, const char *__name) __THROW;
+ extern int fremovexattr (int __filedes,   const char *__name) __THROW;
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* __XATTR_H__ */
-- 
2.6.3


