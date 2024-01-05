Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2409DC47074
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 02:51:23 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.15693.1704423074454351442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 18:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aqanvvbf;
 spf=pass (domain: mvista.com, ip: 209.85.167.170, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bbd1f9e0b8so856494b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704423073; x=1705027873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iO+5EP6PdP6AcxrbkAFaCLvn7XUPMgQAxG9CFpSnB3s=;
        b=aqanvvbfpdhq/Oj6jJaTLoxUyvhwLaGtSn9uHkfJI2NYeSNxmlBTJ0T7l1plrbnY7W
         uXpnzBOMCT2nt6oObVNpNo4rRlNh0D5jyCd4ujDUFdaD0/rwia51G7aAFZq3r3RJoaBl
         bUl5Q46n3C9g2Y0rs31sUpMAA1X3D9us9O/fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704423073; x=1705027873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iO+5EP6PdP6AcxrbkAFaCLvn7XUPMgQAxG9CFpSnB3s=;
        b=kyvBGKAV8ijwPZMasvM3aPhLe3GgGspF8FYoR+rMHo8wvFVAFsAuOVFypTnxWn2rWT
         VjeV4J7bY30XO3AJmBTqVIMTc4JAKhmyV9UrCs4AfwCnIZB1YskaCONQjrH8Ju1W33nN
         aOX+cZUEKb6BqEpcegtyEALVW9yQVuTjROqHC1hTkwGpDfFwX13+ZxBbVSz7aOoCYITc
         FgqE60IjD0Q9CA4l+1G6LSdYEynb5K/nOOkV4U/JD+DEeq81MebsqWgt9Z+12vXNsndt
         4TjgiY5YD1ZpVP/JrIutZzTcgEmytxo7MZV5ldY1dt26v6HNjwUdoAfuAXt5afspLK7L
         H19A==
X-Gm-Message-State: AOJu0YzPc9aJjfGvUxENaIFM/npYPus3cicMmnZEhNeh7201GoDmuysS
	m2+VA6NvBTxyXVLE9YCUx17rauv4NwSKE1ot4bYwydtd0QI=
X-Google-Smtp-Source: AGHT+IEwXtC6AwLCcmoufkWtfWEwI52KT0A0OaL0z0+/4+stVCUeujLeDufr68G6DvWluYkdJXsFoA==
X-Received: by 2002:a05:6808:1482:b0:3bc:316b:e5a8 with SMTP id e2-20020a056808148200b003bc316be5a8mr1404179oiw.54.1704423072819;
        Thu, 04 Jan 2024 18:51:12 -0800 (PST)
Received: from MVIN00020.mvista.com ([122.174.156.249])
        by smtp.gmail.com with ESMTPSA id w9-20020a056a0014c900b006d9bb4400f0sm341515pfu.88.2024.01.04.18.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 18:51:12 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] xserver-xorg: Fix for CVE-2023-6377 and CVE-2023-6478
Date: Fri,  5 Jan 2024 08:19:01 +0530
Message-Id: <20240105024901.5990-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 02:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193339

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2023-6377.patch          | 79 +++++++++++++++++++
 .../xserver-xorg/CVE-2023-6478.patch          | 63 +++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 3 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6478.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6377.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6377.patch
