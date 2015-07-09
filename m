Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 79DC560557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 23:01:18 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 01:01:12 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 65B8328BA1E;
	Fri, 10 Jul 2015 01:01:13 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 01:01:09 +0200
Message-ID: <1436482869-26543-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] [daisy] [dizzy] openssl: upgrade to 1.0.1p
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
X-List-Received-Date: Thu, 09 Jul 2015 23:01:25 -0000
Content-Type: text/plain

This upgrade fixes CVE-2015-1793
Removed openssl-fix-link.patch. The linking issue has been fixed in openssl.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../openssl/openssl/openssl-fix-link.patch         | 35 ----------------------
 .../{openssl_1.0.1m.bb => openssl_1.0.1p.bb}       |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1m.bb => openssl_1.0.1p.bb} (90%)

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
deleted file mode 100644
index 154106c..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From aabfb6f78af8e337d3239142117ba303fce55e7e Mon Sep 17 00:00:00 2001
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Date: Thu, 22 Sep 2011 08:55:26 +0200
-Subject: [PATCH] fix the parallel build regarding shared libraries.
-
-Upstream-Status: Pending
----
- .../openssl-1.0.0e/Makefile.org                    |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.org
-index 3c7aea1..6326cd6 100644
---- a/Makefile.org
-+++ b/Makefile.org
-@@ -243,13 +243,13 @@ build_libs: build_crypto build_ssl build_engines
- 
- build_crypto:
- 	@dir=crypto; target=all; $(BUILD_ONE_CMD)
--build_ssl:
-+build_ssl: build_crypto
- 	@dir=ssl; target=all; $(BUILD_ONE_CMD)
--build_engines:
-+build_engines: build_crypto
- 	@dir=engines; target=all; $(BUILD_ONE_CMD)
--build_apps:
-+build_apps: build_crypto build_ssl
- 	@dir=apps; target=all; $(BUILD_ONE_CMD)
--build_tests:
-+build_tests: build_crypto build_ssl
- 	@dir=test; target=all; $(BUILD_ONE_CMD)
- build_tools:
- 	@dir=tools; target=all; $(BUILD_ONE_CMD)
--- 
-1.6.6.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
index cab6b3f..3f61790 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
@@ -15,7 +15,6 @@ SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://oe-ldflags.patch \
             file://engines-install-in-libdir-ssl.patch \
-            file://openssl-fix-link.patch \
             file://debian/version-script.patch \
             file://debian/pic.patch \
             file://debian/c_rehash-compat.patch \
@@ -37,8 +36,8 @@ SRC_URI += "file://configure-targets.patch \
             file://run-ptest \
            "
 
-SRC_URI[md5sum] = "d143d1555d842a069cb7cc34ba745a06"
-SRC_URI[sha256sum] = "095f0b7b09116c0c5526422088058dc7e6e000aa14d22acca6a4e2babcdfef74"
+SRC_URI[md5sum] = "7563e92327199e0067ccd0f79f436976"
+SRC_URI[sha256sum] = "bd5ee6803165c0fb60bbecbacacf244f1f90d2aa0d71353af610c29121e9b2f1"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.9.1


