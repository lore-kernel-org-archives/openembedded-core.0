Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC14793DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 16:48:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w92GmNHn011449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2018 09:48:23 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 2 Oct 2018 09:48:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Wed, 3 Oct 2018 00:58:28 +0800
Message-ID: <1538499508-26876-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0Lb5-pnQtBDkNEao2AhGnxiLpKYGxdrbGuv1cNpGs+4opg@mail.gmail.com>
References: <CAJTo0Lb5-pnQtBDkNEao2AhGnxiLpKYGxdrbGuv1cNpGs+4opg@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V3] openssl: skip ptest case `test_symbol_presence'
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
X-List-Received-Date: Tue, 02 Oct 2018 16:48:29 -0000
Content-Type: text/plain

The case in ptest use `nm -Pg libcrypto.so' to check symbol presence,
if library is stripped or debug split, the case will fail.

The test case needs debug symbols then we just disable that test.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssl/0001-skip-test_symbol_presence.patch   | 46 ++++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch b/meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch
new file mode 100644
index 0000000..d8d9651
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch
@@ -0,0 +1,46 @@
+From a9401b2289656c5a36dd1b0ecebf0d23e291ce70 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 2 Oct 2018 23:58:24 +0800
+Subject: [PATCH] skip test_symbol_presence
+
+We cannot skip `01-test_symbol_presence.t' by configuring option `no-shared'
+as INSTALL told us the shared libraries will not be built.
+
+[INSTALL snip]
+ Notes on shared libraries
+ -------------------------
+
+ For most systems the OpenSSL Configure script knows what is needed to
+ build shared libraries for libcrypto and libssl. On these systems
+ the shared libraries will be created by default. This can be suppressed and
+ only static libraries created by using the "no-shared" option. On systems
+ where OpenSSL does not know how to build shared libraries the "no-shared"
+ option will be forced and only static libraries will be created.
+[INSTALL snip]
+
+Hence directly modification the case to skip it.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ test/recipes/01-test_symbol_presence.t | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/test/recipes/01-test_symbol_presence.t b/test/recipes/01-test_symbol_presence.t
+index 7f2a2d7..0b93745 100644
+--- a/test/recipes/01-test_symbol_presence.t
++++ b/test/recipes/01-test_symbol_presence.t
+@@ -14,8 +14,7 @@ use OpenSSL::Test::Utils;
+ 
+ setup("test_symbol_presence");
+ 
+-plan skip_all => "Only useful when building shared libraries"
+-    if disabled("shared");
++plan skip_all => "The case needs debug symbols then we just disable it";
+ 
+ my @libnames = ("crypto", "ssl");
+ my $testcount = scalar @libnames;
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 73bcb27..5a43a15 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -13,6 +13,7 @@ DEPENDS = "hostperl-runtime-native"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
+           file://0001-skip-test_symbol_presence.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.7.4


