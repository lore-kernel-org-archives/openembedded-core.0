Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C876AE6ADF9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88516.1766436310315614443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYICE9Yv;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so610901266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436309; x=1767041109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdSyWwMLSgy3ncaVLEY/kOZ7Wyq40qswipisgf0+P9U=;
        b=QYICE9YvR3FTyqLIP0ADaeCwIvoTbemSRwxReK1jhMV9LF5q7Go4nED43kd+IekB5/
         YA1AcnsEays5AmkY+rtxCsOYFgP2M7Ea918yZTg6ch1j2fCviEdySg+wcGCYjbtzfy4S
         p6EOR4XGnieEvcJpX8Pst5+UqsdGY653sG0fRFhkX1hbeH6w7DstpXQwmZBsb6KsEN4S
         Y0OHKBRCZC19gKxqgN+/4Nx3A98KPwl2/CIiMNJxdBzFMcf7idl0mughxAWI/k6TVLOn
         KMo9y00GrIstwnwQSn5ytCtfSZRhJu//r53dBZWjpCNH+QsSpvOkhfCBGl+i81sn5PTm
         EmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436309; x=1767041109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdSyWwMLSgy3ncaVLEY/kOZ7Wyq40qswipisgf0+P9U=;
        b=vezkL44Lv8VmY86O/Vvpld/uzed+vRQ3wA7kbiHgg5mIVjKdJwl5y13qn01cIfDY5F
         eWIP7vuACcv5WtF5wX62HphFu3buEYX0RKxrFTQ5yFf8i6hn4vnvYfgq0N0Kb5QcdtJ2
         G3JkE3VRmMCP62F5h6d44Yx023t+s4UJkL8YejFPhQBnYMO1sd6Ndk4W2/XJ70rP8+vp
         +iCMylmcUVR/m29j0GK3QWKPQvoLWjd/SZIhOie7D6dwf6WK95ZqDtcTn4J53mkGjm5j
         xEvvY1Bb2DGbilW5oRAnNy3YVDOtvf4ucipS06OZgEYxSF91JfP5nmJlGMyplGNK8187
         kxUg==
X-Gm-Message-State: AOJu0YxyV69g+GlK9Gr1Jp5jy6GDt6GY0/hwBmbPurFszsZkePNorvvG
	kdQDxWgHYCeD23HZ5LsJgcS2AL23k9uu6q8774BQ8GHmtO5tl3ZS6BA+mob+Kw==
X-Gm-Gg: AY/fxX5OTwYwj8+pDsaQKQa/P9cpuzxnxgJGyyphw1eNOcRE8ARl7Vsz2VDh4/yX0XJ
	tNt7CDufp6jypVFZVKCvK1c+cFm3hOsmdMKCx3zMZsoTFp47lxoEAt5OcYs9D75EY6hLWGP2ZTY
	BnN6RPkL7hakkgR6n3Nd/wdBXKrcJwI4OP8KVfVtaEROLH+/YZDp8a7LlYXBP7Ir9xZSSzfrOAW
	MEv/d0xS9jK+DpqCTfkzA4gGu50peIFIXXnFZ3Em4vzlYzIXxBrTPCt9wVtv0ty6dZ7+sJ43PiB
	GFzy0UHAX8iHOTIpGPoyAM5tcXAQUzOkFcz6JWyMKMHiAw26FMcSzIJ2UbUurWquSfRkOQcJ9ea
	ugCRpf4m/4nrYA0rfIMuyMPZGhayytGESIm1bCJPwyB45G8PK3is7ayticL0wOEt5Dp8H3/8SlS
	Fhc5SG/muqmQ+VBi5oB9O9kvT2kNA8xqotaNotk7OYIXrh2tI=
X-Google-Smtp-Source: AGHT+IHG8OtzNVrYc5QqCw3PKuObKpoXrH+AJs5Irl8ytmLpkXd/bjE8CwnZA1+hwfvqVXPmHfg6FQ==
X-Received: by 2002:a17:906:9f91:b0:b72:5d9c:b47b with SMTP id a640c23a62f3a-b8037051eb2mr1121638466b.36.1766436308381;
        Mon, 22 Dec 2025 12:45:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/15] xwayland: upgrade 24.1.8 -> 24.1.9
