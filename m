Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc9-0005NT-5C
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233779"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:28 -0800
Message-Id: <1dfb63dc9c2e0d27247fea10b59867d4fb36d8d0.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/26] binutils: fix building on distros with matching binutils version
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:57 -0000

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



