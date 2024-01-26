Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1704AC47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 03:14:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web11.7284.1706238894951339775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 19:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mMJWIRxw;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706238897; x=1737774897;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Jsu95DsfDb5pAWoLgQE5y7g6wv3x9mciuEFiq726tv0=;
  b=mMJWIRxwpW1nLazQkRg3CPSnrv20LOXKEDTy8+Yf8SqAZOqrtMT8hjaA
   UP8JyaG8CO+IsAdP1Wao4YxwvGg7roR3+L6u5SjSXRiLHVdiCy6se615W
   0vF/Aw77+FatqlwZbSqU2VhGfhV6sDjk3gXesUAcFwZZDiLJH4hF14qeN
   VAt3Y3gV8sge+/1fnmKJ1u33gNnEXRuvS0hKkHkGSSM14QMrm1rxb74Hp
   SWizvHCBqd0hlrEnRnIsvARB0lo8W/4O7J3of/iGblyWWs92jkgzhVUxr
   yANQgvaHw3t9Jyz+y5vF6wLx6zqYmYdv9H55iz5TYwGXXC0rIy5p4KtkE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2266480"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2266480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 19:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736553029"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736553029"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 19:14:55 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][patch 3/3] xwayland: Fix CVE-2023-6377 CVE-2023-6478
Date: Fri, 26 Jan 2024 10:46:12 +0800
Message-Id: <20240126024612.358182-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240126024612.358182-1-chee.yang.lee@intel.com>
References: <20240126024612.358182-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 03:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194343

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.37.3


