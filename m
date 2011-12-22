Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc7-0005NT-Pa
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233774"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:26 -0800
Message-Id: <c82275652d1346b8f7e0e145b04295ac27fdd94e.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/26] gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:56 -0000

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



