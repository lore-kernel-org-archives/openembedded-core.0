Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF0586FFD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C8PKPb000543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:20 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:08 -0700
Message-ID: <9d28d6ffba92b45f437eed145fbec202f184850e.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] e2fsprogs: 1.42.99+1.43+git -> 1.43
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:20 -0000
Content-Type: text/plain

* Removed patches already in the source:
  - Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
  - xattr_ordering.patch

* COPYING -> NOTICE, the md5sum is the same.

* e2fsprogs_git.bb -> e2fsprogs_1.43..bb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |   2 +-
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch |  34 ----
 .../e2fsprogs/e2fsprogs/xattr_ordering.patch       | 219 ---------------------
 .../{e2fsprogs_git.bb => e2fsprogs_1.43..bb}       |   5 +-
 4 files changed, 2 insertions(+), 258 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_git.bb => e2fsprogs_1.43..bb} (94%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 09e4ea5..74e92f6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -9,7 +9,7 @@ LICENSE_e2fsprogs-mke2fs = "GPLv2"
 LICENSE_e2fsprogs-fsck = "GPLv2"
 LICENSE_e2fsprogs-tune2fs = "GPLv2"
 LICENSE_e2fsprogs-badblocks = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b48f21d765b875bd10400975d12c1ca2 \
+LIC_FILES_CHKSUM = "file://NOTICE;md5=b48f21d765b875bd10400975d12c1ca2 \
                       file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
                       file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
                       file://lib/uuid/uuid.h.in;beginline=1;endline=32;md5=dbb8079e114a5f841934b99e59c8820a \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
deleted file mode 100644
index 656fb6e..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0a392baf1874964651115d9f77b0daa6851d1daa Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Tue, 1 Mar 2016 14:28:01 +1100
-Subject: [PATCH] Revert "mke2fs: enable the metadata_csum and 64bit features
- by default"
-
-This reverts commit cd27af3ecb83e8fd1e3eaa14994284a1818c7c15 as we
-don't want to enable features by default that are not supported by
-the latest stable e2fsprogs release.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- misc/mke2fs.conf.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
-index a049d61..106ee80 100644
---- a/misc/mke2fs.conf.in
-+++ b/misc/mke2fs.conf.in
-@@ -11,7 +11,8 @@
- 		features = has_journal
- 	}
- 	ext4 = {
--		features = has_journal,extent,huge_file,flex_bg,metadata_csum,64bit,dir_nlink,extra_isize
-+		features = has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize
-+		auto_64-bit_support = 1
- 		inode_size = 256
- 	}
- 	ext4dev = {
--- 
-2.7.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
deleted file mode 100644
index 782a7b1..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From: "Darrick J. Wong" <darrick.wong@oracle.com>
-To: tytso@mit.edu, darrick.wong@oracle.com
-Cc: linux-ext4@vger.kernel.org, Darren Hart <dvhart@linux.intel.com>,
- Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sat, 13 Feb 2016 14:38:24 -0800
-Message-ID: <20160213223824.25381.8002.stgit@birch.djwong.org>
-In-Reply-To: <20160213223725.25381.20929.stgit@birch.djwong.org>
-References: <20160213223725.25381.20929.stgit@birch.djwong.org>
-User-Agent: StGit/0.17.1-dirty
-MIME-Version: 1.0
-Content-Type: text/plain; charset="utf-8"
-X-Source-IP: aserv0022.oracle.com [141.146.126.234]
-X-Evolution-Source: 1358860361.4566.33@ted
-Content-Transfer-Encoding: 8bit
-
-Richard Purdie reports that libext2fs doesn't sort attribute keys in
-the xattr block correctly, causing the kernel to return -ENODATA when
-querying attributes that should be there.  Therefore, sort attributes
-so that whatever ends up in the xattr block is sorted according to
-what the kernel expects.
-
-Cc: Darren Hart <dvhart@linux.intel.com>
-Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
----
- lib/ext2fs/ext_attr.c        |   24 +++++++++++-
- tests/d_xattr_sorting/expect |   29 ++++++++++++++
- tests/d_xattr_sorting/name   |    1 
- tests/d_xattr_sorting/script |   86 ++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 139 insertions(+), 1 deletion(-)
- create mode 100644 tests/d_xattr_sorting/expect
- create mode 100644 tests/d_xattr_sorting/name
- create mode 100644 tests/d_xattr_sorting/script
-
-Upstream-Status: Submitted
-
-
-diff --git a/lib/ext2fs/ext_attr.c b/lib/ext2fs/ext_attr.c
-index 0a4f8c0..b121837 100644
---- a/lib/ext2fs/ext_attr.c
-+++ b/lib/ext2fs/ext_attr.c
-@@ -254,10 +254,15 @@ static struct ea_name_index ea_names[] = {
- 	{0, NULL},
- };
- 
-+static int find_ea_index(char *fullname, char **name, int *index);
-+
- /* Push empty attributes to the end and inlinedata to the front. */
- static int attr_compare(const void *a, const void *b)
- {
- 	const struct ext2_xattr *xa = a, *xb = b;
-+	char *xa_suffix, *xb_suffix;
-+	int xa_idx, xb_idx;
-+	int cmp;
- 
- 	if (xa->name == NULL)
- 		return +1;
-@@ -267,7 +272,24 @@ static int attr_compare(const void *a, const void *b)
- 		return -1;
- 	else if (!strcmp(xb->name, "system.data"))
- 		return +1;
--	return 0;
-+
-+	/*
-+	 * Duplicate the kernel's sorting algorithm because xattr blocks
-+	 * require sorted keys.
-+	 */
-+	xa_suffix = xa->name;
-+	xb_suffix = xb->name;
-+	xa_idx = xb_idx = 0;
-+	find_ea_index(xa->name, &xa_suffix, &xa_idx);
-+	find_ea_index(xb->name, &xb_suffix, &xb_idx);
-+	cmp = xa_idx - xb_idx;
-+	if (cmp)
-+		return cmp;
-+	cmp = strlen(xa_suffix) - strlen(xb_suffix);
-+	if (cmp)
-+		return cmp;
-+	cmp = strcmp(xa_suffix, xb_suffix);
-+	return cmp;
- }
- 
- static const char *find_ea_prefix(int index)
-diff --git a/tests/d_xattr_sorting/expect b/tests/d_xattr_sorting/expect
-new file mode 100644
-index 0000000..17da663
---- /dev/null
-+++ b/tests/d_xattr_sorting/expect
-@@ -0,0 +1,29 @@
-+debugfs sort extended attributes
-+mke2fs -Fq -b 1024 test.img 512
-+Exit status is 0
-+ea_set / security.SMEG64 -f /tmp/b
-+Exit status is 0
-+ea_set / security.imb -f /tmp/b
-+Exit status is 0
-+ea_set / user.moo cow
-+Exit status is 0
-+ea_list /
-+Extended attributes:
-+  user.moo = "cow" (3)
-+  security.imb = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" (256)
-+  security.SMEG64 = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" (256)
-+Exit status is 0
-+ea_get / security.imb
-+xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-+Exit status is 0
-+ea_get / nosuchea
-+ea_get: Extended attribute key not found while getting extended attribute
-+Exit status is 0
-+e2fsck -yf -N test_filesys
-+Pass 1: Checking inodes, blocks, and sizes
-+Pass 2: Checking directory structure
-+Pass 3: Checking directory connectivity
-+Pass 4: Checking reference counts
-+Pass 5: Checking group summary information
-+test_filesys: 11/64 files (0.0% non-contiguous), 29/512 blocks
-+Exit status is 0
-diff --git a/tests/d_xattr_sorting/name b/tests/d_xattr_sorting/name
-new file mode 100644
-index 0000000..dde8926
---- /dev/null
-+++ b/tests/d_xattr_sorting/name
-@@ -0,0 +1 @@
-+sort extended attributes in debugfs
-diff --git a/tests/d_xattr_sorting/script b/tests/d_xattr_sorting/script
-new file mode 100644
-index 0000000..30c189a
---- /dev/null
-+++ b/tests/d_xattr_sorting/script
-@@ -0,0 +1,86 @@
-+if test -x $DEBUGFS_EXE; then
-+
-+OUT=$test_name.log
-+EXP=$test_dir/expect
-+VERIFY_FSCK_OPT=-yf
-+
-+TEST_DATA=$test_name.tmp
-+VERIFY_DATA=$test_name.ver.tmp
-+
-+echo "debugfs sort extended attributes" > $OUT
-+
-+dd if=/dev/zero of=$TMPFILE bs=1k count=512 > /dev/null 2>&1
-+
-+echo "mke2fs -Fq -b 1024 test.img 512" >> $OUT
-+
-+$MKE2FS -Fq $TMPFILE 512 > /dev/null 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT
-+
-+perl -e 'print "x" x 256;' > /tmp/b
-+
-+echo "ea_set / security.SMEG64 -f /tmp/b" > $OUT.new
-+$DEBUGFS -w -R "ea_set / security.SMEG64 -f /tmp/b" $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+echo "ea_set / security.imb -f /tmp/b" > $OUT.new
-+$DEBUGFS -w -R "ea_set / security.imb -f /tmp/b" $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+echo "ea_set / user.moo cow" > $OUT.new
-+$DEBUGFS -w -R "ea_set / user.moo cow" $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+rm -rf /tmp/b
-+
-+echo "ea_list /" > $OUT.new
-+$DEBUGFS -w -R "ea_list /" $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+echo "ea_get / security.imb" > $OUT.new
-+$DEBUGFS -w -R "ea_get / security.imb" $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+echo "ea_get / nosuchea" > $OUT.new
-+$DEBUGFS -w -R "ea_get / nosuchea" $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+echo e2fsck $VERIFY_FSCK_OPT -N test_filesys > $OUT.new
-+$FSCK $VERIFY_FSCK_OPT -N test_filesys $TMPFILE >> $OUT.new 2>&1
-+status=$?
-+echo Exit status is $status >> $OUT.new
-+sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
-+
-+#
-+# Do the verification
-+#
-+
-+rm -f $TMPFILE $OUT.new
-+cmp -s $OUT $EXP
-+status=$?
-+
-+if [ "$status" = 0 ] ; then
-+	echo "$test_name: $test_description: ok"
-+	touch $test_name.ok
-+else
-+	echo "$test_name: $test_description: failed"
-+	diff $DIFF_OPTS $EXP $OUT > $test_name.failed
-+fi
-+
-+unset VERIFY_FSCK_OPT NATIVE_FSCK_OPT OUT EXP TEST_DATA VERIFY_DATA
-+
-+else #if test -x $DEBUGFS_EXE; then
-+	echo "$test_name: $test_description: skipped"
-+fi
-
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb
similarity index 94%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb
index 9cde8e4..e4695fb 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb
@@ -6,12 +6,9 @@ SRC_URI += "file://acinclude.m4 \
             file://run-ptest \
             file://ptest.patch \
             file://mkdir.patch \
-            file://xattr_ordering.patch \
-            file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
 "
 
-SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
-PV = "1.42.99+1.43+git${SRCPV}"
+SRCREV = "d6adf070b0e85f209c0d7f310188b134b5cb7180"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.8.0


