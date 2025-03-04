Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6588C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:19:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.20484.1741090786891431246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ayCZFp/g;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2232b12cd36so74190795ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090786; x=1741695586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leeTsPRBqgZ85HlDKcrbr7L1Y45qFoi56D+mceQWhhg=;
        b=ayCZFp/gz7BTyaAEsK2/JKkmsl7SJu5MOE44L2uHhdB+nfXdsOKqZiQjY0XOGhl93h
         wXpghAW84la30cucsbY0Zo877i9cDs0MeOOibwNk2mVzhcqUqTLBNPzc0Hz34EHR/CIp
         0H4VX9yLjYNHKExp7mLe6WQh0pExv11rZqfJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090786; x=1741695586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leeTsPRBqgZ85HlDKcrbr7L1Y45qFoi56D+mceQWhhg=;
        b=C81kgYbkkXhUJiBxHznR7/SXB8KLbyLCS4Q7H4JNyd2xmoxZfhNiZPd+AVDGcTIuIU
         917+xs+Hj/I+djVWBMfDjdir0OhIXJL8Daiuf5cZPt6q41rIPzDwKzBKIx/PVv24UcWD
         rDLC6MgxeS8fD+wrD23/21Lteq7Yj0YuiFQBm3cYFu+4Rt5uBKsuL103w0PhLkTytEd7
         zxJfu7PlSvGGXLwI9pJiY6VJaI13jHqwnFqU3gIHK6CdQblBFJ/OSxZk911hkTvuxNJZ
         pEFYLfRvt6dNf2gd3zNhXiizkdjLk6zZI1G4Tj1d0k3ge10SvBtPIY3gV3aRe+FUvGwj
         OJ3g==
X-Gm-Message-State: AOJu0Ywn6fIdMKkAzGMIWElGknKiqLcq5W6k6VCgZwkLhxpg1ZkX/lB0
	LWyUGjQdIXaFDFGCj6QhZnzS9Os2k/s4bm681fyY+iQWjQuWn79Z1rODUNzbPqgWVa1OJTEJw8c
	sXkY=
X-Gm-Gg: ASbGncsYjkK9Af9VkS+vYswtcK1gxy83zQbpc2I3Qx3A1hLbrMYeDD2t8mgVk7ghAR9
	TZe1qnF2QnhOG6UwDvNGej2mdu5Jo1AwJImC4jvsNk9kKyniBJAz1IOdu+pu3r1rDXgF0cQOhbz
	8y3bDkQk/TFjXoXI/+Fu2ayReht5HjEzCYkN1wj68PFCbRmQGadrICUMb5yVk0nR+O7iJe4gcSD
	IPbL5mr4uwh1kJQgLK7utYqPK7zzhod9d9YN/6nRU2kYrNWcDrX9SSyHFVhBxAUV93K+6bYIjLl
	Ks4sgiAnYEvg//NCOgqWhNj1fAejB6aCsadFwjBIjJR5msZHwXwh8g==
X-Google-Smtp-Source: AGHT+IH21EyQm/SkolILpnd19UvUZFnB1G2He/GPHdjtga7VrpwNbYx09kah58ZWK6hWFe5cij74Bg==
X-Received: by 2002:a05:6a21:6e01:b0:1f3:401f:d76f with SMTP id adf61e73a8af0-1f3401fd974mr2657642637.22.1741090785898;
        Tue, 04 Mar 2025 04:19:45 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:19:45 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 03/14] xwayland: Fix CVE-2024-31080
Date: Tue,  4 Mar 2025 17:49:07 +0530
Message-Id: <20250304121918.147345-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212268

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2024-31080.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch
new file mode 100644
index 0000000000..40296903cd
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 1d4e699d94..78e849b305 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-21885.patch \
            file://CVE-2024-21886-1.patch \
            file://CVE-2024-21886-2.patch \
+           file://CVE-2024-31080.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


