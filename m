Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzTWp-0002LG-Ek for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 15:11:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82D6WV8025916
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 14:06:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25302-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 14:06:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82D6Q5K025910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 14:06:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2011 14:06:08 +0100
Message-ID: <1314968768.5939.581.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: gcc: Fix multilib baselib confusion
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
X-List-Received-Date: Fri, 02 Sep 2011 13:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit 35fa8dc5f7da90fdd40091a3c3600d3fcd232922 changed the gcc recipes to use
baselib for the compiler location. This is fine as long as baselib happens to
match the platform multilib definition which is enabled at the time.

This patch fixes things so that gcc will honour whatever ${base_libdir} is 
set to re-allowing suitable customisation of the system layout.

[YOCTO #1362]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 290d8f2..380f9f7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r8"
+PR = "r9"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
index 4b846bb..d35753a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
@@ -1,22 +1,68 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-By default gcc places 64 bit libs in a lib64 directory. This makes it use 
-"lib" instead.
+GCC has internal multilib handling code but it assumes a very specific rigid directory
+layout. The build system implementation of multilib layout is very generic and allows
+complete customisation of the library directories.
 
-RP 25/7/10
+This patch is a partial solution to allow any custom directories to be passed into gcc
+and handled correctly. It forces gcc to use the base_libdir (which is the current 
+directory, "."). We need to do this for each multilib that is configured as we don't
+know which compiler options may be being passed into the compiler. Since we have a compiler
+per mulitlib at this point that isn't an issue.
 
-Index: gcc-4.6.0/gcc/config/i386/t-linux64
+The one problem is the target compiler is only going to work for the default multlilib at
+this point. Ideally we'd figure out which multilibs were being enabled with which paths
+and be able to patch these entries with a complete set of correct paths but this we
+don't have such code at this point. This is something the target gcc recipe should do 
+and override these platform defaults in its build config.
+
+RP 15/8/11
+
+Index: gcc-4_6-branch/gcc/config/i386/t-linux64
 ===================================================================
---- gcc-4.6.0.orig/gcc/config/i386/t-linux64
-+++ gcc-4.6.0/gcc/config/i386/t-linux64
+--- gcc-4_6-branch.orig/gcc/config/i386/t-linux64	2011-06-23 15:15:29.000000000 +0100
++++ gcc-4_6-branch/gcc/config/i386/t-linux64	2011-08-15 13:09:03.772415848 +0100
 @@ -24,8 +24,8 @@
  # MULTILIB_OSDIRNAMES according to what is found on the target.
  
  MULTILIB_OPTIONS = m64/m32
 -MULTILIB_DIRNAMES = 64 32 
 -MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
-+MULTILIB_DIRNAMES = . 32
-+MULTILIB_OSDIRNAMES = . $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
++MULTILIB_DIRNAMES = . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
  
  LIBGCC = stmp-multilib
  INSTALL_LIBGCC = install-multilib
+Index: gcc-4_6-branch/gcc/config/mips/t-linux64
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/mips/t-linux64	2011-08-15 13:06:13.732415763 +0100
++++ gcc-4_6-branch/gcc/config/mips/t-linux64	2011-08-15 13:09:11.452419446 +0100
+@@ -17,8 +17,8 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+-MULTILIB_DIRNAMES = n32 32 64
+-MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ 
+ EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
+ 
+Index: gcc-4_6-branch/gcc/config/rs6000/t-linux64
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/rs6000/t-linux64	2011-08-15 13:06:25.272415822 +0100
++++ gcc-4_6-branch/gcc/config/rs6000/t-linux64	2011-08-15 13:09:21.062415878 +0100
+@@ -32,11 +32,11 @@
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+ MULTILIB_OPTIONS        = m64/m32 msoft-float
+-MULTILIB_DIRNAMES       = 64 32 nof
++MULTILIB_DIRNAMES       = . . .
+ MULTILIB_EXTRA_OPTS     = fPIC mstrict-align
+ MULTILIB_EXCEPTIONS     = m64/msoft-float
+ MULTILIB_EXCLUSIONS     = m64/!m32/msoft-float
+-MULTILIB_OSDIRNAMES	= ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) nof
++MULTILIB_OSDIRNAMES	= ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ MULTILIB_MATCHES        = $(MULTILIB_MATCHES_FLOAT)
+ 
+ softfp_wrap_start := '\#ifndef __powerpc64__'
--
cgit 0.9.0.1




