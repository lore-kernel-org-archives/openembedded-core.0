Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 972FF60EA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 19:15:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 01 Oct 2013 12:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1015,1371106800"; d="scan'208";a="403813172"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.107])
	by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2013 12:15:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2013 12:15:45 -0700
Message-Id: <1380654945-17787-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] makedevs: Do not return error if the fifo exisits
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
X-List-Received-Date: Tue, 01 Oct 2013 19:15:52 -0000

This ensures that makedevs will not cause image creation failures
when it encounters a pipe (fifo) that exists from a previous image.
This handles mode changes and it will correctly fail for dangling
symlinks.

[YOCTO #5288]

Signed-off-by: Saul Wold <sgw@linux.intel.com>

makedev

Signed-off-by: Saul Wold <sgw@linux.intel.com>

makedev

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../makedevs/makedevs-1.0.0/makedevs.c                 |   16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 5d2c45b..53700c6 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -274,8 +274,20 @@ static void add_new_file(char *name, char *path, unsigned long uid,
 static void add_new_fifo(char *name, char *path, unsigned long uid,
 				  unsigned long gid, unsigned long mode)
 {
-	if (mknod(path, mode, 0))
-		error_msg_and_die("%s: file can not be created with mknod!", path);
+	int status;
+	struct stat sb;
+
+	memset(&sb, 0, sizeof(struct stat));
+	status = stat(path, &sb);
+
+
+	/* Update the mode if we exist and are a fifo already */
+	if (status >= 0 && S_ISFIFO(sb.st_mode)) {
+		chmod(path, mode);
+	} else {
+		if (mknod(path, mode, 0))
+			error_msg_and_die("%s: file can not be created with mknod!", path);
+	}
 	chown(path, uid, gid);
 //	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
 //			path, name, gid, uid, mode);
-- 
1.7.10.4


