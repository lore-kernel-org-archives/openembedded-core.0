Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QQ4KP-0007Kg-7s
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 23:12:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 May 2011 14:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,282,1304319600"; 
   d="scan'208";a="8750408"
Received: from swold-mobl.jf.intel.com ([10.24.82.108])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2011 14:09:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:09:08 -0700
Message-Id: <8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306530446.git.sgw@linux.intel.com>
References: <cover.1306530446.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306530446.git.sgw@linux.intel.com>
References: <cover.1306530446.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] xserver: force to use libdl
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
X-List-Received-Date: Fri, 27 May 2011 21:12:17 -0000

From: Yu Ke <ke.yu@intel.com>

[YOCTO #737]

The AC_CHECK_FUNC([dlopen], [], AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
macro seems not work well in ppc arch, so this patch force the DLOPEN_LIBS="-ldl"

Signed-off-by: Yu Ke <ke.yu@intel.com>

Added Bug info

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/files/force-libdl.patch           |   19 +++++++++++++++++++
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |    5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/files/force-libdl.patch

diff --git a/meta/recipes-graphics/xorg-xserver/files/force-libdl.patch b/meta/recipes-graphics/xorg-xserver/files/force-libdl.patch
new file mode 100644
index 0000000..87814c8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/files/force-libdl.patch
@@ -0,0 +1,19 @@
+configure.ac: force to use DLOPEN_LIBS="-ldl"
+
+The AC_CHECK_FUNC([dlopen], [], AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
+macro seems not work well in ppc arch, so this patch force the DLOPEN_LIBS="-ldl"
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 61caaed..46e68d2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -203,6 +203,7 @@ dnl Check to see if dlopen is in default libraries (like Solaris, which
+ dnl has it in libc), or if libdl is needed to get it.
+ AC_CHECK_FUNC([dlopen], [],
+ 	AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
++DLOPEN_LIBS="-ldl"
+ AC_SUBST(DLOPEN_LIBS)
+ 
+ dnl Checks for library functions.
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
index f9b3a64..c84478a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
@@ -2,11 +2,12 @@ require xserver-xf86-lite.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "font-util"
 
-SRC_URI += "file://crosscompile.patch"
+SRC_URI += "file://crosscompile.patch \
+            file://force-libdl.patch "
 
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
-- 
1.7.3.4



