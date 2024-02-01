Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD335C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 19:37:52 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.4993.1706816268826206498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 11:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ixjtu6NG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so1036170b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706816268; x=1707421068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT52is2XaklXDYp+mMofBi8B17TnCkzhVodRK1f5OaM=;
        b=Ixjtu6NGhKsnUp5k1QNCW74uG7x1FwIl4CcMd5H82M0bLnaQpVhQJcRTthh+kGS5i9
         tSjXsqHymD68hykWnCiROL2pAnN1N2+QH0GVxoqInlGod+ofmOMPdYtHtuadSqqyQ5Ee
         YuPS89rd9ulIagkgN61Af3MWCdZ4ZQARYdS3THb1FnpQejMDycCWH6g4LbZ0ULTx9YR7
         ZOZRvy/8woui57Scqz3N0Qb9dV5VLFHU8vTb9kJ9/WILhNEc1hQS2zjezLv9PkE7n9hy
         k7CzMJom2tegHdspMrT5yoi06lULNT3R2t9WC/vq25jkj4fUFF2XOUGo0uoQXmlcXcPt
         4qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816268; x=1707421068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT52is2XaklXDYp+mMofBi8B17TnCkzhVodRK1f5OaM=;
        b=bwbHfC86kva23jtw1SJMOOvqfSSvaXDofds69PXblbxF0itDcN0VxjHL9KU0su85aL
         aYvIKfUOvOrwc3U10RAdxTBzvehTsZfFqlUOIgL+ODSRwi7dcUp5TqiasZggIYfrEnc7
         polbw7NO+tlOo2ytwv6XKUidilUQLh57rpZ7or3cNq7GEvKnWe7zIRKmzp2mCe7TRcm5
         tY/7XBxDzadHMlGT8+SAnDkPOT4+Vz8z4KJmR4F3si0qpaVT9jHfYU3+tTsjWSX7782n
         NQEXodWHjcSUpaBd/DTOV1Y6emRRe4zadEHAgO8+8UWNuw99eTnGZ4vOGNi+7TAJGmkU
         up5w==
X-Gm-Message-State: AOJu0Yw/TcCeteIsQsWRIG53Z+ULCyeAxl81/oTfKmmck/Gg9v96AwrZ
	I415wchApRQbZ7BkY1rAIjOeJRt+0H7aDWwJGjSHKyuEdh4/Zky6rXirbB2qOMProO8K+ro+smA
	4Ao4=
X-Google-Smtp-Source: AGHT+IEvVYE2qsfv0fO61qsWlR7wXZy3W1hJrlw4diTH7Gy29KrSrC2PFePFKM7cpAw5Kc+bW4G3YQ==
X-Received: by 2002:a05:6a00:6a04:b0:6de:3521:f046 with SMTP id hy4-20020a056a006a0400b006de3521f046mr5654947pfb.32.1706816267804;
        Thu, 01 Feb 2024 11:37:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e10-20020a056a001a8a00b006dbdbe7f71csm109717pfv.98.2024.02.01.11.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:37:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] xwayland: Fix CVE-2023-6377 CVE-2023-6478
Date: Thu,  1 Feb 2024 09:37:39 -1000
Message-Id: <89974b7fa33f3e9d3e3a4df7ad219898fe400d3a.1706815725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706815725.git.steve@sakoman.com>
References: <cover.1706815725.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 19:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194735

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2023-6377.patch     | 82 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2023-6478.patch     | 66 +++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 3 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-6377.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-6478.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6377.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6377.patch
new file mode 100644
index 0000000000..f650f495a3
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6377.patch
@@ -0,0 +1,82 @@
+CVE: CVE-2023-6377
+Upstream-Status: Backport [ https://gitlab.freedesktop.org/xorg/xserver/-/commit/19e9f199950aaa4b9b7696936d1b067475da999c ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 19e9f199950aaa4b9b7696936d1b067475da999c Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 0c1a93d319558fe3ab2d94f51d174b4f93810afd)
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
+index 7150734a58..20fef16923 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -2530,6 +2530,8 @@ RecalculateMasterButtons(DeviceIntPtr slave)
+ 
+     if (master->button && master->button->numButtons != maxbuttons) {
+         int i;
++        int last_num_buttons = master->button->numButtons;
++
+         DeviceChangedEvent event = {
+             .header = ET_Internal,
+             .type = ET_DeviceChanged,
+@@ -2540,6 +2542,14 @@ RecalculateMasterButtons(DeviceIntPtr slave)
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6478.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6478.patch
new file mode 100644
index 0000000000..23fbc0e9e2
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6478.patch
@@ -0,0 +1,66 @@
+CVE: CVE-2023-6478
+Upstream-Status: Backport [ https://gitlab.freedesktop.org/xorg/xserver/-/commit/aaf854fb25541380cc38a221c15f0e8372f48872 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From aaf854fb25541380cc38a221c15f0e8372f48872 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 14f480010a93ff962fef66a16412fafff81ad632)
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 94797be8e0..e6e17d7da5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2023-5367.patch \
+           file://CVE-2023-6377.patch \
+           file://CVE-2023-6478.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.34.1


