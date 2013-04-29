Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWs9s-0004Lx-6N for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 19:46:53 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UWrse-0004pB-VI
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 19:28:49 +0200
Message-ID: <1367256528.14512.145.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 18:28:48 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] qt4: Fix sundry erroneous assumptions about ${prefix}
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
X-List-Received-Date: Mon, 29 Apr 2013 17:47:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

FILES_${QT_BASE_NAME}-tests was hard-coded to "/usr/tests/..." but Qt
actually installs these files into ${prefix}/tests.

Conversely, FILES_${PN}-dbg in qt4.inc was defined in terms of
${exec_prefix}/src, which appears commendable but doesn't actually match
where package.bbclass will put the sources since the latter is
hard-coded to /usr/src.

This fixes a large number of "installed but not shipped" warnings
when ${prefix} is set to something other than /usr.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-qt/qt4/qt4-4.8.4.inc |    4 ++--
 meta/recipes-qt/qt4/qt4.inc       |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-4.8.4.inc
index 3f0f003..9da3557 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -37,8 +37,8 @@ FILES_${QT_BASE_NAME}-tools_append     = " ${bindir}/qml ${bindir}/qmlplugindump
 FILES_${QT_BASE_NAME}-tools-dbg_append = " ${bindir}/.debug/qml ${bindir}/.debug/qmlplugindump"
 
 PACKAGES_append = " ${QT_BASE_NAME}-tests-dbg ${QT_BASE_NAME}-tests"
-FILES_${QT_BASE_NAME}-tests-dbg        = "/usr/tests/qt4/*/.debug"
-FILES_${QT_BASE_NAME}-tests            = "/usr/tests/qt4/*"
+FILES_${QT_BASE_NAME}-tests-dbg        = "${prefix}/tests/qt4/*/.debug"
+FILES_${QT_BASE_NAME}-tests            = "${prefix}/tests/qt4/*"
 
 do_configure_prepend() {
     for pro in $(find ${S} -name "*.pro") ; do
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 35e3003..37fc1dd 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -129,7 +129,7 @@ PACKAGES_DYNAMIC += "^${QT_BASE_NAME}-plugin-.* ^${QT_BASE_NAME}-translation-.*
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
 FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
-FILES_${PN}-dbg = "${exec_prefix}/src/debug/"
+FILES_${PN}-dbg = "/usr/src/debug/"
 FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/qtopia/qch/qt.qch"
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
-- 
1.7.10.4





