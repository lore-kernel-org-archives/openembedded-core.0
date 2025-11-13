Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B97ECD98F0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:44 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4375.1763070463092321381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SiragjI2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2953ad5517dso15569295ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070462; x=1763675262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inuww3dsoh25g+e7ywuy3kixgzCq5cbvnNtHoDn4QLk=;
        b=SiragjI2LNzv9YXfvm1g+vCEgdITIk9jyzYOhY6YdIXHXv5dhefDy0rTiuOZjOD890
         4QOYKJh+KZK4G6MbX1zaHXNVjrdR+vOPTSBJPOhCtGfF40zIbRNL1PvWu0X0bROjQS2M
         AaTxhSYyTADcM7LSl4+g5TRzM2fXn7BtYNoN2hi/nlTcIirP5I13CJGyZ00L2sLDeQuM
         sAgW41u2URXTRhSXAtoTj04gD+wb8N8Gtfzp7UtF9Y43MmwhgjOLFHJrFuRet86N8jaE
         BrJsUTc69rxtJJckpLtbdO4dQugUuhXMMhJeQ3mpaDz4hefUhpHBoqmzrm9L6bV1Vo6S
         k9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070462; x=1763675262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inuww3dsoh25g+e7ywuy3kixgzCq5cbvnNtHoDn4QLk=;
        b=dVYPkhFHa1nlnvPuuqVy0tYW1XYtLXFoWs20Iivi+NA5YdPMmynDIFa8hJi9wHhRYt
         R2Fa8j1fMoofaYywoX5rFfvCx1SNjwipQkX53mcpjjb5m+CCxTQCuAHGvvEFdtY+ASD0
         ZzhjiLh8eQHe5CNUYHYOl0B/s0K/xFqj3YOIGfjrVeS7zV85Aq/45TxNdxHPpwkO++su
         Cfne0nFWNu6MM1HEnIle1F74RzPlcO83qnBq5rZSjkMRI9nr2opd7i5EP9paYvUoOzlC
         v7ZBcsrqGmrVq3dVsqvCQYHI7YUD4Ju00oVnpsTmREhukVrN5lgI51ZUDMOr7hxC6PwX
         LeOQ==
X-Gm-Message-State: AOJu0YzqavligAVd2iMPgXlQL3NnvpZKsa3TBBxIvMbunM/PiuOLE1KI
	w4ODCl9s62CIcQZVigOaicbsgA/m439uWV4h94XYwOTqY1W7H83CYrFm9aUgu22fBJJt81KFUBA
	jgkMk
X-Gm-Gg: ASbGncuNjnqsjZYfFfxoCB5CurbYWlN2ic+ydejo2m4kJVTwTOl4zWNf2EP51l4XtYT
	QKWyHWrNz5kIss9IQwmeGKw5bMPsX9v/ovUyay+QCNZ/258J/pnyrOwF7uJzjsQkSXAxieC5zUI
	tMLh2o8xBr0pasrCuReroAuiCQLEvMu/tpyWkM5uD039UjRy8HroX+MQVbiQHcymDvfNo/5JYUw
	rVK/BXEoUr98oBmvs5Gqjx6EsduqHnlMUzBovvOdacfhujJz23+ge4bApJHk6qxhZEsdbgGCcks
	ACQsHyDOisvDju9scXOj3pnN1iU5bM36PDVugUEJvY5FhbUD8vyj6fsQOQySZ82+jMrtY4mtvEm
	zbZUW+Rea4ptmJorWgRQ6n9ASMtGgHJXhuU3pqH/rT4neQSPHbSSJUTbcgREhuiLsmQ==
X-Google-Smtp-Source: AGHT+IE+1FTYfqYkzGq/eaGnE/y+tDbOdi4R+RSGyOgWJk9i+uyVrC1q+ZvrapY71o5RHX3ngplQTg==
X-Received: by 2002:a17:903:f83:b0:246:4077:4563 with SMTP id d9443c01a7336-2986a73b4bfmr4975535ad.34.1763070462183;
        Thu, 13 Nov 2025 13:47:42 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] xserver-xorg: Fix for CVE-2025-62230
Date: Thu, 13 Nov 2025 13:47:23 -0800
Message-ID: <215d63fd22b40148625215aac5c4e7f2629f5814.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226276

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a61df135f7b44a9782a175
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914ad0cde999376a3adc3839

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-62230-1.patch       | 63 +++++++++++++
 .../xserver-xorg/CVE-2025-62230-2.patch       | 92 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-1.patch
