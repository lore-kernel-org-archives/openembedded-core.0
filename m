Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7A33F6007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 16:51:43 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Oct 2013 09:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1014,1371106800"; d="scan'208";a="301815862"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.107])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Oct 2013 09:51:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2013 09:51:00 -0700
Message-Id: <1380646260-15245-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] makedevs: Do not return error if the fifo exisits
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
X-List-Received-Date: Tue, 01 Oct 2013 16:51:44 -0000

This ensures that makedevs will not cause image creation failures
when it encounters a pipe (fifo) that exists from a previous image.
The other file/device creation code either ignore this error or check
for file type.

[YOCTO #5288]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 5d2c45b..7b0487f 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -274,7 +274,7 @@ static void add_new_file(char *name, char *path, unsigned long uid,
 static void add_new_fifo(char *name, char *path, unsigned long uid,
 				  unsigned long gid, unsigned long mode)
 {
-	if (mknod(path, mode, 0))
+	if (mknod(path, mode, 0) && errno != EEXIST)
 		error_msg_and_die("%s: file can not be created with mknod!", path);
 	chown(path, uid, gid);
 //	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
-- 
1.7.10.4


