Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8C5C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 07:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web10.10366.1711612249907302998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 00:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YLLaj93B;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711612250; x=1743148250;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E2tN7bGBhA3st4Hu3S1b98xhAOYfuINCKJulTRGgwwg=;
  b=YLLaj93BWjq+M01cVNsOC9YU0Zyr0NmqcHf92+z70rfUtCm28Kx16e2o
   oq/THyY1o9b3r0nBRmdNR9EYrtNQD/Lk8hpUpMppSljf0LlhlvHILZYRJ
   8kbDJwi2se58zx4U8FM6tMBs4LN/8ruOeVjb0IAtSmHr3aW6Ons+v0Dmv
   nrS1mx0pBAPpeodXWAbwMsqqTGNNB+TX2bmB2RUx2t5c9WBZWaE0w0gYA
   cs+w5vCx4jEGi17MGYecoRN+JtAnTAYAkTuU7KtzGrpaCoAJGQvt4RsJ+
   S36N+URd2NSCkdw1qsDLiv2MzrVY94rib/5jjLvZ4pauePK3MxWVjfp+D
   w==;
X-CSE-ConnectionGUID: EQSa/q4dQLmNxPWbBstEQw==
X-CSE-MsgGUID: wYup0ugnQsSi759w+aq4Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18185087"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="18185087"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="47547202"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2024 00:50:49 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/3] xwayland: fix CVE-2023-6816 CVE-2024-0408/0409
Date: Thu, 28 Mar 2024 15:50:31 +0800
Message-Id: <20240328075033.3800753-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 07:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197570

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix CVE-2023-6816 CVE-2024-0408 CVE-2024-0409

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../xwayland/xwayland/CVE-2023-6816.patch     | 57 ++++++++++++++++
 .../xwayland/xwayland/CVE-2024-0408.patch     | 65 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2024-0409.patch     | 47 ++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  3 +
 4 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-6816.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0408.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0409.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6816.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6816.patch
