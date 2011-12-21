Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RdRvk-0008W8-Jk
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:34:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 11:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98926595"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 11:27:16 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 11:27:12 -0800
Message-Id: <c363f3248af48a2d0e8be897e93237343cd69e02.1324495514.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324495514.git.nitin.a.kamble@intel.com>
References: <cover.1324495514.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure
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
X-List-Received-Date: Wed, 21 Dec 2011 19:34:25 -0000

From: "H.J. Lu" <hjl.tools@gmail.com>

There is no need to check "$CC $CFLAGS" for x32 in gmp configure.  The
way GMP works is that it makes all the ABIs available for the user to
pick from based on the target, but the final ABI is selected based on
the $ABI variable or if compiler passes the ABI test.  The test for
x32 ABI is

any_x32_testlist="sizeof-long-4"

GMP will select x32 ABI only if long is 4byte, which will only be set
to 4 by -mx32 passed in "$CC $CFLAGS".

Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   24 ++++++++-----------
 1 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch b/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
index b8e22aa..76d3a00 100644
--- a/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
+++ b/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
@@ -8,7 +8,7 @@ Signed Off By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/11/21
 
 --- gmp-4.3.2/configure.in.x32	2011-08-12 15:03:06.143548291 -0700
 +++ gmp-4.3.2/configure.in	2011-08-12 15:06:20.580595316 -0700
-@@ -1499,6 +1499,25 @@ case $host in
+@@ -1499,6 +1499,21 @@ case $host in
  	    path_64="x86_64/atom x86_64"
  	    ;;
  	esac
@@ -16,19 +16,15 @@ Signed Off By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/11/21
 +	# X32 support.
 +	case x"$path_64" in
 +	  xx86_64*)
-+	    case x"$CC $CFLAGS" in
-+	      x*-mx32*)
-+		abilist="x32 64 32"
-+		path_x32="$path_64"
-+		limb_x32=longlong
-+		cclist_x32="gcc"
-+		gcc_x32_cflags="-O2 -mx32"
-+		any_x32_testlist="sizeof-long-4"
-+		CALLING_CONVENTIONS_OBJS_x32='amd64call.lo amd64check$U.lo'
-+		SPEED_CYCLECOUNTER_OBJ_x32=x86_64.lo
-+		cyclecounter_size_x32=2
-+		;;
-+	    esac
++	    abilist="x32 64 32"
++	    path_x32="$path_64"
++	    limb_x32=longlong
++	    cclist_x32="gcc"
++	    gcc_x32_cflags="-O2 -mx32"
++	    any_x32_testlist="sizeof-long-4"
++	    CALLING_CONVENTIONS_OBJS_x32='amd64call.lo amd64check$U.lo'
++	    SPEED_CYCLECOUNTER_OBJ_x32=x86_64.lo
++	    cyclecounter_size_x32=2
 +	    ;;
 +	esac
  	;;
-- 
1.7.6.4



