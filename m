Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhB-0002KL-6P
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396284"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:02 -0800
Message-Id: <394a7e8600d83b69623bf9e07a933e2d1035e4b2.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/11] gmp: fix the recipe for x32 target
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add support for building with x32 toolchain.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |   94 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   45 +++++++++
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    6 +-
 3 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_bugfix.patch
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch

diff --git a/meta/recipes-support/gmp/gmp/gmp_bugfix.patch b/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
new file mode 100644
index 0000000..a96136f
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
@@ -0,0 +1,94 @@
+UpstreamStatus: Pending
+
+When LONG_MIN is passed to val, -val is undefined.  This patch fixes
+it.  See for details: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50066
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
+
+--- gmp-4.3.2/mpf/iset_si.c.ll	2010-01-07 12:09:03.000000000 -0800
++++ gmp-4.3.2/mpf/iset_si.c	2011-11-30 16:42:35.827944358 -0800
+@@ -31,7 +31,7 @@ mpf_init_set_si (mpf_ptr r, long int val
+   r->_mp_prec = prec;
+   r->_mp_d = (mp_ptr) (*__gmp_allocate_func) ((prec + 1) * BYTES_PER_MP_LIMB);
+ 
+-  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
++  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
+ 
+   r->_mp_d[0] = vl & GMP_NUMB_MASK;
+   size = vl != 0;
+--- gmp-4.3.2/mpf/set_si.c.ll	2010-01-07 12:09:03.000000000 -0800
++++ gmp-4.3.2/mpf/set_si.c	2011-11-30 16:42:47.823878367 -0800
+@@ -27,7 +27,7 @@ mpf_set_si (mpf_ptr dest, long val)
+   mp_size_t size;
+   mp_limb_t vl;
+ 
+-  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
++  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
+ 
+   dest->_mp_d[0] = vl & GMP_NUMB_MASK;
+   size = vl != 0;
+--- gmp-4.3.2/mpz/cmp_si.c.ll	2010-01-07 12:09:03.000000000 -0800
++++ gmp-4.3.2/mpz/cmp_si.c	2011-11-30 13:44:25.923319700 -0800
+@@ -27,7 +27,7 @@ _mpz_cmp_si (mpz_srcptr u, signed long i
+ {
+   mp_size_t usize = u->_mp_size;
+   mp_size_t vsize;
+-  mp_limb_t u_digit;
++  mp_limb_t u_digit, vl_digit;
+ 
+ #if GMP_NAIL_BITS != 0
+   /* FIXME.  This isn't very pretty.  */
+@@ -41,11 +41,14 @@ _mpz_cmp_si (mpz_srcptr u, signed long i
+ 
+   vsize = 0;
+   if (v_digit > 0)
+-    vsize = 1;
++    {
++      vsize = 1;
++      vl_digit = (mp_limb_t) (unsigned long) v_digit;
++    }
+   else if (v_digit < 0)
+     {
+       vsize = -1;
+-      v_digit = -v_digit;
++      vl_digit = (mp_limb_t) -(unsigned long) v_digit;
+     }
+ 
+   if (usize != vsize)
+@@ -56,10 +59,10 @@ _mpz_cmp_si (mpz_srcptr u, signed long i
+ 
+   u_digit = u->_mp_d[0];
+ 
+-  if (u_digit == (mp_limb_t) (unsigned long) v_digit)
++  if (u_digit == vl_digit)
+     return 0;
+ 
+-  if (u_digit > (mp_limb_t) (unsigned long) v_digit)
++  if (u_digit > vl_digit)
+     return usize;
+   else
+     return -usize;
+--- gmp-4.3.2/mpz/iset_si.c.ll	2010-01-07 12:09:03.000000000 -0800
++++ gmp-4.3.2/mpz/iset_si.c	2011-11-30 13:44:25.924319695 -0800
+@@ -31,7 +31,7 @@ mpz_init_set_si (mpz_ptr dest, signed lo
+   dest->_mp_alloc = 1;
+   dest->_mp_d = (mp_ptr) (*__gmp_allocate_func) (BYTES_PER_MP_LIMB);
+ 
+-  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
++  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
+ 
+   dest->_mp_d[0] = vl & GMP_NUMB_MASK;
+   size = vl != 0;
+--- gmp-4.3.2/mpz/set_si.c.ll	2010-01-07 12:09:03.000000000 -0800
++++ gmp-4.3.2/mpz/set_si.c	2011-11-30 13:44:25.947319574 -0800
+@@ -27,7 +27,7 @@ mpz_set_si (mpz_ptr dest, signed long in
+   mp_size_t size;
+   mp_limb_t vl;
+ 
+-  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
++  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
+ 
+   dest->_mp_d[0] = vl & GMP_NUMB_MASK;
+   size = vl != 0;
diff --git a/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch b/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
new file mode 100644
index 0000000..aa5641c
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Pending
+
+Add X32 support in gmp configure.
+
+Patch Originator: H J Lu @ Intel
+Patch modified for Yocto by Nitin Kamble
+Signed Off By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/11/21
+
+--- gmp-4.3.2/configure.in.x32	2011-08-12 15:03:06.143548291 -0700
++++ gmp-4.3.2/configure.in	2011-08-12 15:06:20.580595316 -0700
+@@ -1499,6 +1499,25 @@ case $host in
+ 	    path_64="x86_64/atom x86_64"
+ 	    ;;
+ 	esac
++
++	# X32 support.
++	case x"$path_64" in
++	  xx86_64*)
++	    case x"$CC $CFLAGS" in
++	      x*-mx32*)
++		abilist="x32 64 32"
++		path_x32="$path_64"
++		limb_x32=longlong
++		cclist_x32="gcc"
++		gcc_x32_cflags="-O2 -mx32"
++		any_x32_testlist="sizeof-long-4"
++		CALLING_CONVENTIONS_OBJS_x32='amd64call.lo amd64check$U.lo'
++		SPEED_CYCLECOUNTER_OBJ_x32=x86_64.lo
++		cyclecounter_size_x32=2
++		;;
++	    esac
++	    ;;
++	esac
+ 	;;
+     esac
+     ;;
+@@ -3039,7 +3058,7 @@ if test "$gmp_asm_syntax_testing" != no;
+ 	      GMP_INCLUDE_MPN(x86/darwin.m4) ;;
+ 	  esac
+           ;;
+-        64)
++        64|x32)
+           GMP_INCLUDE_MPN(x86_64/x86_64-defs.m4)
+ 	  case $host in
+ 	    *-*-darwin*)
diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-support/gmp/gmp_5.0.2.bb
index 873fc3e..c28e745 100644
--- a/meta/recipes-support/gmp/gmp_5.0.2.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
@@ -2,10 +2,12 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r2"
+PR = "r3"
 
 SRC_URI_append += "file://sh4-asmfix.patch \
-                   file://use-includedir.patch "
+                   file://gmp_bugfix.patch \
+                   file://use-includedir.patch \
+                   file://gmp_fix_for_x32.patch"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-- 
1.7.6.4



