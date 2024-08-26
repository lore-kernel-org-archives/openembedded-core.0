Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5858FC5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 16:40:23 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.56728.1724690414005659866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 09:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 27 Aug 2024 01:40:13 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.227.48)
	by 156.147.1.125 with ESMTP; 27 Aug 2024 01:40:12 +0900
X-Original-SENDERIP: 10.177.227.48
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v2] makedevs: Fix matching uid/gid
Date: Tue, 27 Aug 2024 01:41:34 +0900
Message-ID: <20240826164135.2520863-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 16:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203758

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Correct the length to compare in convert2guid() to fix an issue where it
ends up with returning a wrong id that matches partially. Also fix the
length of usr_buf and grp_buf in interpret_table_entry() which are used
as arguments of convert2guid().

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index 2254b54891..411a669153 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -202,7 +202,7 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 		// Check for bad user/group name
 		node = search_list;
 		while (node != NULL) {
-			if (!strncmp(node->name, id_buf, strlen(id_buf))) {
+			if (!strncmp(node->name, id_buf, MAX_ID_LEN)) {
 				fprintf(stderr, "WARNING: Bad user/group name %s detected\n", id_buf);
 				break;
 			}
@@ -212,7 +212,7 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 	} else {
 		node = search_list;
 		while (node != NULL) {
-			if (!strncmp(node->name, id_buf, strlen(id_buf)))
+			if (!strncmp(node->name, id_buf, MAX_ID_LEN))
 				return node->id;
 			node = node->next;
 		}
@@ -362,13 +362,13 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 static int interpret_table_entry(char *line)
 {
 	char *name;
-	char usr_buf[MAX_ID_LEN];
-	char grp_buf[MAX_ID_LEN];
-	char path[4096], type;
+	char usr_buf[MAX_ID_LEN+1];
+	char grp_buf[MAX_ID_LEN+1];
+	char path[PATH_MAX], type;
 	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
 	unsigned long start = 0, increment = 1, count = 0;
 
-	if (0 > sscanf(line, "%4095s %c %lo %39s %39s %lu %lu %lu %lu %lu", path,
+	if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
 		    &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
 		    &increment, &count))
 	{
-- 
2.43.0


