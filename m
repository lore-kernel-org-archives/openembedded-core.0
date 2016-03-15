Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA0C6FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 07:13:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2F7Dc7o021593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 00:13:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 00:13:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2016 15:13:46 +0800
Message-ID: <be3bc855e07621413e0e2443d722d2932b05dee1.1458025958.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458025958.git.Qi.Chen@windriver.com>
References: <cover.1458025958.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] openssl: don't move libcrypto to base_libdir
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
X-List-Received-Date: Tue, 15 Mar 2016 07:13:39 -0000
Content-Type: text/plain

For now, if 'openssl' is enabled for ntp, ntp would still be built
without openssl & libcrypto. This is because that ntp thinks openssl
and libcrypto locates under the same directory.

This patch removes the codes of moving libcrypto to base_libdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 1282115..0c7e192 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -33,12 +33,12 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 inherit pkgconfig siteinfo multilib_header ptest
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
-FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
 RDEPENDS_${PN}-misc = "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
-FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
+FILES_${PN}-dev += "${libdir}/libcrypto${SOLIBSDEV}"
 
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
 # package RRECOMMENDS on this package.  This will enable the configuration
@@ -166,13 +166,6 @@ do_install () {
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 
-	# Moving libcrypto to /lib
-	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-		mkdir -p ${D}/${base_libdir}/
-		mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
-		sed -i s#libdir=\$\{exec_prefix\}\/lib#libdir=${base_libdir}# ${D}/${libdir}/pkgconfig/libcrypto.pc
-	fi
-
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
 
-- 
1.9.1


