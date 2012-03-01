Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XH-0007yt-HD
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168890"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:09 -0800
Message-Id: <aab7e17206c339520a3338ee8343109970d6a953.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] util-linux: Fix removal of lscpu for non-GPLv3 Build
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
X-List-Received-Date: Thu, 01 Mar 2012 07:34:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux/util-linux-2.21/remove-lscpu.patch  |   43 +++++++++++++------
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch
index 434e28d..a15c1e3 100644
--- a/meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch
@@ -2,24 +2,39 @@ Upstream-Status: Inappropriate [distribution]
 
 Take out lscpu stuff from the code
 
-2011/03/17
-Saul Wold <saul.wold@intel.com>
-Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: util-linux-2.20.1/sys-utils/Makefile.am
+Index: util-linux-2.21/configure.ac
 ===================================================================
---- util-linux-2.20.1.orig/sys-utils/Makefile.am
-+++ util-linux-2.20.1/sys-utils/Makefile.am
-@@ -17,12 +17,6 @@ usrsbin_exec_PROGRAMS += ldattach tunelp
- dist_man_MANS += dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
- 		ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8
+--- util-linux-2.21.orig/configure.ac
++++ util-linux-2.21/configure.ac
+@@ -871,7 +871,7 @@ UL_REQUIRES_BUILD([lsblk], [libblkid])
+ AM_CONDITIONAL(BUILD_LSBLK, test "x$build_lsblk" = xyes)
  
--if HAVE_CPU_SET_T
+ 
+-UL_BUILD_INIT([lscpu], [check])
++UL_BUILD_INIT([lscpu], [no])
+ UL_REQUIRES_LINUX([lscpu])
+ UL_REQUIRES_HAVE([lscpu], [cpu_set_t], [cpu_set_t type])
+ AM_CONDITIONAL(BUILD_LSCPU, test "x$build_lscpu" = xyes)
+Index: util-linux-2.21/sys-utils/Makefile.am
+===================================================================
+--- util-linux-2.21.orig/sys-utils/Makefile.am
++++ util-linux-2.21/sys-utils/Makefile.am
+@@ -108,16 +108,6 @@ swapon_CFLAGS = $(AM_CFLAGS) -I$(ul_libb
+ swapon_LDADD = $(ul_libblkid_la)
+ endif
+ 
+-if BUILD_LSCPU
 -usrbin_exec_PROGRAMS += lscpu
--lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c $(top_srcdir)/lib/strutils.c
+-lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c \
+-			$(top_srcdir)/lib/strutils.c \
+-			$(top_srcdir)/lib/mbsalign.c \
+-			$(top_srcdir)/lib/tt.c \
+-			$(top_srcdir)/lib/path.c
 -dist_man_MANS += lscpu.1
 -endif
 -
- endif
- 
- cytune_SOURCES = cytune.c cyclades.h
+ if BUILD_CHCPU
+ sbin_PROGRAMS += chcpu
+ chcpu_SOURCES = chcpu.c $(top_srcdir)/lib/cpuset.c \
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index aa6ac64..e21f484 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.7.6



