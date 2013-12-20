Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB166BC1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 06:41:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 22:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,518,1384329600"; d="scan'208";a="455317866"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 22:41:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 22:41:07 -0800
Message-Id: <1387521668-26329-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
References: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4] openssl: use PACKAGECONFIG to disable perl bits
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
X-List-Received-Date: Fri, 20 Dec 2013 06:41:10 -0000

Adding perl to the RDEPENDS caused a performance hit to the overall build time since this was
the only package that depended on perl.  The openssl-misc package is not installed by default
so use a PACKAGECONFIG which can be overridden to allow the perl scripts along with  perl to
 be installed.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index cdb1809..c58c99f 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
 DEPENDS = "perl-native-runtime"
 
-# Adding RDEPENDS for perl scripts
-RDEPENDS_${PN}-misc +="perl"
+PACKAGECONFIG[perl] = ",,,perl"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
@@ -157,11 +156,18 @@ do_install () {
 
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
-	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 
 	oe_multilib_header openssl/opensslconf.h
-	# The c_rehash utility isn't installed by the normal installation process.
-	install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
+	if [ "${@base_contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" = "perl" ]; then
+		install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/c_rehash
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
+		# The c_rehash utility isn't installed by the normal installation process.
+	else
+		rm -f ${D}${bindir}/c_rehash
+		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
+	fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


