Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82111CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:00:03 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71355.1778576397770164453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VFQjtpic;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-366375c43c2so3002949a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778576396; x=1779181196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpIb1V4D85/daexIVMETbfNMPjRmjR3lq0jaBZW1ho4=;
        b=VFQjtpicDkNwYerqJ8D0KCJQOpqpGZZugIWwYhPDGgSqL8RleqpveP5NNS//SpG/io
         KWyWl95Pa8BjxzqnMEGFeUObDsWCeigOhNesFXakEh8pgc8clPaeupRazi+tELEhxiiO
         V6GbIJcAhq3sI0sLT11mJEZlRwtS/+fvFYn5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576396; x=1779181196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpIb1V4D85/daexIVMETbfNMPjRmjR3lq0jaBZW1ho4=;
        b=FR2mQvdws5IdCY0zz0vvsiE1GvdTvsMOuWPt/dOZ14Ht+JPQMsaDTqDttW5eHSXkZw
         BA3MJVIIcsoRZ5kyLFFsLD41q2EDnU+a2l9YTWKpvepjRYo7KwbRt2V4V2GGJWJhwkrl
         W5RpJr683Na0NJqWv9bUdRviw6NzSsnQRfqrCVx39jU2UxunCNzDIT1DrB3SSizasfvS
         ESdCdvwTFD1a7c68c6Mqmxt5WRFKguKjtjvEqL5HVkG9LfF1VTpV5+jQ97qhJl2BJd9Z
         xB88IArytkFroOHuyXt5OaWSvzBulOXPIJL/wID5S9cZdWm+wdqK8Vzp/FgVE3IaGQO2
         OeLw==
X-Gm-Message-State: AOJu0Yx60cW8lPsGUF4hmKT10utyVIyEJppgm+5gLTcGbkKhhDJYq7zR
	WZt3QM0VUfacpS/eiUj/gwPEKd0HeyTIMJy4aJ819Naoa3xv5/qg4YKbf1NQhIvnQi7HiWASW3K
	oGgXP
X-Gm-Gg: Acq92OHDHUSO/3pkjyE4U1fAHloS2wBcXQ9GRh5i+Zm1//RYzI8l5fjPSsnBND/kwbw
	YO+cm1K+0wZJWxAqP4D2cEdLWcKnjOiEwX0Cfvqy0YGBz65PZheYbmxyWNnKPOjR6qHc4cGu7IS
	Qrcm7/zEEDAJSaob0tuC5v8CHTPdtZxMs9sikjwuRhGLiCAsNowXcS17W+ap5DcWBSJ+SEFBqCn
	hPIE8Khgc7WvWCZaBDl/4Gm4Ci3XKVSl3AcZMEFX0aJTXHgCl9rkwYU5xDZDTHbq1qAOJpnbU1x
	mNdLW26SESuQOac2/4vUR75RHM146mk57CbbXfRaIoaykWOL5UttGjCaF6QittbqxxfcS4ChvHg
	FmWzCvMJztjzx5tG+fSfLCFCsVSXxlkI8RA27jEl73R4aKJxJ5zq2M6rvkYX2x5GYI7uLPCKIlU
	mMVZ66kx3i9nw/7HL1Y0PEm2p50aI=
X-Received: by 2002:a17:90b:2fcf:b0:35f:bfdd:f5a1 with SMTP id 98e67ed59e1d1-3664ccca3d8mr16781445a91.13.1778576396437;
        Tue, 12 May 2026 01:59:56 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1cc4:80a8:e6ce:e2c9:e8fb:6a6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fcfasm13591380a91.2.2026.05.12.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:59:55 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 3/5] xserver-xorg: Fix CVE-2026-34001
