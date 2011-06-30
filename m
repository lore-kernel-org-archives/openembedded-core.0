Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcJUU-00018L-8k
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 17:49:26 +0200
Received: by wwi18 with SMTP id 18so2033191wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 08:45:24 -0700 (PDT)
Received: by 10.227.154.6 with SMTP id m6mr1961609wbw.73.1309448724587;
	Thu, 30 Jun 2011 08:45:24 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm1721393wbb.20.2011.06.30.08.45.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 08:45:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 17:45:19 +0200
Message-Id: <1309448719-2171-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] eglibc: fix merge conflict that wiped out RPs fixes for eglibc-dev breakage
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
X-List-Received-Date: Thu, 30 Jun 2011 15:49:26 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/eglibc/eglibc-package.inc |   18 +++++++++++++-----
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index f3d133b..5110063 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -104,13 +104,21 @@ inherit libc-common
 
 do_install_locale () {
 	dest=${D}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
-	install -d ${dest} ${dest}${bindir}
-	cp -fpPR ${D}${base_libdir} ${dest}${base_prefix}
-	cp -fpPR ${D}${libdir} ${dest}${exec_prefix}
-	cp -fpPR ${D}${datadir} ${dest}${exec_prefix}
-	cp -fpPR ${D}${bindir}/localedef ${dest}${bindir}
+	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
+	cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
+	cp -fpP ${D}${bindir}/localedef ${dest}${bindir}
+        mv ${D}${libdir}/gconv ${dest}${libdir}
+	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
+        mv ${D}${datadir}/i18n ${dest}${datadir}
+	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
 	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
 }
 
 addtask do_install_locale after do_install before do_populate_sysroot
 
+PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
+
+eglibc_package_preprocess () {
+	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
+}
+
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 85d58fa..fd7b485 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r18"
+PR = "r19"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 7986131..be65787 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -4,7 +4,7 @@ SRCREV = "14157"
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-PR = "r5"
+PR = "r6"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.6.6.1



