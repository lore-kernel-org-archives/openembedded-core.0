Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKa-0003KV-0p
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2011 14:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="433888015"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 14:16:12 -0700
Message-Id: <520e750344d82cc40b301c16ed4d527680b8f55d.1305062028.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 9 May 2011 17:45:38 -0700
Date: Tue, 10 May 2011 14:16:12 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 06/16] libzypp: fix compilatoin with gcc 4.6.0
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
X-List-Received-Date: Tue, 10 May 2011 21:19:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libzypp/fix_for_compile_wth_gcc-4.6.0.patch    |   22 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch b/meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
new file mode 100644
index 0000000..0f17b48
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Pending
+
+Fix following compilation errors with gcc 4.6.0
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/09
+
+| i586-poky-linux-g++: error: unrecognized option '--as-needed'
+| make[2]: *** [zypp/libzypp.so.810.1.0] Error 1
+
+
+Index: git/zypp/CMakeLists.txt
+===================================================================
+--- git.orig/zypp/CMakeLists.txt
++++ git/zypp/CMakeLists.txt
+@@ -903,7 +903,7 @@ SET_LOGGROUP( "satsolver" ${zypp_sat_SRC
+ ADD_LIBRARY(zypp SHARED ${zypp_lib_SRCS})
+ SET_TARGET_PROPERTIES( zypp PROPERTIES VERSION "${LIBZYPP_VERSION_INFO}" )
+ SET_TARGET_PROPERTIES( zypp PROPERTIES SOVERSION "${LIBZYPP_SOVERSION_INFO}" )
+-SET_TARGET_PROPERTIES( zypp PROPERTIES LINK_FLAGS "--as-needed" )
++SET_TARGET_PROPERTIES( zypp PROPERTIES LINK_FLAGS "-Wl,--as-needed" )
+ ADD_DEPENDENCIES(zypp schema_header)
+ # System libraries
+ SET(UTIL_LIBRARY util)
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index f8535af..824f7a1 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN} = "sat-solver"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -22,6 +22,7 @@ SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://rpm5-no-rpmdbinit.patch \
 	   file://config-release.patch \
 	   file://libzypp-pokyarch.patch \
+	   file://fix_for_compile_wth_gcc-4.6.0.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
-- 
1.7.3.4



