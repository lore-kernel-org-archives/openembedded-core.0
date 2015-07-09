Return-Path: <jan.wetter@mikrom.com>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Jul 2015 15:39:16 UTC
Received: from mail.mikrom.com (mikrom.com [178.63.40.178])
	by mail.openembedded.org (Postfix) with ESMTP id DA8EC6E5F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:39:16 +0000 (UTC)
Received: from mikrom.com (mail.mikrom.local [192.168.0.225])
	by mail.mikrom.com (Postfix) with ESMTPS id 9224213E8E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:34:05 +0200 (CEST)
Received: from methusalix.dove.mikrom.com (methusalix.dove.mikrom.com
	[192.168.0.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mikrom.com (Postfix) with ESMTPSA id 494831BC1A;
	Thu,  9 Jul 2015 17:33:56 +0200 (CEST)
From: Jan Wetter <jan.wetter@mikrom.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 17:33:48 +0200
Message-Id: <1436456028-23148-1-git-send-email-jan.wetter@mikrom.com>
X-Mailer: git-send-email 2.3.6
Subject: [PATCH] openssl: upgrade to 1.0.2d
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
X-List-Received-Date: Thu, 09 Jul 2015 15:39:24 -0000

This upgrade fixes CVE-2015-1793
Removed openssl-fix-link.patch. The linking issue has been fixed in openssl.

Signed-off-by: Jan Wetter <jan.wetter@mikrom.com>
---
 .../openssl/openssl/openssl-fix-link.patch         | 35 ----------------------
 .../{openssl_1.0.2c.bb => openssl_1.0.2d.bb}       |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2c.bb => openssl_1.0.2d.bb} (90%)

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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2c.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2c.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index fd4ba6c..32d8dce 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -15,7 +15,6 @@ SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://oe-ldflags.patch \
             file://engines-install-in-libdir-ssl.patch \
-            file://openssl-fix-link.patch \
             file://debian1.0.2/block_diginotar.patch \
             file://debian1.0.2/block_digicert_malaysia.patch \
             file://debian/ca.patch \
@@ -39,8 +38,8 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.2a-x32-asm.patch \
            "
 
-SRC_URI[md5sum] = "8c8d81a9ae7005276e486702edbcd4b6"
-SRC_URI[sha256sum] = "0038ba37f35a6367c58f17a7a7f687953ef8ce4f9684bbdec63e62515ed36a83"
+SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
+SRC_URI[sha256sum] = "671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
2.3.6


