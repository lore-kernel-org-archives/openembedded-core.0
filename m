Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF48EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 13:56:23 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.19836.1689342977408414662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 06:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=a8r8CS2E;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-54290603887so1116089a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689342976; x=1691934976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ1PZNEMCATAt6dcL/EtPkqMLq1Z1nQO7Qm6QfhI0gU=;
        b=a8r8CS2EfSREZ5GIFmOtw3oh6k9WgcpvUMwPYF6RCVqBkBONE/hJjifid+Og2Tb/3F
         pMdzKDc88eSATyLWmrD+n4B1Z6SOA4L7O1lj/SIBaBYUO6q9APRfj+B42PMtmDq/7Rn9
         h+IclEDFn/gQH+JCn7rnp/Bwi367rRt/P8Fxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342976; x=1691934976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ1PZNEMCATAt6dcL/EtPkqMLq1Z1nQO7Qm6QfhI0gU=;
        b=MPCTOvO2CBmBKgYjHzcunvRMohq/1xVda+yN0na6voLU4ZLfcnmqgVyN2jva7Lkk1O
         MYit3dN7F1WwbBKCUMRZXoyxSxRV5WAkZmcVSGfb6ek2keXwTkFbLeBi83jD/3XVDfI4
         fIy6aSiFGW9MDO8lO/4qRs2fl+ybCQbmtP7QqPjnfxRgnnMDZbwDrWckrNflQqlNzQKD
         VUEO9fJAIGdjZ3wxehjnFYLrSTxPi6ZMH1s1p6wZbiLbyXqsVlnetN3sbAtjvCp3uOve
         4hE0J+H/mcDlkNLqhs/Sz6KTqZkuvT0WYuuBXtmNB8UiylLfrirvB5TLbIah0OIhkqoM
         48Qg==
X-Gm-Message-State: ABy/qLbVIZiGF5zYf704O/idMiwRczFrY5c5cEXBjUtWo8wpKCmKzyTS
	RRgpQOUo9N9HBWXmlGvMdEi4Qj8w9sIidLy0en8=
X-Google-Smtp-Source: APBJJlEnFEzad7/8ATX/Va6EuPel5T1XRd3WO1PNCdvWTv8SycOlwL08UV2nB9UxIvZbRoDHMUCu1w==
X-Received: by 2002:a17:90a:8407:b0:263:ebab:a152 with SMTP id j7-20020a17090a840700b00263ebaba152mr3193516pjn.19.1689342975397;
        Fri, 14 Jul 2023 06:56:15 -0700 (PDT)
Received: from MVIN00020.mvista.com ([106.201.2.185])
        by smtp.gmail.com with ESMTPSA id 20-20020a17090a199400b00263ba6a248bsm1250540pji.1.2023.07.14.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:56:14 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: backport Debian patch to fix CVE-2023-0330
Date: Fri, 14 Jul 2023 19:24:02 +0530
Message-Id: <20230714135402.1664938-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184266

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2023-0330

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/focal-security
Upstream commit
https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


