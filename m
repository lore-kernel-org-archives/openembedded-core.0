Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A012A72B49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8ljFD022126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:45 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:31 -0800
Message-ID: <5e6472c817794ff4e029a2f6d0345e5f5f347bcd.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 20/27] python: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:49 -0000
Content-Type: text/plain

And bump PR to avoid:
gcc: error: Parser/tokenizer_pgen.o: No such file or directory
gcc: error: Parser/printgrammar.o: No such file or directory
gcc: error: Parser/pgenmain.o: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python.inc       |    4 ++--
 meta/recipes-devtools/python/python3_3.3.3.bb |    6 +++---
 meta/recipes-devtools/python/python_2.7.3.bb  |    6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 19942ba..bc5e5b9 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
-INC_PR = "r0"
+INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3abfd1059e2d3a36a8cff3986f9bb6"
 
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "726457e11cb153adc3f428aaf1901fc561a374c30e5e7da6742c0742a3
 
 PYTHON_MAJMIN = "2.7"
 
-inherit autotools-brokensep
+inherit autotools
 
 PYTHONLSBOPTS = "--with-wctype-functions"
 PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index 2c1f63f..efa98c0 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -76,7 +76,7 @@ do_configure_prepend() {
 
 do_compile() {
         # regenerate platform specific files, because they depend on system headers
-        cd Lib/plat-linux*
+        cd ${S}/Lib/plat-linux*
         include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
                 ${S}/Tools/scripts/h2py.py -i '(u_long)' \
                 ${STAGING_INCDIR}/dlfcn.h \
@@ -108,7 +108,7 @@ do_compile() {
 	install -m 0644 Makefile Makefile.sysroot
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
-	export PYTHONBUILDDIR="${S}"
+	export PYTHONBUILDDIR="${B}"
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -136,7 +136,7 @@ do_install() {
 	install -m 0644 Makefile.orig Makefile
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
-	export PYTHONBUILDDIR="${S}"
+	export PYTHONBUILDDIR="${B}"
 	install -d ${D}${libdir}/pkgconfig
 	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
 
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 9ded75b..90b397f 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -61,7 +61,7 @@ do_configure_prepend() {
 
 do_compile() {
         # regenerate platform specific files, because they depend on system headers
-        cd Lib/plat-linux2
+        cd ${S}/Lib/plat-linux2
         include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python-native/python \
                 ${S}/Tools/scripts/h2py.py -i '(u_long)' \
                 ${STAGING_INCDIR}/dlfcn.h \
@@ -93,7 +93,7 @@ do_compile() {
 	install -m 0644 Makefile Makefile.sysroot
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
-	export PYTHONBUILDDIR="${S}"
+	export PYTHONBUILDDIR="${B}"
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
@@ -110,7 +110,7 @@ do_install() {
 	install -m 0644 Makefile.orig Makefile
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
-	export PYTHONBUILDDIR="${S}"
+	export PYTHONBUILDDIR="${B}"
 
 	# After swizzling the makefile, we need to run the build again.
 	# install can race with the build so we have to run this first, then install
-- 
1.7.9.5


