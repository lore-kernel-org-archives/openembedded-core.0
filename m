Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8541C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38593.1782742836622847505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CpxRYo3t;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so1982544f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742835; x=1783347635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wDpdZYxXnbxWMbqMDGvwm1UMYcZJLYu++CrXo9OKzk=;
        b=CpxRYo3tRMqs6Pfz7g0LOo9jgQ63x1TELGgssLYHOB5aaLxF84vU55XdAyZDNZPPUk
         WpQBRDN6dowKK9IjnA2YTMZ+0GwBCR/k1MJNeBauSPxsOb2gu2eaCuvaO4H11B4ks4TZ
         JeQq6b9MnqZsFh8mcHVPD0bNqtQw6RlEbiJZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742835; x=1783347635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wDpdZYxXnbxWMbqMDGvwm1UMYcZJLYu++CrXo9OKzk=;
        b=L/F7OLzp8FoZWvAf42jWe9KK/RV55gCoNwGUT0hwlNF15/2A8P8SO2uBprqg7tapd3
         dgqqb5Zv31PdCk2FvmTkF+/NqIVCAc0vNeEhI3+Pzu66opmkvqFWRVKJHxTLTwH9ccO6
         SK7eSwMSTD+6IoxyGOEnYNeVR5PbaqFWgJwf00IVNWuQBnSXb9so5a7hBChYHtJAL0k2
         YORFAUefWJTQq/6t6HVLSyAtF6S9Yu2SWKPy6PEpjDFcYOaM7pN0Gx2+By9J9cp6VBz7
         kkusrERX2DCQV1kje+oWvUk+QcB+1/wVp6BGfsANIImmP0CZBgP8B2gv/HTC3CjNHJVU
         2r8g==
X-Gm-Message-State: AOJu0YzPHUBShfuFRuFB+S4lb9WfdKPw79QuYeorl8YpRpPLK7NI7JlJ
	QWv8NsLu+q4XaQu2Al1KYFsRhYCns5AjkHKSCauaxJ/n75SaxyVL89HkJEMve2wA3Ca2mpdl/IP
	Cva8xPmQ=
X-Gm-Gg: AfdE7cnukHaXO1MyhjwJfG5h4Gy2et9iNUHeY4jf0GV3GibdC/qqJ2+s9yVySx/A9Qj
	SKox8oE/jgS7vkZZ133mF29v2vVkWNCS5+pySMRGkuEeEuQwHVGg/T2X7DZf7ccDckEJ/JwHlPs
	PHDxyHXjUyRFjImkhDEjM9uHu9i4IZ4K1rHoaqG81STa53ckX2P/NMb2XRRxVnjDM8zOt0J6VNn
	8Mk9pz0AOnF6z0rsQqELp/b415RzWYCNLlOQWlHGhyHDkqYlPx3FrOi9CkztZur2zAQNiKYvq8B
	zi7MiZdWF/oANc5sW3EY5tgToMvJ/I4bIsGQQbW9wQ2/aMXfnajepvl0XKm5+dlpBkNiEu1OliA
	mLwvlrW2eRDIfWZH+dUA7b0qs0Nei6E7Xi9xkaOahsz3b/jVRFjagX/wLLUy/xVRAmkyDlBMh3z
	GezyBjtkXTyT62h2egTRbyal07vDj6sC95muF2bTV0/ZlzOvDtWTWovg889Rjgrszjf9fpAqUmm
	DCmMBSTlz5/5nQTtvEnIO4=
X-Received: by 2002:adf:f24e:0:b0:46d:d5da:f0a9 with SMTP id ffacd0b85a97d-475017f69a0mr1005281f8f.44.1782742834845;
        Mon, 29 Jun 2026 07:20:34 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/19] xwayland: Fix CVE-2026-34001
Date: Mon, 29 Jun 2026 16:19:56 +0200
Message-ID: <8e5404f100491b564706a7975fc3ded97abca090.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239799

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/xwayland/CVE-2026-34001.patch    | 104 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch
new file mode 100644
index 00000000000..a438f5ffcdd
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
index 1a076ab552f..800d0a8f634 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62231.patch \
            file://CVE-2026-33999.patch \
            file://CVE-2026-34000.patch \
+           file://CVE-2026-34001.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 

