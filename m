Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7fC-0007V9-HB
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916466"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:07 -0700
Message-Id: <875d5dbcc31bbf49fbbb331ef1b8f989d2385150.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 14/18] glew: fix generation of glew.pc needed by mesa-demos
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 21:55:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../glew/files/fix-glew.pc-install.patch           | 44 ++++++++++++++++++++++
 meta/recipes-graphics/glew/glew_1.9.0.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/files/fix-glew.pc-install.patch

diff --git a/meta/recipes-graphics/glew/files/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/files/fix-glew.pc-install.patch
new file mode 100644
index 0000000..5b6a94e
--- /dev/null
+++ b/meta/recipes-graphics/glew/files/fix-glew.pc-install.patch
@@ -0,0 +1,44 @@
+
+We maintain the autotools configure.ac and Makefile.am, to correctly
+provide the glew.pc, the following patch is needed.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: glew-1.9.0/Makefile.am
+===================================================================
+--- glew-1.9.0.orig/Makefile.am
++++ glew-1.9.0/Makefile.am
+@@ -3,3 +3,5 @@ ACLOCAL_AMFLAGS = -I m4 --install
+ 
+ SUBDIRS = include src
+ 
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = glew.pc
+Index: glew-1.9.0/configure.ac
+===================================================================
+--- glew-1.9.0.orig/configure.ac
++++ glew-1.9.0/configure.ac
+@@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:5:7])
+ 
+ AC_CONFIG_FILES([Makefile
+                  include/Makefile
+-                 src/Makefile])
++                 src/Makefile
++                 glew.pc])
+ AC_OUTPUT
+Index: glew-1.9.0/glew.pc.in
+===================================================================
+--- glew-1.9.0.orig/glew.pc.in
++++ glew-1.9.0/glew.pc.in
+@@ -5,6 +5,6 @@ includedir=@includedir@
+ 
+ Name: glew
+ Description: The OpenGL Extension Wrangler library
+-Version: @version@
+-Cflags: -I${includedir} @cflags@
+-Libs: -L${libdir} -l@libname@
++Version: @VERSION@
++Cflags: -I${includedir} @CFLAGS@
++Libs: -L${libdir} -lGLEW
diff --git a/meta/recipes-graphics/glew/glew_1.9.0.bb b/meta/recipes-graphics/glew/glew_1.9.0.bb
index 599d64b..f1ba4e4 100644
--- a/meta/recipes-graphics/glew/glew_1.9.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.9.0.bb
@@ -12,6 +12,7 @@ PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
            file://glew_fix_for_automake-1.12.patch \
+           file://fix-glew.pc-install.patch \
           "
 
 SRC_URI[md5sum] = "69ce911decef6249d24742497e6ad06a"
-- 
1.8.0.2



