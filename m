Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9U1Y-000681-KF
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 06:49:04 +0200
Received: by mail-iy0-f175.google.com with SMTP id y10so1659673iak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 21:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nbsQ+B7NLZQejdZVS86KaaZKznR4cz+XyesBDQFUQxQ=;
	b=GAtWnJA4JjupZxic7y/A2MHUeD37qAgmYQNCzTmdwCnJpvfcSCpT7LjgjWH0wjdzMU
	OU9Cbrr74gbG5aQYU/UsHpmdxc6Mk27iS+2LhY8OKeNBR7ueu7Z1ZVIRmouAMzrq/3x1
	byV77llCV6dPZSELrBrZ/NTFVBWrLXHDTOwsLR+uwUWVGM5Yxexw9X78LiwP7NTU8Uup
	+D8NPj4encgSLCmr4zYquc/5/Wb8chOCuegX11lzU3y4l4RSvkAHUyZ1Tbb4ihXFyaED
	KxheVx637+ZtgWCIZINTKFga1TTLJCLLNiznudDwiN/HRaU2SRDfePK2iHDNNoy1RC5S
	Keqg==
Received: by 10.42.74.8 with SMTP id u8mr635682icj.16.1346906202697;
	Wed, 05 Sep 2012 21:36:42 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id xm2sm2662687igb.3.2012.09.05.21.36.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 21:36:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 21:35:45 -0700
Message-Id: <698f0ce085fc3bcdb6798f26916dbd2c450b5e1f.1346905978.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
References: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346905978.git.raj.khem@gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] gcc-4.7: Fix build for armv4/EABI and ppc/Os
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
X-List-Received-Date: Thu, 06 Sep 2012 04:49:04 -0000

arm patch is a forward port from OE/classic
ppc patch should help in building images with Os

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    4 ++-
 .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   29 ++++++++++++++++++++
 .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   21 ++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index affbd54..b455b28 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r11"
+PR = "r12"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -75,6 +75,8 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://fix-g++-sysroot.patch \
 	   file://disablesdt.patch \
 	   file://libtool.patch \
+	   file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
+	   file://ppc_no_crtsavres.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch b/meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
new file mode 100644
index 0000000..6cd645a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
@@ -0,0 +1,29 @@
+The LINK_SPEC for linux gets overwritten by linux-eabi.h which
+means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
+the option is not passed to linker when chosing march=armv4
+This patch redefines this in linux-eabi.h and reinserts it
+for eabi defaulting toolchains.
+
+We might want to send it upstream
+
+-Khem
+Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-08-21 22:54:12.448453417 -0700
++++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-08-21 23:05:18.008478722 -0700
+@@ -78,10 +78,14 @@
+      %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
+      %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
+ 
++/* For armv4 we pass --fix-v4bx to linker to support EABI */
++#undef TARGET_FIX_V4BX_SPEC
++#define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+-#define LINK_SPEC BE8_LINK_SPEC						\
++#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC			\
+   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
+ 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch b/meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
new file mode 100644
index 0000000..88684d3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
@@ -0,0 +1,21 @@
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -246,13 +246,13 @@ do {									\
+ 
+ /* Define cutoff for using external functions to save floating point.
+    When optimizing for size, use external functions when profitable.  */
+-#define FP_SAVE_INLINE(FIRST_REG) (optimize_size			\
++#define FP_SAVE_INLINE(FIRST_REG) (1 || (optimize_size			\
+ 				   ? ((FIRST_REG) == 62			\
+ 				      || (FIRST_REG) == 63)		\
+-				   : (FIRST_REG) < 64)
++				   : (FIRST_REG) < 64))
+ /* And similarly for general purpose registers.  */
+-#define GP_SAVE_INLINE(FIRST_REG) ((FIRST_REG) < 32	\
+-				   && !optimize_size)
++#define GP_SAVE_INLINE(FIRST_REG) (1 || ((FIRST_REG) < 32	\
++				   && !optimize_size))
+ 
+ /* Put jump tables in read-only memory, rather than in .text.  */
+ #define JUMP_TABLES_IN_TEXT_SECTION 0
+
-- 
1.7.9.5



