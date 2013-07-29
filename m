Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A68F6A39D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 01:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6T1rLXR027716
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 18:53:21 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sun, 28 Jul 2013 18:53:20 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2013 09:53:16 +0800
Message-ID: <1375062796-13686-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH V1] openssl: Fix multilib header conflict - opensslconf.h
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
X-List-Received-Date: Mon, 29 Jul 2013 01:53:20 -0000
Content-Type: text/plain

opensslconf.h conflicts between 32-bit and 64-bit versions.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index f5b2432..78ff7ae 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -31,7 +31,7 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
-inherit pkgconfig siteinfo
+inherit pkgconfig siteinfo multilib_header
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc"
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
@@ -145,6 +145,7 @@ do_install () {
 	cp --dereference -R include/openssl ${D}${includedir}
 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 
+	oe_multilib_header openssl/opensslconf.h
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1


