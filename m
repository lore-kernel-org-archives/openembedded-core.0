Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcEtC-0003Hv-Qm
	for openembedded-core@lists.linuxtogo.org;
	Thu, 30 Jun 2011 12:54:30 +0200
Received: by wyg30 with SMTP id 30so1640172wyg.6
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 30 Jun 2011 03:50:47 -0700 (PDT)
Received: by 10.216.63.68 with SMTP id z46mr2438750wec.82.1309431047152;
	Thu, 30 Jun 2011 03:50:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm1532744wbh.59.2011.06.30.03.50.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 03:50:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Thu, 30 Jun 2011 12:50:42 +0200
Message-Id: <1309431042-14267-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] eglibc: make eglibc-utils list explicit to avoid dragging localedef
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
X-List-Received-Date: Thu, 30 Jun 2011 10:54:30 -0000

This fixes the following regression:

 * check_data_file_clashes: Package eglibc-utils wants to install file /usr/bin/localedef
        But that file is already provided by package  * localedef

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/eglibc/eglibc-package.inc |   16 +++++++++++++++-
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 8228484..f3d133b 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -65,7 +65,21 @@ FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
 FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
 	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
-FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
+FILES_eglibc-utils = "${bindir}/gencat \
+                      ${bindir}/getconf \
+                      ${bindir}/getent \
+                      ${bindir}/iconv \
+                      ${bindir}/locale \
+                      ${bindir}/mtrace \
+                      ${bindir}/pcprofiledump \
+                      ${bindir}/rpcgen \
+                      ${bindir}/sprof \
+                      ${bindir}/tzselect \
+                      ${bindir}/xtrace \
+                      ${sbindir}/iconvconfig \
+                      ${sbindir}/rpcinfo \
+                      ${sbindir}/zdump \
+                      ${sbindir}/zic"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 60358e1..85d58fa 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r17"
+PR = "r18"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 5088049..7986131 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -4,7 +4,7 @@ SRCREV = "14157"
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-PR = "r4"
+PR = "r5"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.6.6.1



