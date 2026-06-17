Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76619CD98FC
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10216.1781682335435380796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=baMOpm6j;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4629324e170so375052f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682334; x=1782287134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JbnHQbtrPP+NpYgyzB6NTZlsXsTBYaw1VYXFbbHmho=;
        b=baMOpm6jzRJLxZ3uvZ/uSdR2+HrOY2R1EmWOdlqdtGYaNKYpwgajEIW8tUS7oxy5VY
         2ahk20kr627DiadVVxKrA/GpSEs6UNujy4haKq72sjhZyG5EPpa/OUFFevzHJmPXvxxS
         tCFHeBzOP7L8NpMTo9/zEZ/KC2O2JzJdaAWA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682334; x=1782287134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2JbnHQbtrPP+NpYgyzB6NTZlsXsTBYaw1VYXFbbHmho=;
        b=ouei/YG5KppiDJ6yXYi6n/FARk7VoIH868WZ41iHSLbqTIx9UiRm3mW4E9jPHm9Vfv
         7MAWKiyXj21C7h0Ik1QMU5jUvIDsH35LCfQ3DVvWmfsAX4auDvdoJq4HNln2JA2VmdV+
         VJPuB8ETlFKjCjZ8eev5HdpizOPBGt5uPknlysf/AwcuJBoIlFmXvX49luDjH3B4CGsR
         Yvad8Ew2lukjJbd/4RSB9yWpsldu0V3ZxoPbYniiiCoV+cQ0FKcGJroJhoHF25//n9zJ
         Yk7pNMNiGleEmLlYp1t9kACUFLSu1CQuqaN+l3BTQ/h5kunLLABDZ4tDy6t6ZRuFrC/6
         xqNQ==
X-Gm-Message-State: AOJu0YzzfAWG+n2rTk+JdZClyOrgMaplG6lzaEC4gNXp2RRWQrsFRlJs
	e0hsFxIuyFk3buZuA/Wv+QMn0MHdD0rzn+SGr+zL392fXCqWNIptpH+WESDg/9IS01OYxNQiWez
	q6q5w
X-Gm-Gg: AfdE7cmHAmqdLTy8ZpGW2ulXOwf7jks4gWSi5/He2T/X/A0MD4kb1qq+frB465VN58s
	5ulh1Ou8bUHMWP16aWRFn+c5OiFzjznmijeShYmtQfCOhvcE/y6lDDtvGAx/uSbMbMiKAKP3edE
	SViPgsRrZXBdu9NFWD8jmrCSAWFWmn9WsOpIgsFsZRWrF+RHHzP7+JFkn97Nkkiic/80FoQEJjs
	sYAmtx4Vfgk2T4xfug5CQBporL42o+ql2TBjkCJL0vcL6TTC1u/fMipbomOk8ulnSNk7BNScnKb
	W+xyCz4FXxvupHuPKqmtvodUm9ttVnACYPWf7Ig6OyTT8LKODyCdy6ZCQB/P8DsdJg29wVfwZUZ
	SuxUGz2fpTW/ACtdtblYbIYQAruzysJMMKXPZj5Sm0rRxD3Sd5jsE+Vfvf6njJ+le1+V38wRlTu
	UYLoZeGldjn4ILCiFsNmJii0EhpuSfVLSaSZiUJw48uLXV/eiWaFkkrt5TmtL3X7RBaiBIx2OH/
	IhAgbdwD6cThvWIlGlOX1JQyEnZ
X-Received: by 2002:a5d:4e47:0:b0:460:3234:2940 with SMTP id ffacd0b85a97d-46239b1ed67mr3630234f8f.43.1781682333667;
        Wed, 17 Jun 2026 00:45:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/30] xserver-xorg: Fix CVE-2026-34001
Date: Wed, 17 Jun 2026 09:44:47 +0200
Message-ID: <b85d3abfc5a1fd05c3a82f1f03579df493094719.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238994

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xserver-xorg/CVE-2026-34001.patch         | 104 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34001.patch
new file mode 100644
index 00000000000..a438f5ffcdd
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
index 658a608b5ea..dfed2c2437c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
             file://CVE-2026-33999.patch \
             file://CVE-2026-34000.patch \
+            file://CVE-2026-34001.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 

