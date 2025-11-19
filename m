Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27102CF58EF
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17326.1763584949357085730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wjqGJkcE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so178948b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584948; x=1764189748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJWmz3eSG+Fia3aHH+m9exBQ+KP3Ny1We9TvOGO7SXs=;
        b=wjqGJkcEvTkKI6Q2OOnLF93icy2A0IOGFXvFHxzmHxBSS7q12I3uZjVQ8kFsYtBhke
         9b808Tp6QDnaBaAKW4lifUYr/QlbJzEnPMaB1xa3QYZAgW9ouMuaCY1RglXJ6+/kgD21
         pxm9Ye4vtYJYZGMjv3ovAXuvxh9S+gShUtsVVLAQ5FjldxUjDIxwcHkonvSyTQW88k8P
         sLe/iUvrJcLEsbyQM3c23L5hn4XX4p1bnCg9JT5FhMOEEih+03e+W50UwhILffChlQ77
         LbimBV7E2w+ACujEXu1kM1EfuKYn1j6HVzue7jvTsT1MDH53fNmL+PHLFCGg2fx3IOJU
         4Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584948; x=1764189748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJWmz3eSG+Fia3aHH+m9exBQ+KP3Ny1We9TvOGO7SXs=;
        b=ULz9rXpgb91OSrdwRyU0hI1n22ySAa3rdY5IFBDvLMZBRDvcexFXXgQGu/mi0m55yY
         rUG9gmMGbGDhdrf999u+sj0McrLTCBEwODMFDjZPlfL9tSIRJfjAmIfzDiGqEDwZXw3f
         wYCHsr+tAex9Mo+Z359KFrwqF5PnGn3xyg2rihnG1wb9wBRQONY9+WnIaxF+W4ylTblI
         GYxCMYKDTrEDgD0HReCkEpjipMYS7oBLQV77PHVsvDGJ3OYc1ZheqGVb+EWlgrLJMin4
         qVZT0puJV+51esW9816g06PO44K9vRG/oXuagmNXxR0WpYC8rRl2v9UmGkDXbGwUi/go
         ns5A==
X-Gm-Message-State: AOJu0Yw216dfrWFNuCXnkZNawlQzVL3vjt3QPd6C4OgUDRY5Z22z/y77
	mZYdAKfsXLICK4KhLWMIySdCeqGsrPskSxUssmpSovzK1HaABzUhCp9IKgrzsSbpfDd35n52Ygu
	muwDq
X-Gm-Gg: ASbGncvmwO7x22vKzAj3f1GFoOwaHdoiTi7JakiCVw9cbhAVtVm9/Vi0pLOYzuy5Swi
	gd8zWJw5L/los8GzhbUPFRV+yZI9SkFA42CMa8eKHbVwf1sGOdaKEncrh5ajt4cdo6ksX/cHNn/
	OGs4XhLrtEZ8gGongBBlL5DBK8A//93WPaCtaq0dtA+qv8IE6pB+qWi4M4Ps9Hfw+stc5ZdQ6IB
	sIXVPgdOCBIscofZGB5KX2Skyoni55iDjrvVEK5L04suVu0lzQ4pzKbLP4dPqzzFkzwvE4YCrl+
	UQU8O6WZwJRNFghzc+mPnA9jVg1m/EFvTtB2evy9f5Y/3O/tYCcnCxZQgJs2Dz/RSuwwgpHjxSS
	RBy9NuhOQP4mk0V5Yib78XwqdocnO9eqqKQHDLRW6UYkDpdqLan78eZ7t3o8tZ06n1zNtyKGumc
	hOCg==
X-Google-Smtp-Source: AGHT+IFswoJY8tlpZ9aLs6KR5akobMQyG7ZNECHJg7Kvzgu+lyq3YwPBO94bVc7uZFhGuAEfHRhVsQ==
X-Received: by 2002:a05:6a20:94cb:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-3613ca9d687mr363143637.26.1763584948436;
        Wed, 19 Nov 2025 12:42:28 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] xwayland: Fix for CVE-2025-62230
Date: Wed, 19 Nov 2025 12:42:12 -0800
Message-ID: <a481fe0dcca8213eca845d5f1fdde3f0d15c8aed.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226594

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a61df135f7b44a9782a175
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914ad0cde999376a3adc3839

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-62230-1.patch  | 63 +++++++++++++
 .../xwayland/xwayland/CVE-2025-62230-2.patch  | 92 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-2.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-1.patch
new file mode 100644
index 0000000000..a3a0bae2d5
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-1.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-2.patch
new file mode 100644
index 0000000000..0e4a69c64e
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-2.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index ba0ed6048e..4fa88fbcff 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -51,6 +51,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
            file://CVE-2025-62229.patch \
+           file://CVE-2025-62230-1.patch \
+           file://CVE-2025-62230-2.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


