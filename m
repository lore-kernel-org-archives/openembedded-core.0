Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DE72D7653B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EEYN7U021246 for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:34:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2jPepSJAdsUr
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:34:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EEYKAB021242
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:34:22 GMT
Message-ID: <1455460460.16142.406.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Feb 2016 14:34:20 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] e2fsprogs: Update to upstream version of a patch
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
X-List-Received-Date: Sun, 14 Feb 2016 14:34:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Switch to the upstream version of the xattr patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
index a89b9464..1199be6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
@@ -1,66 +1,219 @@
-[Message sent to linux-ext4 on 2016/2/7]
+From: "Darrick J. Wong" <darrick.wong@oracle.com>
+To: tytso@mit.edu, darrick.wong@oracle.com
+Cc: linux-ext4@vger.kernel.org, Darren Hart <dvhart@linux.intel.com>,
+ Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 13 Feb 2016 14:38:24 -0800
+Message-ID: <20160213223824.25381.8002.stgit@birch.djwong.org>
+In-Reply-To: <20160213223725.25381.20929.stgit@birch.djwong.org>
+References: <20160213223725.25381.20929.stgit@birch.djwong.org>
+User-Agent: StGit/0.17.1-dirty
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+X-Source-IP: aserv0022.oracle.com [141.146.126.234]
+X-Evolution-Source: 1358860361.4566.33@ted
+Content-Transfer-Encoding: 8bit
 
