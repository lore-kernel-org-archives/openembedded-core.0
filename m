Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2d-00056b-Jz
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034658"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:06 -0700
Message-Id: <1ab98caf037a59c9369a8bcbfe194e20634180b2.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 03/28] gcc-4.7: Add knowledge about arm hf dynamic loader
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
X-List-Received-Date: Thu, 24 May 2012 04:52:51 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 ++++++++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index efd166c..0321776 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -65,6 +65,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://libgcc-sjlj-check.patch \
 	   file://cpp-honor-sysroot.patch \
 	   file://mips64-default-n64.patch \
+	   file://arm-hard-float-loader.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch b/meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
new file mode 100644
index 0000000..dfa0d19
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
@@ -0,0 +1,48 @@
+This patch is still being discussed by probably is almost
+final version. We add the OE notion of multilib on top
+
+Upstream-Status: Backport [ adapted ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-04-30 15:28:31.891863845 -0700
++++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-04-30 15:37:11.531888994 -0700
+@@ -32,7 +32,8 @@
+   while (false)
+ 
+ /* We default to a soft-float ABI so that binaries can run on all
+-   target hardware.  */
++   target hardware.  If you override this to use the hard-float ABI then
++   change the setting of GLIBC_DYNAMIC_LINKER_DEFAULT as well.  */
+ #undef  TARGET_DEFAULT_FLOAT_ABI
+ #define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_SOFT
+ 
+@@ -59,10 +60,23 @@
+ #undef  SUBTARGET_EXTRA_LINK_SPEC
+ #define SUBTARGET_EXTRA_LINK_SPEC " -m " TARGET_LINKER_EMULATION
+ 
+-/* Use ld-linux.so.3 so that it will be possible to run "classic"
+-   GNU/Linux binaries on an EABI system.  */
++/* GNU/Linux on ARM currently supports three dynamic linkers:
++   - ld-linux.so.2 - for the legacy ABI
++   - ld-linux.so.3 - for the EABI-derived soft-float ABI
++   - ld-linux-armhf.so.3 - for the EABI-derived hard-float ABI.
++   All the dynamic linkers live in /lib.
++   We default to soft-float, but this can be overridden by changing both
++   GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
++
+ #undef  GLIBC_DYNAMIC_LINKER
+-#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"
++#define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
++
++ #define GLIBC_DYNAMIC_LINKER \
++    "%{mfloat-abi=hard:" GLIBC_DYNAMIC_LINKER_HARD_FLOAT "} \
++     %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
++     %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
+ 
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
-- 
1.7.7.6



