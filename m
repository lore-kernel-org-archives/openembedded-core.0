Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hf-0006Yk-OK
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980196"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:55:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:22 -0700
Message-Id: <51ef8335df895603e75345a18aaefe2359b2387f.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/32] qt4: allow a reduction in build time
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:40 -0000

From: Anders Darander <anders@chargestorm.se>

When reducing build time by adding QT_DISTRO_FLAGS from the set '-no-gui -nomake tools
-nomake examples -nomake demos -nomake docs', build failure can occur, due to not building
all tools.

* Make rm not error out when removing one of the, possibly, non-existing tools.
* Only try to rename qtdemo, if qtdemo exists.
* Check if the phrasebook path exists, and only then call do_split_packages()

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-qt/qt4/qt4.inc |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 0410a92..5545be7 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -227,10 +227,11 @@ python populate_packages_prepend() {
  
         phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
         phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
-        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
+        import os;
+        if os.path.exists(phrasebook_dir):
+                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
  
         # Package all the plugins and their -dbg version and create a meta package
-        import os
         def qtopia_split(path, name, glob):
                 """
                 Split the package into a normal and -dbg package and then add the
@@ -278,11 +279,11 @@ do_install() {
 
 	# These are host binaries, we should only use them in staging
 	rm ${D}/${bindir}/qmake
-	rm ${D}/${bindir}/uic
-	rm ${D}/${bindir}/uic3
+	rm -f ${D}/${bindir}/uic
+	rm -f ${D}/${bindir}/uic3
 	rm ${D}/${bindir}/moc
 	rm ${D}/${bindir}/rcc
-	rm ${D}/${bindir}/lrelease
+	rm -f ${D}/${bindir}/lrelease
 
 	# fix pkgconfig, libtool and prl files
 	sed -i -e s#-L${S}/lib##g \
@@ -319,6 +320,6 @@ do_install() {
 
 	#Append an E to the qtdemo file
 	if [ -n "${QT_LIBINFIX}" ] ; then
-		mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
+		[ -f ${D}${bindir}/qtdemo ] && mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
 	fi
 }
-- 
1.7.6



