Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809h-00034S-Lq
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119089800"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:10 -0700
Message-Id: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1331776831.git.nitin.a.kamble@intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/8] gmp: upgrade from 5.0.3 to 5.0.4
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
X-List-Received-Date: Thu, 15 Mar 2012 02:11:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

gmp_bugfix.patch : removed this patch as it is in upstream now

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |   94 --------------------
 .../gmp/{gmp_5.0.3.bb => gmp_5.0.4.bb}             |    7 +-
 2 files changed, 3 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-support/gmp/gmp/gmp_bugfix.patch
 rename meta/recipes-support/gmp/{gmp_5.0.3.bb => gmp_5.0.4.bb} (54%)

diff --git a/meta/recipes-support/gmp/gmp/gmp_bugfix.patch b/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
deleted file mode 100644
index 329c880..0000000
--- a/meta/recipes-support/gmp/gmp/gmp_bugfix.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Upstream-Status: Pending
-
-When LONG_MIN is passed to val, -val is undefined.  This patch fixes
-it.  See for details: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50066
-
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
-
---- gmp-4.3.2/mpf/iset_si.c.ll	2010-01-07 12:09:03.000000000 -0800
-+++ gmp-4.3.2/mpf/iset_si.c	2011-11-30 16:42:35.827944358 -0800
-@@ -31,7 +31,7 @@ mpf_init_set_si (mpf_ptr r, long int val
-   r->_mp_prec = prec;
-   r->_mp_d = (mp_ptr) (*__gmp_allocate_func) ((prec + 1) * BYTES_PER_MP_LIMB);
- 
--  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
-+  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
- 
-   r->_mp_d[0] = vl & GMP_NUMB_MASK;
-   size = vl != 0;
---- gmp-4.3.2/mpf/set_si.c.ll	2010-01-07 12:09:03.000000000 -0800
-+++ gmp-4.3.2/mpf/set_si.c	2011-11-30 16:42:47.823878367 -0800
-@@ -27,7 +27,7 @@ mpf_set_si (mpf_ptr dest, long val)
-   mp_size_t size;
-   mp_limb_t vl;
- 
--  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
-+  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
- 
-   dest->_mp_d[0] = vl & GMP_NUMB_MASK;
-   size = vl != 0;
---- gmp-4.3.2/mpz/cmp_si.c.ll	2010-01-07 12:09:03.000000000 -0800
-+++ gmp-4.3.2/mpz/cmp_si.c	2011-11-30 13:44:25.923319700 -0800
-@@ -27,7 +27,7 @@ _mpz_cmp_si (mpz_srcptr u, signed long i
- {
-   mp_size_t usize = u->_mp_size;
-   mp_size_t vsize;
--  mp_limb_t u_digit;
-+  mp_limb_t u_digit, vl_digit;
- 
- #if GMP_NAIL_BITS != 0
-   /* FIXME.  This isn't very pretty.  */
-@@ -41,11 +41,14 @@ _mpz_cmp_si (mpz_srcptr u, signed long i
- 
-   vsize = 0;
-   if (v_digit > 0)
--    vsize = 1;
-+    {
-+      vsize = 1;
-+      vl_digit = (mp_limb_t) (unsigned long) v_digit;
-+    }
-   else if (v_digit < 0)
-     {
-       vsize = -1;
--      v_digit = -v_digit;
-+      vl_digit = (mp_limb_t) -(unsigned long) v_digit;
-     }
- 
-   if (usize != vsize)
-@@ -56,10 +59,10 @@ _mpz_cmp_si (mpz_srcptr u, signed long i
- 
-   u_digit = u->_mp_d[0];
- 
--  if (u_digit == (mp_limb_t) (unsigned long) v_digit)
-+  if (u_digit == vl_digit)
-     return 0;
- 
--  if (u_digit > (mp_limb_t) (unsigned long) v_digit)
-+  if (u_digit > vl_digit)
-     return usize;
-   else
-     return -usize;
---- gmp-4.3.2/mpz/iset_si.c.ll	2010-01-07 12:09:03.000000000 -0800
-+++ gmp-4.3.2/mpz/iset_si.c	2011-11-30 13:44:25.924319695 -0800
-@@ -31,7 +31,7 @@ mpz_init_set_si (mpz_ptr dest, signed lo
-   dest->_mp_alloc = 1;
-   dest->_mp_d = (mp_ptr) (*__gmp_allocate_func) (BYTES_PER_MP_LIMB);
- 
--  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
-+  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
- 
-   dest->_mp_d[0] = vl & GMP_NUMB_MASK;
-   size = vl != 0;
---- gmp-4.3.2/mpz/set_si.c.ll	2010-01-07 12:09:03.000000000 -0800
-+++ gmp-4.3.2/mpz/set_si.c	2011-11-30 13:44:25.947319574 -0800
-@@ -27,7 +27,7 @@ mpz_set_si (mpz_ptr dest, signed long in
-   mp_size_t size;
-   mp_limb_t vl;
- 
--  vl = (mp_limb_t) (unsigned long int) (val >= 0 ? val : -val);
-+  vl = (mp_limb_t) (val >= 0 ? (unsigned long int) val : -(unsigned long int) val);
- 
-   dest->_mp_d[0] = vl & GMP_NUMB_MASK;
-   size = vl != 0;
diff --git a/meta/recipes-support/gmp/gmp_5.0.3.bb b/meta/recipes-support/gmp/gmp_5.0.4.bb
similarity index 54%
rename from meta/recipes-support/gmp/gmp_5.0.3.bb
rename to meta/recipes-support/gmp/gmp_5.0.4.bb
index 9f37943..9adcc3f 100644
--- a/meta/recipes-support/gmp/gmp_5.0.3.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.4.bb
@@ -4,11 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
 PR = "r0"
 
-SRC_URI_append += "file://gmp_bugfix.patch \
-                   file://use-includedir.patch \
+SRC_URI_append += "file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-SRC_URI[md5sum] = "8061f765cc86b9765921a0c800615804"
-SRC_URI[sha256sum] = "dcafe9989c7f332b373e1f766af8e9cd790fc802fdec422a1910a6ef783480e3"
+SRC_URI[md5sum] = "50c3edcb7c9438e04377ee9a1a061b79"
+SRC_URI[sha256sum] = "35d4aade3e4bdf0915c944599b10d23f108ffedf6c3188aeec52221c5cf9a06f"
-- 
1.7.6.4



