Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RdRvl-0008W8-I1
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:34:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 11:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98926597"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 11:27:17 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 11:27:14 -0800
Message-Id: <16df1bc176ad96d8fbe36701a40314bdc5a487dc.1324495514.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <c363f3248af48a2d0e8be897e93237343cd69e02.1324495514.git.nitin.a.kamble@intel.com>
References: <c363f3248af48a2d0e8be897e93237343cd69e02.1324495514.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1324495514.git.nitin.a.kamble@intel.com>
References: <cover.1324495514.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] binutils: fix building on distros with matching binutils version
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
X-List-Received-Date: Wed, 21 Dec 2011 19:34:26 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

x86_64 opensuse 11.4 has bintuils version 2.21, and when
binutils_2.21 recipe is built for x86_64 target then, the invocation
of distro gcc fails with errors like this:

/usr/lib64/gcc/x86_64-suse-linux/4.5/../../../../x86_64-suse-linux/bin/as:
symbol lookup error: /usr/lib64/gcc/x86_64-suse-linux/4.5/..
make[2]: *** [sysinfo.o] Error 1

The issue rootcaused as incompatible LD_LIBRARY_PATH while running
the distro gcc.

As per Martin Jansa gentoo also sees similar issue with binutils 2.22
recipe.

This commit fixes the issue by clearing the LD_LIBRARY_PATH for
distro gcc (CC_FOR_BUILD)

This Fixes bug: [YOCTO #1833]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 +-
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
index e91e7dc..a49aded 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r1"
+PR = "r2"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
index 21289cd..0e8b6e4 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
@@ -4,7 +4,7 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r1"
+PR = "r2"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 5cb2cc9..30a0416 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -76,7 +76,7 @@ export RANLIB_FOR_TARGET = "${TARGET_PREFIX}ranlib"
 export CC_FOR_HOST = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX_FOR_HOST = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 
-export CC_FOR_BUILD = "${BUILD_CC}"
+export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
 export CPP_FOR_BUILD = "${BUILD_CPP}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index f1e7e12..41a30ee 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
-- 
1.7.6.4



