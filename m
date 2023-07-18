Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB79C0015E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:30 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.11603.1689696087558712986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ly38kCZ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so3876880b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696086; x=1692288086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WlHpxdVi93Uvy53gvhv9CgoAYooIq/b5Mj1caXVW/Y=;
        b=Ly38kCZ6EqfsklU6OJkjf6nCoUwwzQQgG2+5JLq84THsSkauCUId7k9rwR+qwC4rCn
         +L8IUp7dBe2q/Fx0hF3gyOJyUvVKdFjjqp3LW/1hLrDCo8/YtWz8gA05l+qYBdHarPt5
         yvg3wMDae0W0uGJeC2/Q3CCHQ7r33AVQzda1VwoM2zHF3yIKAkAOfXFZN08TEK087SXU
         Pj/w6Gz1fhBAPnmfxKYmunAYRrhHWnFKEMI05f5CbQ6yyBGzVtH2TykPWMI1bcDbl3ua
         U92W/ZvSByQvB8UwVIsVy8NNp66cujjdOd+n/1Ttj6mYGcfQ4RTnAUX99eBHqSRXnsX5
         nRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696086; x=1692288086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WlHpxdVi93Uvy53gvhv9CgoAYooIq/b5Mj1caXVW/Y=;
        b=UTLH7dOktMvWs+2Pf8jSRbrYquFUGv8Q28vNvnJK29I0GGWmsEYlDCizNv9IJMOWaC
         W0U1PV3bS84xqPl64vME09hs78NcKNCM+aXG+IK2qx8Gb0bEw1DWZSO4BLqQrDYtOhWt
         myCPCwdSgXEsrV82hOfzgMSCpzZUI0r9fHejHkBmKiByz4M1vbZZC18UB57bm4rSYjUd
         g78uvHLHOfGXVzqm/kTiqWsuP18B9eKeLjHWtbnsJEOG4M5LRnJy7bBIVRskrpxuOaBv
         t1lNKYUSjXiDOwlBr8gaR+7tXLiAg7S1I3PFxfg2TrD+9Km/6A/hX9MxGnyDlc5EPWfg
         3mIg==
X-Gm-Message-State: ABy/qLYgccxcEP2y/3rj7Dfoo4BRtsI6aHZnBgxpSqD9VjBio6Foal5K
	KGAwOoVvsOnTRFfHDYdBRzpUqb8yG/EGyytM7gk=
X-Google-Smtp-Source: APBJJlECZqhoDWW6Z3Cq3AD8aMl9g+KrHnH6KGmr/AIXaghXVXQ6s0HVKHACs9qBjCMs1qxsfivgSg==
X-Received: by 2002:a05:6a00:cd4:b0:668:9bf9:fa70 with SMTP id b20-20020a056a000cd400b006689bf9fa70mr17191179pfv.34.1689696086592;
        Tue, 18 Jul 2023 09:01:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/13] qemu: backport Debian patch to fix CVE-2023-0330
Date: Tue, 18 Jul 2023 06:00:56 -1000
Message-Id: <559327579bcee685c6dc22b7ad5595960aa896c0.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184542

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2023-0330

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/focal-security
Upstream commit
https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-0330.patch             | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8d6c4050f7..352277573b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -137,6 +137,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3409-4.patch \
            file://CVE-2021-3409-5.patch \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
+           file://CVE-2023-0330.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
new file mode 100644
index 0000000000..26e22b4c31
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
@@ -0,0 +1,77 @@
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
+Reference: https://launchpad.net/ubuntu/+source/qemu/1:4.2-3ubuntu6.27
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches/CVE-2023-0330.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]
+CVE: CVE-2023-0330
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ hw/scsi/lsi53c895a.c               | 23 +++++++++++++++------
+ tests/qtest/fuzz-lsi53c895a-test.c | 33 ++++++++++++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 6 deletions(-)
+
+--- qemu-4.2.orig/hw/scsi/lsi53c895a.c
++++ qemu-4.2/hw/scsi/lsi53c895a.c
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
2.34.1


