Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZsz-0005Gh-FZ
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:45:57 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	08:41:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 08:41:25 +0200
Message-ID: <0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313563238.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313563238.git.anders@chargestorm.se>
References: <cover.1313563238.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH v2 1/5] qt4: allow a reduction in build time
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
X-List-Received-Date: Wed, 17 Aug 2011 06:45:57 -0000
Content-Type: text/plain

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
1.7.5.4



