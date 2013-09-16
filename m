Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id C89C66A40C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 04:59:15 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id B122C40044;
	Mon, 16 Sep 2013 05:56:26 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 06:59:13 +0200
Message-Id: <1379307553-2744-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] boost: set up PACKAGECONFIG for boost-python library
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
X-List-Received-Date: Mon, 16 Sep 2013 04:59:17 -0000

Until now, the comment in the boost.inc file suggested to enable
the boost-python library by uncommenting some lines in that file.
Using the new PACKAGECONFIG feature, boost-python can now be added
optionally without need to modify the file or copying those lines
into a bbappend file.
Furthermore, we obtain the python version by inheriting python-dir
instead of fixing the python version in this file.

This commit is motivated by the need in the meta-ros layer, as
discussed in the issue #145 of the meta-ros issue tracker [1].

[1] https://github.com/bmwcarit/meta-ros/pull/145

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/boost/boost.inc |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 5a219c5..f13051c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -18,11 +18,12 @@ BOOST_LIBS = "\
 	thread \
 	"
 
-# To enable python, uncomment the following:
-#BOOST_LIBS += "python"
-#DEPENDS += "python"
-#PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
-#PYTHON_VERSION = "2.7"
+# optional boost-python library
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = ",,python"
+BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}"
+inherit python-dir
+PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 
 # Make a package for each library, plus -dev
 PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
@@ -95,7 +96,7 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
 		'-sGCC_STDLIB_DIRECTORY=${STAGING_LIBDIR}' \
 		'-sBUILD=release <optimization>space <threading>multi <inlining>on <debug-symbols>off' \
-		'-sPYTHON_VERSION=${PYTHON_VERSION}' \
+		'-sPYTHON_VERSION=${PYTHON_BASEVERSION}' \
 		'-sPYTHON_ROOT=${PYTHON_ROOT}' \
 		'--layout=system' \
 		"
@@ -136,7 +137,7 @@ do_boostconfig() {
 		echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
 	fi	
 
-	echo "using python : ${PYTHON_VERSION} : : ${STAGING_INCDIR}/python${PYTHON_VERSION} ;" >> ${S}/tools/build/v2/user-config.jam
+	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/v2/user-config.jam
 
 	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
 	sed -i '/^using python/d' project-config.jam
-- 
1.7.10.4