new file mode 100644
index 0000000000..5c68bfb3c1
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-6816.patch
@@ -0,0 +1,57 @@
+CVE: CVE-2023-6816
+Upstream-Status: Backport [ https://gitlab.freedesktop.org/xorg/xserver/-/commit/b5cb27032d3e486ba84a491e1420e85171c4c0a3 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From b5cb27032d3e486ba84a491e1420e85171c4c0a3 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 14 Dec 2023 11:29:49 +1000
+Subject: [PATCH] dix: allocate enough space for logical button maps
+
+Both DeviceFocusEvent and the XIQueryPointer reply contain a bit for
+each logical button currently down. Since buttons can be arbitrarily mapped
+to anything up to 255 make sure we have enough bits for the maximum mapping.
+
+CVE-2023-6816, ZDI-CAN-22664, ZDI-CAN-22665
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+(cherry picked from commit 9e2ecb2af8302dedc49cb6a63ebe063c58a9e7e3)
+---
+ Xi/xiquerypointer.c | 3 +--
+ dix/enterleave.c    | 5 +++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xiquerypointer.c b/Xi/xiquerypointer.c
+index 5b77b1a444..2b05ac5f39 100644
+--- a/Xi/xiquerypointer.c
++++ b/Xi/xiquerypointer.c
+@@ -149,8 +149,7 @@ ProcXIQueryPointer(ClientPtr client)
+     if (pDev->button) {
+         int i;
+ 
+-        rep.buttons_len =
+-            bytes_to_int32(bits_to_bytes(pDev->button->numButtons));
++        rep.buttons_len = bytes_to_int32(bits_to_bytes(256)); /* button map up to 255 */
+         rep.length += rep.buttons_len;
+         buttons = calloc(rep.buttons_len, 4);
+         if (!buttons)
+diff --git a/dix/enterleave.c b/dix/enterleave.c
+index 867ec74363..ded8679d76 100644
+--- a/dix/enterleave.c
++++ b/dix/enterleave.c
+@@ -784,8 +784,9 @@ DeviceFocusEvent(DeviceIntPtr dev, int type, int mode, int detail,
+ 
+     mouse = IsFloating(dev) ? dev : GetMaster(dev, MASTER_POINTER);
+ 
+-    /* XI 2 event */
+-    btlen = (mouse->button) ? bits_to_bytes(mouse->button->numButtons) : 0;
++    /* XI 2 event contains the logical button map - maps are CARD8
++     * so we need 256 bits for the possibly maximum mapping */
++    btlen = (mouse->button) ? bits_to_bytes(256) : 0;
+     btlen = bytes_to_int32(btlen);
+     len = sizeof(xXIFocusInEvent) + btlen * 4;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0408.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0408.patch
new file mode 100644
index 0000000000..9063cd00b2
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0408.patch
@@ -0,0 +1,65 @@
+CVE: CVE-2024-0408
+Upstream-Status: Backport [ https://gitlab.freedesktop.org/xorg/xserver/-/commit/4093057b98bc5a178f130c9ba6b0b28385e24ae5 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 4093057b98bc5a178f130c9ba6b0b28385e24ae5 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 6 Dec 2023 12:09:41 +0100
+Subject: [PATCH] glx: Call XACE hooks on the GLX buffer
+
+The XSELINUX code will label resources at creation by checking the
+access mode. When the access mode is DixCreateAccess, it will call the
+function to label the new resource SELinuxLabelResource().
+
+However, GLX buffers do not go through the XACE hooks when created,
+hence leaving the resource actually unlabeled.
+
+When, later, the client tries to create another resource using that
+drawable (like a GC for example), the XSELINUX code would try to use
+the security ID of that object which has never been labeled, get a NULL
+pointer and crash when checking whether the requested permissions are
+granted for subject security ID.
+
+To avoid the issue, make sure to call the XACE hooks when creating the
+GLX buffers.
+
+Credit goes to Donn Seeley <donn@xmission.com> for providing the patch.
+
+CVE-2024-0408
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit e5e8586a12a3ec915673edffa10dc8fe5e15dac3)
+---
+ glx/glxcmds.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/glx/glxcmds.c b/glx/glxcmds.c
+index fc26a2e345..1e46d0c723 100644
+--- a/glx/glxcmds.c
++++ b/glx/glxcmds.c
+@@ -48,6 +48,7 @@
+ #include "indirect_util.h"
+ #include "protocol-versions.h"
+ #include "glxvndabi.h"
++#include "xace.h"
+ 
+ static char GLXServerVendorName[] = "SGI";
+ 
+@@ -1392,6 +1393,13 @@ DoCreatePbuffer(ClientPtr client, int screenNum, XID fbconfigId,
+     if (!pPixmap)
+         return BadAlloc;
+ 
++    err = XaceHook(XACE_RESOURCE_ACCESS, client, glxDrawableId, RT_PIXMAP,
++                   pPixmap, RT_NONE, NULL, DixCreateAccess);
++    if (err != Success) {
++        (*pGlxScreen->pScreen->DestroyPixmap) (pPixmap);
++        return err;
++    }
++
+     /* Assign the pixmap the same id as the pbuffer and add it as a
+      * resource so it and the DRI2 drawable will be reclaimed when the
+      * pbuffer is destroyed. */
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0409.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0409.patch
new file mode 100644
index 0000000000..de3396a410
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-0409.patch
@@ -0,0 +1,47 @@
+CVE: CVE-2024-0409
+Upstream-Status: Backport [ https://gitlab.freedesktop.org/xorg/xserver/-/commit/51be9e767a02cdc6a524dc895dcc81abb689d50b ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 51be9e767a02cdc6a524dc895dcc81abb689d50b Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 6 Dec 2023 11:51:56 +0100
+Subject: [PATCH] ephyr,xwayland: Use the proper private key for cursor
+
+The cursor in DIX is actually split in two parts, the cursor itself and
+the cursor bits, each with their own devPrivates.
+
+The cursor itself includes the cursor bits, meaning that the cursor bits
+devPrivates in within structure of the cursor.
+
+Both Xephyr and Xwayland were using the private key for the cursor bits
+to store the data for the cursor, and when using XSELINUX which comes
+with its own special devPrivates, the data stored in that cursor bits'
+devPrivates would interfere with the XSELINUX devPrivates data and the
+SELINUX security ID would point to some other unrelated data, causing a
+crash in the XSELINUX code when trying to (re)use the security ID.
+
+CVE-2024-0409
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 2ef0f1116c65d5cb06d7b6d83f8a1aea702c94f7)
+---
+ hw/xwayland/xwayland-cursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/xwayland/xwayland-cursor.c b/hw/xwayland/xwayland-cursor.c
+index e3c1aaa50c..bd94b0cfbb 100644
+--- a/hw/xwayland/xwayland-cursor.c
++++ b/hw/xwayland/xwayland-cursor.c
+@@ -431,7 +431,7 @@ static miPointerScreenFuncRec xwl_pointer_screen_funcs = {
+ Bool
+ xwl_screen_init_cursor(struct xwl_screen *xwl_screen)
+ {
+-    if (!dixRegisterPrivateKey(&xwl_cursor_private_key, PRIVATE_CURSOR_BITS, 0))
++    if (!dixRegisterPrivateKey(&xwl_cursor_private_key, PRIVATE_CURSOR, 0))
+         return FALSE;
+ 
+     return miPointerInitialize(xwl_screen->screen,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index e6e17d7da5..133c65fbc3 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -13,6 +13,9 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2023-5367.patch \
            file://CVE-2023-6377.patch \
            file://CVE-2023-6478.patch \
+           file://CVE-2023-6816.patch \
+           file://CVE-2024-0408.patch \
+           file://CVE-2024-0409.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.37.3


