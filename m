Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E91876067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 17:00:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jul 2016 10:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,358,1464678000"; d="scan'208";a="1016196281"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2016 10:00:43 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 20:00:33 +0300
Message-Id: <1468429233-22327-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0La6G+d8bSJkG3VW-+hN3dwqcwgr1B3eaRRJOsYYMy7Djw@mail.gmail.com>
References: <CAJTo0La6G+d8bSJkG3VW-+hN3dwqcwgr1B3eaRRJOsYYMy7Djw@mail.gmail.com>
Subject: [PATCHv3] piglit: Upgrade version, use python3
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
X-List-Received-Date: Wed, 13 Jul 2016 17:00:57 -0000

* Remove backported patch
* Update dependencies to use python3 modules, add depencies added
  in the new version
* Install only stripped binaries to keep size down
* Fix bash-completion install location

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

The bash-completion failure does not happen on master but it does
if Alexanders bash-completion upgrade patch is used. This patch v3
includes a fix for the issue.

I've updated the branch (and rebased on master, so only two commits
left):

  git://git.yoctoproject.org/poky-contrib jku/piglit
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/piglit


Thanks,
 Jussi


 ...stall-bash-completions-in-the-right-place.patch | 35 ++++++++++++++++++++++
 ...0001-tests-Fix-missing-include-of-Xutil.h.patch | 28 -----------------
 meta/recipes-graphics/piglit/piglit_git.bb         | 25 +++++++++-------
 3 files changed, 50 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Fix-missing-include-of-Xutil.h.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
new file mode 100644
index 0000000..e07e810
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
@@ -0,0 +1,35 @@
+From 26faa2c157a27a18a9f767976730fe0c115e3af4 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 13 Jul 2016 19:19:02 +0300
+Subject: [PATCH] cmake: install bash-completions in the right place
+
+The completionsdir variable is a full path and should not be
+prefixed.
+
+This does mean the files may be installed outside of
+CMAKE_INSTALL_PREFIX -- the alternative is more difficult and
+means that bash completion files may be installed where
+bash-completion can't find them.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [mailing list]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8e2abba..784a8f9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -532,7 +532,7 @@ install (
+ if (BASH_COMPLETION_FOUND)
+ 	install(
+ 		FILES completions/bash/piglit
+-		DESTINATION ${CMAKE_INSTALL_PREFIX}/${BASH_COMPLETION_COMPLETIONSDIR}/
++		DESTINATION ${BASH_COMPLETION_COMPLETIONSDIR}/
+ 	)
+ endif (BASH_COMPLETION_FOUND)
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-missing-include-of-Xutil.h.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-missing-include-of-Xutil.h.patch
deleted file mode 100644
index c27cc04..0000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-missing-include-of-Xutil.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-From e40e0a25f996d2e205c4bdec2c8a5cc7f74e5065 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Mon, 15 Jun 2015 16:25:30 -0300
-Subject: tests: Fix missing include of Xutil.h
-
-The EGL tests rely on Xutil.h being included. Some EGL implementation
-does not explitly include it by default and then the build fails.
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Reviewed-by: Neil Roberts <neil@linux.intel.com>
-
-diff --git a/tests/egl/egl-configless-context.c b/tests/egl/egl-configless-context.c
-index 0504a26..154b55c 100644
---- a/tests/egl/egl-configless-context.c
-+++ b/tests/egl/egl-configless-context.c
-@@ -32,6 +32,7 @@
- /* Chunks of code in this file are taken from egl-util.c */
- 
- #include <X11/Xlib.h>
-+#include <X11/Xutil.h>
- 
- #include "piglit-util-gl.h"
- #include "piglit-util-egl.h"
--- 
-cgit v0.10.2
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 607f236..f5ef364 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -3,18 +3,19 @@ LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://anongit.freedesktop.org/piglit \
-           file://0001-tests-Fix-missing-include-of-Xutil.h.patch"
+           file://0001-cmake-install-bash-completions-in-the-right-place.patch \
+           "
 
-# From 2015-02-19
-SRCREV = "c4585427913e4cb28994b4bfb11d49778273aa2c"
+# From 2016-07-07
+SRCREV = "c39e41a86551eb390b8da23232dc8577639403d0"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "virtual/libx11 libxrender waffle virtual/libgl libglu python-mako-native python-numpy-native"
+DEPENDS = "libpng virtual/libx11 libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native"
 
-inherit cmake pythonnative distro_features_check
+inherit cmake python3native distro_features_check bash-completion
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -34,10 +35,14 @@ do_configure_prepend() {
    fi
 }
 
-RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess \
-	python-argparse python-importlib python-unixadmin python-xml \
-	python-multiprocessing python-textutils python-netserver python-shell \
-	mesa-demos bash \
+do_install() {
+	oe_runmake -C ${B} 'DESTDIR=${D}' install/strip
+}
+
+RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
+	python3-subprocess python3-misc python3-importlib \
+	python3-unixadmin python3-xml python3-multiprocessing \
+	python3-six python3-shell python3-io mesa-demos bash \
 	"
 
-INSANE_SKIP_${PN} += "dev-so"
+INSANE_SKIP_${PN} += "dev-so already-stripped"
-- 
2.1.4


