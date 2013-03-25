Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UKADY-0004gx-4g
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:25:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Mar 2013 09:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,905,1355126400"; d="scan'208";a="308098280"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2013 09:08:20 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 18:08:18 +0200
Message-Id: <1364227698-2785-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nspr: remove unnecessary files from the main package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 16:26:30 -0000

This patch does the following:
 * removes compile-et.pl and prerr.properties from the main package
   because these files are needed only at compile time;
 * moves nspr-config script to nspr-dev package where it belongs;
 * adds 'perl' RDEPENDS for nspr-dev since the package contains a perl
   script for running some tests;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-support/nspr/nspr_4.9.5.bb |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr_4.9.5.bb b/meta/recipes-support/nspr/nspr_4.9.5.bb
index 7975d14..d18b12e 100644
--- a/meta/recipes-support/nspr/nspr_4.9.5.bb
+++ b/meta/recipes-support/nspr/nspr_4.9.5.bb
@@ -16,6 +16,8 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
 
 SRC_URI += "file://nspr.pc.in"
 
+RDEPENDS_${PN}-dev += "perl"
+
 SRC_URI[md5sum] = "b6ccfa8fcbbeb17ebeb19a3edff612bd"
 SRC_URI[sha256sum] = "616ab65c849155c9ed0e5f502530a241cc9108e278275aa448b417ae632c7604"
 
@@ -163,9 +165,14 @@ do_install_append() {
     cd ${S}/pr/tests
     mkdir -p ${D}${libdir}/nspr/tests
     install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
+
+    # delete compile-et.pl and perr.properties from ${bindir} because these are
+    # only used to generate prerr.c and prerr.h files from prerr.et at compile
+    # time
+    rm ${D}${bindir}/compile-et.pl ${D}${bindir}/prerr.properties
 }
 
-FILES_${PN} = "${bindir}/* ${libdir}/lib*.so"
-FILES_${PN}-dev = "${libdir}/nspr/tests/* ${libdir}/pkgconfig \
+FILES_${PN} = "${libdir}/lib*.so"
+FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
                 ${includedir}/* ${datadir}/aclocal/* "
 FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
-- 
1.7.9.5