Date: Tue, 12 May 2026 14:29:21 +0530
Message-ID: <20260512085923.820545-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512085923.820545-1-vanusuri@mvista.com>
References: <20260512085923.820545-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236865

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2026-34001.patch         | 104 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch
new file mode 100644
index 0000000000..a438f5ffcd
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch
@@ -0,0 +1,104 @@
+From f19ab94ba9c891d801231654267556dc7f32b5e0 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Feb 2026 16:23:23 +0100
+Subject: [PATCH] miext/sync: Fix use-after-free in miSyncTriggerFence()
+
+As reported by valgrind:
+
+  == Invalid read of size 8
+  ==    at 0x568C14: miSyncTriggerFence (misync.c:140)
+  ==    by 0x540688: ProcSyncTriggerFence (sync.c:1957)
+  ==    by 0x540CCC: ProcSyncDispatch (sync.c:2152)
+  ==    by 0x4A28C5: Dispatch (dispatch.c:553)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+  ==  Address 0x17e35488 is 8 bytes inside a block of size 16 free'd
+  ==    at 0x4843E43: free (vg_replace_malloc.c:990)
+  ==    by 0x53D683: SyncDeleteTriggerFromSyncObject (sync.c:169)
+  ==    by 0x53F14D: FreeAwait (sync.c:1208)
+  ==    by 0x4DFB06: doFreeResource (resource.c:888)
+  ==    by 0x4DFC59: FreeResource (resource.c:918)
+  ==    by 0x53E349: SyncAwaitTriggerFired (sync.c:701)
+  ==    by 0x568C52: miSyncTriggerFence (misync.c:142)
+  ==    by 0x540688: ProcSyncTriggerFence (sync.c:1957)
+  ==    by 0x540CCC: ProcSyncDispatch (sync.c:2152)
+  ==    by 0x4A28C5: Dispatch (dispatch.c:553)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+  ==  Block was alloc'd at
+  ==    at 0x4840B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x5E50E1: XNFalloc (utils.c:1129)
+  ==    by 0x53D772: SyncAddTriggerToSyncObject (sync.c:206)
+  ==    by 0x53DCA8: SyncInitTrigger (sync.c:414)
+  ==    by 0x5409C7: ProcSyncAwaitFence (sync.c:2089)
+  ==    by 0x540D04: ProcSyncDispatch (sync.c:2160)
+  ==    by 0x4A28C5: Dispatch (dispatch.c:553)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+
+When walking the list of fences to trigger, miSyncTriggerFence() may
+call TriggerFence() for the current trigger, which end up calling the
+function SyncAwaitTriggerFired().
+
+SyncAwaitTriggerFired() frees the entire await resource, which removes
+all triggers from that await - including pNext which may be another
+trigger from the same await attached to the same fence.
+
+On the next iteration, ptl = pNext points to freed memory...
+
+To avoid the issue, we need to restart the iteration from the beginning
+of the list each time a trigger fires, since the callback can modify the
+list.
+
+CVE-2026-34001, ZDI-CAN-28706
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with TrendAI Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/f19ab94ba9c891d801231654267556dc7f32b5e0]
+CVE: CVE-2026-34001
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ miext/sync/misync.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/miext/sync/misync.c b/miext/sync/misync.c
+index 0931803..e11eba2 100644
+--- a/miext/sync/misync.c
++++ b/miext/sync/misync.c
+@@ -131,16 +131,22 @@ miSyncDestroyFence(SyncFence * pFence)
+ void
+ miSyncTriggerFence(SyncFence * pFence)
+ {
+-    SyncTriggerList *ptl, *pNext;
++    SyncTriggerList *ptl;
++    Bool triggered;
+ 
+     pFence->funcs.SetTriggered(pFence);
+ 
+     /* run through triggers to see if any fired */
+-    for (ptl = pFence->sync.pTriglist; ptl; ptl = pNext) {
+-        pNext = ptl->next;
+-        if ((*ptl->pTrigger->CheckTrigger) (ptl->pTrigger, 0))
+-            (*ptl->pTrigger->TriggerFired) (ptl->pTrigger);
+-    }
++    do {
++	triggered = FALSE;
++	for (ptl = pFence->sync.pTriglist; ptl; ptl = ptl->next) {
++	    if ((*ptl->pTrigger->CheckTrigger) (ptl->pTrigger, 0)) {
++                (*ptl->pTrigger->TriggerFired) (ptl->pTrigger);
++		triggered = TRUE;
++		break;
++	    }
++        }
++    } while (triggered);
+ }
+ 
+ SyncScreenFuncsPtr
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 658a608b5e..dfed2c2437 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
             file://CVE-2026-33999.patch \
             file://CVE-2026-34000.patch \
+            file://CVE-2026-34001.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
-- 
2.43.0


