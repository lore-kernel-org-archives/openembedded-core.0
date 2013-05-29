Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 923FB6A626
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 14:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 62D3E19CFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZpwRASdOtYtm
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:20 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 1534F19CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:17 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id F149081D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id E480A371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E2A6A3405E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4TEuG1i028551
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4TEuGvn028550
	for openembedded-core@lists.openembedded.org;
	Wed, 29 May 2013 16:56:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 16:56:00 +0200
Message-Id: <6220a0500140035b9305da936d4c81206f16b05c.1369839249.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
Subject: [PATCH 4/4] makedevs: Avoid unnecessary timestamp calculation
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
X-List-Received-Date: Wed, 29 May 2013 14:56:20 -0000

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


