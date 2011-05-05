Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QI0Af-0002VD-T1
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 17:08:54 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QI07x-0005dp-Ev from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:06:05 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 May 2011 08:04:47 -0700
Received: from localhost.localdomain ([172.30.0.24]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 May 2011 09:06:04 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2011 08:05:52 -0700
Message-Id: <e6bc9c65387b91c316167df66110d4585133b5aa.1304607797.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304607797.git.tom_rini@mentor.com>
References: <cover.1304607797.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 05 May 2011 15:06:04.0375 (UTC)
	FILETIME=[F41F0E70:01CC0B35]
Subject: [PATCH 2/4] binutils.inc: Switch to TARGET_PREFIX not TARGET_SYS
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
X-List-Received-Date: Thu, 05 May 2011 15:08:54 -0000

When TARGET_PREFIX and TARGET_SYS didn't match up, the symlinks and
update-alternatives weren't working.  TARGET_PREFIX is what we use when
configuring so it's what we should be using here.

This is 79b497edc0ce5d54db564818e59b690d3391d6ce from OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/binutils/binutils.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index d9e859e..882fe7b 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -110,7 +110,7 @@ do_install () {
 
 	# Symlinks for ease of running these on the native target
 	for p in ${TARGET_SYS}-* ; do
-		ln -sf $p `echo $p | sed -e s,${TARGET_SYS}-,,`
+		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
 	done
 
 	rm ${D}${bindir}/ar ${D}${bindir}/strings
@@ -139,11 +139,11 @@ do_install_virtclass-native () {
 }
 
 pkg_postinst_${PN}-symlinks () {
-	update-alternatives --install ${bindir}/ar ar ${TARGET_SYS}-ar 100
-	update-alternatives --install ${bindir}/strings strings ${TARGET_SYS}-strings 100
+	update-alternatives --install ${bindir}/ar ar ${TARGET_PREFIX}ar 100
+	update-alternatives --install ${bindir}/strings strings ${TARGET_PREFIX}strings 100
 }
 
 pkg_prerm_${PN}-symlinks () {
-	update-alternatives --remove ar ${TARGET_SYS}-ar
-	update-alternatives --remove strings ${TARGET_SYS}-strings
+	update-alternatives --remove ar ${TARGET_PREFIX}ar
+	update-alternatives --remove strings ${TARGET_PREFIX}strings
 }
-- 
1.7.0.4



