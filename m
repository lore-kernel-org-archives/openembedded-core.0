Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAKYs-00029x-LA
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:22:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 05:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121485289"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.204])
	by azsmga001.ch.intel.com with ESMTP; 21 Mar 2012 05:12:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 12:12:42 +0000
Message-Id: <0abdcdc1609b4409fd16c038b85e934195b3cf4c.1332331918.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332331918.git.paul.eggleton@linux.intel.com>
References: <cover.1332331918.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332331918.git.paul.eggleton@linux.intel.com>
References: <cover.1332331918.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] syslinux: fix stripped file warnings
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
X-List-Received-Date: Wed, 21 Mar 2012 12:22:43 -0000

Fix the following package warnings:
WARNING: File '/usr/bin/memdiskfind' from syslinux was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/syslinux' from syslinux was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/gethostip' from syslinux was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/isohybrid' from syslinux was already stripped, this will prevent future debugging!

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/syslinux/files/no-strip.patch |   31 ++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    5 ++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/no-strip.patch

diff --git a/meta/recipes-devtools/syslinux/files/no-strip.patch b/meta/recipes-devtools/syslinux/files/no-strip.patch
new file mode 100644
index 0000000..775851a
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/files/no-strip.patch
@@ -0,0 +1,31 @@
+Disable stripping of binaries
+
+We don't want to strip these as this is handled separately at package
+time.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- syslinux-4.03.orig/mtools/Makefile
++++ syslinux-4.03/mtools/Makefile
+@@ -4,7 +4,7 @@ include $(topdir)/MCONFIG
+ OPTFLAGS = -g -Os
+ INCLUDES = -I. -I.. -I../libfat -I../libinstaller
+ CFLAGS	 = $(GCCWARN) -D_FILE_OFFSET_BITS=64 $(OPTFLAGS) $(INCLUDES)
+-LDFLAGS	 = -s
++LDFLAGS	 =
+ 
+ SRCS     = syslinux.c \
+ 	   ../libinstaller/fat.c \
+--- syslinux-4.03.orig/utils/Makefile
++++ syslinux-4.03/utils/Makefile
+@@ -18,7 +18,7 @@ topdir = ..
+ include $(topdir)/MCONFIG
+ 
+ CFLAGS   = $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64
+-LDFLAGS  = -O2 -s
++LDFLAGS  = -O2
+ 
+ TARGETS	 = mkdiskimage isohybrid gethostip memdiskfind
+ TARGETS += isohybrid.pl  # about to be obsoleted
diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 2ab6878..a8a1f94 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2 \
-           file://cross-build.patch"
+           file://cross-build.patch \
+           file://no-strip.patch"
 
 SRC_URI[md5sum] = "a7ca38a0a5786b6efae8fb01a1ae8070"
 SRC_URI[sha256sum] = "c65567e324f9d1f7f794ae8f9578a0292bbd47d7b8d895a004d2f0152d0bda38"
-- 
1.7.5.4



