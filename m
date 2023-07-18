Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DD3EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 06:01:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1849.1689660076757746005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 23:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=ivsF3fkH;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b8bbce9980so30962515ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 23:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689660075; x=1692252075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78X2F43s6EZJfc4b8ZHfdG76bFVWpFEqHW68kqwnmkA=;
        b=ivsF3fkHrnBqExRrGUB3Jp11+I9rfQ7CeaT71b2/cBUUlH5mw1rs76GCaiTO5nUp/g
         IF0ZfHPWGTQAp0GfIl+w17U5q3grNVZhDRgP2d2sND5YQJPYWxMTMuRYSsC9PqfpGiyB
         6uZb+NgVSNteaTbMExnnF1fjBRzOH6Xy7cbew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660075; x=1692252075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78X2F43s6EZJfc4b8ZHfdG76bFVWpFEqHW68kqwnmkA=;
        b=PTAH9t0gGgMPCcNBgeb/3B5fg9971Dbc5MQiFNSzXr2DFgvihkrKgEQzZu3zU4KSRN
         jwzCWPRIvBx6mpzZBQQEQsFdKf4qo/d2y6Llry7WcFiF2XnI3H7wGJtkQyq50vSuF+jl
         K+K8HsfWt6UDZL0mDy79mK34yoI4o7cS3IHyDLAMlsXYN8lyyRAO87bLqgyKiwKX5Sq3
         dzoQCmjrpGQLdSUEAxNoXUM4TUZYHinBahye1KIUU1bVOS4+VG5rK7Paq7euRh2oDsFA
         I9p64/gkwcs5KrfuXC8ZugjH8+jkAe24skcw+bo7Kr7RoK2WXkV3OXyHPxspNU56atqf
         XQmg==
X-Gm-Message-State: ABy/qLYNE2IXM/eu556oaolbfDc33Xlb+7vrKrMhjiFT5QS/JrTfi7wm
	F2vibUYug3vUSqam4zggLR99Qj89tX3I+KcF8uY=
X-Google-Smtp-Source: APBJJlGXY8IHuYfPVRvZnO9N/ywliSPR6hVrmfY5kSpDGbnQj202HUeS4vNYPWbpQtI5E8IOyXLyXg==
X-Received: by 2002:a17:90a:e38e:b0:25c:1397:3c0b with SMTP id b14-20020a17090ae38e00b0025c13973c0bmr11138024pjz.37.1689660075517;
        Mon, 17 Jul 2023 23:01:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c27:ab62:d500:faba:c7be:d3d3])
        by smtp.gmail.com with ESMTPSA id t7-20020a17090abc4700b00263ed4efa9bsm663135pjv.19.2023.07.17.23.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:01:14 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] qemu: backport Debian patch to fix CVE-2023-0330
Date: Tue, 18 Jul 2023 11:31:04 +0530
Message-Id: <20230718060104.988551-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 06:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184495

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2023-0330

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-0330.patch             | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7f2b52fa88..c6c6e49ebf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -93,6 +93,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-4144.patch \
            file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch \
            file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
+           file://CVE-2023-0330.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
new file mode 100644
index 0000000000..025075fd6d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
@@ -0,0 +1,75 @@
+[Ubuntu note: remove fuzz-lsi53c895a-test.c changes since the file does not
+ exist for this release]
+From b987718bbb1d0eabf95499b976212dd5f0120d75 Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Mon, 22 May 2023 11:10:11 +0200
+Subject: [PATCH] hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI
+ controller (CVE-2023-0330)
+
+We cannot use the generic reentrancy guard in the LSI code, so
+we have to manually prevent endless reentrancy here. The problematic
+lsi_execute_script() function has already a way to detect whether
+too many instructions have been executed - we just have to slightly
+change the logic here that it also takes into account if the function
+has been called too often in a reentrant way.
+
+The code in fuzz-lsi53c895a-test.c has been taken from an earlier
+patch by Mauro Matteo Cascella.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1563
+Message-Id: <20230522091011.1082574-1-thuth@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2023-0330.patch?h=ubuntu/jammy-security
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]
+CVE: CVE-2023-0330
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ hw/scsi/lsi53c895a.c               | 23 +++++++++++++++------
+ tests/qtest/fuzz-lsi53c895a-test.c | 33 ++++++++++++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 6 deletions(-)
+
+--- qemu-6.2+dfsg.orig/hw/scsi/lsi53c895a.c
++++ qemu-6.2+dfsg/hw/scsi/lsi53c895a.c
+@@ -1135,15 +1135,24 @@ static void lsi_execute_script(LSIState
+     uint32_t addr, addr_high;
+     int opcode;
+     int insn_processed = 0;
++    static int reentrancy_level;
++
++    reentrancy_level++;
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+ again:
+-    if (++insn_processed > LSI_MAX_INSN) {
+-        /* Some windows drivers make the device spin waiting for a memory
+-           location to change.  If we have been executed a lot of code then
+-           assume this is the case and force an unexpected device disconnect.
+-           This is apparently sufficient to beat the drivers into submission.
+-         */
++    /*
++     * Some windows drivers make the device spin waiting for a memory location
++     * to change. If we have executed more than LSI_MAX_INSN instructions then
++     * assume this is the case and force an unexpected device disconnect. This
++     * is apparently sufficient to beat the drivers into submission.
++     *
++     * Another issue (CVE-2023-0330) can occur if the script is programmed to
++     * trigger itself again and again. Avoid this problem by stopping after
++     * being called multiple times in a reentrant way (8 is an arbitrary value
++     * which should be enough for all valid use cases).
++     */
++    if (++insn_processed > LSI_MAX_INSN || reentrancy_level > 8) {
+         if (!(s->sien0 & LSI_SIST0_UDC)) {
+             qemu_log_mask(LOG_GUEST_ERROR,
+                           "lsi_scsi: inf. loop with UDC masked");
+@@ -1597,6 +1606,8 @@ again:
+         }
+     }
+     trace_lsi_execute_script_stop();
++
++    reentrancy_level--;
+ }
+ 
+ static uint8_t lsi_reg_readb(LSIState *s, int offset)
-- 
2.25.1