-I'm using the -d option of mke2fs to construct a filesystem, I'm seeing
-that some xattrs are being corrupted. The filesystem builds with no
-errors but when mounted by the kernel, I see errors like "security.ima:
-No such attribute". The strace from such a failure is:
-
-mmap(NULL, 26258, PROT_READ, MAP_SHARED, 3, 0) = 0x7fdb36a8c000
-close(3)                    = 0
-getrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=64*1024}) = 0
-lstat("mnt/foobar", {st_mode=S_IFREG|0755, st_size=1, ...}) = 0
-listxattr("mnt/foobar", NULL, 0) = 30
-listxattr("mnt/foobar", "security.SMACK64\0security.ima\0", 256) = 30
-getxattr("mnt/foobar", "security.SMACK64", 0x0, 0) = 1
-getxattr("mnt/foobar", "security.SMACK64", "_", 256) = 1
-fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 13), ...}) = 0
-mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fdb36a8b000
-write(1, "# file: mnt/foobar\n", 19# file: mnt/foobar) = 19
-write(1, "security.SMACK64=\"_\"\n", 21security.SMACK64="_") = 21
-getxattr("mnt/foobar", "security.ima", 0x0, 0) = -1 ENODATA (No data available)
-write(2, "mnt/foobar: ", 12mnt/foobar: ) = 12
-write(2, "security.ima: No such attribute\n", 32security.ima: No such attribute) = 32= 32
-
-so the attribute is there but the kernel gives ENODATA when trying
-to read it.
-
-http://www.nongnu.org/ext2-doc/ext2.html#CONTRIB-EXTENDED-ATTRIBUTES co
-ntains the small snippet that " The entry descriptors are sorted by
-attribute name, so that two extended attribute blocks can be compared
-efficiently. ". It doesn't specify what kind of sort.
-
-Looking at ext2fs, there is some sorting code through the qsort call
-using attr_compare() but it doesn't match what the kernel is doing in
-ext4_xattr_find_entry().
-
-This patch fixes the problem.
+Richard Purdie reports that libext2fs doesn't sort attribute keys in
+the xattr block correctly, causing the kernel to return -ENODATA when
+querying attributes that should be there.  Therefore, sort attributes
+so that whatever ends up in the xattr block is sorted according to
+what the kernel expects.
+
+Cc: Darren Hart <dvhart@linux.intel.com>
+Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
+---
+ lib/ext2fs/ext_attr.c        |   24 +++++++++++-
+ tests/d_xattr_sorting/expect |   29 ++++++++++++++
+ tests/d_xattr_sorting/name   |    1 
+ tests/d_xattr_sorting/script |   86 ++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 139 insertions(+), 1 deletion(-)
+ create mode 100644 tests/d_xattr_sorting/expect
+ create mode 100644 tests/d_xattr_sorting/name
+ create mode 100644 tests/d_xattr_sorting/script
 
 Upstream-Status: Submitted
-RP
-2016/2/7
 
-Index: git/lib/ext2fs/ext_attr.c
-===================================================================
---- git.orig/lib/ext2fs/ext_attr.c
-+++ git/lib/ext2fs/ext_attr.c
-@@ -258,6 +258,7 @@ static struct ea_name_index ea_names[] =
- static int attr_compare(const void *a, const void *b)
- {
- 	const struct ext2_xattr *xa = a, *xb = b;
-+	size_t len;
- 
- 	if (xa->name == NULL)
- 		return +1;
-@@ -267,7 +268,11 @@ static int attr_compare(const void *a, c
- 		return -1;
- 	else if (!strcmp(xb->name, "system.data"))
- 		return +1;
--	return 0;
-+	len = strlen(xa->name) - strlen(xb->name);
-+	if (len)
-+		return len;
-+
-+	return strcmp(xa->name, xb->name);
- }
- 
- static const char *find_ea_prefix(int index)
+
+diff --git a/lib/ext2fs/ext_attr.c b/lib/ext2fs/ext_attr.c
+index 0a4f8c0..b121837 100644
+--- a/lib/ext2fs/ext_attr.c
++++ b/lib/ext2fs/ext_attr.c
+@@ -254,10 +254,15 @@ static struct ea_name_index ea_names[] = {
+ 	{0, NULL},
+ };
+ 
++static int find_ea_index(char *fullname, char **name, int *index);
++
+ /* Push empty attributes to the end and inlinedata to the front. */
+ static int attr_compare(const void *a, const void *b)
+ {
+ 	const struct ext2_xattr *xa = a, *xb = b;
++	char *xa_suffix, *xb_suffix;
++	int xa_idx, xb_idx;
++	int cmp;
+ 
+ 	if (xa->name == NULL)
+ 		return +1;
+@@ -267,7 +272,24 @@ static int attr_compare(const void *a, const void *b)
+ 		return -1;
+ 	else if (!strcmp(xb->name, "system.data"))
+ 		return +1;
+-	return 0;
++
++	/*
++	 * Duplicate the kernel's sorting algorithm because xattr blocks
++	 * require sorted keys.
++	 */
++	xa_suffix = xa->name;
++	xb_suffix = xb->name;
++	xa_idx = xb_idx = 0;
++	find_ea_index(xa->name, &xa_suffix, &xa_idx);
++	find_ea_index(xb->name, &xb_suffix, &xb_idx);
++	cmp = xa_idx - xb_idx;
++	if (cmp)
++		return cmp;
++	cmp = strlen(xa_suffix) - strlen(xb_suffix);
++	if (cmp)
++		return cmp;
++	cmp = strcmp(xa_suffix, xb_suffix);
++	return cmp;
+ }
+ 
+ static const char *find_ea_prefix(int index)
+diff --git a/tests/d_xattr_sorting/expect b/tests/d_xattr_sorting/expect
+new file mode 100644
+index 0000000..17da663
+--- /dev/null
++++ b/tests/d_xattr_sorting/expect
+@@ -0,0 +1,29 @@
++debugfs sort extended attributes
++mke2fs -Fq -b 1024 test.img 512
++Exit status is 0
++ea_set / security.SMEG64 -f /tmp/b
++Exit status is 0
++ea_set / security.imb -f /tmp/b
++Exit status is 0
++ea_set / user.moo cow
++Exit status is 0
++ea_list /
++Extended attributes:
++  user.moo = "cow" (3)
++  security.imb = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" (256)
++  security.SMEG64 = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" (256)
++Exit status is 0
++ea_get / security.imb
++xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
++Exit status is 0
++ea_get / nosuchea
++ea_get: Extended attribute key not found while getting extended attribute
++Exit status is 0
++e2fsck -yf -N test_filesys
++Pass 1: Checking inodes, blocks, and sizes
++Pass 2: Checking directory structure
++Pass 3: Checking directory connectivity
++Pass 4: Checking reference counts
++Pass 5: Checking group summary information
++test_filesys: 11/64 files (0.0% non-contiguous), 29/512 blocks
++Exit status is 0
+diff --git a/tests/d_xattr_sorting/name b/tests/d_xattr_sorting/name
+new file mode 100644
+index 0000000..dde8926
+--- /dev/null
++++ b/tests/d_xattr_sorting/name
+@@ -0,0 +1 @@
++sort extended attributes in debugfs
+diff --git a/tests/d_xattr_sorting/script b/tests/d_xattr_sorting/script
+new file mode 100644
+index 0000000..30c189a
+--- /dev/null
++++ b/tests/d_xattr_sorting/script
+@@ -0,0 +1,86 @@
++if test -x $DEBUGFS_EXE; then
++
++OUT=$test_name.log
++EXP=$test_dir/expect
++VERIFY_FSCK_OPT=-yf
++
++TEST_DATA=$test_name.tmp
++VERIFY_DATA=$test_name.ver.tmp
++
++echo "debugfs sort extended attributes" > $OUT
++
++dd if=/dev/zero of=$TMPFILE bs=1k count=512 > /dev/null 2>&1
++
++echo "mke2fs -Fq -b 1024 test.img 512" >> $OUT
++
++$MKE2FS -Fq $TMPFILE 512 > /dev/null 2>&1
++status=$?
++echo Exit status is $status >> $OUT
++
++perl -e 'print "x" x 256;' > /tmp/b
++
++echo "ea_set / security.SMEG64 -f /tmp/b" > $OUT.new
++$DEBUGFS -w -R "ea_set / security.SMEG64 -f /tmp/b" $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++echo "ea_set / security.imb -f /tmp/b" > $OUT.new
++$DEBUGFS -w -R "ea_set / security.imb -f /tmp/b" $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++echo "ea_set / user.moo cow" > $OUT.new
++$DEBUGFS -w -R "ea_set / user.moo cow" $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++rm -rf /tmp/b
++
++echo "ea_list /" > $OUT.new
++$DEBUGFS -w -R "ea_list /" $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++echo "ea_get / security.imb" > $OUT.new
++$DEBUGFS -w -R "ea_get / security.imb" $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++echo "ea_get / nosuchea" > $OUT.new
++$DEBUGFS -w -R "ea_get / nosuchea" $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++echo e2fsck $VERIFY_FSCK_OPT -N test_filesys > $OUT.new
++$FSCK $VERIFY_FSCK_OPT -N test_filesys $TMPFILE >> $OUT.new 2>&1
++status=$?
++echo Exit status is $status >> $OUT.new
++sed -f $cmd_dir/filter.sed $OUT.new >> $OUT
++
++#
++# Do the verification
++#
++
++rm -f $TMPFILE $OUT.new
++cmp -s $OUT $EXP
++status=$?
++
++if [ "$status" = 0 ] ; then
++	echo "$test_name: $test_description: ok"
++	touch $test_name.ok
++else
++	echo "$test_name: $test_description: failed"
++	diff $DIFF_OPTS $EXP $OUT > $test_name.failed
++fi
++
++unset VERIFY_FSCK_OPT NATIVE_FSCK_OPT OUT EXP TEST_DATA VERIFY_DATA
++
++else #if test -x $DEBUGFS_EXE; then
++	echo "$test_name: $test_description: skipped"
++fi
+
+



