Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340C7CF2597
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 07:44:25 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1821.1763538257561013929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 23:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XY8a1MZ+;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-298039e00c2so81233275ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 23:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763538256; x=1764143056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYoXpA+s4Xw7eNcy3oGncEk540Tg0HhAAp5syAdVNHI=;
        b=XY8a1MZ+45hsMbqz6cM/bE0U4f5XVEWPnKitQ/G8l0YcuNSjmGAgLM9BSxi9YX/ELf
         PZcd+B2IqpNhwimYGdt/ds4kLnqDrWfRUrZjO6mDl0AEWMsyyrqW06z/eaFi7cpjovU/
         Lp37tB6Spkobpi2D6t0tJdBlLqgkLfbL3Cydo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538256; x=1764143056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYoXpA+s4Xw7eNcy3oGncEk540Tg0HhAAp5syAdVNHI=;
        b=CkL7O4Thrr+d8Hxwl5nhbXVfkDZs1EmQ3ni3RbI2VI2Vwsq2ZbiS+/Kc6LBfcnG01u
         YjVMXBNGqNEWTgqNGcSc/1GTZlFK1HEjPEfAR33aHz/zOhzgWDM5J0XdgX0cXYCsv7HT
         Qt0ZyNpfco0Gz7PGhxdplMEp90XZjCcrrrJ6w2rzfO5eatqIiHi+sUzi1s1HwtShKcd3
         Rruk760CMF4XutqRNTI3oFHwtGsPE+/DGO+qXoxsKVa3twbL/OGd5rj81DHQzOEItc/M
         FolCccn+8q4kOY+pg8qSfy31hcmdkJkUo8asOAv9m24e2vGTQe7CnlnrKdKQuE3e3HRt
         r/sA==
X-Gm-Message-State: AOJu0YzrbYpjof+/o5D1HSkWSQzIZPGY3ZGiPF13YHpdZK1FdLYpBJt/
	OA28AtitvPW4M8IKRzgImZn2dX8jI/kXvcpb2ihNl8LHTyhmUm85pBUj1ls9wBx6Z213MKCrSf2
	AU4CR
X-Gm-Gg: ASbGncvmV/fQlvppuEL6PcMsg3SUqZuXJief4f/PiH79lQm/4bOZiRvNj+nA08appMK
	y88Fz7Y8sHrCpgI6sLudZAwFyOWsFreqt9E5bIux4+DQhSwiVX4luouj7GclWtlornrcWLsJiXP
	mDFSottvFTWcFs6bJ7qcHW2q32k3CQHATmM0j+IaISZgrEQwq8NFFmtq94OG57jo8q2KOQUuQ9V
	RfiXoFSume4Rg1xO4UmO2WFdC5eA6iofwu6ytTnc/1qK/JgrFo93ODnvdPiVYbcxEEEiTuppunI
	g37cevYqGXqaxYFq5X1Auj+PvyB5pGgV8aLUPiw17Kv15VA21wszj78aij4M3eFVkxPX0uPd1z3
	2TwMilS4jkvcHPxdx2RiN5AY9b/24GaOUGUDdOrTfYaYRHuaxExLrH+A3zpNPaNgU0borKPm7yk
	XFjpg9eZBa68vXyC8k0ZODVE8q1q9AAAUmyTbK
X-Google-Smtp-Source: AGHT+IE8w9Jo5kms1FaVUFrFuK06CVCjLmyyGpjB4oOOlkuAcjKknDsBCHFOiQIFnvDo+zfdlO5pFQ==
X-Received: by 2002:a17:903:46c4:b0:297:e3f5:4a20 with SMTP id d9443c01a7336-2986a6f540dmr211627555ad.26.1763538256497;
        Tue, 18 Nov 2025 23:44:16 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcd:b4d5:5829:5269:5ea2:a966])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c23487esm194541685ad.20.2025.11.18.23.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:44:15 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/3] xwayland: Fix for CVE-2025-62229
Date: Wed, 19 Nov 2025 13:14:06 +0530
Message-Id: <20251119074408.51461-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226539

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-62229.patch    | 89 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
new file mode 100644
index 0000000000..634e8d44f1
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
@@ -0,0 +1,89 @@
+From 5a4286b13f631b66c20f5bc8db7b68211dcbd1d0 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 2 Jul 2025 09:46:22 +0200
+Subject: [PATCH] present: Fix use-after-free in present_create_notifies()
+
+Using the Present extension, if an error occurs while processing and
+adding the notifications after presenting a pixmap, the function
+present_create_notifies() will clean up and remove the notifications
+it added.
+
+However, there are two different code paths that can lead to an error
+creating the notify, one being before the notify is being added to the
+list, and another one after the notify is added.
+
+When the error occurs before it's been added, it removes the elements up
+to the last added element, instead of the actual number of elements
+which were added.
+
+As a result, in case of error, as with an invalid window for example, it
+leaves a dangling pointer to the last element, leading to a use after
+free case later:
+
+ |  Invalid write of size 8
+ |     at 0x5361D5: present_clear_window_notifies (present_notify.c:42)
+ |     by 0x534A56: present_destroy_window (present_screen.c:107)
+ |     by 0x41E441: xwl_destroy_window (xwayland-window.c:1959)
+ |     by 0x4F9EC9: compDestroyWindow (compwindow.c:622)
+ |     by 0x51EAC4: damageDestroyWindow (damage.c:1592)
+ |     by 0x4FDC29: DbeDestroyWindow (dbe.c:1291)
+ |     by 0x4EAC55: FreeWindowResources (window.c:1023)
+ |     by 0x4EAF59: DeleteWindow (window.c:1091)
+ |     by 0x4DE59A: doFreeResource (resource.c:890)
+ |     by 0x4DEFB2: FreeClientResources (resource.c:1156)
+ |     by 0x4A9AFB: CloseDownClient (dispatch.c:3567)
+ |     by 0x5DCC78: ClientReady (connection.c:603)
+ |   Address 0x16126200 is 16 bytes inside a block of size 2,048 free'd
+ |     at 0x4841E43: free (vg_replace_malloc.c:989)
+ |     by 0x5363DD: present_destroy_notifies (present_notify.c:111)
+ |     by 0x53638D: present_create_notifies (present_notify.c:100)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+ |   Block was alloc'd at
+ |     at 0x48463F3: calloc (vg_replace_malloc.c:1675)
+ |     by 0x5362A1: present_create_notifies (present_notify.c:81)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+
+To fix the issue, count and remove the actual number of notify elements
+added in case of error.
+
+CVE-2025-62229, ZDI-CAN-27238
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2086>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0]
+CVE: CVE-2025-62229
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ present/present_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/present/present_notify.c b/present/present_notify.c
+index 7d19d9cfe1..fe84d1f070 100644
+--- a/present/present_notify.c
++++ b/present/present_notify.c
+@@ -92,7 +92,7 @@ present_create_notifies(ClientPtr client, int num_notifies, xPresentNotify *x_no
+         if (status != Success)
+             goto bail;
+ 
+-        added = i;
++        added++;
+     }
+     return Success;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 73f5a05ce7..ba0ed6048e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
+           file://CVE-2025-62229.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


