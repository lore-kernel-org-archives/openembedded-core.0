Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qm5B7-0007dV-9c
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:33:41 +0200
Received: by rex (Postfix, from userid 1000)
	id 3BC3721565; Wed, 27 Jul 2011 15:29:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:29:13 +0100
Message-Id: <fe78c19406d856cb9473e062f1c2905dfe063c2a.1311776363.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
References: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] gcc: Drop part of the 64bithack patch which is no longer used
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
X-List-Received-Date: Wed, 27 Jul 2011 14:33:41 -0000

Since we now handle GLIBC_DYNAMIC_LINKER in gcc-configure-common.inc:

's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'

we can drop the patch which changes a hardcoded value for this.

No PR bump since there is no code change resulting from this, its just
a cleanup.

There is still a valid question over the remainder of this patch and its
interaction with multilib configurations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |   13 -------------
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   13 -------------
 2 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
index 890cc2f..05eafe3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
@@ -20,16 +20,3 @@ Index: gcc-4.5.0/gcc/config/i386/t-linux64
  
  LIBGCC = stmp-multilib
  INSTALL_LIBGCC = install-multilib
-Index: gcc-4.5.0/gcc/config/i386/linux64.h
-===================================================================
---- gcc-4.5.0.orig/gcc/config/i386/linux64.h	2010-08-10 15:49:06.000000000 +0100
-+++ gcc-4.5.0/gcc/config/i386/linux64.h	2010-08-10 15:49:16.000000000 +0100
-@@ -59,7 +59,7 @@
-    done.  */
- 
- #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 "/lib/ld-linux-x86-64.so.2"
- 
- #if TARGET_64BIT_DEFAULT
- #define SPEC_32 "m32"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
index 84962e6..4b846bb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
@@ -20,16 +20,3 @@ Index: gcc-4.6.0/gcc/config/i386/t-linux64
  
  LIBGCC = stmp-multilib
  INSTALL_LIBGCC = install-multilib
-Index: gcc-4.6.0/gcc/config/i386/linux64.h
-===================================================================
---- gcc-4.6.0.orig/gcc/config/i386/linux64.h
-+++ gcc-4.6.0/gcc/config/i386/linux64.h
-@@ -63,7 +63,7 @@ see the files COPYING3 and COPYING.RUNTI
-    done.  */
- 
- #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 "/lib/ld-linux-x86-64.so.2"
- 
- #if TARGET_64BIT_DEFAULT
- #define SPEC_32 "m32"
-- 
1.7.4.1



