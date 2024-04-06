Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67300C67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 19:04:30 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.44324.1712430269753509097
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 12:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ag3SMPNt;
 spf=pass (domain: mvista.com, ip: 209.85.215.169, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso2363430a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712430269; x=1713035069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoitzLDwRnmReAeBZ/lO9L0Lxvqx1v33bFSgMqfr5TE=;
        b=ag3SMPNtL7vCIlW8o/+BM8MgcXMV2i5WsXMWE8kENh/a0EJxZuZhUL5I6B0xydB18h
         L+TifbQJy8ACwqD9QLsI2iXf2Z/x7l5uYtBOW4aIdyxQj6PiZ0PfIdZxzybi+vWpkQw9
         Itzm2+eNqTA53CEFv6fNusjN01mLotwOeJroE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712430269; x=1713035069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoitzLDwRnmReAeBZ/lO9L0Lxvqx1v33bFSgMqfr5TE=;
        b=rlr/IaI7bh2f0ucKzAPsSeut8+XVIrvKNE//79iVa4FU757i6yPWTWOHQfseic3DDH
         irM3SRKdxfiHrjnJJ5A7cWkh6l6zWYuKqOVULHZ7mtvNixnKiWWSPhzl6yMRvG/aWmfL
         /g5MKyHxvPNN2Xo3KvPS98fQzpOmhdddOl9X9wHIz3aPYPfAz5K5KcwYm/B3OGCH2bWs
         E6mZshWsOjbaTYoxZ/gPzU5bRmq7qqoFC+VCEn38BbDHU78o1Zr4YidJIqtjTO8hUA2P
         +xWe88aP2dJfPmgW7ru9xQ/jF+z3nMUOBoW9Ogjo83pmgfvwSkXw38KBqddGvjXAIgV9
         UEyg==
X-Gm-Message-State: AOJu0YzfjSJ01y+12RN+YIDiHx//JewGPl1NAqz43LdKlmgMPzzKW171
	P1EoGWJoeOj0NSwv0uS1rPGkRYbTrd/As8YwQn3T2X529sXW20F8P3JRKdG6MnmG2NaQ7Tb5x7C
	H
X-Google-Smtp-Source: AGHT+IH+Dldv/QyIpLD07dc7V3IO6xxvViGrmsSrETns3xwrkt0gW5u7KvzHjY9J6sTm/GKuAAukNg==
X-Received: by 2002:a17:90a:55c6:b0:2a4:b66c:c951 with SMTP id o6-20020a17090a55c600b002a4b66cc951mr1172770pjm.24.1712430268765;
        Sat, 06 Apr 2024 12:04:28 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.10])
        by smtp.gmail.com with ESMTPSA id o8-20020a17090aac0800b002a2f055e52csm4284620pjq.34.2024.04.06.12.04.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Apr 2024 12:04:28 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Sun, 07 Apr 2024 00:32:11 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] xserver-xorg: Backport fix for CVE-2024-31080
Date: Sun,  7 Apr 2024 00:32:10 +0530
Message-Id: <20240406190210.3941-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 19:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197998

Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../xserver-xorg/CVE-2024-31080.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch
new file mode 100644
index 0000000000..da735efb2b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch
@@ -0,0 +1,49 @@
+From 96798fc1967491c80a4d0c8d9e0a80586cb2152b Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:51:45 -0700
+Subject: [PATCH] Xi: ProcXIGetSelectedEvents needs to use unswapped length to
+ send reply
+
+CVE-2024-31080
+
+Reported-by: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=69762
+Fixes: 53e821ab4 ("Xi: add request processing for XIGetSelectedEvents.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b]
+CVE: CVE-2024-31080
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ Xi/xiselectev.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xiselectev.c b/Xi/xiselectev.c
+index edcb8a0d36..ac14949871 100644
+--- a/Xi/xiselectev.c
++++ b/Xi/xiselectev.c
+@@ -349,6 +349,7 @@ ProcXIGetSelectedEvents(ClientPtr client)
+     InputClientsPtr others = NULL;
+     xXIEventMask *evmask = NULL;
+     DeviceIntPtr dev;
++    uint32_t length;
+ 
+     REQUEST(xXIGetSelectedEventsReq);
+     REQUEST_SIZE_MATCH(xXIGetSelectedEventsReq);
+@@ -418,10 +419,12 @@ ProcXIGetSelectedEvents(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIGetSelectedEvents swaps it */
++    length = reply.length;
+     WriteReplyToClient(client, sizeof(xXIGetSelectedEventsReply), &reply);
+ 
+     if (reply.num_masks)
+-        WriteToClient(client, reply.length * 4, buffer);
++        WriteToClient(client, length * 4, buffer);
+ 
+     free(buffer);
+     return Success;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index 9e8ad7b1e5..aacee8892c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-0408.patch \
            file://CVE-2024-0409.patch \
            file://CVE-2024-31081.patch \
+           file://CVE-2024-31080.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.24.4


