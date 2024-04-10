Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2F1CD129A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:11:18 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.166621.1712754673133306028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r9hKBOui;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed32341906so2687749b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712754672; x=1713359472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9M/P2ygmBnqnGmA6FQ8s0rATHo0Q0o+ba4RCmCKB1vw=;
        b=r9hKBOuijYxE9Av23MDVmj+YV1EcfgG0fcTKJxnRQNMUpNQelg7pG6+T5WRcKA8UJ9
         ALfazh60JMSmeaZySc2PRe/VLrQFfbHIccr6xFAxccq8wvASHyqz3I0T8DtA6/l6aeSY
         y+QwXLEl1pPwJv4wAcdmcPpvpv3sWtKnMaZu/STVuSjxR72XBoAk+BjRYGA3O/tVfzN8
         mYIEOnTsio4PJ9UO7EV8KnJlGNRkAItXwVDMZREEusJYhXNuFmId0lr7rDkXY+O9AwKM
         bBY2mcQs/xpsV7InyB4+iu1C8LfFSmScXFkWOX/M4kE3Z1e6dN0QZMYPsk/WpHmYyYS8
         52Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754672; x=1713359472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9M/P2ygmBnqnGmA6FQ8s0rATHo0Q0o+ba4RCmCKB1vw=;
        b=GrGE96qfQx4sqRa2RV2m6O9jtzsB+TfvLgxVr1qYKT5zoty1CxAQC3ebFt8yTOGnKL
         eBeog+SRKoXXLnQ0vkpx3OM001Frd2MVBIWSbf64EXoIcuvnH/LLz90wPxrSWlhFUf6K
         E2Migj9AwrOMrEDB3zz2MweqY3MiyagoVXch196oK1VvakzYZ93tN8WeGzfDZ2pLYWO0
         B3vJrcaUWtVOVgSVGsF9su7FKBUrCloID9V3VuALPj6rLud6/DF+BJXZeNMNUEqiaAXc
         jXyKrInEdTiY1KfknNX6ggrX/w0uYNzcvy8YKYXMnR8ItUeETyAr5qxPrh8aA0MYUWDL
         dBIw==
X-Gm-Message-State: AOJu0YwyQMFxcQq/WBSCI2bzNH+xHIZueIMh3ilm9/nuFQ94sImQS0i0
	5XdJft+TXdaFKhtqNBhF5YymZguCaEAK10MvVIXQ/LjyMRzg8MYO3xsdFBl1EzpINO6ULlfjgzE
	Lcfc=
X-Google-Smtp-Source: AGHT+IHZnr5uvtmrE3e9dBVKGErIhzCpJHyhz4+sh7+hcxFcPsYICS0NjkjIHcRiqk3Exvrw1yAPVg==
X-Received: by 2002:a05:6a20:431b:b0:1a7:68bf:6eba with SMTP id h27-20020a056a20431b00b001a768bf6ebamr2826262pzk.42.1712754672326;
        Wed, 10 Apr 2024 06:11:12 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm10054887pfd.177.2024.04.10.06.11.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:11:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] xserver-xorg: Backport fix for CVE-2024-31080
Date: Wed, 10 Apr 2024 06:10:57 -0700
Message-Id: <f950b5a09c6dd19bdd5a942ae34516338e723942.1712754495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712754495.git.steve@sakoman.com>
References: <cover.1712754495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198097

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index ade250542f..04a6e734ef 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-0408.patch \
            file://CVE-2024-0409.patch \
            file://CVE-2024-31081.patch \
+           file://CVE-2024-31080.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.34.1


