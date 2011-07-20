Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDI-0001Zu-3M
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753294"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:11 -0700
Message-Id: <6a8c2b0a310167b4949429970fa85943e7438850.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 24/50] gcc_4.5.1: add pr43810.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:06 -0000

From: Ilya Yanok <yanok@emcraft.com>

Add fix for PR43810 as proposed in
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810

Building on powerpc-eabi* with --enable-target-optspace
still fails for me though.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc           |    1 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch |   57 +++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 76f9837..efed414 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -58,6 +58,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
 	   file://use-defaults.h-and-t-oe-in-B.patch \
+	   file://pr43810.patch \
 	  "
 	
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch
new file mode 100644
index 0000000..e9db4c0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/pr43810.patch
@@ -0,0 +1,57 @@
+From 33ba46dc9395d7a6b1496e9f273cf953d59a8d71 Mon Sep 17 00:00:00 2001
+From: froydnj <froydnj@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 23 Feb 2011 18:06:29 +0000
+Subject: [PATCH 1/6] PR target/43810
+
+	Backport from mainline:
+	2010-07-23  Nathan Froyd  <froydnj@codesourcery.com>
+
+	* config.host (powerpc*-eabispe*): Set tmake_file.
+	(powerpc*-eabi*): Likewise.
+	* config/rs6000/t-ppccomm (EXTRA_PARTS): Add crtbegin, crtend,
+	crtbeginS, crtendS, crtbeginT.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_5-branch@170443 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ libgcc/config.host             |    2 ++
+ libgcc/config/rs6000/t-ppccomm |    4 +++-
+ 2 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/libgcc/config.host b/libgcc/config.host
+index fe3465e..f85c723 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -454,6 +454,7 @@ powerpc*-*-freebsd*)
+ powerpc-*-netbsd*)
+ 	;;
+ powerpc-*-eabispe*)
++	tmake_file="${tmake_file} rs6000/t-ppccomm"
+ 	;;
+ powerpc-*-eabisimaltivec*)
+ 	;;
+@@ -464,6 +465,7 @@ powerpc-*-elf*)
+ powerpc-*-eabialtivec*)
+ 	;;
+ powerpc-*-eabi*)
++	tmake_file="${tmake_file} rs6000/t-ppccomm"
+ 	;;
+ powerpc-*-rtems*)
+ 	;;
+diff --git a/libgcc/config/rs6000/t-ppccomm b/libgcc/config/rs6000/t-ppccomm
+index 1a711eb..4548cd7 100644
+--- a/libgcc/config/rs6000/t-ppccomm
++++ b/libgcc/config/rs6000/t-ppccomm
+@@ -15,7 +15,9 @@ LIB2ADD_ST += crtsavfpr.S crtresfpr.S \
+   e500crtsavg64gpr.S \
+   e500crtsavg64gprctr.S
+ 
+-EXTRA_PARTS += ecrti$(objext) ecrtn$(objext) ncrti$(objext) ncrtn$(objext)
++EXTRA_PARTS += crtbegin$(objext) crtend$(objext) \
++  crtbeginS$(objext) crtendS$(objext) crtbeginT$(objext) \
++  ecrti$(objext) ecrtn$(objext) ncrti$(objext) ncrtn$(objext)
+ 
+ # We build {e,n}crti.o and {e,n}crtn.o, which serve to add begin and
+ # end labels to all of the special sections used when we link using gcc.
+-- 
+1.7.4
+
-- 
1.7.3.4



