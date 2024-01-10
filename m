Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7936BC4706C
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 03:09:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.4020.1704856150758036077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 19:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=f4BgugGF;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso1525671a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 19:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704856149; x=1705460949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUrsBOVtRgCZJ/ZpzXplWtI9Gei11npsijo1j8J9k24=;
        b=f4BgugGFxyTFCBf3EWwLXvb7aej2JYo37/kbvt9dri7Y42FoscUjEcxC6v02Uq7OB4
         bh/aLXKw9QweYwiLIS+nDVQ3fvTOst89HTIAZrA5LmyOcK9+kbRWl5LOv6BPZy2xUJD7
         PsikLB8ndCwfgUxSyG6x0e5JhXiK2XGMt46jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704856149; x=1705460949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUrsBOVtRgCZJ/ZpzXplWtI9Gei11npsijo1j8J9k24=;
        b=e6TSQcwDGOWaCNDpBmpsj0/h0Da0ix/5yGtyPgYQyjHv9YUaOU5aVnbkhL/yHaUCND
         hsd324DOfliWaTuB1pxq9AN3+Aw8wOctWBnnnxo0dCgZ5wqUNa3dePtQEN0pIR1IwlEL
         98Ogej1/EJcNPkukyiXayrOrxx8TZ4VebSva/PIhjeZBn5eKskJt9OV+Zj/EJidO2CsR
         WF4tSz+RXBuft+W9rk4fvVh/Lc32OZRF/JDHiWyciC3rqtfMfQ5+XT4yPSB7yeARcNBW
         JQltxC8KZkDFsEBvQb2VbIcDHkUAJJZU91++fpHWLaS0DAOeuqrFKN4YxA0HqbzYAMvJ
         DNIA==
X-Gm-Message-State: AOJu0YziKEBA7sFsRghKHrwXmtIQlJhVTZKkg33/Ys0NyMgum1ZlMzkQ
	9Y7bQEJFgL6wXeYRpot0eDZH2l3kiNfUPC1QLkPMAAwHw+s=
X-Google-Smtp-Source: AGHT+IHdbJ1tpS7sjZveozx6Wx1RwKZqGI/Y/RQGJY0ez4PF1pJukPJB8Qw4HjvsEWJLtNSrLxspSQ==
X-Received: by 2002:a05:6a20:9152:b0:19a:29c5:d57d with SMTP id x18-20020a056a20915200b0019a29c5d57dmr10209pzc.47.1704856148896;
        Tue, 09 Jan 2024 19:09:08 -0800 (PST)
Received: from MVIN00020.mvista.com ([182.65.243.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902d38900b001d49608e3dfsm2519509pld.50.2024.01.09.19.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 19:09:08 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] xserver-xorg: Fix for CVE-2023-6377 and CVE-2023-6478
Date: Wed, 10 Jan 2024 08:36:57 +0530
Message-Id: <20240110030657.6760-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 03:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193486

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2023-6377.patch          | 79 +++++++++++++++++++
 .../xserver-xorg/CVE-2023-6478.patch          | 63 +++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  2 +
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index eaff93bd09..4fdf3a0ec3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -18,6 +18,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2023-1393.patch \
            file://CVE-2023-5367.patch \
            file://CVE-2023-5380.patch \
+           file://CVE-2023-6377.patch \
+           file://CVE-2023-6478.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.25.1


