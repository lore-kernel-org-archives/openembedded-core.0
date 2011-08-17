Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf8-0004F2-I6
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163458"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:46 -0700
Message-Id: <5708a11bfe4a17baea022d1ed8d77b50c136b692.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/27] qt4: allow a reduction in build time
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:39 -0000

From: Anders Darander <anders@chargestorm.se>

When reducing build time by adding QT_DISTRO_FLAGS from the set '-no-gui -nomake tools
-nomake examples -nomake demos -nomake docs', build failure can occur, due to not building
all tools.

* Make rm not error out when removing one of the, possibly, non-existing tools.
* Only try to rename qtdemo, if qtdemo exists.
* Guard do_split_packages() with an try-except-clause, otherwise we get an error stating
  that .../phrasebooks/... do not exist.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-qt/qt4/qt4.inc |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 0410a92..994ec12 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -227,7 +227,10 @@ python populate_packages_prepend() {
  
         phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
         phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
-        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
+        try:
+                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
+        except:
+                pass
  
         # Package all the plugins and their -dbg version and create a meta package
         import os
@@ -278,11 +281,11 @@ do_install() {
 
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
@@ -319,6 +322,6 @@ do_install() {
 
 	#Append an E to the qtdemo file
 	if [ -n "${QT_LIBINFIX}" ] ; then
-		mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
+		[ -f ${D}${bindir}/qtdemo ] && mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
 	fi
 }
-- 
1.7.6



