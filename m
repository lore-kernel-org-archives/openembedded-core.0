Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3B2C4725D
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:51:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.2908.1705546307906339534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fuSee7ya;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28d0052beb0so7230887a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705546307; x=1706151107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJ1/l2ZeBdlGnFqekGWsRtSgug96ipsDicv6WWiN9lk=;
        b=fuSee7yalFjKXQjar1jexGasTEeBbCzDElwxLNEuj2klOQZ4Jcuvx5JK911f4q0Q5i
         OmNFewesDxe8KGMiZKmwGNlEmcRb/isLFoA/GlYdQFfKsKm2fah2gd0iRj/7zH9Nnc7d
         8gibNYggoQKzIiFHv7UKWjvhchciyaDxdgavBdR53vNcxTi7Z9PbPI4VedXvKYIpHhdA
         OaDHBOC/nS8fYrVi7mqwcSMOVwZ2dzloVMl7a2/qx+JuEqoY2Eg9TSxrcFT9mG2SWr7I
         C70UXSwBPaIqGbeDtkwiNQr91odf4PVsgUrWbaXAewzyUY51drI6EDylP/ik+R1dJ595
         zzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705546307; x=1706151107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ1/l2ZeBdlGnFqekGWsRtSgug96ipsDicv6WWiN9lk=;
        b=IM8UorHhGdlvRhaCnp/NYv76OY1axz1s56wn31raK8iDca9yBHoW86gyQuJoK9G5rl
         BZAQ4C7DdrV2zaGuq+/7zkxnrT3fW0/eHHP6Z6k78KZrvSP1Pen77oG7R2MayizYy4S1
         C8kJq+9l5SdfVf+ijq2xbygJ0FmIdpuKX7inpq8P14ZS4B0kT+H6s/BpYGwpsMdgi6Qq
         eIBqbLoBo+DlFygZY7zrpxEKOc9VRp6iHAcoNvEHjpLCBmc6hclVjN0GJmp//eEI/sY+
         slGioUl0tgekorJowkAawzebLb7asmcGr8mbQcdFoHfnDf1Ns3MhpDegztkhXucC6CrD
         s56w==
X-Gm-Message-State: AOJu0Yz/I23phha43FN2E6L/wjq2zpCpjxS/PdIFE0s9wYKdcb8muZi/
	CfvS3h/jhT3IPHaXR7lfUXJ/nYaG66as+vWjFuzINcUOHBPKLjr8KfzJIFGlnrOXvta5L9ki2xB
	rz5s=
X-Google-Smtp-Source: AGHT+IEs01uI/NmNBD6JHsJoAiIDWaQKYu5Mh5tqoDEtghJPK0KsGRJ9IIlg0BEJXI0qg+1jqotKHA==
X-Received: by 2002:a17:90a:c203:b0:28e:8832:a3d4 with SMTP id e3-20020a17090ac20300b0028e8832a3d4mr143956pjt.72.1705546306932;
        Wed, 17 Jan 2024 18:51:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b0028dd956835bsm441844pjb.2.2024.01.17.18.51.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:51:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] xserver-xorg: Fix for CVE-2023-6377 and CVE-2023-6478
Date: Wed, 17 Jan 2024 16:51:34 -1000
Message-Id: <f5eff24d386215e5b5aee5c3261f5602b47c7f02.1705546122.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705546122.git.steve@sakoman.com>
References: <cover.1705546122.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193956

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


