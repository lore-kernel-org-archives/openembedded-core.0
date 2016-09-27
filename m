Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 29DB4605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 17:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8RHAIe7024027 for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:10:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Jx7HRj7wVgtG
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:10:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8RHAE3X024015
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:10:15 +0100
Message-ID: <1474996214.30475.53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 18:10:14 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] openssl: Upgrade 1.0.2i -> 1.0.2j
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
X-List-Received-Date: Tue, 27 Sep 2016 17:10:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Deals with a CVE issue
Drops a patch applied upstream and no longer needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch b/meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch
deleted file mode 100644
index 0411296..0000000
--- a/meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 581215a519c66db7255ea360ed25bb00033ccd52 Mon Sep 17 00:00:00 2001
-From: Rich Salz <rsalz@openssl.org>
-Date: Thu, 22 Sep 2016 08:47:45 -0400
-Subject: [PATCH] Fix typo introduced by a03f81f4
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/581215a519c66db7255ea360ed25bb00033ccd52]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- crypto/engine/eng_cryptodev.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
-index 65a74df..2a2b95c 100644
---- a/crypto/engine/eng_cryptodev.c
-+++ b/crypto/engine/eng_cryptodev.c
-@@ -939,7 +939,7 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
-     if (fstate->mac_len != 0) {
-         if (fstate->mac_data != NULL) {
-             dstate->mac_data = OPENSSL_malloc(fstate->mac_len);
--            if (dstate->ac_data == NULL) {
-+            if (dstate->mac_data == NULL) {
-                 printf("cryptodev_digest_init: malloc failed\n");
-                 return 0;
-             }
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2i.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2i.bb
deleted file mode 100644
index c32f472..0000000
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2i.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-require openssl.inc
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-DEPENDS += "cryptodev-linux"
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
-
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
-
-SRC_URI += "file://find.pl;subdir=${BP}/util/ \
-            file://run-ptest \
-            file://openssl-c_rehash.sh \
-            file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://oe-ldflags.patch \
-            file://engines-install-in-libdir-ssl.patch \
-            file://debian1.0.2/block_diginotar.patch \
-            file://debian1.0.2/block_digicert_malaysia.patch \
-            file://debian/ca.patch \
-            file://debian/c_rehash-compat.patch \
-            file://debian/debian-targets.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-rpath.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/pic.patch \
-            file://debian1.0.2/version-script.patch \
-            file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-            file://openssl-fix-des.pod-error.patch \
-            file://Makefiles-ptest.patch \
-            file://ptest-deps.patch \
-            file://openssl-1.0.2a-x32-asm.patch \
-            file://ptest_makefile_deps.patch  \
-            file://configure-musl-target.patch \
-            file://parallel.patch \
-            file://openssl-util-perlpath.pl-cwd.patch \
-            file://Fix-typo-introduced-by-a03f81f4.patch \
-           "
-SRC_URI[md5sum] = "678374e63f8df456a697d3e5e5a931fb"
-SRC_URI[sha256sum] = "9287487d11c9545b6efb287cdb70535d4e9b284dd10d51441d9b9963d000de6f"
-
-PACKAGES =+ "${PN}-engines"
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-
-# The crypto_use_bigint patch means that perl's bignum module needs to be
-# installed, but some distributions (for example Fedora 23) don't ship it by
-# default.  As the resulting error is very misleading check for bignum before
-# building.
-do_configure_prepend() {
-	if ! perl -Mbigint -e true; then
-		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
-	fi
-}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
new file mode 100644
index 0000000..257e3cf
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
@@ -0,0 +1,58 @@
+require openssl.inc
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+DEPENDS += "cryptodev-linux"
+
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
+
+export DIRS = "crypto ssl apps engines"
+export OE_LDFLAGS="${LDFLAGS}"
+
+SRC_URI += "file://find.pl;subdir=${BP}/util/ \
+            file://run-ptest \
+            file://openssl-c_rehash.sh \
+            file://configure-targets.patch \
+            file://shared-libs.patch \
+            file://oe-ldflags.patch \
+            file://engines-install-in-libdir-ssl.patch \
+            file://debian1.0.2/block_diginotar.patch \
+            file://debian1.0.2/block_digicert_malaysia.patch \
+            file://debian/ca.patch \
+            file://debian/c_rehash-compat.patch \
+            file://debian/debian-targets.patch \
+            file://debian/man-dir.patch \
+            file://debian/man-section.patch \
+            file://debian/no-rpath.patch \
+            file://debian/no-symbolic.patch \
+            file://debian/pic.patch \
+            file://debian1.0.2/version-script.patch \
+            file://openssl_fix_for_x32.patch \
+            file://fix-cipher-des-ede3-cfb1.patch \
+            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
+            file://openssl-fix-des.pod-error.patch \
+            file://Makefiles-ptest.patch \
+            file://ptest-deps.patch \
+            file://openssl-1.0.2a-x32-asm.patch \
+            file://ptest_makefile_deps.patch  \
+            file://configure-musl-target.patch \
+            file://parallel.patch \
+            file://openssl-util-perlpath.pl-cwd.patch \
+           "
+SRC_URI[md5sum] = "96322138f0b69e61b7212bc53d5e912b"
+SRC_URI[sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
+
+PACKAGES =+ "${PN}-engines"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_configure_prepend() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}



