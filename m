Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 738DC6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 15:37:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w91Fb8Xl028734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Oct 2018 08:37:08 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 1 Oct 2018 08:37:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 1 Oct 2018 23:47:05 +0800
Message-ID: <1538408825-13100-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <829f16e68431d6fbeda54d3a16709ab47552589a.camel@linuxfoundation.org>
References: <829f16e68431d6fbeda54d3a16709ab47552589a.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH] openssl: fix ptest case `test_symbol_presence' failed
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
X-List-Received-Date: Mon, 01 Oct 2018 15:37:08 -0000
Content-Type: text/plain

The case in ptest use `nm -Pg libcrypto.so' to check symbol presence,
if library is stripped or debug split, the case will fail.

The dbg library keeps symbol table, so tweak to check on it.

Use wildcard `libcrypto.so*' rather than `libcrypto.so.1.1' to compat
the subsequent version upgrade.

The binutils provides `nm', hence add it to ptest runtime depends.
(Without `nm', the test_symbol_presence will be skipped, that's the
reason why ptest passed on a small image, and failed on a full image)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...test_symbol_presence-check-on-dbg-library.patch | 36 ++++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  6 ++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch b/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch
new file mode 100644
index 0000000..3999aa0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch
@@ -0,0 +1,36 @@
+From 2766dc8af70ced2854a6817e67cbac234c99f91f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 1 Oct 2018 22:16:53 +0800
+Subject: [PATCH] test_symbol_presence: check on dbg library
+
+The case uses `nm -Pg libcrypto.so' to check symbol presence,
+if library is stripped or debug splited, the case will fail.
+
+The dbg library has the symbol table, so tweak to check on it.
+
+Use wildcard `libcrypto.so*' rather than `libcrypto.so.1.1' to compat
+the subsequent version upgrade.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ test/recipes/01-test_symbol_presence.t | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/recipes/01-test_symbol_presence.t b/test/recipes/01-test_symbol_presence.t
+index 7f2a2d7..1668cde 100644
+--- a/test/recipes/01-test_symbol_presence.t
++++ b/test/recipes/01-test_symbol_presence.t
+@@ -32,7 +32,7 @@ note
+ foreach my $libname (@libnames) {
+  SKIP:
+     {
+-        my $shlibpath = bldtop_file("lib" . $libname . ".so");
++        my $shlibpath = bldtop_file(".debug/" . "lib" . $libname . ".so*");
+         *OSTDERR = *STDERR;
+         *OSTDOUT = *STDOUT;
+         open STDERR, ">", devnull();
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 73bcb27..74b3417 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -13,6 +13,7 @@ DEPENDS = "hostperl-runtime-native"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
+           file://0001-test_symbol_presence-check-on-dbg-library.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
@@ -174,6 +175,11 @@ RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-bin = "perl"
 RDEPENDS_${PN}-misc = "perl"
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+# The ptest case uses `nm -Pg .debug/libcrypto.so*' to check symbol presence
+RDEPENDS_${PN}-ptest += "${PN}-dbg"
+INSANE_SKIP_${PN}-ptest ?= "debug-deps"
+# The binutils provides `nm'
+RDEPENDS_${PN}-ptest += "binutils"
 
 RPROVIDES_openssl-conf = "openssl10-conf"
 RREPLACES_openssl-conf = "openssl10-conf"
-- 
2.7.4


