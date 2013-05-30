Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0046A428
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id CEC6619DC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T3-1nAew6IZi
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 7642119D94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5E16A1176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.localdomain (Postfix) with ESMTP id 5199FA0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 4EBFF3E06D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4UCIgFO017029
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4UCIgA4017028
	for openembedded-core@lists.openembedded.org;
	Thu, 30 May 2013 14:18:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:18:29 +0200
Message-Id: <2e7062acdcc5114d0b1dd9b90344b6ff85e6c4a8.1369916015.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
Subject: [PATCH v3 1/5] makedevs: Create blocks of devices with the correct uid/gid
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
X-List-Received-Date: Thu, 30 May 2013 12:18:45 -0000

When creating a block of devices (i.e., when count > 0), the wrong
path was used with the call to chown(), effectively trying to change
the owner of some (probably) non-existent file. Thus the created
device nodes were always owned by root.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index c7ad722..247d6c1 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -130,7 +130,7 @@ static void add_new_device(char *name, char *path, unsigned long uid,
 		timestamp = sb.st_mtime;
 	}
 
-	mknod(name, mode, rdev);
+	mknod(path, mode, rdev);
 	chown(path, uid, gid);
 //	printf("Device: %s %s  UID: %ld  GID: %ld  MODE: %ld  MAJOR: %d  MINOR: %d\n",
 //			path, name, uid, gid, mode, (short)(rdev >> 8), (short)(rdev & 0xff));
@@ -198,7 +198,7 @@ static int interpret_table_entry(char *line)
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 	name = xstrdup(path + 1);
-	sprintf(path, "%s/%s\0", rootdir, name);
+	sprintf(path, "%s/%s", rootdir, name);
 
 	switch (type) {
 	case 'd':
@@ -223,6 +223,7 @@ static int interpret_table_entry(char *line)
 
 			for (i = start; i < count; i++) {
 				sprintf(buf, "%s%d", name, i);
+				sprintf(path, "%s/%s%d", rootdir, name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
 				 * major/minor representation...  */
 				rdev = MKDEV(major, minor + (i * increment - start));
-- 
1.8.2.1


