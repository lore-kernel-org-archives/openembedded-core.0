Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDF-0006Li-8m
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507171"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:32 -0700
Message-Id: <fc7a9b5991606ad85d1f53bce6ca6147603066ce.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 17/30] lrzsz: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../lrzsz_fix_for_automake-1.12.patch              |   49 ++++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 ++-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..b4529f4
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
@@ -0,0 +1,49 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| configure.in:95: error: automatic de-ANSI-fication support has been removed
+...
+| lib/Makefile.am:3: error: automatic de-ANSI-fication support has been removed
+| lib/Makefile.am: installing './depcomp'
+| src/Makefile.am:11: error: automatic de-ANSI-fication support has been removed
+
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: lrzsz-0.12.20/configure.in
+===================================================================
+--- lrzsz-0.12.20.orig/configure.in
++++ lrzsz-0.12.20/configure.in
+@@ -92,7 +92,6 @@ AC_PROG_RANLIB
+ AC_ISC_POSIX
+ AC_AIX
+ AC_MINIX
+-AM_C_PROTOTYPES
+ AC_C_CONST
+ AC_C_INLINE
+ 
+Index: lrzsz-0.12.20/lib/Makefile.am
+===================================================================
+--- lrzsz-0.12.20.orig/lib/Makefile.am
++++ lrzsz-0.12.20/lib/Makefile.am
+@@ -1,6 +1,5 @@
+ noinst_LIBRARIES=libzmodem.a
+ CFLAGS=@CFLAGS@
+-AUTOMAKE_OPTIONS=ansi2knr
+ 
+ EXTRA_DIST = alloca.c ansi2knr.1 ansi2knr.c \
+ 	getopt.c getopt1.c mkdir.c mktime.c \
+Index: lrzsz-0.12.20/src/Makefile.am
+===================================================================
+--- lrzsz-0.12.20.orig/src/Makefile.am
++++ lrzsz-0.12.20/src/Makefile.am
+@@ -8,7 +8,6 @@ CFLAGS=@CFLAGS@
+ DISTCLEAN_FILES=lrzszbug
+ 
+ LDADD = ../lib/libzmodem.a @LIBINTL@
+-AUTOMAKE_OPTIONS=ansi2knr
+ EXTRA_DIST = ansi2knr.1 ansi2knr.c lrzszbug.in
+ INCLUDES = -I.. -I$(srcdir) -I$(top_srcdir)/src -I../intl -I$(top_srcdir)/lib
+ #DEFS = -DLOCALEDIR=\"$(localedir)\" -DOS=\"@host_os@\" -DCPU=\"@host_cpu@\"
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 7f86157..e76f36a 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -10,12 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
 SECTION = "console/network"
 DEPENDS = ""
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://autotools.patch \
 	   file://makefile.patch \
-	   file://gettext.patch"
+	   file://gettext.patch \
+	   file://lrzsz_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
-- 
1.7.7



