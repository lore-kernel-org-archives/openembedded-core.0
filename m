Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76C167C94F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 01:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1K1VZlL029501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:31:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 19 Feb 2019 17:31:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2019 09:40:35 +0800
Message-ID: <893bfb66e32bb3bc8a2ef21fa5255873c508f0a3.1550626729.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550626729.git.Qi.Chen@windriver.com>
References: <cover.1550626729.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] kmod: upgrade to 26
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
X-List-Received-Date: Wed, 20 Feb 2019 01:31:34 -0000
Content-Type: text/plain

Refresh patches to avoid warning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc                       |  4 ++--
 ...-to-calling-bswap_-instead-of-htobe-and-be-toh.patch | 17 +++++++++--------
 .../recipes-kernel/kmod/kmod/avoid_parallel_tests.patch | 15 ++++++++++-----
 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch       | 13 +++++++------
 4 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 29885fb..ceb66ad 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-SRCREV = "aca4eca103d6699543f7ed663335c28c2e9908bb"
+SRCREV = "58133a96c894c043e48c74ddf0bfe8db90bac62f"
 # Lookout for PV bump too when SRCREV is changed
-PV = "25+git${SRCPV}"
+PV = "26+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
diff --git a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
index b722183..0ec20fa 100644
--- a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
+++ b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
@@ -1,4 +1,7 @@
-Subject: Change to calling bswap_* instead of htobe* and be*toh
+From 38d6871d9c98e0080426ea375e390728485b2bc2 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Tue, 10 Sep 2013 06:00:20 +0000
+Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
 
 We can't use htobe* and be*toh functions because they are not
 available on older versions of glibc, For example, shipped on Centos 5.5.
@@ -9,12 +12,13 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  libkmod/libkmod-signature.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
-index 6fc06fc..912185a 100644
+index 48d0145..dd2c6fa 100644
 --- a/libkmod/libkmod-signature.c
 +++ b/libkmod/libkmod-signature.c
 @@ -18,6 +18,7 @@
@@ -23,9 +27,9 @@ index 6fc06fc..912185a 100644
  #include <endian.h>
 +#include <byteswap.h>
  #include <inttypes.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -127,7 +128,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
+ #ifdef ENABLE_OPENSSL
+ #include <openssl/cms.h>
+@@ -343,7 +344,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
  			modsig->hash >= PKEY_HASH__LAST ||
  			modsig->id_type >= PKEY_ID_TYPE__LAST)
  		return false;
@@ -34,6 +38,3 @@ index 6fc06fc..912185a 100644
  	if (sig_len == 0 ||
  	    size < (int64_t)(modsig->signer_len + modsig->key_id_len + sig_len))
  		return false;
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index 5f45fce..990c338 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -1,3 +1,8 @@
+From be6f82c54f694617c646ca1f8b5bcf93694e20ad Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Fri, 6 Sep 2013 21:11:57 +0000
+Subject: [PATCH] kmod: avoid parallel-tests
+
 Avoid parallel-tests as it remove
 buildtest-TESTS and runtest-TESTS targets required by ptest.
 In automake 1.13.4 parallel-tests is assumed by defauls.
@@ -5,16 +10,16 @@ In order to have buildtest-TESTS and runtest-TESTS targets
 serial-tests is now required
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Inappropriate (disable feature incompatible with ptest) 
+Upstream-Status: Inappropriate (disable feature incompatible with ptest)
 
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
+diff --git a/configure.ac b/configure.ac
+index ee72283..60980c0 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  AC_PREFIX_DEFAULT([/usr])
diff --git a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
index 5d9d40c..07e4a1f 100644
--- a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
+++ b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
@@ -1,4 +1,4 @@
-From bd43367eee868059770188fd9e9db38520dc6fff Mon Sep 17 00:00:00 2001
+From 5f55e6806cd8ae1a6c8ec1e6cb38ad292cfc1df9 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 22 Jan 2014 01:06:40 -0500
 Subject: [PATCH] libkmod/libkmod-internal.h: check whether O_CLOEXEC is
@@ -14,14 +14,15 @@ This problem was reported by "Ting Liu <b28495@freescale.com>"
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
 Upstream-Status: Pending
+
 ---
- libkmod/libkmod-internal.h |    4 ++++
+ libkmod/libkmod-internal.h | 4 ++++
  1 file changed, 4 insertions(+)
 
-Index: git/libkmod/libkmod-internal.h
-===================================================================
---- git.orig/libkmod/libkmod-internal.h
-+++ git/libkmod/libkmod-internal.h
+diff --git a/libkmod/libkmod-internal.h b/libkmod/libkmod-internal.h
+index a65ddd1..a4f4b77 100644
+--- a/libkmod/libkmod-internal.h
++++ b/libkmod/libkmod-internal.h
 @@ -10,6 +10,10 @@
  
  #include "libkmod.h"
-- 
1.9.1


