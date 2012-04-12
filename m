Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIRWn-0002Ny-1W
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 23:26:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3CLGh79023082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:16:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Apr 2012 14:16:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 16:21:22 -0500
Message-ID: <3d06ef85d583f8ef824cb7ca91ff070dcddd0e8b.1334265557.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334265557.git.mark.hatle@windriver.com>
References: <cover.1334265557.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] pseudo: Tell pseudo to avoid specifying an RPATH
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
X-List-Received-Date: Thu, 12 Apr 2012 21:26:05 -0000
Content-Type: text/plain

[Yocto #2251]

Add --without-rpath to avoid embedding rpaths into the pseudo
components.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc    |    8 ++++----
 meta/recipes-devtools/pseudo/pseudo_1.3.bb |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 664a9b5..d5c33df 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -29,9 +29,9 @@ NO32LIBS ??= "0"
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" == "64" ]; then
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	else
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
@@ -42,7 +42,7 @@ do_compile () {
 do_compile_prepend_virtclass-native () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
@@ -52,7 +52,7 @@ do_compile_prepend_virtclass-native () {
 do_compile_prepend_virtclass-nativesdk () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
index e7a329c..080b739 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9414c79..7857275 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,7 @@ require pseudo.inc
 
 SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
 PV = "1.3+git${SRCPV}"
-PR = "r22"
+PR = "r23"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.3.4



