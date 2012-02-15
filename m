Received: from e06smtp13.uk.ibm.com ([195.75.94.109])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1RxaqJ-0002O3-LE
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Feb 2012 10:08:03 +0100
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Wed, 15 Feb 2012 08:49:37 -0000
Received: from d06nrmr1507.portsmouth.uk.ibm.com (9.149.38.233)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 15 Feb 2012 08:49:23 -0000
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q1F8nLNf2433234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 08:49:22 GMT
Received: from d06av07.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q1F8nLpJ027628
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 01:49:21 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-213-71.boeblingen.de.ibm.com [9.152.213.71])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q1F8nKT7027594; Wed, 15 Feb 2012 01:49:20 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2012 09:49:07 +0100
Message-Id: <1329295747-25855-1-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 12021508-2966-0000-0000-0000033A6BD1
Subject: [PATCH] Add sanity checks for eglibc locale
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
X-List-Received-Date: Wed, 15 Feb 2012 09:08:03 -0000

Add sanity checks that test for the existance of folders. This allows to use
an external binary toolchain that doesn't have localization support.
---
 meta/recipes-core/eglibc/eglibc-locale.inc  |   20 +++++++++++++++-----
 meta/recipes-core/eglibc/eglibc-package.inc |    4 +++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index b4646fa..2e9b4d4 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -72,11 +72,21 @@ LOCALETREESRC = "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS
 
 do_install () {
 	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
-	cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
-	cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
-	cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
-	cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
-	cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
+	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
+		cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
+	fi
+	if [ -e ${LOCALETREESRC}/${libdir}/locale ]; then
+		cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
+	fi
+	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
+		cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
+	fi
+	if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
+		cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
+	fi
+	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
+		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
+	fi
 	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
 }
 
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 870b95d..2a1d939 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -91,7 +91,9 @@ do_install_locale () {
 		mv -f ${D}${libdir}/gconv ${dest}${libdir}
 	fi
 	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
-        mv ${D}${datadir}/i18n ${dest}${datadir}
+	if [ -e ${D}${datadir}/i18n ]; then
+		mv ${D}${datadir}/i18n ${dest}${datadir}
+	fi
 	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
 	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
 }
-- 
1.7.5.4



