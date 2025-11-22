Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA84DCFD308
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3754.1763849687108426472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DBYcYAHg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297d4a56f97so46062155ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849686; x=1764454486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xr347e5oeu24MJTtkJu9uTi1cCW/LkvNyt6ZSXKIOYw=;
        b=DBYcYAHgTSoaPsWS2t4b9Jw/125FTQtarz52OcTQ56XwU0jvz5Alzbr6C+UvT+Rllo
         En3YdOaoJ+F0YNzfYM6N8nJwO6SWtIu8IOEqPs3DXvD713TYXeqeZDKSDb+wOr4EARfx
         /sr57tmV7LXutHRPJ+T9/PjFVHLoo5RCMOzekAMouid6lHVzd6vXiBTcx2O0k+BwLSpg
         TZ3pO4sa25jC6lc51wwGR3O0gTCnLsY6L9rjqFbHV12nn7UKhAoxRJwbfMPK60AcUfHX
         gEpJxIPSuJ44uTVY4e7tHH/DtT74CPt4ZjRksce4V/uKjCUj1KcwQNt+uVj6qM2VKBJq
         aJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849686; x=1764454486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xr347e5oeu24MJTtkJu9uTi1cCW/LkvNyt6ZSXKIOYw=;
        b=TDTMmyAmdw6Jbhmc98J8uv+dcsiBk2OdMmtAi/KJwJXuz+N2dwdZ4khUOy3ieS9hIe
         rFP83zUOiMqw5J5H//VyCoDURLyI+b2FGmf3eLXb8So/vpU8J7bDHSc66czwohyzIHnA
         HGo5QXct1qb+ORyptpAMfXfY1P34W6DfuwuwHGZcSdzk5ptyxHiJZFKkP84LXdfT7slF
         9B2ueX7HrlE9kc1Yg4IblLaieBISJ8MRgI6hlPVxVsuMT7W+S2AeNIYA1KTDnrspFN0M
         yzGSchvrq7QEg5YgSL6kI7lL6B5IAA+VjfhoXvX2whSiJQg/oGMrUM2rJPKkox/M3XHu
         bEUg==
X-Gm-Message-State: AOJu0YwZaJEgw232zkmYtqBM3iaW8o3tHBda6dlqOln0Q8WbvAW7MP90
	qWIGzPKrQAXwwq0wsJF/aTT9EmewOgvqrVShoJQz1biVr40zbpXWuw9R6ORvB6XbzM71Xr1m0Rn
	+xudk
X-Gm-Gg: ASbGncscEOqWnbaaef6O3KgHDhvm+8GhtPcVAD67uWDXKpbhFY1CsNM5L0Hvo1PIMHF
	PuWZhAgcCS5f1o7pplRRxtlhhkMjzpjRejLFzDx0xQWVEoFkDHTprNMpDYcQnXwAJk5UajxTq+a
	dtfqrbS2H+9k8XoPjdigfzqLq4ULtwLR2A0VvQyBChDTy0KRn89jCCceg3v4CEdV0i0+fqmXjuP
	HYp7EwkKyAeu8/CsT7r0rN8l+sAukKKhOwT8qcCi4P3EESFffwdVO+4Ve90ar1Ww8VSEyWZ6gnX
	tEOiPmiTNE0gCtp2DB1XFreQbjklgnJqWWX0y6I+6KOLwJ8PC/+E/BkKUaIoezcifd1vccckjVL
	8tajUuAiQXbtZYhtkhza6eyuL5zqpgMHZYARTFRtn5aZDaM5lJwP0RrBO6DwGbnjy5psw6rQFNE
	RXlg==
X-Google-Smtp-Source: AGHT+IHEhc+G/YAHYTXF8y2MfDpQfRb1yi9gwd2C0xkoq4dwTsqu5laZ0bl7JdZYpJxbqm8IcCyV2g==
X-Received: by 2002:a17:90b:3d90:b0:33e:2d0f:4793 with SMTP id 98e67ed59e1d1-34733e4c735mr6852068a91.11.1763849686254;
        Sat, 22 Nov 2025 14:14:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/21] xwayland: fix CVE-2025-62230
Date: Sat, 22 Nov 2025 14:14:13 -0800
Message-ID: <5d98bca7ca76964a6bf7efb7cf8331b9f518ad00.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226705

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was discovered in the X.Org X serverâ\x80\x99s X Keyboard
(Xkb) extension when handling client resource cleanup. The software
frees certain data structures without properly detaching related
resources, leading to a use-after-free condition. This can cause
memory corruption or a crash when affected clients disconnect.

Reference:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa

Upstream patches:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a61df135f7b44a9782a175
https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914ad0cde999376a3adc3839

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/CVE-2025-62230-0001.patch        | 60 +++++++++++++
 .../xwayland/CVE-2025-62230-0002.patch        | 89 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch
new file mode 100644
index 0000000000..a26d13e712
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch
@@ -0,0 +1,60 @@
+From 865089ca70840c0f13a61df135f7b44a9782a175 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:55:06 +0200
+Subject: [PATCH] xkb: Make the RT_XKBCLIENT resource private
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
+CVE: CVE-2025-62230
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a61df135f7b44a9782a175]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ include/xkbsrv.h | 2 ++
+ xkb/xkb.c        | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/xkbsrv.h b/include/xkbsrv.h
+index 21cd876..24fdfb4 100644
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
+index 3210ff9..b7877f5 100644
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
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch
new file mode 100644
index 0000000000..b5230359ba
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch
@@ -0,0 +1,89 @@
+From 87fe2553937a99fd914ad0cde999376a3adc3839 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:58:57 +0200
+Subject: [PATCH] xkb: Free the XKB resource when freeing XkbInterest
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
+CVE: CVE-2025-62230
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914ad0cde999376a3adc3839]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ xkb/xkbEvents.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkbEvents.c b/xkb/xkbEvents.c
+index f8f65d4..7c669c9 100644
+--- a/xkb/xkbEvents.c
++++ b/xkb/xkbEvents.c
+@@ -1055,6 +1055,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+             autoCtrls = interest->autoCtrls;
+             autoValues = interest->autoCtrlValues;
+             client = interest->client;
++            FreeResource(interest->resource, RT_XKBCLIENT);
+             free(interest);
+             found = TRUE;
+         }
+@@ -1066,6 +1067,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+                 autoCtrls = victim->autoCtrls;
+                 autoValues = victim->autoCtrlValues;
+                 client = victim->client;
++                FreeResource(victim->resource, RT_XKBCLIENT);
+                 free(victim);
+                 found = TRUE;
+             }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 1ed5df8a2e..9bc67f7761 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -32,6 +32,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
            file://CVE-2025-62229.patch \
+           file://CVE-2025-62230-0001.patch \
+           file://CVE-2025-62230-0002.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


