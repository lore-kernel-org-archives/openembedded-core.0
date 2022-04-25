Return-Path: <cam@myfastmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72236C41535
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.30625.1650898195166807268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 07:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@myfastmail.com
 header.s=fm1 header.b=S9pQ8MhO;
 spf=pass (domain: myfastmail.com, ip: 64.147.123.19,
 mailfrom: cam@myfastmail.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id A37E63201FED;
	Mon, 25 Apr 2022 10:49:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 25 Apr 2022 10:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myfastmail.com;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1650898193; x=1650984593; bh=2tPedNtqgL
	c6fd6ALOk1npY/wSk6V4d1Ok6QwVKcS9o=; b=S9pQ8MhOwFoNRiQiYo5ZHdFn2s
	K3hKxv4B5rWZX4ZCdTsbFJRehDIXbBWSanX3w/HbUS5mOVIs3sKQNWVAq5aIRu45
	zdQC8BqF0JIgFSXXGmz89TABbHBt9STeUBQNI6DlEXc6aQ8ZNiwWAA+gEqGBTkTr
	upIrg014nyeJtXIk1A+aJa1c9ovVzUcTQZuomvzNMZ1pr7NgW9tFOTats9VH8FNo
	ws/Itiwq/ISfsUz7ojkpCpUinyDwW+BOSR/LnxFutCfO402yFIbnn4gONXNQAxjk
	g69cRoQEvPbGFgP7hMaAFepin0SdroCd3VEvXpihqfG4GRWF/9cLnFG9aPzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1650898193; x=1650984593; bh=2
	tPedNtqgLc6fd6ALOk1npY/wSk6V4d1Ok6QwVKcS9o=; b=rqpkWr0rKkBR33FAP
	Q4QkiBHGCVzvmHAsVOaA/45QBabCjorFAQJGFdPrZscLlHglHPMJLON3tIPLMKWq
	9a9UWAdXo5LlO/uhwOOCp0gVvNdnaL9bHUnBuGSLZCmwwbpzvFc4vuESGpyCaGIY
	a+jz9vVcVEtwVNp76hrSyw7xVFVbnJHMcSItnea00bWs92tX1g64VxiDs2BP8Ate
	XJbbhiM/xMLbxHR0JEyzpdt9iAxzRHe3o8mTJCgy9cc06enVTUSV2LE7SK+cCrwJ
	4qQLR+8BO0ymipMloN9IeO4dy7AqW2aKNQczzrN4Y26Y41VCL9MoGHVnGdC5ZAlM
	kIp8Q==
X-ME-Sender: <xms:ELVmYgPWg5XvpzhFZFiJQI0beDyRS_iTWc8B_Qb-r87ynhuHupQ6Bg>
    <xme:ELVmYm_tIki3KjzcEDCpRT2b3RFbaYL01kRzotJEHvUulAjI_HUsFwccNA5B64vQW
    XI_4epbzYFxSw>
X-ME-Received: 
 <xmr:ELVmYnQq5TOVqYb7QfASs8MiEnGV5UOE2n5ZyOaoSw8A2vpeeUiXw3SZjUpAAGZsTajIyUSKSZYgbR6ma0MVKeXFvqZbr-4rAhJo4WQ8dK-8jpgGyDA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddugdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepfdevrdcutehnugihucforghrthhinhdfuceotggrmhesmhihfhgr
    shhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedtvdeludfgledtueetlefghf
    dtudekhedvveekfeegjeffueehudeftedvvdejheenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegtrghmsehmhihfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:ELVmYou3ivwgqNQjkveCuzbga3H4XVyNdMfdTf5BqkAyj1z-at1Jkg>
    <xmx:ELVmYofMXiKwOtI9YkStk9s1-VlPmT92gJafr0yARtwIASoGPxqstA>
    <xmx:ELVmYs37eO0YV4DXZxtzDVRf6k360MrgSIYhKhs7-UnA_b7qx3vPCw>
    <xmx:EbVmYgmi-Vx4GFgO0_Hu2IU1rxIklq7xUo6sFOV5BDe0lYkDMvqG5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Apr 2022 10:49:52 -0400 (EDT)
From: "C. Andy Martin" <cam@myfastmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "C. Andy Martin" <cam@myfastmail.com>
Subject: [pseudo][PATCH] do not abort on hard link path mismatch
Date: Mon, 25 Apr 2022 10:49:24 -0400
Message-Id: <20220425144924.1033647-1-cam@myfastmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164824

For hard-links there are many potential races where the path may not
yet exist in the database but we find an inode match on the linked
file. For instance, if one sub-process performs the link and another
one soon after opens the link, it is a race as to which operation's
message is received first by the pseudo server. Therefore, do not
abort on hard links, instead go back to master-branch behavior
(verbose file debug) for such cases.

See commit 691a2304c8c29a3b7d5977908ef82aaf188f5ba0 for original
nerf of the path mismatch messages for hard links.
---
 pseudo.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/pseudo.c b/pseudo.c
index 528fe1b..cb03987 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -696,15 +696,31 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
 					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion.\n",
 						msg->path);
 				} else {
-					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
-						msg->nlink,
-						msg->nlink == 1 ? "" : "s",
-						(unsigned long long) msg_header.ino,
-						path_by_ino ? path_by_ino : "no path",
-						msg->path);
+					if (msg->nlink > 1) {
+						/* For hard-links there are many potential races
+						 * where the path may not yet exist in the
+						 * database but we find an inode match on the
+						 * linked file. */
+						int flags = PDBGF_FILE | PDBGF_VERBOSE;
+						pseudo_debug(flags, "path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
+							msg->nlink,
+							msg->nlink == 1 ? "" : "s",
+							(unsigned long long) msg_header.ino,
+							path_by_ino ? path_by_ino : "no path",
+							msg->path);
+					} else {
+						pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
+							msg->nlink,
+							msg->nlink == 1 ? "" : "s",
+							(unsigned long long) msg_header.ino,
+							path_by_ino ? path_by_ino : "no path",
+							msg->path);
+					}
 					found_ino = 0;
-					msg->result = RESULT_ABORT;
-					goto op_exit;
+					if (msg->nlink == 1) {
+						msg->result = RESULT_ABORT;
+						goto op_exit;
+					}
 				}
 			}
 		} else {
-- 
2.25.1


