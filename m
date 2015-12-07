Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
X-Greylist: delayed 545 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Dec 2015 07:46:04 UTC
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 2538C6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 07:46:04 +0000 (UTC)
Received: from hsp.bmw-carit.intra (hsp.bmw-carit.intra [192.168.101.108])
	by linuxmail.bmw-carit.de (Postfix) with ESMTP id 0436C4023F;
	Mon,  7 Dec 2015 08:24:54 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 08:36:50 +0100
Message-Id: <1449473810-23950-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] boost: adjust hard-coded path after python3 upgrade
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
X-List-Received-Date: Mon, 07 Dec 2015 07:46:05 -0000

When using `PACKAGECONFIG = "python"` in the boost recipe, `bitbake boost`
fails at do_compile with:

    ./boost/python/detail/wrap_python.hpp:50:23: fatal error: pyconfig.h: No such file or directory
    compilation terminated.

This issue is due to the recent version upgrade from python 3.4 to 3.5:

701ec1977ced1bb08461e6de98b4f63d21cba8a6 python3: Upgrade from 3.4.3 to 3.5

The boost.inc file modifies the boost build configuration with a path
containing the python3 major version, which is hard-coded in the boost.inc
file. Hence after the python3 update, the path points to the outdated
location and it needs to be updated to the new location.

This issue was unrevealed by an internal continuous integration system
for the meta-ros application layer. Further manual bisecting lead to the
critical commit 701ec1977ced1bb08461e6de98b4f63d21cba8a6.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index a1b434d..9d7fb89 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -155,7 +155,7 @@ do_boostconfig() {
 	sed -i "/^using python : ${PYTHON_BASEVERSION}"/d ${S}/tools/build/example/user-config.jam
 	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-config.jam
 	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/example/user-config.jam
-	echo "using python : 3.4 : : ${STAGING_INCDIR}/python3.4m ;" >> ${S}/tools/build/example/user-config.jam
+	echo "using python : 3.5 : : ${STAGING_INCDIR}/python3.5m ;" >> ${S}/tools/build/example/user-config.jam
 
 	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
 	sed -i '/^using python/d' project-config.jam
-- 
1.9.1


