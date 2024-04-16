Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BF2C04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:21 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.19020.1713269231279512552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LBbvR81B;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso2655273b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269230; x=1713874030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIamnY1HZUDgc0MchzRLk48SgW464vgWII2+AONCgOw=;
        b=LBbvR81BvvOmBq2ZVNJpnbT/JAlq1d25V5xS2WYHPaNFItzFBEmZemdcZ9GRKD5Djk
         q6tUJILg5QJOZSV7Fxh2UNNAR/uYtCFap1datx3SVYyY8xGol4eTW+u6RzDLHB+6sqLs
         jo7Oi2sCg84czPiTkBLjk4FRMZ2zfbUWHymBjFfR38Kmrk7tvBRJ9BxZIdex4wjY8Yn0
         8I8VVzaxW/gV34cQUDtVjGfEHy9/ZMFnLTESR5hs/lP4yJGOXhTG3BMaT/pktsNMdIIv
         RJT5pcunU7RMxy/O1E3kNpwu1KLgmtJjPnoEw3BIuq89QYAS/6zDg51Ru3eq3WkdS9Zl
         moHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269230; x=1713874030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIamnY1HZUDgc0MchzRLk48SgW464vgWII2+AONCgOw=;
        b=L/wlIl/jpYyx3AQTlFumqfqOb5+ou5d9UIBdm34syDjZP8G/0QRLZVySGAJWRj+zJw
         bs4UBQBc65MvAuMP4m/SbMF7mi1OSdtb9leWFYaIudabjLqbgYVkqSKtFcFxXfYl0fhH
         q5OW6JB6/AyIijFgm+r1XzLoKbdPhWpmgS89yO0jQ4E7DwRmH/P9kzUd4F1E1EoeP6uW
         qOAftC1/kMvA/WjxPycwRkb3F7t+dyHoNLb37PCwu1/7I8kn8ZY+fU8xoNYWc9gewGhD
         WAVNt8ZzEiyJrpCcQIoUT7XKjJTPBX9W8aXPpYUd2C8npPHQ1uUjYbE0eJ7hxK/MZIif
         /h4A==
X-Gm-Message-State: AOJu0YzF4X6+X2/Q5OqaExzHpJlSZQxjYHv4o58cE8ZKUH95wbjDw3Y3
	4K3ec159GllyaFRZjFJNxWkN4XDIIuvKWaktaxP9CaJaY6WgG4ojxtkvclWxrsmgmhEamf+vVrn
	tZSU=
X-Google-Smtp-Source: AGHT+IFOCw0hm7SCyAKRR82EyxKBkjmw9KLp1tUVq3hdQc/5IXeSjqFLetGkPTEj+u0dwGv3pak5fQ==
X-Received: by 2002:a05:6a00:986:b0:6ed:1c7:8c6b with SMTP id u6-20020a056a00098600b006ed01c78c6bmr12360371pfg.1.1713269230373;
        Tue, 16 Apr 2024 05:07:10 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] xserver-xorg: Fix for CVE-2024-31080 and CVE-2024-31081
Date: Tue, 16 Apr 2024 05:06:51 -0700
Message-Id: <223950f9c748f89ee1b2a9df9cd77a0099e74581.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198441

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


