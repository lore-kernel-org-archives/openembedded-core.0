Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA0471984
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 06:29:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8U6TVfv012632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Sep 2018 23:29:32 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 23:29:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sun, 30 Sep 2018 14:39:34 +0800
Message-ID: <1538289574-19536-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Sun, 30 Sep 2018 06:29:33 -0000
Content-Type: text/plain

The case in ptest use `nm -Pg libcrypto.so.1.1' to check symbol presence,
hence we need to inhibit package split and package debug split.

The binutils provides `nm', hence add it to ptest runtime depends.
(Without `nm', the test_symbol_presence will be skipped, that's the
reason why ptest passed on a small image, and failed on a full image)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 73bcb27..673b0f9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -151,6 +151,12 @@ do_install_ptest () {
 	cp -r * ${D}${PTEST_PATH}
 }
 
+# The ptest case uses `nm -Pg libcrypto.so.1.1' to check symbol presence
+INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
+# The binutils provides `nm'
+RDEPENDS_${PN}-ptest += "binutils"
+
 PRIVATE_LIBS_${PN}-ptest = "libcrypto.so.1.1 libssl.so.1.1"
 
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
-- 
2.7.4


