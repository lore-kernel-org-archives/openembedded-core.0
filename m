Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SphX9-00074k-CA
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 17:11:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6DDtBRM018626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 06:55:12 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 13 Jul 2012 06:55:11 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2012 09:54:51 -0400
Message-ID: <1342187709-19368-3-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
References: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/20] python: Update for python-native changes
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
X-List-Received-Date: Fri, 13 Jul 2012 15:12:54 -0000
Content-Type: text/plain

Add pythonnative onto the list of inherits and update the paths to the binaries
referenced in the recipe to the new paths.

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index b06d7b7..fd0e2f7 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -30,7 +30,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header
+inherit autotools multilib_header pythonnative
 
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
@@ -45,7 +45,7 @@ do_configure_prepend() {
 do_compile() {
         # regenerate platform specific files, because they depend on system headers
         cd Lib/plat-linux2
-        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python \
+        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python-native/python \
                 ${S}/Tools/scripts/h2py.py -i '(u_long)' \
                 ${STAGING_INCDIR}/dlfcn.h \
                 ${STAGING_INCDIR}/linux/cdrom.h \
@@ -89,8 +89,8 @@ do_compile() {
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
@@ -99,8 +99,8 @@ do_compile() {
 
 	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
@@ -115,8 +115,8 @@ do_install() {
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
-- 
1.7.0.4



