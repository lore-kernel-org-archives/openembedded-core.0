Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id D7DCD6B5BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 07:12:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r797CBpG007531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 03:12:12 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 9 Aug 2013 00:12:11 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 15:12:32 +0800
Message-ID: <af7806906b222475b4d3b033986c0caaf3409584.1376031704.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376031704.git.Qi.Chen@windriver.com>
References: <cover.1376031704.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] grub_0.97: Fix to correctly ship files under /usr/lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2013 07:12:12 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The grub_fix_for_automake-1.12.patch replaced pkglib with pkgdata to
make grub_0.97 build with automake-1.12. However, it forgot to set up
the pkgdatadir, thus causing grub_0.97 not shipping files under /usr/lib.
This in turn resulted in an unworkable grub.

This patch fixes this problem by setting up the pkgdatadir correctly.

[YOCTO #4997]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../grub-0.97/grub_fix_for_automake-1.12.patch     |   50 +++++++++++++++-----
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch b/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
index 97ee0ad..0cf7dc9 100644
--- a/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
+++ b/meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
@@ -1,4 +1,6 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate
+
+Subject: [PATCH] grub: fix for automake-1.12
 
 automake 1.12 has depricated automatic de-ANSI-fication support
 
@@ -10,25 +12,37 @@ this patch avoids these kinds of errors:
 | autoreconf: automake failed with exit status: 1
 | ERROR: autoreconf execution failed.
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/04
+The upstream status is marked as 'Inappropriate' because this problem is not uncommon,
+it has been there for a long time and no change in upstream.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 Index: grub-0.97/stage1/Makefile.am
 ===================================================================
---- grub-0.97.orig/stage1/Makefile.am
-+++ grub-0.97/stage1/Makefile.am
-@@ -1,5 +1,5 @@
- pkglibdir = $(libdir)/$(PACKAGE)/$(host_cpu)-$(host_vendor)
+--- a/stage1/Makefile.am
++++ b/stage1/Makefile.am
+@@ -1,7 +1,7 @@
+-pkglibdir = $(libdir)/$(PACKAGE)/$(host_cpu)-$(host_vendor)
 -nodist_pkglib_DATA = stage1
++pkgdatadir = $(libdir)/$(PACKAGE)/$(host_cpu)-$(host_vendor)
 +nodist_pkgdata_DATA = stage1
  
- CLEANFILES = $(nodist_pkglib_DATA)
+-CLEANFILES = $(nodist_pkglib_DATA)
++CLEANFILES = $(nodist_pkgdata_DATA)
  
+ # We can't use builtins or standard includes.
+ AM_CCASFLAGS = $(STAGE1_CFLAGS) -fno-builtin -nostdinc
 Index: grub-0.97/stage2/Makefile.am
 ===================================================================
---- grub-0.97.orig/stage2/Makefile.am
-+++ grub-0.97/stage2/Makefile.am
-@@ -32,7 +32,7 @@ pkglibdir = $(libdir)/$(PACKAGE)/$(host_
+--- a/stage2/Makefile.am
++++ b/stage2/Makefile.am
+@@ -27,12 +27,12 @@ libgrub_a_CFLAGS = $(GRUB_CFLAGS) -I$(top_srcdir)/lib \
+ 	-DUSE_MD5_PASSWORDS=1 -DSUPPORT_SERIAL=1 -DSUPPORT_HERCULES=1
+ 
+ # Stage 2 and Stage 1.5's.
+-pkglibdir = $(libdir)/$(PACKAGE)/$(host_cpu)-$(host_vendor)
++pkgdatadir = $(libdir)/$(PACKAGE)/$(host_cpu)-$(host_vendor)
+ 
  EXTRA_PROGRAMS = nbloader.exec pxeloader.exec diskless.exec
  
  if DISKLESS_SUPPORT
@@ -37,7 +51,7 @@ Index: grub-0.97/stage2/Makefile.am
  	ffs_stage1_5 iso9660_stage1_5 jfs_stage1_5 minix_stage1_5 \
  	reiserfs_stage1_5 ufs2_stage1_5 vstafs_stage1_5 xfs_stage1_5 \
  	nbgrub pxegrub
-@@ -43,7 +43,7 @@ noinst_PROGRAMS = pre_stage2.exec start.
+@@ -43,7 +43,7 @@ noinst_PROGRAMS = pre_stage2.exec start.exec start_eltorito.exec \
  	reiserfs_stage1_5.exec ufs2_stage1_5.exec vstafs_stage1_5.exec \
  	xfs_stage1_5.exec nbloader.exec pxeloader.exec diskless.exec
  else
@@ -46,3 +60,15 @@ Index: grub-0.97/stage2/Makefile.am
  	ffs_stage1_5 iso9660_stage1_5 jfs_stage1_5 minix_stage1_5 \
  	reiserfs_stage1_5 ufs2_stage1_5 vstafs_stage1_5 xfs_stage1_5
  noinst_DATA = pre_stage2 start start_eltorito
+@@ -105,7 +105,7 @@ else
+ BUILT_SOURCES = stage2_size.h
+ endif
+ 
+-CLEANFILES = $(pkglib_DATA) $(noinst_DATA) $(BUILT_SOURCES)
++CLEANFILES = $(pkgdata_DATA) $(noinst_DATA) $(BUILT_SOURCES)
+ 
+ stage2_size.h: pre_stage2
+ 	-rm -f stage2_size.h
+-- 
+1.7.9.5
+
-- 
1.7.9.5


