Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 668A06CA74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 05:15:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9S5FIOK016522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 22:15:18 -0700 (PDT)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 27 Oct 2013 22:15:18 -0700
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Oct 2013 13:15:54 +0800
Message-ID: <1382937354-31622-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] openssl: create package for openssl configuration file
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
X-List-Received-Date: Mon, 28 Oct 2013 05:15:18 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

* Add the openssl-conf package to the list of packages to
  be created.  This package contains the openssl.cnf file
  which is used by both the openssl executable in the
  openssl package and the libcrypto library.

* This is to avoid messages like:
    WARNING: can't open config file: /usr/lib/ssl/openssl.cnf

* When running "openssl req" to request and generate a certificate
  the command will fail without the openssl.cnf file being
  installed on the target system.

* Made this package an RRECOMMENDS for libcrypto since:
	* libcrypto is a RDEPENDS for the openssl package
	* Users can specify a configuration file at another
      location so it is not stricly required and many
      commands will work without it (with warnings)

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 78ff7ae..f4b786a 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -33,13 +33,21 @@ export AS = "${CC} -c"
 
 inherit pkgconfig siteinfo multilib_header
 
-PACKAGES =+ "libcrypto libssl ${PN}-misc"
+PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
 FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
+# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
+# package RRECOMMENDS on this package.  This will enable the configuration
+# file to be installed for both the base openssl package and the libcrypto
+# package since the base openssl package depends on the libcrypto package.
+FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
+CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
+
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
 }
-- 
1.7.9.5