new file mode 100644
index 0000000000..a3a0bae2d5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-1.patch
@@ -0,0 +1,63 @@
+From 865089ca70840c0f13a61df135f7b44a9782a175 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:55:06 +0200
+Subject: [PATCH] xkb: Make the RT_XKBCLIENT resource private
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Currently, the resource in only available to the xkb.c source file.
+
+In preparation for the next commit, to be able to free the resources
+from XkbRemoveResourceClient(), make that variable private instead.
+
+This is related to:
+
+CVE-2025-62230, ZDI-CAN-27545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+(cherry picked from commit 99790a2c9205a52fbbec01f21a92c9b7f4ed1d8f)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a61df135f7b44a9782a175]
+CVE: CVE-2025-62230
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ include/xkbsrv.h | 2 ++
+ xkb/xkb.c        | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/xkbsrv.h b/include/xkbsrv.h
+index fbb5427e1c..b2766277cf 100644
+--- a/include/xkbsrv.h
++++ b/include/xkbsrv.h
+@@ -58,6 +58,8 @@ THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #include "inputstr.h"
+ #include "events.h"
+ 
++extern RESTYPE RT_XKBCLIENT;
++
+ typedef struct _XkbInterest {
+     DeviceIntPtr dev;
+     ClientPtr client;
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 5131bfcdf7..26d965d482 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -51,7 +51,7 @@ int XkbKeyboardErrorCode;
+ CARD32 xkbDebugFlags = 0;
+ static CARD32 xkbDebugCtrls = 0;
+ 
+-static RESTYPE RT_XKBCLIENT;
++RESTYPE RT_XKBCLIENT = 0;
+ 
+ /***====================================================================***/
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-2.patch
new file mode 100644
index 0000000000..0e4a69c64e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62230-2.patch
@@ -0,0 +1,92 @@
+From 87fe2553937a99fd914ad0cde999376a3adc3839 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:58:57 +0200
+Subject: [PATCH] xkb: Free the XKB resource when freeing XkbInterest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+XkbRemoveResourceClient() would free the XkbInterest data associated
+with the device, but not the resource associated with it.
+
+As a result, when the client terminates, the resource delete function
+gets called and accesses already freed memory:
+
+ | Invalid read of size 8
+ |   at 0x5BC0C0: XkbRemoveResourceClient (xkbEvents.c:1047)
+ |   by 0x5B3391: XkbClientGone (xkb.c:7094)
+ |   by 0x4DF138: doFreeResource (resource.c:890)
+ |   by 0x4DFB50: FreeClientResources (resource.c:1156)
+ |   by 0x4A9A59: CloseDownClient (dispatch.c:3550)
+ |   by 0x5E0A53: ClientReady (connection.c:601)
+ |   by 0x5E4FEF: ospoll_wait (ospoll.c:657)
+ |   by 0x5DC834: WaitForSomething (WaitFor.c:206)
+ |   by 0x4A1BA5: Dispatch (dispatch.c:491)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+ | Address 0x1893e278 is 184 bytes inside a block of size 928 free'd
+ |   at 0x4842E43: free (vg_replace_malloc.c:989)
+ |   by 0x49C1A6: CloseDevice (devices.c:1067)
+ |   by 0x49C522: CloseOneDevice (devices.c:1193)
+ |   by 0x49C6E4: RemoveDevice (devices.c:1244)
+ |   by 0x5873D4: remove_master (xichangehierarchy.c:348)
+ |   by 0x587921: ProcXIChangeHierarchy (xichangehierarchy.c:504)
+ |   by 0x579BF1: ProcIDispatch (extinit.c:390)
+ |   by 0x4A1D85: Dispatch (dispatch.c:551)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+ | Block was alloc'd at
+ |   at 0x48473F3: calloc (vg_replace_malloc.c:1675)
+ |   by 0x49A118: AddInputDevice (devices.c:262)
+ |   by 0x4A0E58: AllocDevicePair (devices.c:2846)
+ |   by 0x5866EE: add_master (xichangehierarchy.c:153)
+ |   by 0x5878C2: ProcXIChangeHierarchy (xichangehierarchy.c:493)
+ |   by 0x579BF1: ProcIDispatch (extinit.c:390)
+ |   by 0x4A1D85: Dispatch (dispatch.c:551)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+
+To avoid that issue, make sure to free the resources when freeing the
+device XkbInterest data.
+
+CVE-2025-62230, ZDI-CAN-27545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+(cherry picked from commit 10c94238bdad17c11707e0bdaaa3a9cd54c504be)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914ad0cde999376a3adc3839]
+CVE: CVE-2025-62230
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkbEvents.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkbEvents.c b/xkb/xkbEvents.c
+index 0bbd661867..3d04ecf0c4 100644
+--- a/xkb/xkbEvents.c
++++ b/xkb/xkbEvents.c
+@@ -1056,6 +1056,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+             autoCtrls = interest->autoCtrls;
+             autoValues = interest->autoCtrlValues;
+             client = interest->client;
++            FreeResource(interest->resource, RT_XKBCLIENT);
+             free(interest);
+             found = TRUE;
+         }
+@@ -1067,6 +1068,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+                 autoCtrls = victim->autoCtrls;
+                 autoValues = victim->autoCtrlValues;
+                 client = victim->client;
++                FreeResource(victim->resource, RT_XKBCLIENT);
+                 free(victim);
+                 found = TRUE;
+             }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 1ec5a195f9..ed543f6270 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -45,6 +45,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49180-1.patch \
            file://CVE-2025-49180-2.patch \
            file://CVE-2025-62229.patch \
+           file://CVE-2025-62230-1.patch \
+           file://CVE-2025-62230-2.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


