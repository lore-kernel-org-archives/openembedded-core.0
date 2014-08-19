Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 872737036C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283381"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:09 -0700
Message-Id: <dcfa4969132fa7af6a06962b900e6f984aaa1512.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] boost: Upgrade to 1.56.0
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

Rebase boostconfig to handle moved user-config file

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../boost/{bjam-native_1.55.0.bb => bjam-native_1.56.0.bb}        | 0
 meta/recipes-support/boost/{boost-1.55.0.inc => boost-1.56.0.inc} | 4 ++--
 meta/recipes-support/boost/boost.inc                              | 8 ++++----
 meta/recipes-support/boost/{boost_1.55.0.bb => boost_1.56.0.bb}   | 0
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.55.0.bb => bjam-native_1.56.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.55.0.inc => boost-1.56.0.inc} (83%)
 rename meta/recipes-support/boost/{boost_1.55.0.bb => boost_1.56.0.bb} (100%)

diff --git a/meta/recipes-support/boost/bjam-native_1.55.0.bb b/meta/recipes-support/boost/bjam-native_1.56.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.55.0.bb
rename to meta/recipes-support/boost/bjam-native_1.56.0.bb
diff --git a/meta/recipes-support/boost/boost-1.55.0.inc b/meta/recipes-support/boost/boost-1.56.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.55.0.inc
rename to meta/recipes-support/boost/boost-1.56.0.inc
index 7daadb6..24c32b4 100644
--- a/meta/recipes-support/boost/boost-1.55.0.inc
+++ b/meta/recipes-support/boost/boost-1.56.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "d6eef4b4cacb2183f2bf265a5a03a354"
-SRC_URI[sha256sum] = "fff00023dd79486d444c8e29922f4072e1d451fc5a4d2b6075852ead7f2b7b52"
+SRC_URI[md5sum] = "a744cf167b05d72335f27c88115f211d"
+SRC_URI[sha256sum] = "134732acaf3a6e7eba85988118d943f0fa6b7f0850f65131fff89823ad30ff1d"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 0a44d79..ad1bc76 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -120,7 +120,7 @@ def get_boost_parallel_make(bb, d):
 BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(bb, d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} \
 		${BJAM_TOOLS} \
-		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/v2/user-config.jam \
+		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/example/user-config.jam \
 		--builddir=${S}/${TARGET_SYS} \
 		--disable-icu \
 		${BJAM_EXTRA}'
@@ -132,12 +132,12 @@ do_boostconfig() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
 
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
-	if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/v2/user-config.jam 
+	if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/example/user-config.jam 
 	then
-		echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/v2/user-config.jam
+		echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-config.jam
 	fi	
 
-	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/v2/user-config.jam
+	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/example/user-config.jam
 
 	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
 	sed -i '/^using python/d' project-config.jam
diff --git a/meta/recipes-support/boost/boost_1.55.0.bb b/meta/recipes-support/boost/boost_1.56.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.55.0.bb
rename to meta/recipes-support/boost/boost_1.56.0.bb
-- 
1.8.3.1


