Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87A7E6B246
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88515.1766436309668634738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hcoxb+Km;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso675851566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436308; x=1767041108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLgPy00YMacW9B9e2hrY4I4cRpjWEuk9aW19/gnu/E0=;
        b=hcoxb+KmiliL07XdlzJ1dO4NwCGyFZgXssSR6bS/9ZbEh5+MAD/cRrGcYTTTa1rNg0
         fP6jLO15nJFbe9iz8GUylgGH6MRTATLRtrXCWHk8P6T4Myxsl3Rt9li4RZ+1aPX0jEhG
         CpVPKnMaWmXaV/wqgUNj/UuYRwnu8PqhXYaygle0BPwG92tf564OOhfz2iLyW+XrW40d
         NRA9OrzocGZqd8E3LePapz5dyP267aV+puctOfGjN7HYoQzVotka4UAax+cSSaQV0vZG
         JGeMU/S1m0Isqzs+XDd1833fkGoBk1ezp6kZ0pXKFGqeBtXJuciPbyL+N5xvBGIjByL0
         ziiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436308; x=1767041108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLgPy00YMacW9B9e2hrY4I4cRpjWEuk9aW19/gnu/E0=;
        b=FGAL/juHEVle1Ti7UcyqauMz1aVLP596QIJQdl6JL5K+thUZxMoNfGi9Yg2BcLP68D
         JTxlCny40RNwnbLFZ69iHybOWD0YVPt60DcTX7AnXG6zig/vkySGcG0/eVcDR5Re4MY8
         RJifAUPX7lkLGqIVs8GPmcyk2FXURFpBZGrlvbvlTwyGQeuiOSdmGN+vNzkVIFCndU3P
         V8IgBNWG0G59N22/bn0arrxY5zTi6VAMFLZV743oMH547w85zVhUmV8NIcRsTwYpAFud
         vWKRk66+rv0arFG9+YcbLh9DYT1Cvum2p4VR2Z1DMega3f+qkkR/dRapgoCugBf4irN5
         f2MA==
X-Gm-Message-State: AOJu0Yx4OD7nwUShD3RMNLkF7u6VqSpc0BwGKoHCV1XVbPL0WObiMtDt
	fZFsZ1mmrp1gCruTTxt2L0w5ntKe7jX5dB8sDmN7zLyf7vB705kTcvJS3Tzlkg==
X-Gm-Gg: AY/fxX7XvLHfOFGfZUb4+zWiFXVtoeilFSczBaYvTXjxbJG76qbLm/BWg+lhD99Patp
	sVjB4idhysbsyP3sQUHr4+QwgAm9l96+JtuIBq87lBoBoFVJnHSvHlt9H/Yp/I4xNFkYZ1wbiar
	+PcgnvMKqRX90FFw3GaGwgd042IkAQJPQYQ6WU++uzNc9pCREnsIx+I2MB9bXwbtvigYm3hJ+wr
	dG6Rw5bmavxMCBAuz05Mzy6RQa53lSm4546ult2y9Dv+9nsFLOlMFGAqYcGh+KpiCpSkfngcxQN
	QKIuthYnQpkCKWZ1ak4sDLirha3ZfGPbZnIF6bwebfjCx/iWgqI72PPUlgEgfmbRQJFI5Fwf/hF
	Gn2+VCz5Jc+518sxBRRzIVKZlH0QzfGf1v/6/GsBYfJx8ecspG20FKGsV2RfYVVMfcQc8muny+4
	4AUmDX5XY8jqN2smFzd9ujXPk7loyd4Lqre4f8QOp1th9ChNo=
X-Google-Smtp-Source: AGHT+IEzJBfkNi/onfKzKRwgdqVtI9A/lxGF3cPphrcIPFRSwnmos4FwVrum/UOEhVT8pEDxJJK6+Q==
X-Received: by 2002:a17:907:ca05:b0:b80:3fb3:bea0 with SMTP id a640c23a62f3a-b803fb3cademr946144266b.56.1766436307751;
        Mon, 22 Dec 2025 12:45:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/15] xserver-xorg: upgrade 21.1.18 -> 21.1.21
Date: Mon, 22 Dec 2025 21:44:32 +0100
Message-ID: <20251222204455.2284529-14-alex.kanavin@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228439

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 ...after-free-in-present_create_notifie.patch | 91 ------------------
 ...-Intel-ddx-only-for-pre-gen4-hardwar.patch |  2 +-
 ...ke-the-RT_XKBCLIENT-resource-private.patch | 63 -------------
 ...KB-resource-when-freeing-XkbInterest.patch | 92 -------------------
 ...-Prevent-overflow-in-XkbSetCompatMap.patch | 53 -----------
 ...org_21.1.18.bb => xserver-xorg_21.1.21.bb} |  9 +-
 7 files changed, 4 insertions(+), 308 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-present-Fix-use-after-free-in-present_create_notifie.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.18.bb => xserver-xorg_21.1.21.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 164eee8ffe..c79bb9e962 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
+LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-present-Fix-use-after-free-in-present_create_notifie.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-present-Fix-use-after-free-in-present_create_notifie.patch
deleted file mode 100644
index fa8bc542d8..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-present-Fix-use-after-free-in-present_create_notifie.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 359c9c0478406fe00e0d4c5d52bd9bf8c2ca4081 Mon Sep 17 00:00:00 2001
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
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index a196e50751..7d151aaa63 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From ad8967de36e6e2a185b71ce1d701448cda4ef3e2 Mon Sep 17 00:00:00 2001
+From 6d23037f48f3d534286fc2bda927c9b6ee5d1445 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
deleted file mode 100644
index ed25f4b58e..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From a3d5c76ee8925ef9846c72e2327674b84e3fcdb3 Mon Sep 17 00:00:00 2001
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
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
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
-index fbb5427e1..b2766277c 100644
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
-index 5131bfcdf..26d965d48 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -51,7 +51,7 @@ int XkbKeyboardErrorCode;
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
deleted file mode 100644
index f55e3d4126..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 32b12feb6f9f3d32532ff75c7434a7426b85e0c3 Mon Sep 17 00:00:00 2001
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
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
-
-CVE: CVE-2025-62230
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- xkb/xkbEvents.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xkb/xkbEvents.c b/xkb/xkbEvents.c
-index 0bbd66186..3d04ecf0c 100644
---- a/xkb/xkbEvents.c
-+++ b/xkb/xkbEvents.c
-@@ -1056,6 +1056,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
-             autoCtrls = interest->autoCtrls;
-             autoValues = interest->autoCtrlValues;
-             client = interest->client;
-+            FreeResource(interest->resource, RT_XKBCLIENT);
-             free(interest);
-             found = TRUE;
-         }
-@@ -1067,6 +1068,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
deleted file mode 100644
index 5036f0c9f0..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 364f06788f1de4edc0547c7f29d338e6deffc138 Mon Sep 17 00:00:00 2001
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
-Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
-
-CVE: CVE-2025-62231
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- xkb/xkb.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 26d965d48..137d70da2 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -2992,6 +2992,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
index 44ccea76f5..3781234c84 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
@@ -1,12 +1,7 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-            file://0001-present-Fix-use-after-free-in-present_create_notifie.patch \
-            file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch \
-            file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
-            file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
-            "
-SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
+SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
+SRC_URI[sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.47.3


