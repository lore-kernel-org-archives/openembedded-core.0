Received: from elite.brightsigndigital.co.uk ([81.142.160.137])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1RuOxt-0000zP-6w
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 14:50:41 +0100
Received: from [172.30.1.25] (helo=chuckie.brightsign)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1RuOqA-0001QF-BC; Mon, 06 Feb 2012 13:42:42 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1RuOqA-0006fy-AE; Mon, 06 Feb 2012 13:42:42 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 13:42:36 +0000
Message-Id: <1328535756-25624-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH] libusb-compat: Cope with ${libdir} and ${base_libdir} being the same
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
X-List-Received-Date: Mon, 06 Feb 2012 13:50:41 -0000

${libdir} and ${base_libdir} may be the same. If they are don't try and
move files onto themselves.
---
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
index 60ebcc2..1595a29 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
@@ -15,7 +15,7 @@ DEPENDS = "libusb1"
 PROVIDES = "libusb"
 
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
            file://0.1.0-beta1-gcc3.4-fix.patch"
@@ -29,7 +29,9 @@ EXTRA_OECONF = "--libdir=${base_libdir}"
 
 do_install_append() {
 	install -d ${D}${libdir}
-	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	fi
 }
 
 FILES_${PN}-dev += "${base_libdir}/*.so"
-- 
1.7.8.3



