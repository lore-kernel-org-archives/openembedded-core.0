Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE18C52D7C
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 02:54:07 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.89339.1723604040839741447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 19:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 14 Aug 2024 11:53:59 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.227.48)
	by 156.147.1.121 with ESMTP; 14 Aug 2024 11:53:59 +0900
X-Original-SENDERIP: 10.177.227.48
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] makedevs: Fix matching uid/gid
Date: Wed, 14 Aug 2024 11:55:07 +0900
Message-ID: <20240814025507.2284408-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 02:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203300

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Use strcmp over strncmp to exact-match uid or gids. Otherwise it may end
up with returning a wrong id that matches partially.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index 2254b54891..84b38d2b74 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -202,7 +202,7 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 		// Check for bad user/group name
 		node = search_list;
 		while (node != NULL) {
-			if (!strncmp(node->name, id_buf, strlen(id_buf))) {
+			if (!strcmp(node->name, id_buf)) {
 				fprintf(stderr, "WARNING: Bad user/group name %s detected\n", id_buf);
 				break;
 			}
@@ -212,7 +212,7 @@ static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
 	} else {
 		node = search_list;
 		while (node != NULL) {
-			if (!strncmp(node->name, id_buf, strlen(id_buf)))
+			if (!strcmp(node->name, id_buf))
 				return node->id;
 			node = node->next;
 		}
-- 
2.43.0


