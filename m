Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1E1F6D571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:23:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD1Nugo021595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:23:56 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 12 Nov 2013 17:23:55 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 19:23:21 -0600
Message-ID: <8f6e4d6a8abbf6bdac0c3b69c45d8b948d42e638.1384305535.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/6] gcc: Drop *-symlinks
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
X-List-Received-Date: Wed, 13 Nov 2013 01:23:54 -0000
Content-Type: text/plain

The -symlinks packages don't really add any value if we're using
update-alternatives.  Drop it, leaving an RPROVIDES in case anyone thought
they needed it still.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 48 ++++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index ee41d3f..426be15 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -10,12 +10,12 @@ EXTRA_OECONF_PATHS = " \
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
 
 PACKAGES = "\
-  ${PN} ${PN}-plugins ${PN}-symlinks \
-  g++ g++-symlinks \
-  cpp cpp-symlinks \
-  g77 g77-symlinks \
-  gfortran gfortran-symlinks \
-  gcov gcov-symlinks \
+  ${PN} ${PN}-plugins \
+  g++ \
+  cpp \
+  g77 \
+  gfortran \
+  gcov \
   ${PN}-plugin-dev \
   ${PN}-doc \
   ${PN}-dev \
@@ -36,6 +36,8 @@ FILES_${PN} = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
 INSANE_SKIP_${PN} += "dev-so"
+RPROVIDES_${PN} += "${PN}-symlinks"
+RREPLACES_${PN} += "${PN}-symlinks"
 
 FILES_${PN}-dbg += "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
@@ -50,8 +52,6 @@ FILES_${PN}-plugin-dev = "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
 "
-FILES_${PN}-symlinks = ""
-ALLOW_EMPTY_${PN}-symlinks = "1"
 
 FILES_${PN}-plugins = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
@@ -62,33 +62,33 @@ FILES_g77 = "\
   ${bindir}/${TARGET_PREFIX}g77 \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
 "
-FILES_g77-symlinks = ""
-ALLOW_EMPTY_g77-symlinks = "1"
+RPROVIDES_g77 += "g77-symlinks"
+RREPLACES_g77 += "g77-symlinks"
 
 FILES_gfortran = "\
   ${bindir}/${TARGET_PREFIX}gfortran \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
 "
-FILES_gfortran-symlinks = ""
-ALLOW_EMPTY_gfortran-symlinks = "1"
+RPROVIDES_gfortran += "gfortran-symlinks"
+RREPLACES_gfortran += "gfortran-symlinks"
 
 FILES_cpp = "\
   ${bindir}/${TARGET_PREFIX}cpp \
   ${base_libdir}/cpp \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
-FILES_cpp-symlinks = ""
-ALLOW_EMPTY_cpp-symlinks = "1"
+RPROVIDES_cpp += "cpp-symlinks"
+RREPLACES_cpp += "cpp-symlinks"
 
 FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
-FILES_gcov-symlinks = ""
-ALLOW_EMPTY_gconv-symlinks = "1"
+RPROVIDES_gcov += "gcov-symlinks"
+RREPLACES_gcov += "gcov-symlinks"
 
 FILES_g++ = "\
   ${bindir}/${TARGET_PREFIX}g++ \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
 "
-FILES_g++-symlinks = ""
-ALLOW_EMPTY_g++-symlinks = "1"
+RPROVIDES_g++ += "g++-symlinks"
+RREPLACES_g++ += "g++-symlinks"
 
 FILES_${PN}-doc = "\
   ${infodir} \
@@ -137,12 +137,12 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN}-symlinks = "cc gcc"
-ALTERNATIVE_g77-symlinks = "${@['', 'g77 f77']['f77' in d.getVar('FORTRAN', True)]}"
-ALTERNATIVE_gfortran-symlinks = "${@['', 'gfortran f95']['fortran' in d.getVar('FORTRAN', True)]}"
-ALTERNATIVE_cpp-symlinks = "cpp"
-ALTERNATIVE_gcov-symlinks = "gcov"
-ALTERNATIVE_g++-symlinks = "c++ g++"
+ALTERNATIVE_${PN} = "cc gcc"
+ALTERNATIVE_g77 = "${@['', 'g77 f77']['f77' in d.getVar('FORTRAN', True)]}"
+ALTERNATIVE_gfortran = "${@['', 'gfortran f95']['fortran' in d.getVar('FORTRAN', True)]}"
+ALTERNATIVE_cpp = "cpp"
+ALTERNATIVE_gcov = "gcov"
+ALTERNATIVE_g++ = "c++ g++"
 
 ALTERNATIVE_LINK_NAME[cc] = "${bindir}/cc"
 ALTERNATIVE_TARGET[cc] = "${bindir}/${TARGET_PREFIX}gcc"
-- 
1.8.1.2.545.g2f19ada


