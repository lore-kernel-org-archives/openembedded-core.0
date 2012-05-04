Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF0-0000Y5-3n
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486027"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:21 -0700
Message-Id: <24195210d0df0645b73bd3e75833117934c663e2.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 15/40] glew: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:42 -0000

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