new file mode 100644
index 0000000000..0abd5914fa
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6377.patch
@@ -0,0 +1,79 @@
+From 0c1a93d319558fe3ab2d94f51d174b4f93810afd Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 28 Nov 2023 15:19:04 +1000
+Subject: [PATCH] Xi: allocate enough XkbActions for our buttons
+
+button->xkb_acts is supposed to be an array sufficiently large for all
+our buttons, not just a single XkbActions struct. Allocating
+insufficient memory here means when we memcpy() later in
+XkbSetDeviceInfo we write into memory that wasn't ours to begin with,
+leading to the usual security ooopsiedaisies.
+
+CVE-2023-6377, ZDI-CAN-22412, ZDI-CAN-22413
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd]
+CVE: CVE-2023-6377
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/exevents.c | 12 ++++++------
+ dix/devices.c | 10 ++++++++++
+ 2 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/Xi/exevents.c b/Xi/exevents.c
+index dcd4efb3bc..54ea11a938 100644
+--- a/Xi/exevents.c
++++ b/Xi/exevents.c
+@@ -611,13 +611,13 @@ DeepCopyPointerClasses(DeviceIntPtr from, DeviceIntPtr to)
+         }
+ 
+         if (from->button->xkb_acts) {
+-            if (!to->button->xkb_acts) {
+-                to->button->xkb_acts = calloc(1, sizeof(XkbAction));
+-                if (!to->button->xkb_acts)
+-                    FatalError("[Xi] not enough memory for xkb_acts.\n");
+-            }
++            size_t maxbuttons = max(to->button->numButtons, from->button->numButtons);
++            to->button->xkb_acts = xnfreallocarray(to->button->xkb_acts,
++                                                   maxbuttons,
++                                                   sizeof(XkbAction));
++            memset(to->button->xkb_acts, 0, maxbuttons * sizeof(XkbAction));
+             memcpy(to->button->xkb_acts, from->button->xkb_acts,
+-                   sizeof(XkbAction));
++                   from->button->numButtons * sizeof(XkbAction));
+         }
+         else {
+             free(to->button->xkb_acts);
+diff --git a/dix/devices.c b/dix/devices.c
+index b063128df0..3f3224d626 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -2539,6 +2539,8 @@ RecalculateMasterButtons(DeviceIntPtr slave)
+ 
+     if (master->button && master->button->numButtons != maxbuttons) {
+         int i;
++        int last_num_buttons = master->button->numButtons;
++
+         DeviceChangedEvent event = {
+             .header = ET_Internal,
+             .type = ET_DeviceChanged,
+@@ -2549,6 +2551,14 @@ RecalculateMasterButtons(DeviceIntPtr slave)
+         };
+ 
+         master->button->numButtons = maxbuttons;
++        if (last_num_buttons < maxbuttons) {
++            master->button->xkb_acts = xnfreallocarray(master->button->xkb_acts,
++                                                       maxbuttons,
++                                                       sizeof(XkbAction));
++            memset(&master->button->xkb_acts[last_num_buttons],
++                   0,
++                   (maxbuttons - last_num_buttons) * sizeof(XkbAction));
++        }
+ 
+         memcpy(&event.buttons.names, master->button->labels, maxbuttons *
+                sizeof(Atom));
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6478.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6478.patch
new file mode 100644
index 0000000000..6392eae3f8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6478.patch
@@ -0,0 +1,63 @@
+From 14f480010a93ff962fef66a16412fafff81ad632 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 27 Nov 2023 16:27:49 +1000
+Subject: [PATCH] randr: avoid integer truncation in length check of
+ ProcRRChange*Property
+
+Affected are ProcRRChangeProviderProperty and ProcRRChangeOutputProperty.
+See also xserver@8f454b79 where this same bug was fixed for the core
+protocol and XI.
+
+This fixes an OOB read and the resulting information disclosure.
+
+Length calculation for the request was clipped to a 32-bit integer. With
+the correct stuff->nUnits value the expected request size was
+truncated, passing the REQUEST_FIXED_SIZE check.
+
+The server then proceeded with reading at least stuff->num_items bytes
+(depending on stuff->format) from the request and stuffing whatever it
+finds into the property. In the process it would also allocate at least
+stuff->nUnits bytes, i.e. 4GB.
+
+CVE-2023-6478, ZDI-CAN-22561
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632]
+CVE: CVE-2023-6478
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ randr/rrproperty.c         | 2 +-
+ randr/rrproviderproperty.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/randr/rrproperty.c b/randr/rrproperty.c
+index 25469f57b2..c4fef8a1f6 100644
+--- a/randr/rrproperty.c
++++ b/randr/rrproperty.c
+@@ -530,7 +530,7 @@ ProcRRChangeOutputProperty(ClientPtr client)
+     char format, mode;
+     unsigned long len;
+     int sizeInBytes;
+-    int totalSize;
++    uint64_t totalSize;
+     int err;
+ 
+     REQUEST_AT_LEAST_SIZE(xRRChangeOutputPropertyReq);
+diff --git a/randr/rrproviderproperty.c b/randr/rrproviderproperty.c
+index b79c17f9bf..90c5a9a933 100644
+--- a/randr/rrproviderproperty.c
++++ b/randr/rrproviderproperty.c
+@@ -498,7 +498,7 @@ ProcRRChangeProviderProperty(ClientPtr client)
+     char format, mode;
+     unsigned long len;
+     int sizeInBytes;
+-    int totalSize;
++    uint64_t totalSize;
+     int err;
+ 
+     REQUEST_AT_LEAST_SIZE(xRRChangeProviderPropertyReq);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 63932b4e79..7738085e11 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -4,6 +4,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://CVE-2023-5367.patch \
            file://CVE-2023-5380.patch \
+           file://CVE-2023-6377.patch \
+           file://CVE-2023-6478.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


