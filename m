Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEEC6D571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:23:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD1Nted024244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:23:55 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 12 Nov 2013 17:23:55 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 19:23:20 -0600
Message-ID: <c9dd76ae9feb0069409763f3f65ae4ff2ef10634.1384305535.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/6] gcc: Use alternatives for the *-symlinks packages.
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
X-List-Received-Date: Wed, 13 Nov 2013 01:23:53 -0000
Content-Type: text/plain

The various gcc related symlinks should be provided as alternatives instead
of hard coded symlinks.  This will permit multiple toolchains on a system.

Multiple toolchains could come from multilib configurations or alternative
open source or commerical sources.

Note, gccbug was skipped since it doesn't seem to be generated anymore.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 91 ++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index e1179ac..ee41d3f 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -50,11 +50,8 @@ FILES_${PN}-plugin-dev = "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
 "
-FILES_${PN}-symlinks = "\
-  ${bindir}/cc \
-  ${bindir}/gcc \
-  ${bindir}/gccbug \
-"
+FILES_${PN}-symlinks = ""
+ALLOW_EMPTY_${PN}-symlinks = "1"
 
 FILES_${PN}-plugins = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
@@ -65,36 +62,33 @@ FILES_g77 = "\
   ${bindir}/${TARGET_PREFIX}g77 \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
 "
-FILES_g77-symlinks = "\
-  ${bindir}/g77 \
-  ${bindir}/f77 \
-"
+FILES_g77-symlinks = ""
+ALLOW_EMPTY_g77-symlinks = "1"
+
 FILES_gfortran = "\
   ${bindir}/${TARGET_PREFIX}gfortran \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
 "
-FILES_gfortran-symlinks = "\
-  ${bindir}/gfortran \
-  ${bindir}/f95"
+FILES_gfortran-symlinks = ""
+ALLOW_EMPTY_gfortran-symlinks = "1"
 
 FILES_cpp = "\
   ${bindir}/${TARGET_PREFIX}cpp \
   ${base_libdir}/cpp \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
-FILES_cpp-symlinks = "${bindir}/cpp"
+FILES_cpp-symlinks = ""
+ALLOW_EMPTY_cpp-symlinks = "1"
 
 FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
-FILES_gcov-symlinks = "${bindir}/gcov"
+FILES_gcov-symlinks = ""
+ALLOW_EMPTY_gconv-symlinks = "1"
 
 FILES_g++ = "\
   ${bindir}/${TARGET_PREFIX}g++ \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
 "
-FILES_g++-symlinks = "\
-  ${bindir}/c++ \
-  ${bindir}/g++ \
-"
-
+FILES_g++-symlinks = ""
+ALLOW_EMPTY_g++-symlinks = "1"
 
 FILES_${PN}-doc = "\
   ${infodir} \
@@ -133,22 +127,53 @@ do_install () {
 	# Not sure why we end up with these but we don't want them...
 	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
 
-	# Symlinks so we can use these trivially on the target
-	if [ -e ${TARGET_PREFIX}g77 ]; then
-		ln -sf ${TARGET_PREFIX}g77 g77 || true
-		ln -sf g77 f77 || true
-	fi
-	if [ -e ${TARGET_PREFIX}gfortran ]; then
-		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
-		ln -sf gfortran f95 || true
-	fi
-	ln -sf ${TARGET_PREFIX}g++ g++
-	ln -sf ${TARGET_PREFIX}gcc gcc
-	ln -sf ${TARGET_PREFIX}cpp cpp
 	install -d ${D}${base_libdir}
 	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
-	ln -sf g++ c++
-	ln -sf gcc cc
 
 	chown -R root:root ${D}
 }
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-symlinks = "cc gcc"
+ALTERNATIVE_g77-symlinks = "${@['', 'g77 f77']['f77' in d.getVar('FORTRAN', True)]}"
+ALTERNATIVE_gfortran-symlinks = "${@['', 'gfortran f95']['fortran' in d.getVar('FORTRAN', True)]}"
+ALTERNATIVE_cpp-symlinks = "cpp"
+ALTERNATIVE_gcov-symlinks = "gcov"
+ALTERNATIVE_g++-symlinks = "c++ g++"
+
+ALTERNATIVE_LINK_NAME[cc] = "${bindir}/cc"
+ALTERNATIVE_TARGET[cc] = "${bindir}/${TARGET_PREFIX}gcc"
+
+ALTERNATIVE_LINK_NAME[gcc] = "${bindir}/gcc"
+ALTERNATIVE_TARGET[gcc] = "${bindir}/${TARGET_PREFIX}gcc"
+
+# Not really generated any longer, avoid warnings...
+#ALTERNATIVE_LINK_NAME[gccbug] = "${bindir}/gccbug"
+#ALTERNATIVE_TARGET[gccbug] = "${bindir}/${TARGET_PREFIX}gccbug"
+
+ALTERNATIVE_LINK_NAME[g77] = "${bindir}/g77"
+ALTERNATIVE_TARGET[g77] = "${bindir}/${TARGET_PREFIX}g77"
+
+ALTERNATIVE_LINK_NAME[f77] = "${bindir}/f77"
+ALTERNATIVE_TARGET[f77] = "${bindir}/${TARGET_PREFIX}g77"
+
+ALTERNATIVE_LINK_NAME[gfortran] = "${bindir}/gfortran"
+ALTERNATIVE_TARGET[gfortran] = "${bindir}/${TARGET_PREFIX}gfortran"
+
+ALTERNATIVE_LINK_NAME[f95] = "${bindir}/f95"
+ALTERNATIVE_TARGET[f95] = "${bindir}/${TARGET_PREFIX}gfortran"
+
+ALTERNATIVE_LINK_NAME[cpp] = "${bindir}/cpp"
+ALTERNATIVE_TARGET[cpp] = "${bindir}/${TARGET_PREFIX}cpp"
+
+ALTERNATIVE_LINK_NAME[gcov] = "${bindir}/gcov"
+ALTERNATIVE_TARGET[gcov] = "${bindir}/${TARGET_PREFIX}gcov"
+
+ALTERNATIVE_LINK_NAME[c++] = "${bindir}/c++"
+ALTERNATIVE_TARGET[c++] = "${bindir}/${TARGET_PREFIX}g++"
+
+ALTERNATIVE_LINK_NAME[g++] = "${bindir}/g++"
+ALTERNATIVE_TARGET[g++] = "${bindir}/${TARGET_PREFIX}g++"
-- 
1.8.1.2.545.g2f19ada


