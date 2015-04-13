Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 578A173D3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 01:55:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3D1t3Yh029690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 18:55:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 18:55:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 09:55:04 +0800
Message-ID: <89cf93e1fba3eaead9ee494e63fe1e711c8d4cfd.1428890059.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428890059.git.Qi.Chen@windriver.com>
References: <cover.1428890059.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kmod: upgrade to 20
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
X-List-Received-Date: Mon, 13 Apr 2015 01:55:02 -0000
Content-Type: text/plain

The following patches are rebased.
-- Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
-- avoid_parallel_tests.patch

The ptest part of kmod is removed because new version of kmod port all tests to
use modules from module-playground instead of copying prebuilt modules to the
repository. So, we cannot use ptest as before. Remove it so that kmod can build
successfully.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |  8 +++---
 ...01-Makefile.am-fix-parallel-build-problem.patch | 29 +++++++++++++++++++++
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 15 +++++------
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 ++++++++++++++--------
 meta/recipes-kernel/kmod/kmod_git.bb               | 15 -----------
 5 files changed, 57 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 899881e..53574b6 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -14,16 +14,14 @@ DEPENDS += "pkgconfig-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
-inherit autotools gtk-doc ptest
+inherit autotools gtk-doc
 
-SRCREV = "fd56638aed3fe147015bfa10ed4a5f7491303cb4"
+SRCREV = "d9c71758595cad72c8278179eabf17017615f704"
 # Lookout for PV bump too when SRCREV is changed
-PV = "19+git${SRCPV}"
+PV = "20+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
-           file://run-ptest \
-           file://ptest.patch \
            file://avoid_parallel_tests.patch \
            file://fix-O_CLOEXEC.patch \
           "
diff --git a/meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch b/meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
new file mode 100644
index 0000000..49b0209
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+Subject: Makefile.am: fix parallel build problem
+
+Fix parallel build problem to avoid errors like below.
+
+    install: cannot stat 'testsuite/module-playground/mod-fake-cciss.ko': No such file or directory
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9457655..d5b02eb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -237,7 +237,7 @@ rootfs: build-module-playground
+ 
+ .PHONY: rootfs build-playground
+ 
+-$(ROOTFS): $(ROOTFS_PRISTINE)
++$(ROOTFS): $(ROOTFS_PRISTINE) build-module-playground
+ 	$(CREATE_ROOTFS)
+ 
+ TESTSUITE_OVERRIDE_LIBS = \
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
index 7c0a275..b722183 100644
--- a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
+++ b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
@@ -1,7 +1,4 @@
-From 4b68940b1ed46c54a5a0bdf6bb9d4599bc64e6f4 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 24 Dec 2014 10:12:40 +0800
-Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
+Subject: Change to calling bswap_* instead of htobe* and be*toh
 
 We can't use htobe* and be*toh functions because they are not
 available on older versions of glibc, For example, shipped on Centos 5.5.
@@ -17,10 +14,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
-index 2b976a5..ffe58c2 100644
+index 6fc06fc..912185a 100644
 --- a/libkmod/libkmod-signature.c
 +++ b/libkmod/libkmod-signature.c
-@@ -19,6 +19,7 @@
+@@ -18,6 +18,7 @@
   */
  
  #include <endian.h>
@@ -28,15 +25,15 @@ index 2b976a5..ffe58c2 100644
  #include <inttypes.h>
  #include <stdio.h>
  #include <stdlib.h>
-@@ -124,7 +125,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
+@@ -127,7 +128,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
  			modsig->hash >= PKEY_HASH__LAST ||
  			modsig->id_type >= PKEY_ID_TYPE__LAST)
  		return false;
 -	sig_len = be32toh(get_unaligned(&modsig->sig_len));
 +	sig_len = bswap_32(get_unaligned(&modsig->sig_len));
- 	if (size < (off_t)(modsig->signer_len + modsig->key_id_len + sig_len))
+ 	if (sig_len == 0 ||
+ 	    size < (int64_t)(modsig->signer_len + modsig->key_id_len + sig_len))
  		return false;
- 
 -- 
 1.9.1
 
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index 4c37d44..feafcb9 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -7,15 +7,23 @@ serial-tests is now required
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate (disable feature incompatible with ptest) 
 
-diff -ruN a/configure.ac b/configure.ac
---- a/configure.ac	2013-09-02 15:05:18.662366800 +0200
-+++ b/configure.ac	2013-11-28 09:26:49.557066764 +0200
-@@ -8,7 +8,7 @@
- AC_CONFIG_SRCDIR([libkmod/libkmod.c])
- AC_CONFIG_AUX_DIR([build-aux])
- AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules
--	tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
-+	tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
- AC_PROG_CC_STDC
- AC_USE_SYSTEM_EXTENSIONS
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index eb0f9d1..a539968 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
+ AC_PREFIX_DEFAULT([/usr])
+ AM_MAINTAINER_MODE([enable])
+-AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
++AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
+ AM_SILENT_RULES([yes])
+ LT_INIT([disable-static pic-only])
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 08dd815..ba4d85e 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -33,27 +33,12 @@ do_install_append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
-
-        if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
-                find testsuite -name *.ko -exec tar rf testmodule.tar {} \;
-                find testsuite -name *.ko -exec rm -f {} \;
-        fi
 }
 
 do_compile_prepend() {
             sed -i 's/ac_pwd=/#ac_pwd=/' config.status ; sed -i "/#ac_pwd=/a\ac_pwd='.'" config.status
 }
 
-do_compile_ptest () {
-        oe_runmake buildtest-TESTS rootfs
-}
-
-do_install_ptest () {
-        install testmodule.tar ${D}${PTEST_PATH}
-}
-
-INSANE_SKIP_${PN}-ptest = "arch"
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "60"
-- 
1.9.1


