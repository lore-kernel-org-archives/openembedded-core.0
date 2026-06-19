Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0068ECD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:08:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43192.1781878091038178494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 07:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hMT+qMas;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6be9cd89bso9843455ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781878090; x=1782482890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlbRddyTgdBzikdmpU+qMeSaTqlOdyxHsst8sCAkpqc=;
        b=hMT+qMasVe2CIRfJ64zsyBdQU++LQ3evTAF2bgb6ATN9nUj1ON655RGjK6R/ljooYO
         y8PsgpzPGpSR6FcUt48dvBCph+XZzAWx5ao+079owqJn2hMIabEhOPi4QMuWZtGQhIeF
         9Ix1JCqkEUcqoUGRMcsE6xfKAUtgnynTJECJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878090; x=1782482890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlbRddyTgdBzikdmpU+qMeSaTqlOdyxHsst8sCAkpqc=;
        b=rqXB29zsFF3XUr3xxdO9umxPtRT0X4akdxvf0hHBpnCzA77lRQVMbEGwqSV3nw7+4E
         Y6+vTw7fj3pVQJo4yAG2uRDKbdsqd5D62TUxM45QcaUZ3OPojTMakTXDDPTSJpLFfIBu
         2GT/MDOhO4pCxl+xKYjTsHq5FSrIC+WRZ6fWYjeeAu17OQbUk1ZT5QxiOH5iwtDFwGc7
         ELQPHJRyiWyVCXjK5Hd7JxYRHXYRU8oca0hzU/QDzeLyctY4BHTg9tIZoPVfG1EY5AcM
         I+lgp8MMjm01GgVGqzoAIfmArXczLrD8kk9dRZDOTKpO2QMfiDrqmlJfbbOkzncxf7We
         NDEQ==
X-Gm-Message-State: AOJu0YyXlzSPgl7DtSRmqwUFe0wsU01xzQ0VwOqa4kaWaW1h8O+sEVqw
	ctbAyoQaVkErxF1OLiTJgBA6e0uxRqKIHLjP4nNdqMTlgj3f+uULnhmkluBk+Rapd4nbCH/eZwu
	9tnbAMgE=
X-Gm-Gg: AfdE7clrm91H8BrTs344Xpp46nDsIJ9OqSvdUwdCcuDQQDILVt2MUnqmeJjSYTWkmlN
	MdUpaCW0qImeOgyt3jRvsZBwzBORujQ5Dlj5RnoTQNkdfNHbR1P44urvolroWu0gLtyUmP8VgXt
	ZLT+3MEwfwGCBfbOKBkB6iHjFUJe8y5bL6f0B/N7Lz3tLoD+5igZdjZy9ldwfHn2C5WzkbR+J9s
	2HGWuUh5DJeKyMAfSupD1uq1w950IWR75BApWpdgXcAKvNjUFDNdP2qB6mAS3cjV9c8EUn5IsWn
	jg83Q5BnioD8/DwAf+8uDlPNEBbiT5iNaFFHbTy49luXZEEM96cThiyhpwCZagsZxC0ZqJ3sLpU
	VBGKYvdGhqx+aq1gQiNNWlbYeDjrqhZVo5zwPJM3lpx3CYMjvEKPVgaxWWkMIWypatlkaiqKADi
	GV+nz65vUJuLj8OUd3ViEEkm0ClGoE
X-Received: by 2002:a17:902:ea01:b0:2c0:a9b3:bdc6 with SMTP id d9443c01a7336-2c718f65036mr42716865ad.30.1781878090409;
        Fri, 19 Jun 2026 07:08:10 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:42a9:d9f6:7cbc:746a:c8a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209e1c7esm25591835ad.57.2026.06.19.07.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:08:09 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 3/5] xwayland: Fix CVE-2026-34001
Date: Fri, 19 Jun 2026 19:37:48 +0530
Message-ID: <20260619140750.914225-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619140750.914225-1-vanusuri@mvista.com>
References: <20260619140750.914225-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239174

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2026-34001.patch    | 104 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch
new file mode 100644
index 0000000000..a438f5ffcd
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 1a076ab552..800d0a8f63 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62231.patch \
            file://CVE-2026-33999.patch \
            file://CVE-2026-34000.patch \
+           file://CVE-2026-34001.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


