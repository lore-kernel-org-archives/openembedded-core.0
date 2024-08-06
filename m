Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D93C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 12:06:00 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.5668.1722945954901323017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 05:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 6 Aug 2024 21:05:52 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.227.48)
	by 156.147.1.121 with ESMTP; 6 Aug 2024 21:05:52 +0900
X-Original-SENDERIP: 10.177.227.48
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] makedevs: Fix issue when rootdir of / is given
Date: Tue,  6 Aug 2024 21:06:51 +0900
Message-ID: <20240806120651.1884611-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 12:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203016

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Treating rootdir "/" as "" leads an error in parse_devtable(). Preserve
it as it is given and use a separate variable for path name prepending.
Another minor fix is to add a return statement at the end of
convert2guid() to avoid an error with -Werror=return-type.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 .../makedevs/makedevs/makedevs.c              | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index df2e3cfad5..5c29bcf2f2 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -36,6 +36,7 @@ static const char *const app_name = "makedevs";
 static const char *const memory_exhausted = "memory exhausted";
 static char default_rootdir[]=".";
 static char *rootdir = default_rootdir;
+static char *rootdir_prepend = default_rootdir;
 static int trace = 0;
 
 struct name_id {
@@ -217,6 +218,9 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 		}
 		error_msg_and_die("No entry for %s in search list", id_buf);
 	}
+
+    // Unreachable, but avoid an error with -Werror=return-type
+    return 0;
 }
 
 static void free_list(struct name_id *list)
@@ -379,8 +383,8 @@ static int interpret_table_entry(char *line)
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 	name = xstrdup(path + 1);
-	/* prefix path with rootdir */
-	sprintf(path, "%s/%s", rootdir, name);
+	/* prefix path with rootdir_prepend */
+	sprintf(path, "%s/%s", rootdir_prepend, name);
 
 	/* XXX Why is name passed into all of the add_new_*() routines? */
 	switch (type) {
@@ -406,11 +410,11 @@ static int interpret_table_entry(char *line)
 
 			for (i = start; i < start + count; i++) {
 				sprintf(buf, "%s%d", name, i);
-				sprintf(path, "%s/%s%d", rootdir, name, i);
+				sprintf(path, "%s/%s%d", rootdir_prepend, name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel
 				 * major/minor representation...  */
 				rdev = MKDEV(major, minor + (i - start) * increment);
-				sprintf(path, "%s/%s\0", rootdir, buf);
+				sprintf(path, "%s/%s\0", rootdir_prepend, buf);
 				add_new_device(buf, path, uid, gid, mode, rdev);
 			}
 		} else {
@@ -541,12 +545,11 @@ int main(int argc, char **argv)
 			} else {
 				closedir(dir);
 			}
-			/* If "/" is specified, use "" because rootdir is always prepended to a
-			 * string that starts with "/" */
-			if (0 == strcmp(optarg, "/"))
-				rootdir = xstrdup("");
+			rootdir = xstrdup(optarg);
+			if (0 == strcmp(rootdir, "/"))
+				rootdir_prepend = xstrdup("");
 			else
-				rootdir = xstrdup(optarg);
+				rootdir_prepend = xstrdup(rootdir);
 			break;
 
 		case 't':
-- 
2.43.0


