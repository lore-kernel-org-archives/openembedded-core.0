Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314DACF2594
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 07:44:25 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1822.1763538261651695650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 23:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZH2RJPjL;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2958db8ae4fso59462505ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 23:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763538260; x=1764143060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IexAPf3/CG1y0y4EDdDSwP1Qp9Ziv94nZvKzbkVHMs=;
        b=ZH2RJPjLHf+9p+UJ3d6Mz1ZQ9FKttg4NAC7OkpQfi6M2Uy5mAqk0VDfOYHPxT2ay9r
         PMLNd4fxJCA0ogyC0e1FiEGzgOhJY+bVVRziVTsrjW0zsxxq3noo2mcMlGGR1XKyjIvb
         dxcFSxYhQGuYoIxWC8DM43TUgBWsy+XL7SUSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538260; x=1764143060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IexAPf3/CG1y0y4EDdDSwP1Qp9Ziv94nZvKzbkVHMs=;
        b=matdeG+CwvUZxBFidcRrFitvJxU6HMf87yQR0HVqQArZCYeVP9akmKSIq1B0/g0b1c
         nfHA3IUc9B7T6gb0CPjwdh77UN6FM7AQE2OuaKc28g32RDLk4zA7naDopsE6d20yPPWs
         zd6zTlD+fGpXXLE/TCEkyGD/iXt7rnGMT+se2zY7h+Yc1oJ3EvonYPW+K/sMh4e1ELPG
         VtDcLA2/6bVm61tk+t2KK5f8mUOUxA+dDGOOXA9ThWLQHAWF+1yf2ICFXtSe83k7x8EM
         2x3wns4S0XNRpS0E6njawIBWQBCGSFgTAe5PLYvHdEHUYaPicOrp9uFg3OPHw654qb5V
         bZNA==
X-Gm-Message-State: AOJu0YxOMeql3Z7mIw7BqGYIgxSuCmFgGS1S1ukdWPi4i0/Yi4JvIDpt
	seDMD7n89ooVEKI8jHy/3aSd15sSjKQOQSm5An5nrWjtUC/2uJGVQtdG4SOiWnjFWJoNwUgCdzD
	Awq1b
X-Gm-Gg: ASbGncuIuPUI8VVYHIWhSAKPlkin6CPfnkKJ3RPU/6MOrVovLye6PiphdqZLIsybfYm
	GWGctWYbKPOgLRrwsjnL1GNrqm8cgH9whoxbWp1Ta4PzbY9RvYyrAYpKfVQSP/olrf8xd+iJvHU
	0H2ClrDwR3OFnPYJmFmkrh71FaO1qM5zJyQtiXNFt+pIVbAi+/Qvl7CI9vwQHWiD2hGptC0s1Jb
	/KuR5LitEr1n+YdSAUNfFAa0WsHB4doe81SBIbGeUSz2+2JBkgk8oIBg2jJ1+capoU5cGU2Bmmg
	hFqTi1mKZq/SHjlBhupov/A7o0v0MIAQPTrF7LxkooOGx5orwKrlb5SHNH4eiSHJOGnketYmG41
	DUyALeH5s/QzdjdcPZW2QfJcNpgFUoyhoBqN4ibXDVyeBwEaD6xOFF27z/eNMAqDV0SUdGJEslu
	220Nu291jK/jAXcpTEaIY9g4eP0w==
X-Google-Smtp-Source: AGHT+IGNOmXBLAy9DvnfXsaG3Uhf8BqcL9coYQdTpMTJS2fhEDZ5ZsSTQ0gaka6HdP6c8SC2/7aAJA==
X-Received: by 2002:a17:902:d54c:b0:295:5132:1a99 with SMTP id d9443c01a7336-2986a752875mr223800725ad.44.1763538260542;
        Tue, 18 Nov 2025 23:44:20 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcd:b4d5:5829:5269:5ea2:a966])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c23487esm194541685ad.20.2025.11.18.23.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:44:19 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/3] xwayland: Fix for CVE-2025-62230
Date: Wed, 19 Nov 2025 13:14:07 +0530
Message-Id: <20251119074408.51461-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251119074408.51461-1-vanusuri@mvista.com>
References: <20251119074408.51461-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226540

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a61df135f7b44a9782a175
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914ad0cde999376a3adc3839

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


