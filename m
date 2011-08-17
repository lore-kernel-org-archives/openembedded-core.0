Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtkHt-0000XC-EW
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 19:52:21 +0200
Received: from localhost (85.231.30.150) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	19:47:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 19:47:51 +0200
Message-ID: <32b76cd9c8357318e8a5855243e968d2dfc683f6.1313603220.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313603220.git.anders@chargestorm.se>
References: <cover.1313603220.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [PATCH v3 1/1] qt4: allow a reduction in build time
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
X-List-Received-Date: Wed, 17 Aug 2011 17:52:21 -0000
Content-Type: text/plain

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
1.7.5.4



