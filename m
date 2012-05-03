Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iN-0001oY-UD
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065360"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:26 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:12 -0700
Message-Id: <1728c9e2ed4d96a81795aa8f2612e1e59ee068cf.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 18/28] glew: fix build with automake 1.12
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
X-List-Received-Date: Thu, 03 May 2012 18:25:21 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../glew/files/glew_fix_for_automake-1.12.patch    |   25 ++++++++++++++++++++
 meta/recipes-graphics/glew/glew_1.7.0.bb           |    3 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch

diff --git a/meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch b/meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..0707efb
--- /dev/null
+++ b/meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libGLEW.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: glew-1.7.0/configure.ac
+===================================================================
+--- glew-1.7.0.orig/configure.ac
++++ glew-1.7.0/configure.ac
+@@ -14,6 +14,9 @@ LT_INIT
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
+ 
+ # Checks for libraries.
+ 
diff --git a/meta/recipes-graphics/glew/glew_1.7.0.bb b/meta/recipes-graphics/glew/glew_1.7.0.bb
index e65663d..cdb778c 100644
--- a/meta/recipes-graphics/glew/glew_1.7.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.7.0.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 DEPENDS = "virtual/libx11 virtual/libgl libxext libxi libxmu"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
+           file://glew_fix_for_automake-1.12.patch \
           "
 
 SRC_URI[md5sum] = "fb7a8bb79187ac98a90b57f0f27a3e84"
-- 
1.7.7



