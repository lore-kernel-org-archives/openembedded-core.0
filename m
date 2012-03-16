Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S8WAQ-0003EA-Fh
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 13:21:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2012 05:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129726094"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 05:12:05 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:57:02 +0800
Message-Id: <77917b19e3fc93c1323c3ff357b0f46adc7132d7.1331897967.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331897967.git.edwin.zhai@intel.com>
References: <cover.1331897967.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1331897967.git.edwin.zhai@intel.com>
References: <cover.1331897967.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] qemugl: Hide some GLX extensions by default
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
X-List-Received-Date: Fri, 16 Mar 2012 12:21:58 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Exporting these extensions make guest call some missing GLX API then crash.
It's hacky to implement these APIs, so hide these extensions as fix.

[YOCTO #1927] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../mesa/qemugl/extensions_emulation.patch         |   34 ++++++++++++++++++++
 meta/recipes-graphics/mesa/qemugl_git.bb           |    5 ++-
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/qemugl/extensions_emulation.patch

diff --git a/meta/recipes-graphics/mesa/qemugl/extensions_emulation.patch b/meta/recipes-graphics/mesa/qemugl/extensions_emulation.patch
new file mode 100644
index 0000000..08418c2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/qemugl/extensions_emulation.patch
@@ -0,0 +1,34 @@
+Hide some GLX extensions by default to avoid guest call missing GLX API. It's
+hacky to implement these APIs, so hide these extensions as fix.
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Index: git/opengl_client.c
+===================================================================
+--- git.orig/opengl_client.c	2012-03-16 18:22:27.000000000 +0800
++++ git/opengl_client.c	2012-03-16 18:52:06.000000000 +0800
+@@ -105,6 +105,12 @@
+   "NO_MOVE",                 /* default : set if TCP/IP communication */
+ };
+ 
++/* Hiding some GLX extensions from guest */
++static const char* hiding_extensions =
++  "GLX_MESA_copy_sub_buffer,\
++   GLX_MESA_multithread_makecurrent,\
++   GLX_MESA_swap_control,\
++  ";
+ 
+ #ifdef WIN32
+ 
+@@ -3516,7 +3522,8 @@
+ static void removeUnwantedExtensions(char* ret)
+ {
+   char* toBeRemoved = getenv("GL_REMOVE_EXTENSIONS");
+-  if (toBeRemoved == NULL) return;
++  if (toBeRemoved == NULL)
++    toBeRemoved = hiding_extensions;
+   toBeRemoved = strdup(toBeRemoved);
+   char* iterToBeRemoved = toBeRemoved;
+   while(*iterToBeRemoved)
diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index 66f4e17..378aa65 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -12,13 +12,14 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 SRC_URI = "git://git.yoctoproject.org/qemugl;protocol=git \
            file://versionfix.patch \
            file://remove-x11r6-lib-dir.patch \
-           file://call_opengl_fix.patch"
+           file://call_opengl_fix.patch \
+           file://extensions_emulation.patch"
 S = "${WORKDIR}/git"
 
 SRCREV = "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 
 PV = "0.0+git${SRCPV}"
-PR = "r9"
+PR = "r10"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.5.4



