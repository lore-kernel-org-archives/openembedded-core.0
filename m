Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 982447EEBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:22:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6A7LoPp017197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 00:22:01 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 10 Jul 2019 00:21:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2019 03:21:29 -0400
Message-ID: <20190710072129.52125-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] openssl: fix multilib files conflict
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
X-List-Received-Date: Wed, 10 Jul 2019 07:22:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Inherit multilib_script to fix openssl multilib files conflict issue:

| Error: Transaction check error:
|   file /usr/bin/c_rehash conflicts between attempted installs of
|   lib32-openssl-bin-1.1.1c-r0.core2_32 and openssl-bin-1.1.1c-r0.core2_64

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1c.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 0117407316..af43d6992c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -26,7 +26,8 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "15e21da6efe8aa0e0768ffd8cd37a5f6"
 SRC_URI[sha256sum] = "f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90"
 
-inherit lib_package multilib_header ptest
+inherit lib_package multilib_header multilib_script ptest
+MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG_class-native = ""
-- 
2.20.0


