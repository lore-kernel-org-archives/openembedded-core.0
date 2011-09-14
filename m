Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R3say-0005zR-QI
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:45:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2011 09:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="51292678"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2011 09:40:45 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 03:13:16 -0700
Message-Id: <08786b67dc4dc72eb442e750b77640dcb1d95ad9.1315994642.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315994642.git.nitin.a.kamble@intel.com>
References: <cover.1315994642.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] cmake-native: fix symbol not found error on old distros
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
X-List-Received-Date: Wed, 14 Sep 2011 16:45:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

more information in the patch file

This also adds dependency on the build system to have libstdc++-static
package being installed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb  |    4 ++-
 .../cmake/fix_for_running_on_older_distros.diff    |   26 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/fix_for_running_on_older_distros.diff

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
index 3fe0c2e..4cd12f0 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
@@ -1,7 +1,9 @@
 require cmake.inc
 inherit native
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
+
+SRC_URI += "file://fix_for_running_on_older_distros.diff"
 
 SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
 SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
diff --git a/meta/recipes-devtools/cmake/cmake/fix_for_running_on_older_distros.diff b/meta/recipes-devtools/cmake/cmake/fix_for_running_on_older_distros.diff
new file mode 100644
index 0000000..9a46f2e
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/fix_for_running_on_older_distros.diff
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Fixes bug: [YOCTO #1459]
+
+When sstate files are shared from newer distro machine to older distro machine, 
+the binaries can fail to run due to missing newer symbols from the newer 
+libraries as seen bellow:
+
+      U _ZNSt15_List_node_base7_M_hookEPS_@@GLIBCXX_3.4.14
+      U _ZNSt15_List_node_base9_M_unhookEv@@GLIBCXX_3.4.14
+
+This patch makes libstdc++ linking static. so the build system need to have libstdc++-static package installed before building cmake.
+
+Date: 2011/09/09
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+diff -rup 1/CompileFlags.cmake 3/CompileFlags.cmake
+--- 1/CompileFlags.cmake	2011-09-09 06:02:22.404136990 -0700
++++ 3/CompileFlags.cmake	2011-09-09 06:02:27.869137440 -0700
+@@ -10,6 +10,7 @@
+ # See the License for more information.
+ #=============================================================================
+ 
++SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libstdc++")
+ #-----------------------------------------------------------------------------
+ # set some special flags for different compilers
+ #
-- 
1.7.6



