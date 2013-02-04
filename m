Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISa-0004xE-Tp
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243125"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:42 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:18 +0200
Message-Id: <b052c48e1e74bbda8026ea678f8a378af4b89f7d.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 04/10] console-tools: fix linking when using the multilib compiler
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:33 -0000
X-List-Received-Date: Mon, 04 Feb 2013 09:35:33 -0000

fix-libconsole-link.patch: add patch for fixing libconsole
linking problems when using multilib gcc

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../fix-libconsole-linking.patch                   | 56 ++++++++++++++++++++++
 .../console-tools/console-tools_0.3.2.bb           |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch

diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch
new file mode 100644
index 0000000..be61eb8
--- /dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch
@@ -0,0 +1,56 @@
+Fix the following error detected with i586-pokymllib32-linux-gcc (the
+multilib x86-64 lib32 compiler):
+    ../lib/ctutils/.libs/libctutils.so: undefined reference to `get_kernel_sfm'
+    collect2: error: ld returned 1 exit status
+
+It seems that libctutils.so (the library that uses get_kernel_sfm) must
+be stated before libconsole.so (the library that exports the function) when
+using multilib gcc
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: console-tools-0.3.2/fontfiletools/Makefile.am
+===================================================================
+--- console-tools-0.3.2.orig/fontfiletools/Makefile.am
++++ console-tools-0.3.2/fontfiletools/Makefile.am
+@@ -10,5 +10,5 @@ EXTRA_DIST = fonts2virfont.c virfont.h
+ 
+ # libconsole is needed by ctutils
+ LDADD = ../lib/ctlocal/libctlocal.a ../lib/cfont/libcfont.la \
+-	../lib/console/libconsole.la \
+-	../lib/ctutils/libctutils.la ../lib/generic/libctgeneric.la
++	../lib/ctutils/libctutils.la \
++	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
+Index: console-tools-0.3.2/vttools/Makefile.am
+===================================================================
+--- console-tools-0.3.2.orig/vttools/Makefile.am
++++ console-tools-0.3.2/vttools/Makefile.am
+@@ -7,9 +7,9 @@ bin_PROGRAMS = chvt deallocvt writevt fg
+ 	vcstime vt-is-UTF8 openvt @RESIZECONS@
+ EXTRA_PROGRAMS = resizecons
+ 
+-LDADD = ../lib/ctlocal/libctlocal.a ../lib/console/libconsole.la \
++LDADD = ../lib/ctlocal/libctlocal.a ../lib/ctutils/libctutils.la \
+ 	../lib/cfont/libcfont.la \
+-	../lib/ctutils/libctutils.la ../lib/generic/libctgeneric.la
++	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
+ 
+ vcstime_LDADD = ../lib/ctlocal/libctlocal.a
+ screendump_LDADD = ../lib/ctlocal/libctlocal.a
+Index: console-tools-0.3.2/kbdtools/Makefile.am
+===================================================================
+--- console-tools-0.3.2.orig/kbdtools/Makefile.am
++++ console-tools-0.3.2/kbdtools/Makefile.am
+@@ -15,9 +15,9 @@ EXTRA_PROGRAMS = getkeycodes setkeycodes
+ loadkeys_SOURCES = loadkeys.y analyze.l
+ 
+ YFLAGS = -d
+-LDADD = ../lib/ctlocal/libctlocal.a ../lib/console/libconsole.la \
++LDADD = ../lib/ctlocal/libctlocal.a ../lib/ctutils/libctutils.la \
+ 	../lib/cfont/libcfont.la \
+-	../lib/ctutils/libctutils.la ../lib/generic/libctgeneric.la
++	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
+ 
+ loadkeys_LDADD = $(LDADD) @LEXLIB@
+ 
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index a46e44d..8f2f116 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
 SUMMARY = "Allows you to set-up and manipulate the Linux console."
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://codepage.patch \
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://kbdrate.patch \
            file://uclibc-fileno.patch \
            file://nodocs.patch \
+           file://fix-libconsole-linking.patch \
            file://lcmessage.m4 \
            file://Makevars"
 
-- 
1.7.11.7



