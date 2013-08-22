Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id A398861EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:13:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7MDDKef025135
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 09:13:21 -0400 (EDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 06:13:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 09:13:09 -0400
Message-ID: <2ee8dfb739c6ce3e08bdeb87875b6f054f23c005.1377175027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/6] e2fsprogs: the max length of debugfs argument is too short
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
X-List-Received-Date: Thu, 22 Aug 2013 13:13:23 -0000
Content-Type: text/plain

The max length of debugfs argument is 256 which is too short, the
arguments are two paths, the PATH_MAX is 4096 according to
/usr/include/linux/limits.h, so use BUFSIZ (which is 8192 on Linux
systems), that's also what the ss library uses.

This patch has been reviewed by the linux-ext4 mailing list, but isn't
merged atm.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs-1.42.8/debugfs-too-short.patch       |   41 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
new file mode 100644
index 0000000..607305b
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
@@ -0,0 +1,41 @@
+debugfs.c: the max length of debugfs argument is too short
+
+The max length of debugfs argument is 256 which is too short, the
+arguments are two paths, the PATH_MAX is 4096 according to
+/usr/include/linux/limits.h, so use BUFSIZ (which is 8192 on Linux
+systems), that's also what the ss library uses.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Acked-by: Darren Hart <dvhart@linux.intel.com>
+---
+ debugfs/debugfs.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -37,6 +37,10 @@ extern char *optarg;
+ #include "../version.h"
+ #include "jfs_user.h"
+ 
++#ifndef BUFSIZ
++#define BUFSIZ 8192
++#endif
++
+ ss_request_table *extra_cmds;
+ const char *debug_prog_name;
+ int sci_idx;
+@@ -2311,7 +2315,7 @@ void do_dump_mmp(int argc EXT2FS_ATTR((unused)), char *argv[])
+ static int source_file(const char *cmd_file, int ss_idx)
+ {
+ 	FILE		*f;
+-	char		buf[256];
++	char		buf[BUFSIZ];
+ 	char		*cp;
+ 	int		exit_status = 0;
+ 	int		retval;
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index d231268..f97de7f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -3,6 +3,7 @@ require e2fsprogs.inc
 
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
+            file://debugfs-too-short.patch \
 "
 
 SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-- 
1.7.10.4


