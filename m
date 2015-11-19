Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id BCF376057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:11 +0000 (UTC)
Received: by qkda6 with SMTP id a6so27804887qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eQFLn7t0gU1raeHn0u1da4pzopXgemg5zfeTlsM2iB4=;
	b=CAsEo3H5kjuo665JZF4BWi99mNKhvbBk7ZYWmzWJr2Lz4ABJKEINjBGutEphJKvm4w
	ANQKaFFnCUF75bUgPGdg2+n1Ij8RkgrTX5YHI/hGVH3I5+lia6izXzl9SBTbvFBeeEHn
	55Z5BLkNR6c8BxPqGnJNILhrZio4rGMcvwEziBoQg6rWh7n8lJr8+/zAqxak6URJfMnl
	UMg0TELjntYIkqpfK0viYT02yzdkDw5mL0KzaDeRYGkjUruhoDS7GzRhRHG/tsL+B2HK
	3aAzkdXKoLp1xD3mdym9xrs+EfpJyP8v1T3UmB8FAOkvQRgxvjaADneQEMUjuLB7+T9y
	h/DA==
X-Received: by 10.55.76.22 with SMTP id z22mr8061674qka.89.1447953072262;
	Thu, 19 Nov 2015 09:11:12 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:11:00 +0000
Message-Id: <952150132cd8088af94a502d612b9c8b1e454efc.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:12 -0000

based on suggestions on musl FAQ
http://wiki.musl-libc.org/wiki/FAQ

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr_2.4.47.bb           |  4 +-
 .../attr/files/dont-use-decl-macros.patch          | 44 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)
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
index 0000000..5285a2f
--- /dev/null
+++ b/meta/recipes-support/attr/files/dont-use-decl-macros.patch
@@ -0,0 +1,44 @@
+musl does not do nested includes unless *necessary*, nor does it define
+macros
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


