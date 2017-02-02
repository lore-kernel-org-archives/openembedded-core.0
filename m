Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 375 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Feb 2017 08:41:20 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 41FC371AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 08:41:18 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v128Z4DP017831
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2017 09:35:04 +0100
Received: from dev.sbt.siemens.com ([163.242.52.173])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v128Z3ke027992;
	Thu, 2 Feb 2017 09:35:03 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 9250F120;
	Thu,  2 Feb 2017 09:35:03 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 09:35:00 +0100
Message-Id: <1486024500-7978-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: Updgrade 1.0.2j -> 1.0.2k
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
X-List-Received-Date: Thu, 02 Feb 2017 08:41:28 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../openssl/openssl/CVE-2016-7055.patch            | 43 ----------------
 .../recipes-connectivity/openssl/openssl_1.0.2j.bb | 60 ----------------------
 .../recipes-connectivity/openssl/openssl_1.0.2k.bb | 59 +++++++++++++++++++++
 3 files changed, 59 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
deleted file mode 100644
index 83a74cd..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 57c4b9f6a2f800b41ce2836986fe33640f6c3f8a Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Sun, 6 Nov 2016 18:33:17 +0100
-Subject: [PATCH] bn/asm/x86_64-mont.pl: fix for CVE-2016-7055 (Low severity).
-
-Reviewed-by: Rich Salz <rsalz@openssl.org>
-(cherry picked from commit 2fac86d9abeaa643677d1ffd0a139239fdf9406a)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/57c4b9f6a2f800b41ce2836986fe33640f6c3f8a]
-CVE: CVE-2016-7055
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- crypto/bn/asm/x86_64-mont.pl | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/crypto/bn/asm/x86_64-mont.pl b/crypto/bn/asm/x86_64-mont.pl
-index 044fd7e..80492d8 100755
---- a/crypto/bn/asm/x86_64-mont.pl
-+++ b/crypto/bn/asm/x86_64-mont.pl
-@@ -1148,18 +1148,17 @@ $code.=<<___;
- 	mulx	2*8($aptr),%r15,%r13	# ...
- 	adox	-3*8($tptr),%r11
- 	adcx	%r15,%r12
--	adox	$zero,%r12
-+	adox	-2*8($tptr),%r12
- 	adcx	$zero,%r13
-+	adox	$zero,%r13
- 
- 	mov	$bptr,8(%rsp)		# off-load &b[i]
--	.byte	0x67
- 	mov	$mi,%r15
- 	imulq	24(%rsp),$mi		# "t[0]"*n0
- 	xor	%ebp,%ebp		# xor	$zero,$zero	# cf=0, of=0
- 
- 	mulx	3*8($aptr),%rax,%r14
- 	 mov	$mi,%rdx
--	adox	-2*8($tptr),%r12
- 	adcx	%rax,%r13
- 	adox	-1*8($tptr),%r13
- 	adcx	$zero,%r14
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
deleted file mode 100644
index 94672f9..0000000
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-require openssl.inc
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-DEPENDS += "cryptodev-linux"
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-CFLAG_append_class-native = " -fPIC"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
-
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
-
-SRC_URI += "file://find.pl;subdir=${BP}/util/ \
-            file://run-ptest \
-            file://openssl-c_rehash.sh \
-            file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://oe-ldflags.patch \
-            file://engines-install-in-libdir-ssl.patch \
-            file://debian1.0.2/block_diginotar.patch \
-            file://debian1.0.2/block_digicert_malaysia.patch \
-            file://debian/ca.patch \
-            file://debian/c_rehash-compat.patch \
-            file://debian/debian-targets.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-rpath.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/pic.patch \
-            file://debian1.0.2/version-script.patch \
-            file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-            file://openssl-fix-des.pod-error.patch \
-            file://Makefiles-ptest.patch \
-            file://ptest-deps.patch \
-            file://openssl-1.0.2a-x32-asm.patch \
-            file://ptest_makefile_deps.patch  \
-            file://configure-musl-target.patch \
-            file://parallel.patch \
-            file://openssl-util-perlpath.pl-cwd.patch \
-            file://CVE-2016-7055.patch \
-           "
-SRC_URI[md5sum] = "96322138f0b69e61b7212bc53d5e912b"
-SRC_URI[sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
-
-PACKAGES =+ "${PN}-engines"
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-
-# The crypto_use_bigint patch means that perl's bignum module needs to be
-# installed, but some distributions (for example Fedora 23) don't ship it by
-# default.  As the resulting error is very misleading check for bignum before
-# building.
-do_configure_prepend() {
-	if ! perl -Mbigint -e true; then
-		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
-	fi
-}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
new file mode 100644
index 0000000..1973f81
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
@@ -0,0 +1,59 @@
+require openssl.inc
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+DEPENDS += "cryptodev-linux"
+
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG_append_class-native = " -fPIC"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
+
+export DIRS = "crypto ssl apps engines"
+export OE_LDFLAGS="${LDFLAGS}"
+
+SRC_URI += "file://find.pl;subdir=${BP}/util/ \
+            file://run-ptest \
+            file://openssl-c_rehash.sh \
+            file://configure-targets.patch \
+            file://shared-libs.patch \
+            file://oe-ldflags.patch \
+            file://engines-install-in-libdir-ssl.patch \
+            file://debian1.0.2/block_diginotar.patch \
+            file://debian1.0.2/block_digicert_malaysia.patch \
+            file://debian/ca.patch \
+            file://debian/c_rehash-compat.patch \
+            file://debian/debian-targets.patch \
+            file://debian/man-dir.patch \
+            file://debian/man-section.patch \
+            file://debian/no-rpath.patch \
+            file://debian/no-symbolic.patch \
+            file://debian/pic.patch \
+            file://debian1.0.2/version-script.patch \
+            file://openssl_fix_for_x32.patch \
+            file://fix-cipher-des-ede3-cfb1.patch \
+            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
+            file://openssl-fix-des.pod-error.patch \
+            file://Makefiles-ptest.patch \
+            file://ptest-deps.patch \
+            file://openssl-1.0.2a-x32-asm.patch \
+            file://ptest_makefile_deps.patch  \
+            file://configure-musl-target.patch \
+            file://parallel.patch \
+            file://openssl-util-perlpath.pl-cwd.patch \
+           "
+SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
+SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
+
+PACKAGES =+ "${PN}-engines"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_configure_prepend() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}
-- 
2.1.4


