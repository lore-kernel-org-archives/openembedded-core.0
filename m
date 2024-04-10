Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04371C67861
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 00:49:55 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.155152.1712710189280949023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 17:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F0xMX1Ub;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so3878059a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 17:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712710188; x=1713314988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxOe420QUqTyc4NYARpfYVAETN61X+NZ5OMQGXIANs4=;
        b=F0xMX1UbpFFIW/71SOJywT5z6MZ9pDEP+rSHOM20RQSazud3d9+Ru1+5ujGcIFLQxw
         gbaeYr+E6oiVvCAvXS+vZLqAdJXkFpMyvdWcxzsz9KWuCgxtPDq4tvsmGflIb/j78c23
         BTy4uIr48ZPcWNfhCsNAQKp5CVKukBH1L9xlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712710188; x=1713314988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxOe420QUqTyc4NYARpfYVAETN61X+NZ5OMQGXIANs4=;
        b=JaA0U/SRxGpOcS7MwtpRKl38BcMTHWzlXi/9FCYh8HYjDqHtkL2i69C9bULYHAqUWf
         x4lePRxtK6UPhtmgNAY1gawnOvIvG0Kk5CaguMbODYnMLEqqXiYSSUVKNQluctYJYK8k
         nQPAnpQq/oERh+6KfuoM1/ge1xdc+HbMf9pRKUT110eX/U0TWhohmMOSTtxel4X7GXkr
         FgN+atGCNZol3Xh6X3wTOHyIL0sX6c5cu9TH/OsNXnK9dfEzLFuaHzqnzGbRp5+If50F
         z7pUlM7Q25BoIJj8O9SxNYWbtsPvTuhChH7Fsv6v2gnSwSedUb1ajqtUEuOj73ITQBQM
         DO2Q==
X-Gm-Message-State: AOJu0Yy4z1ESpz8A72Xc6w2wW7mahiQ5FIUsm1CJ+pS8Ekh8wfcMEBM4
	YbZByE1X19DyGp+cWEhvzTBhYDo6WMyIVXJAaib4obaeWLIE5TFWkLgjH+3/3M2dqvE3G5lJQUj
	f
X-Google-Smtp-Source: AGHT+IF2//MQCEs9rzZvmmi/oCdYO6oB1DZCqCdfvLFhEvvCpWtJu+9eO6s/VpIlIi2p63u+1GLQ4Q==
X-Received: by 2002:a17:90a:9cc:b0:2a4:acd3:6d59 with SMTP id 70-20020a17090a09cc00b002a4acd36d59mr1349801pjo.21.1712710187636;
        Tue, 09 Apr 2024 17:49:47 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:7f4d:7102:4333:734b:73cc])
        by smtp.gmail.com with ESMTPSA id nm21-20020a17090b19d500b002a2979a8651sm228144pjb.54.2024.04.09.17.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 17:49:47 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] xserver-xorg: Fix for CVE-2024-31080 and CVE-2024-31081
Date: Wed, 10 Apr 2024 06:19:31 +0530
Message-Id: <20240410004931.4964-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 00:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198074

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2024-31080.patch         | 49 +++++++++++++++++++
 .../xserver-xorg/CVE-2024-31081.patch         | 47 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 3 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch
new file mode 100644
index 0000000000..40296903cd
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch
new file mode 100644
index 0000000000..4380004700
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch
@@ -0,0 +1,47 @@
+From 3e77295f888c67fc7645db5d0c00926a29ffecee Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:56:27 -0700
+Subject: [PATCH] Xi: ProcXIPassiveGrabDevice needs to use unswapped length to
+ send reply
+
+CVE-2024-31081
+
+Fixes: d220d6907 ("Xi: add GrabButton and GrabKeysym code.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
+CVE: CVE-2024-31081
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xipassivegrab.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
+index c9ac2f8553..896233bec2 100644
+--- a/Xi/xipassivegrab.c
++++ b/Xi/xipassivegrab.c
+@@ -93,6 +93,7 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+     GrabParameters param;
+     void *tmp;
+     int mask_len;
++    uint32_t length;
+ 
+     REQUEST(xXIPassiveGrabDeviceReq);
+     REQUEST_FIXED_SIZE(xXIPassiveGrabDeviceReq,
+@@ -247,9 +248,11 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIPassiveGrabDevice swaps it */
++    length = rep.length;
+     WriteReplyToClient(client, sizeof(rep), &rep);
+     if (rep.num_modifiers)
+-        WriteToClient(client, rep.length * 4, modifiers_failed);
++        WriteToClient(client, length * 4, modifiers_failed);
+ 
+  out:
+     free(modifiers_failed);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index e62babd4cb..b9eed92103 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -16,6 +16,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-21886-2.patch \
            file://CVE-2024-0408.patch \
            file://CVE-2024-0409.patch \
+           file://CVE-2024-31080.patch \
+           file://CVE-2024-31081.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


