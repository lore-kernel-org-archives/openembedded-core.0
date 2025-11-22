Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6344CFD302
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3753.1763849685303655565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VzjGt5Tk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34585428e33so3133952a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849684; x=1764454484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCgl0Cl/qcIjFazLk15gg1DahK1vWogkZe4DxmSkXH8=;
        b=VzjGt5TkM/CwGjCXErRBbnB+v0oUTmc9E4OC/gXKLxhPh/NYuos6rlHMdiWkuI1elZ
         5V8L+usrO6YrD+PSiCOZgsG6U5aZGD84v4u2p7MwsKNQcRiv1FSILtHBbxLmHzK2tjBo
         Bk70FlPX+OImJ3FTp/mbeoXr/bM98AB8Z+B7j9nSWY8ejvpNhO+5MsRJARa6QcSC7Kes
         nROEvmxTKkB0A0KAnWI7qa63srYrRB+BqviChKYNgaz1AUwkROukvv4TO9RG5Fj++14P
         X1B+iOpmuvCUgA4RXzNaiVIi4cRljnvzLxOfjyKD/shlw+yxGki9Zo4lwL9K2qeezS+K
         36nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849684; x=1764454484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VCgl0Cl/qcIjFazLk15gg1DahK1vWogkZe4DxmSkXH8=;
        b=RIQTwJzKl9labLxKc1v6+z0QFRqnY+08yrgeSN0sg3l5I7shAO/+auf5MZwSwYBAKt
         i0kz5U2AQAaWQRTlgOoqxDN8W4TI62oPGEgpNFEQU4ibAFjoOx6+AL/U4OaT7Jnpt5vr
         Yr87STJs1K9lxHDpKKgVibTQEq/PtGGkiuUiy2OIxEAri3nINsXpqoVayl21ltdvgSl8
         5YfPIsLJayRsEnXtkXzUNg/cjtiW3eLFiF8JOYvDEPsiCkmYv8gGIDu7N6zvEvgQZsnA
         g8FAOAVvXC65DphBPKcIv2nDez6Pswyr7+wTF/YXwa0ovTmfYNETRXJ90CkoNKxIkdcR
         mOUw==
X-Gm-Message-State: AOJu0YwEetJ9nSxAmqhfN+rXEHq8siCRYXyIh9evuOXqcAte1Zo7irwY
	ZJlFt8Wm2fuRZP1/X3yLcoHjb+SKt5bpQXnC2sXC2H4/UKA+C9AoNtjDD1uWXqBtgV4c/j1Y2Ge
	uJ2Rg
X-Gm-Gg: ASbGnctaJnfMTQR3L+bTSbYCk91M/cx7iMK/pyz7IDHwb78iaemV7xJETC7WDbaqefO
	K1fyG1rtoPV9S4F+wGti5V4UzRwklyBUpeUGOF5/X11OcYx/VkCYq5cb8sPdjLfph6GT4FEOa8V
	9pDGYCIK3WkntLvXofUhIr9VOfF3C1bcMhV/CiRcPCxQqblvoDmierITUvyU/D/tvZNh7kNlYWL
	gDPNAzbgz9p9sQtJZxYoWqT0Oj5dVxhXT1W31F8YldQ8VQXXUeHG7v0VJQFkSdJFikBwNiaLi3g
	xb/bjdlceM1VQVE6KP4ljXRsMzRqbGv4oItpiA7DE9q3hMS3A7cWhv8eK5Nz1dpkXuFyR3xj1Eu
	3Uihwf7XEx23YIPDAUNG5fR8eUyxQinO648GwLGWx2BDf0JbhCPyymDsc2DkAapJ5+osT5TbJA8
	ZYhA==
X-Google-Smtp-Source: AGHT+IFw/uDb5Z3+hLXjYpxvuMYrgwhgRVf6ZrrdJ+zGBPO5CWIidWpk/qgSOv7sP62es+g4l23C9g==
X-Received: by 2002:a17:90b:4b03:b0:343:747e:2cab with SMTP id 98e67ed59e1d1-34733e2d39emr6966193a91.8.1763849684519;
        Sat, 22 Nov 2025 14:14:44 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/21] xwayland: fix CVE-2025-62229
Date: Sat, 22 Nov 2025 14:14:12 -0800
Message-ID: <3d606cc94e5ce42b836878578fa271a72bc76015.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226704

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the X.Org X server and Xwayland when processing
X11 Present extension notifications. Improper error handling during
notification creation can leave dangling pointers that lead to a
use-after-free condition. This can cause memory corruption or a crash,
potentially allowing an attacker to execute arbitrary code or cause a
denial of service.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-62229

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-62229.patch    | 89 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
new file mode 100644
index 0000000000..f27bd00434
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
+CVE: CVE-2025-62229
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ present/present_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/present/present_notify.c b/present/present_notify.c
+index 4459549..00b3b68 100644
+--- a/present/present_notify.c
++++ b/present/present_notify.c
+@@ -90,7 +90,7 @@ present_create_notifies(ClientPtr client, int num_notifies, xPresentNotify *x_no
+         if (status != Success)
+             goto bail;
+
+-        added = i;
++        added++;
+     }
+     return Success;
+
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 49e35ca442..1ed5df8a2e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
+           file://CVE-2025-62229.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


