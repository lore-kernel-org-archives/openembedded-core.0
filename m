Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDK-0006Lj-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507181"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:40 -0700
Message-Id: <5a356e206112e28604719df129be340d2e63dc1a.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 25/30] grub-0.97: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../grub-0.97/grub_fix_for_automake-1.12.patch     |   48 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch

diff --git a/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch b/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..97ee0ad
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| stage1/Makefile.am:2: error: 'pkglibdir' is not a legitimate directory for 'DATA'
+| stage2/Makefile.am:35: error: 'pkglibdir' is not a legitimate directory for 'DATA'
+| stage2/Makefile.am:46: error: 'pkglibdir' is not a legitimate directory for 'DATA'
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: grub-0.97/stage1/Makefile.am
+===================================================================
+--- grub-0.97.orig/stage1/Makefile.am
++++ grub-0.97/stage1/Makefile.am
+@@ -1,5 +1,5 @@
+ pkglibdir = $(libdir)/$(PACKAGE)/$(host_cpu)-$(host_vendor)
+-nodist_pkglib_DATA = stage1
++nodist_pkgdata_DATA = stage1
+ 
+ CLEANFILES = $(nodist_pkglib_DATA)
+ 
+Index: grub-0.97/stage2/Makefile.am
+===================================================================
+--- grub-0.97.orig/stage2/Makefile.am
++++ grub-0.97/stage2/Makefile.am
+@@ -32,7 +32,7 @@ pkglibdir = $(libdir)/$(PACKAGE)/$(host_
+ EXTRA_PROGRAMS = nbloader.exec pxeloader.exec diskless.exec
+ 
+ if DISKLESS_SUPPORT
+-pkglib_DATA = stage2 stage2_eltorito e2fs_stage1_5 fat_stage1_5 \
++pkgdata_DATA = stage2 stage2_eltorito e2fs_stage1_5 fat_stage1_5 \
+ 	ffs_stage1_5 iso9660_stage1_5 jfs_stage1_5 minix_stage1_5 \
+ 	reiserfs_stage1_5 ufs2_stage1_5 vstafs_stage1_5 xfs_stage1_5 \
+ 	nbgrub pxegrub
+@@ -43,7 +43,7 @@ noinst_PROGRAMS = pre_stage2.exec start.
+ 	reiserfs_stage1_5.exec ufs2_stage1_5.exec vstafs_stage1_5.exec \
+ 	xfs_stage1_5.exec nbloader.exec pxeloader.exec diskless.exec
+ else
+-pkglib_DATA = stage2 stage2_eltorito e2fs_stage1_5 fat_stage1_5 \
++pkgdata_DATA = stage2 stage2_eltorito e2fs_stage1_5 fat_stage1_5 \
+ 	ffs_stage1_5 iso9660_stage1_5 jfs_stage1_5 minix_stage1_5 \
+ 	reiserfs_stage1_5 ufs2_stage1_5 vstafs_stage1_5 xfs_stage1_5
+ noinst_DATA = pre_stage2 start start_eltorito
diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index af489fe..1cde30d 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -10,11 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
                     file://grub/main.c;beginline=3;endline=9;md5=22a5f28d2130fff9f2a17ed54be90ed6"
 
 RDEPENDS_${PN} = "diffutils"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
             file://no-reorder-functions.patch \
-            file://autohell.patch "
+            file://autohell.patch \
+            file://grub_fix_for_automake-1.12.patch \
+            "
 
 SRC_URI[md5sum] = "cd3f3eb54446be6003156158d51f4884"
 SRC_URI[sha256sum] = "4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b"
-- 
1.7.7



