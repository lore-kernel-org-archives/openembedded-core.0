Return-Path: <Yue.Tao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76B486067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 03:24:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6F3OZ3w024294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 20:24:37 -0700
Received: from pek-ytao-l1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 14 Jul 2016 20:24:33 -0700
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 11:24:25 +0800
Message-ID: <1468553065-6553-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.131]
Cc: yue.tao@windriver.com
Subject: [meta-oe][PATCH] openssl: use the perl of perl-native instead of the host perl
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
X-List-Received-Date: Fri, 15 Jul 2016 03:24:41 -0000
Content-Type: text/plain

The openssl can't build with very old perl, such as 5.8.9, so force it
to use the perl-native to avoid host dependence issue.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 1a0031e..6990139 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -30,7 +30,7 @@ export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-inherit pkgconfig siteinfo multilib_header ptest
+inherit pkgconfig siteinfo multilib_header ptest perlnative
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
@@ -208,6 +208,7 @@ do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}/util
 	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
 	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
+	sed -i -e 's#^PERL=.*#PERL= /usr/bin/perl#g' ${D}${PTEST_PATH}/Makefile
 }
 
 do_install_append_class-native() {
-- 
1.7.9.5


