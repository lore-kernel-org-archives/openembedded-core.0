Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DBDC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:00:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.15560.1674050450761675063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XMdxjwCV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id g10so24738491wmo.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tuoyrVcdxKG2Z0VAjCo+eImCbiQyq3WuFM3cNR0xdg=;
        b=XMdxjwCVD/KCCNiyM15eIZvacOsQW1RoKcwb4X+UxyAYrhTuxFt4vjlZ8qCENbTxbQ
         gbUsEdyhEixpcgzBCnZKuATQfrzulN6+s0a7g7Ng7E6ogNoGFbt52FeXBdOusgOataEL
         3EkRamcz+4Jlpypr0mwWYbsxpFh0YGG9INH1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tuoyrVcdxKG2Z0VAjCo+eImCbiQyq3WuFM3cNR0xdg=;
        b=xA6Kbr6Lb6MoUNLpuju31ylayQUgChImaPbwQ7eMo9CfVDqTEdNjewfImfqhOxJuBi
         uOWBT9k8+U3LQY+2bTROcOnRuaCCtLu9SYdHo3MMaVAW3fOa7HKn4/0qpOoQ7OlEZ2co
         GYCfIVEhFMgyCZN8gRW/z7DuUbZTtIf5BvSrwg+JzhhQPJ8EfxYyAast5gO6qGiOc8nw
         iwSmksCzuoUfPxJbnxdxn5maweSnfI4FW9Exc1rymOQiYfk1xieXVUEx61dsZJZkgoBR
         uGeXJQjCRzeDmRQGZCak4AtNZl4nAu89AJdVkUaWvSDVcV9HUAoJ8dHIovOBlZYl8jPc
         vjQQ==
X-Gm-Message-State: AFqh2kpmVfP5J8ikNMPoojfl66WdkgEK5Tq0t4DSMkPBCu66VUK5AFfE
	lI5V26TOQ6bKvScCd3pIaniENZgqXTEBk3eT
X-Google-Smtp-Source: AMrXdXtrt7COHbsDwgSKJ2LiBsyaPlsTyZvZV4x0jLEUr8ps6ztSUPh3ljsw886pG+69XjbQ8uFGUw==
X-Received: by 2002:a05:600c:4f12:b0:3d0:7415:c5a9 with SMTP id l18-20020a05600c4f1200b003d07415c5a9mr2796443wmq.21.1674050448655;
        Wed, 18 Jan 2023 06:00:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003d35acb0fd7sm2103465wmo.34.2023.01.18.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:00:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] pseudo.c: Avoid patch mismatch errors for NAMELESS file entries
Date: Wed, 18 Jan 2023 14:00:47 +0000
Message-Id: <20230118140047.1924765-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176096

In rare cases we see failures, often in linux-libc-headers for things like:

|   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
| abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.

Pseudo log:
path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linux-libc-headers/6.1-r0/image/usr'.
Setup complete, sending SIGUSR1 to pid 3630890.

Whilst this doesn't easily reproduce, the issue is that multiple different processes are
likely working on the directory and the creation in pseudo might not match accesses
made by other processes.

Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile things
so rather than error out, we should ignore this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 pseudo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pseudo.c b/pseudo.c
index 528fe1b..4f36786 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -682,7 +682,8 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
 				}
 				break;
 			default:
-				if (strcmp(msg->path, path_by_ino)) {
+				/* Ignore NAMELESS FILE entries since those could be created by other threads on new files */
+				if (strcmp(msg->path, path_by_ino) && !strcmp(path_by_ino, "NAMELESS FILE")) {
 					mismatch = 1;
 				}
 				break;
-- 
2.37.2


