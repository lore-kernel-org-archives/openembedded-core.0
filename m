Received: from elite.brightsigndigital.co.uk ([81.142.160.137])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1RuPH2-0001ew-GI
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 15:10:28 +0100
Received: from [172.30.1.25] (helo=chuckie.brightsign)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1RuOiA-0001Pj-TT; Mon, 06 Feb 2012 13:34:26 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1RuOiA-0006Xd-SW; Mon, 06 Feb 2012 13:34:26 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 13:34:22 +0000
Message-Id: <1328535262-25110-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libcap: Cope with ${libdir} and ${base_libdir} being the same
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 14:10:28 -0000

${libdir} and ${base_libdir} may be the same. If they are don't try and
move files onto themselves.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/libcap/libcap.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 9418abf..5b03671 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -12,6 +12,8 @@ DEPENDS_virtclass-native = "perl-native-runtime"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/libcap2/${BPN}-${PV}.tar.bz2"
 
+PR = "r1"
+
 inherit lib_package
 
 do_configure() {
@@ -47,8 +49,10 @@ do_install() {
 do_install_append() {
 	# Move the library to base_libdir
 	install -d ${D}${base_libdir}
-	mv ${D}${libdir}/* ${D}${base_libdir}
-	rmdir ${D}${libdir}
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mv ${D}${libdir}/* ${D}${base_libdir}
+		rmdir ${D}${libdir}
+	fi
 }
 
 FILES_${PN}-dev += "${base_libdir}/*.so"
-- 
1.7.8.3



