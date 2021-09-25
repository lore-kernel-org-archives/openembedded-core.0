Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F22FC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 09:35:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.5156.1632562541926461470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PSeD9Tfv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id t28so21420511wra.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0VmygvONiptQ/HfJSokBOWLU4TVT/Bpwll00dJex59M=;
        b=PSeD9Tfvd9D2K67fQSMMRAKmZUvYSYJ0RpGfU5a3hw0iCv7aR7RKogVKKUEbnNFXxb
         gxKUPdPJDvS8khdHNlWR6QV885gi6F0H2m1Ev5AXOiO2MlmpUtGpIGqSGxUqwHJCi5cq
         S1WFNsDwB62GMR2DrO+1DIplnQ20ugm/wCqkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0VmygvONiptQ/HfJSokBOWLU4TVT/Bpwll00dJex59M=;
        b=tssC7lNki26f5ezz3n+zLDcpyxCJnJTzDYak/nQ+fkmM2iOTCewz24AzFN21vfxBK6
         1GD3dyuugmAqNeOZOoPRWRIPBZeFJUVIu0b3qsJOEiv/ZDZ1cW2ZXbQ6N7YivWRdkwTs
         6A5R1lCvt2FFH92GORl6FbXlCu/lh0f9ysCUOrXTkPuvaoUMiG30vZQu4bN3ExIasoFD
         m6LrFQ1jNxEVPUd1/oIP4r8483ILYBpu/SRFjdpuiBMDul55qrjX6Zu/rzX8Qu8x9TIG
         PpftMbolTu5MeO/a6io2C9noIIQYaQCzUK9q3+8ItWxZVJVnlABaGH2Q63o9iBzsuc/9
         GJfA==
X-Gm-Message-State: AOAM533X4m7P7sql2QxMG6Z7L5xef3ACWzOyntY/qx2Qs5x2B1bdUmwX
	XivCqwM5Z04IC+Fcdycf7NaPm8h8hiG2uaHG
X-Google-Smtp-Source: 
 ABdhPJwfMaMvM+JJe1MnPgYH8U+hycA1mBxyQSyFi2dY3t+TXbJ3EYFRkOfiM3CYFQKdugpXaP8SXw==
X-Received: by 2002:adf:9f45:: with SMTP id f5mr5161706wrg.170.1632562540312;
        Sat, 25 Sep 2021 02:35:40 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id
 i18sm10640925wrn.64.2021.09.25.02.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 02:35:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] pseudo_db: Flush DB if there is a shutdown request
Date: Sat, 25 Sep 2021 10:35:39 +0100
Message-Id: <20210925093539.1780545-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 09:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156343

We have some challenges in ensuring the pseudo database is flushed to disk
in things like docker containers since the processes can be killed with no
warning at container termination. Rightly or wrongly, we need to handle this
better.

There is no current way to flush the DB but there is a shutdoen request
mechanism. Whilst we can't force a shutdown from bitbake due to the multiple
connected clients and the existing 3s shutdown isn't enough, we can take the
hint to flush the DB at this time. Further writes are unlikely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 pseudo_db.c     | 2 +-
 pseudo_db.h     | 1 +
 pseudo_server.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/pseudo_db.c b/pseudo_db.c
index 6c48cc8..14bafcb 100644
--- a/pseudo_db.c
+++ b/pseudo_db.c
@@ -399,7 +399,7 @@ signed_ino(ino_t ino) {
 
 #ifdef USE_MEMORY_DB
 
-static void
+void
 pdb_backup() {
         sqlite3_backup *pBackup;
         /* no point in doing this if we don't have a database to back up,
diff --git a/pseudo_db.h b/pseudo_db.h
index 5a4aa59..9d01232 100644
--- a/pseudo_db.h
+++ b/pseudo_db.h
@@ -26,6 +26,7 @@ typedef struct {
 	char *program;
 } log_entry;
 
+extern void pdb_backup(void);
 extern int pdb_maybe_backup(void);
 extern int pdb_cancel_unlink_file(pseudo_msg_t *msg);
 extern int pdb_did_unlink_file(char *path, pseudo_msg_t *msg, int deleting);
diff --git a/pseudo_server.c b/pseudo_server.c
index 84cef05..815c76b 100644
--- a/pseudo_server.c
+++ b/pseudo_server.c
@@ -568,6 +568,7 @@ serve_client(int i) {
 				}
 				in->pathlen = (s - response_path) + 1;
 				/* exit quickly once clients go away, though */
+                               pdb_backup();
 				pseudo_server_timeout = 3;
 			} else {
 				in->type = PSEUDO_MSG_ACK;
-- 
2.32.0


