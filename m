Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Feb 2015 14:21:51 UTC
Received: from kazi.fit.vutbr.cz (kazi.fit.vutbr.cz [147.229.8.12])
	by mail.openembedded.org (Postfix) with ESMTP id AB6C072DD1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 14:21:50 +0000 (UTC)
Received: from dulik64.local.tbs-biometrics.cz (176-74-132-138.netdatacomm.cz
	[176.74.132.138] (may be forged)) (authenticated bits=0)
	by kazi.fit.vutbr.cz (8.14.9/8.14.6) with ESMTP id t19EEkel044113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Feb 2015 15:14:49 +0100 (CET)
From: Tomas Novotny <tomas.novotny@tbs-biometrics.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 15:14:45 +0100
Message-Id: <1423491285-7329-1-git-send-email-tomas.novotny@tbs-biometrics.com>
X-Mailer: git-send-email 1.8.3.1
X-Scanned-By: MIMEDefang 2.75 on 147.229.8.12
Subject: [PATCH] qmake_base.bbclass: fix hardcoded paths in a generated qt.conf
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
X-List-Received-Date: Mon, 09 Feb 2015 14:21:56 -0000

The qmake_base class generates internal qt.conf for build with hardcoded
qt4 target paths. This is ok for qt4-x11 as this is the default
$QT_DIR_NAME, but it is wrong for qt4-embedded, because qtopia is its
default directory.

Signed-off-by: Tomas Novotny <tomas.novotny@tbs-biometrics.com>
---
 meta/classes/qmake_base.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 86bbede..dc98713 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -38,9 +38,9 @@ do_generate_qt_config_file() {
 [Paths]
 Prefix =
 Binaries = ${STAGING_BINDIR_NATIVE}
-Headers = ${STAGING_INCDIR}/qt4
-Plugins = ${STAGING_LIBDIR}/qt4/plugins/
-Mkspecs = ${STAGING_DATADIR}/qt4/mkspecs/
+Headers = ${STAGING_INCDIR}/${QT_DIR_NAME}
+Plugins = ${STAGING_LIBDIR}/${QT_DIR_NAME}/plugins/
+Mkspecs = ${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/
 EOF
 }
 
-- 
1.8.3.1


