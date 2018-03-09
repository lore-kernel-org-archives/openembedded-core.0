Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBDF78917
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651896"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:46 +0200
Message-Id: <20180309185614.31113-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/36] e2fsprogs: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:02 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch | 12 ++++-----
 .../e2fsprogs/e2fsprogs/ptest.patch                | 30 +++++++++++-----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
index 38fb07e6e6e..38e1bdb3d86 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  misc/mke2fs.conf.in | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
-index 812f7c7..0280398 100644
---- a/misc/mke2fs.conf.in
-+++ b/misc/mke2fs.conf.in
+Index: git/misc/mke2fs.conf.in
+===================================================================
+--- git.orig/misc/mke2fs.conf.in
++++ git/misc/mke2fs.conf.in
 @@ -11,8 +11,9 @@
  		features = has_journal
  	}
@@ -32,5 +32,5 @@ index 812f7c7..0280398 100644
  		inode_size = 256
 +		auto_64-bit_support = 1
  	}
- 	ext4dev = {
- 		features = has_journal,extent,huge_file,flex_bg,uninit_bg,inline_data,64bit,dir_nlink,extra_isize
+ 	small = {
+ 		blocksize = 1024
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index 7df09676373..7c4bb39fd71 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Inappropriate
 
-diff --git a/tests/Makefile.in b/tests/Makefile.in
-index c130f4a..d2ade03 100644
---- a/tests/Makefile.in
-+++ b/tests/Makefile.in
-@@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
+Index: git/tests/Makefile.in
+===================================================================
+--- git.orig/tests/Makefile.in
++++ git/tests/Makefile.in
+@@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile
  	@echo "#!/bin/sh" > test_one
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
@@ -12,8 +12,8 @@ index c130f4a..d2ade03 100644
 +	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
- 	@cat $(srcdir)/test_one.in >> test_one
-@@ -27,7 +27,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
+ 	@echo "DD=@DD@" >>test_one
+@@ -28,7 +28,7 @@ test_one: $(srcdir)/test_one.in Makefile
  test_script: test_one test_script.in Makefile mke2fs.conf
  	@echo "Creating test_script..."
  	@echo "#!/bin/sh" > test_script
@@ -22,10 +22,10 @@ index c130f4a..d2ade03 100644
  	@cat $(srcdir)/test_script.in >> test_script
  	@chmod +x test_script
  
-diff --git a/tests/test_config b/tests/test_config
-index 547ef4c..e11e6f4 100644
---- a/tests/test_config
-+++ b/tests/test_config
+Index: git/tests/test_config
+===================================================================
+--- git.orig/tests/test_config
++++ git/tests/test_config
 @@ -3,24 +3,24 @@
  #
  
@@ -67,10 +67,10 @@ index 547ef4c..e11e6f4 100644
  CLEAN_OUTPUT="sed -f $cmd_dir/filter.sed"
  LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${LD_LIBRARY_PATH}
  DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${DYLD_LIBRARY_PATH}
-diff --git a/tests/test_script.in b/tests/test_script.in
-index 9959e30..442999d 100644
---- a/tests/test_script.in
-+++ b/tests/test_script.in
+Index: git/tests/test_script.in
+===================================================================
+--- git.orig/tests/test_script.in
++++ git/tests/test_script.in
 @@ -39,7 +39,7 @@ for i; do
  done
  
-- 
2.16.1


