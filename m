Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5233D75886
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:50:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I2oHQL015296
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 19:50:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 17 Jun 2015 19:50:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 10:43:06 +0800
Message-ID: <1434595386-11377-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openssl: upgrade to 1.0.2c
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
X-List-Received-Date: Thu, 18 Jun 2015 02:50:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to fix the CVE: CVE-2015-1788..CVE-2015-1792 and CVE-2014-8176
remove a backport patch
update the c_rehash-compat.patch

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...lcl.h-fix-MIPS-specific-gcc-version-check.patch | 30 ----------------------
 .../openssl/openssl/debian/c_rehash-compat.patch   | 22 +++++++---------
 .../{openssl_1.0.2a.bb => openssl_1.0.2c.bb}       |  5 ++--
 3 files changed, 11 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2a.bb => openssl_1.0.2c.bb} (89%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch b/meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
deleted file mode 100644
index 7308f8f..0000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 60c268b21ac81cc6b1af5c5470282a613b96f6fd Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Mon, 25 May 2015 10:17:14 +0200
-Subject: [PATCH] bn/bn_lcl.h: fix MIPS-specific gcc version check.
-
-RT#3859
-
-Reviewed-by: Tim Hudson <tjh@openssl.org>
----
-Upstream-Status: Backport
-
- crypto/bn/bn_lcl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/bn/bn_lcl.h b/crypto/bn/bn_lcl.h
-index 196df7e..b9d124a 100644
---- a/crypto/bn/bn_lcl.h
-+++ b/crypto/bn/bn_lcl.h
-@@ -443,7 +443,7 @@ unsigned __int64 _umul128(unsigned __int64 a, unsigned __int64 b,
- #   endif
- #  elif defined(__mips) && (defined(SIXTY_FOUR_BIT) || defined(SIXTY_FOUR_BIT_LONG))
- #   if defined(__GNUC__) && __GNUC__>=2
--#    if __GNUC__>=4 && __GNUC_MINOR__>=4
-+#    if __GNUC__>4 || (__GNUC__>=4 && __GNUC_MINOR__>=4)
-                                      /* "h" constraint is no more since 4.4 */
- #     define BN_UMULT_HIGH(a,b)          (((__uint128_t)(a)*(b))>>64)
- #     define BN_UMULT_LOHI(low,high,a,b) ({     \
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch
index 3943e2c..68e54d5 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch
@@ -5,14 +5,10 @@ Subject: [PATCH] also create old hash for compatibility
 
 Upstream-Status: Backport [debian]
 
----
- tools/c_rehash.in |    8 +++++++-
- 1 files changed, 7 insertions(+), 1 deletions(-)
-
-Index: openssl-1.0.2~beta3/tools/c_rehash.in
-===================================================================
---- openssl-1.0.2~beta3.orig/tools/c_rehash.in
-+++ openssl-1.0.2~beta3/tools/c_rehash.in
+diff --git a/tools/c_rehash.in b/tools/c_rehash.in
+index b086ff9..b777d79 100644
+--- a/tools/c_rehash.in
++++ b/tools/c_rehash.in
 @@ -8,8 +8,6 @@ my $prefix;
  
  my $openssl = $ENV{OPENSSL} || "openssl";
@@ -23,14 +19,14 @@ Index: openssl-1.0.2~beta3/tools/c_rehash.in
  my $symlink_exists=eval {symlink("",""); 1};
  my $removelinks = 1;
 @@ -18,10 +16,7 @@ my $removelinks = 1;
- while ( $ARGV[0] =~ '-.*' ) {
+ while ( $ARGV[0] =~ /^-/ ) {
      my $flag = shift @ARGV;
      last if ( $flag eq '--');
--    if ( $flag =~ /-old/) {
+-    if ( $flag eq '-old') {
 -	    $x509hash = "-subject_hash_old";
 -	    $crlhash = "-hash_old";
--    } elsif ( $flag =~ /-h/) {
-+    if ( $flag =~ /-h/) {
+-    } elsif ( $flag eq '-h') {
++    if ( $flag eq '-h') {
  	    help();
      } elsif ( $flag eq '-n' ) {
  	    $removelinks = 0;
@@ -52,7 +48,7 @@ Index: openssl-1.0.2~beta3/tools/c_rehash.in
  		$fname =~ s/'/'\\''/g;
  		my ($hash, $fprint) = `"$openssl" x509 $x509hash -fingerprint -noout -in "$fname"`;
  		chomp $hash;
-@@ -177,10 +175,20 @@ sub link_hash_cert {
+@@ -176,11 +174,21 @@ sub link_hash_cert {
  		$hashlist{$hash} = $fprint;
  }
  
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2c.bb
similarity index 89%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2c.bb
index f4006f6..74319ff 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2c.bb
@@ -36,11 +36,10 @@ SRC_URI += "file://configure-targets.patch \
             file://ptest-deps.patch \
             file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
-            file://0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch \
            "
 
-SRC_URI[md5sum] = "a06c547dac9044161a477211049f60ef"
-SRC_URI[sha256sum] = "15b6393c20030aab02c8e2fe0243cb1d1d18062f6c095d67bca91871dc7f324a"
+SRC_URI[md5sum] = "8c8d81a9ae7005276e486702edbcd4b6"
+SRC_URI[sha256sum] = "0038ba37f35a6367c58f17a7a7f687953ef8ce4f9684bbdec63e62515ed36a83"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.9.1