Date: Mon, 22 Dec 2025 21:44:33 +0100
Message-ID: <20251222204455.2284529-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228440

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...after-free-in-present_create_notifie.patch | 91 ------------------
 ...ke-the-RT_XKBCLIENT-resource-private.patch | 63 -------------
 ...KB-resource-when-freeing-XkbInterest.patch | 92 -------------------
 ...-Prevent-overflow-in-XkbSetCompatMap.patch | 53 -----------
 ...{xwayland_24.1.8.bb => xwayland_24.1.9.bb} | 13 +--
 5 files changed, 4 insertions(+), 308 deletions(-)
 delete mode 100644 meta/recipes-graphics/xwayland/xwayland/0001-present-Fix-use-after-free-in-present_create_notifie.patch
 delete mode 100644 meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
 delete mode 100644 meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
 delete mode 100644 meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.8.bb => xwayland_24.1.9.bb} (81%)

diff --git a/meta/recipes-graphics/xwayland/xwayland/0001-present-Fix-use-after-free-in-present_create_notifie.patch b/meta/recipes-graphics/xwayland/xwayland/0001-present-Fix-use-after-free-in-present_create_notifie.patch
deleted file mode 100644
index c2f6ad1e02..0000000000
--- a/meta/recipes-graphics/xwayland/xwayland/0001-present-Fix-use-after-free-in-present_create_notifie.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From a2d7bd5fefecfc4315247902b7f03e8bf9866908 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 2 Jul 2025 09:46:22 +0200
-Subject: [PATCH 1/4] present: Fix use-after-free in present_create_notifies()
-
-Using the Present extension, if an error occurs while processing and
-adding the notifications after presenting a pixmap, the function
-present_create_notifies() will clean up and remove the notifications
-it added.
-
-However, there are two different code paths that can lead to an error
-creating the notify, one being before the notify is being added to the
-list, and another one after the notify is added.
-
-When the error occurs before it's been added, it removes the elements up
-to the last added element, instead of the actual number of elements
-which were added.
-
-As a result, in case of error, as with an invalid window for example, it
-leaves a dangling pointer to the last element, leading to a use after
-free case later:
-
- |  Invalid write of size 8
- |     at 0x5361D5: present_clear_window_notifies (present_notify.c:42)
- |     by 0x534A56: present_destroy_window (present_screen.c:107)
- |     by 0x41E441: xwl_destroy_window (xwayland-window.c:1959)
- |     by 0x4F9EC9: compDestroyWindow (compwindow.c:622)
- |     by 0x51EAC4: damageDestroyWindow (damage.c:1592)
- |     by 0x4FDC29: DbeDestroyWindow (dbe.c:1291)
- |     by 0x4EAC55: FreeWindowResources (window.c:1023)
- |     by 0x4EAF59: DeleteWindow (window.c:1091)
- |     by 0x4DE59A: doFreeResource (resource.c:890)
- |     by 0x4DEFB2: FreeClientResources (resource.c:1156)
- |     by 0x4A9AFB: CloseDownClient (dispatch.c:3567)
- |     by 0x5DCC78: ClientReady (connection.c:603)
- |   Address 0x16126200 is 16 bytes inside a block of size 2,048 free'd
- |     at 0x4841E43: free (vg_replace_malloc.c:989)
- |     by 0x5363DD: present_destroy_notifies (present_notify.c:111)
- |     by 0x53638D: present_create_notifies (present_notify.c:100)
- |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
- |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
- |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
- |     by 0x4A1E4E: Dispatch (dispatch.c:561)
- |     by 0x4B00F1: dix_main (main.c:284)
- |     by 0x42879D: main (stubmain.c:34)
- |   Block was alloc'd at
- |     at 0x48463F3: calloc (vg_replace_malloc.c:1675)
- |     by 0x5362A1: present_create_notifies (present_notify.c:81)
- |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
- |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
- |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
- |     by 0x4A1E4E: Dispatch (dispatch.c:561)
- |     by 0x4B00F1: dix_main (main.c:284)
- |     by 0x42879D: main (stubmain.c:34)
-
-To fix the issue, count and remove the actual number of notify elements
-added in case of error.
-
-CVE-2025-62229, ZDI-CAN-27238
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-(cherry picked from commit 5a4286b13f631b66c20f5bc8db7b68211dcbd1d0)
-
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2088>
-
-CVE: CVE-2025-62229
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- present/present_notify.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/present/present_notify.c b/present/present_notify.c
-index 445954998..00b3b68bd 100644
---- a/present/present_notify.c
-+++ b/present/present_notify.c
-@@ -90,7 +90,7 @@ present_create_notifies(ClientPtr client, int num_notifies, xPresentNotify *x_no
-         if (status != Success)
-             goto bail;
- 
--        added = i;
-+        added++;
-     }
-     return Success;
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch b/meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
deleted file mode 100644
index 61369d789c..0000000000
--- a/meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 539bca9e0d05ce995a936c4bdf90bc716510d2a7 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 10 Sep 2025 15:55:06 +0200
-Subject: [PATCH 2/4] xkb: Make the RT_XKBCLIENT resource private
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Currently, the resource in only available to the xkb.c source file.
-
-In preparation for the next commit, to be able to free the resources
-from XkbRemoveResourceClient(), make that variable private instead.
-
-This is related to:
-
-CVE-2025-62230, ZDI-CAN-27545
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
-(cherry picked from commit 99790a2c9205a52fbbec01f21a92c9b7f4ed1d8f)
-
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2088>
-
-CVE: CVE-2025-62230
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- include/xkbsrv.h | 2 ++
- xkb/xkb.c        | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/xkbsrv.h b/include/xkbsrv.h
-index bd747856b..d801cd4b8 100644
---- a/include/xkbsrv.h
-+++ b/include/xkbsrv.h
-@@ -58,6 +58,8 @@ THE USE OR PERFORMANCE OF THIS SOFTWARE.
- #include "inputstr.h"
- #include "events.h"
- 
-+extern RESTYPE RT_XKBCLIENT;
-+
- typedef struct _XkbInterest {
-     DeviceIntPtr dev;
-     ClientPtr client;
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index ac154e200..6c102af0a 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -50,7 +50,7 @@ int XkbKeyboardErrorCode;
- CARD32 xkbDebugFlags = 0;
- static CARD32 xkbDebugCtrls = 0;
- 
--static RESTYPE RT_XKBCLIENT;
-+RESTYPE RT_XKBCLIENT = 0;
- 
- /***====================================================================***/
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch b/meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
deleted file mode 100644
index 76e50cfad9..0000000000
--- a/meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From a7e9938b621e16677c6330306a45baba0495ea31 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 10 Sep 2025 15:58:57 +0200
-Subject: [PATCH 3/4] xkb: Free the XKB resource when freeing XkbInterest
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-XkbRemoveResourceClient() would free the XkbInterest data associated
-with the device, but not the resource associated with it.
-
-As a result, when the client terminates, the resource delete function
-gets called and accesses already freed memory:
-
- | Invalid read of size 8
- |   at 0x5BC0C0: XkbRemoveResourceClient (xkbEvents.c:1047)
- |   by 0x5B3391: XkbClientGone (xkb.c:7094)
- |   by 0x4DF138: doFreeResource (resource.c:890)
- |   by 0x4DFB50: FreeClientResources (resource.c:1156)
- |   by 0x4A9A59: CloseDownClient (dispatch.c:3550)
- |   by 0x5E0A53: ClientReady (connection.c:601)
- |   by 0x5E4FEF: ospoll_wait (ospoll.c:657)
- |   by 0x5DC834: WaitForSomething (WaitFor.c:206)
- |   by 0x4A1BA5: Dispatch (dispatch.c:491)
- |   by 0x4B0070: dix_main (main.c:277)
- |   by 0x4285E7: main (stubmain.c:34)
- | Address 0x1893e278 is 184 bytes inside a block of size 928 free'd
- |   at 0x4842E43: free (vg_replace_malloc.c:989)
- |   by 0x49C1A6: CloseDevice (devices.c:1067)
- |   by 0x49C522: CloseOneDevice (devices.c:1193)
- |   by 0x49C6E4: RemoveDevice (devices.c:1244)
- |   by 0x5873D4: remove_master (xichangehierarchy.c:348)
- |   by 0x587921: ProcXIChangeHierarchy (xichangehierarchy.c:504)
- |   by 0x579BF1: ProcIDispatch (extinit.c:390)
- |   by 0x4A1D85: Dispatch (dispatch.c:551)
- |   by 0x4B0070: dix_main (main.c:277)
- |   by 0x4285E7: main (stubmain.c:34)
- | Block was alloc'd at
- |   at 0x48473F3: calloc (vg_replace_malloc.c:1675)
- |   by 0x49A118: AddInputDevice (devices.c:262)
- |   by 0x4A0E58: AllocDevicePair (devices.c:2846)
- |   by 0x5866EE: add_master (xichangehierarchy.c:153)
- |   by 0x5878C2: ProcXIChangeHierarchy (xichangehierarchy.c:493)
- |   by 0x579BF1: ProcIDispatch (extinit.c:390)
- |   by 0x4A1D85: Dispatch (dispatch.c:551)
- |   by 0x4B0070: dix_main (main.c:277)
- |   by 0x4285E7: main (stubmain.c:34)
-
-To avoid that issue, make sure to free the resources when freeing the
-device XkbInterest data.
-
-CVE-2025-62230, ZDI-CAN-27545
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
-(cherry picked from commit 10c94238bdad17c11707e0bdaaa3a9cd54c504be)
-
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2088>
-
-CVE: CVE-2025-62230
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- xkb/xkbEvents.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xkb/xkbEvents.c b/xkb/xkbEvents.c
-index f8f65d4a7..7c669c93e 100644
---- a/xkb/xkbEvents.c
-+++ b/xkb/xkbEvents.c
-@@ -1055,6 +1055,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
-             autoCtrls = interest->autoCtrls;
-             autoValues = interest->autoCtrlValues;
-             client = interest->client;
-+            FreeResource(interest->resource, RT_XKBCLIENT);
-             free(interest);
-             found = TRUE;
-         }
-@@ -1066,6 +1067,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
-                 autoCtrls = victim->autoCtrls;
-                 autoValues = victim->autoCtrlValues;
-                 client = victim->client;
-+                FreeResource(victim->resource, RT_XKBCLIENT);
-                 free(victim);
-                 found = TRUE;
-             }
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch b/meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
deleted file mode 100644
index 27c8f6c809..0000000000
--- a/meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 70dfb0fb993655b0989d54e3bffc4e62c5629392 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 10 Sep 2025 16:30:29 +0200
-Subject: [PATCH 4/4] xkb: Prevent overflow in XkbSetCompatMap()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The XkbCompatMap structure stores its "num_si" and "size_si" fields
-using an unsigned short.
-
-However, the function _XkbSetCompatMap() will store the sum of the
-input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
-"size_si" without first checking if the sum overflows the maximum
-unsigned short value, leading to a possible overflow.
-
-To avoid the issue, check whether the sum does not exceed the maximum
-unsigned short value, or return a "BadValue" error otherwise.
-
-CVE-2025-62231, ZDI-CAN-27560
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
-(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
-
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2088>
-
-CVE: CVE-2025-62231
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- xkb/xkb.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 6c102af0a..a77fe7ff0 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -2990,6 +2990,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
-         XkbSymInterpretPtr sym;
-         unsigned int skipped = 0;
- 
-+        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
-+            return BadValue;
-         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
-             compat->num_si = compat->size_si = req->firstSI + req->nSI;
-             compat->sym_interpret = reallocarray(compat->sym_interpret,
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
similarity index 81%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
index af4bb73499..df1bb7e31b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
@@ -7,15 +7,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
-
-SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
-           file://0001-present-Fix-use-after-free-in-present_create_notifie.patch \
-           file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch \
-           file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
-           file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
-           "
-SRC_URI[sha256sum] = "c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907"
+LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+
+SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
+SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.3


