Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7856F6E680
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1AIQ38o025237 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:26:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SB84p_H7t-Nn
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:26:03 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1AIPxrx025233
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:26:00 GMT
Message-ID: <1455128759.16142.180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Feb 2016 18:25:59 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] e2fsprogs: Fix multiple xattr handling
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
X-List-Received-Date: Wed, 10 Feb 2016 18:26:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is an ordering issue when adding multiple xattr values to
an ext filesystem build using the -d option to mkfs. This patch 
fixes that issue. Its been posted for discussion with the upstream
community.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
new file mode 100644
index 0000000..a89b946
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
@@ -0,0 +1,66 @@
+[Message sent to linux-ext4 on 2016/2/7]
+
+I'm using the -d option of mke2fs to construct a filesystem, I'm seeing
+that some xattrs are being corrupted. The filesystem builds with no
+errors but when mounted by the kernel, I see errors like "security.ima:
+No such attribute". The strace from such a failure is:
+
+mmap(NULL, 26258, PROT_READ, MAP_SHARED, 3, 0) = 0x7fdb36a8c000
+close(3)                    = 0
+getrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=64*1024}) = 0
+lstat("mnt/foobar", {st_mode=S_IFREG|0755, st_size=1, ...}) = 0
+listxattr("mnt/foobar", NULL, 0) = 30
+listxattr("mnt/foobar", "security.SMACK64\0security.ima\0", 256) = 30
+getxattr("mnt/foobar", "security.SMACK64", 0x0, 0) = 1
+getxattr("mnt/foobar", "security.SMACK64", "_", 256) = 1
+fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 13), ...}) = 0
+mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fdb36a8b000
+write(1, "# file: mnt/foobar\n", 19# file: mnt/foobar) = 19
+write(1, "security.SMACK64=\"_\"\n", 21security.SMACK64="_") = 21
+getxattr("mnt/foobar", "security.ima", 0x0, 0) = -1 ENODATA (No data available)
+write(2, "mnt/foobar: ", 12mnt/foobar: ) = 12
+write(2, "security.ima: No such attribute\n", 32security.ima: No such attribute) = 32= 32
+
+so the attribute is there but the kernel gives ENODATA when trying
+to read it.
+
+http://www.nongnu.org/ext2-doc/ext2.html#CONTRIB-EXTENDED-ATTRIBUTES co
+ntains the small snippet that " The entry descriptors are sorted by
+attribute name, so that two extended attribute blocks can be compared
+efficiently. ". It doesn't specify what kind of sort.
+
+Looking at ext2fs, there is some sorting code through the qsort call
+using attr_compare() but it doesn't match what the kernel is doing in
+ext4_xattr_find_entry().
+
+This patch fixes the problem.
+
+Upstream-Status: Submitted
+RP
+2016/2/7
+
+Index: git/lib/ext2fs/ext_attr.c
+===================================================================
+--- git.orig/lib/ext2fs/ext_attr.c
++++ git/lib/ext2fs/ext_attr.c
+@@ -258,6 +258,7 @@ static struct ea_name_index ea_names[] =
+ static int attr_compare(const void *a, const void *b)
+ {
+ 	const struct ext2_xattr *xa = a, *xb = b;
++	size_t len;
+ 
+ 	if (xa->name == NULL)
+ 		return +1;
+@@ -267,7 +268,11 @@ static int attr_compare(const void *a, c
+ 		return -1;
+ 	else if (!strcmp(xb->name, "system.data"))
+ 		return +1;
+-	return 0;
++	len = strlen(xa->name) - strlen(xb->name);
++	if (len)
++		return len;
++
++	return strcmp(xa->name, xb->name);
+ }
+ 
+ static const char *find_ea_prefix(int index)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index 9ade1ff..d4a19f9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://acinclude.m4 \
             file://run-ptest \
             file://ptest.patch \
             file://mkdir.patch \
+            file://xattr_ordering.patch \
 "
 
 SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"



