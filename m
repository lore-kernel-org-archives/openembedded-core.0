Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 722A660825
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 342281204E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KtkYufksFBFO
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 95EE211FD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7F7A31198
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.localdomain (Postfix) with ESMTP id 741541194
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 6F4783E06E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4UCIgB0017041
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4UCIgSN017040
	for openembedded-core@lists.openembedded.org;
	Thu, 30 May 2013 14:18:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:18:32 +0200
Message-Id: <acbf7929f56933bca73123fcd77084c36c5b7a07.1369916015.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
Subject: [PATCH v3 4/5] makedevs: Avoid unnecessary timestamp calculation
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
X-List-Received-Date: Thu, 30 May 2013 12:18:42 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 4cfb1d5..4bb316b 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -116,7 +116,6 @@ static void add_new_device(char *name, char *path, unsigned long uid,
 {
 	int status;
 	struct stat sb;
-	time_t timestamp = time(NULL);
 
 	memset(&sb, 0, sizeof(struct stat));
 	status = lstat(path, &sb);
@@ -127,7 +126,6 @@ static void add_new_device(char *name, char *path, unsigned long uid,
 		 * better match the actual file or strange things will happen.... */
 		if ((mode & S_IFMT) != (sb.st_mode & S_IFMT))
 			error_msg_and_die("%s: file type does not match specified type!", path);
-		timestamp = sb.st_mtime;
 	}
 
 	mknod(path, mode, rdev);
-- 
1.8.2.1


