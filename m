Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21A8C001E0
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:09 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.11575.1690052226850436173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rjpNO1tq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-66767d628e2so1772146b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052226; x=1690657026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqKTh6JU9E4o6Tbbl+uKMqcjQiPIz0h/9oxSjci2OVA=;
        b=rjpNO1tq8F0GKzyZ9xxUKIWbTLU2PeVG+ilvBBgmverTlNQKi0av9ChuFpKWLO0AUz
         eDu99Lig6Gih2DoP+8+20UdltOYKzktZBXtMgVh+kEiTXL1bwqQWCDGOngOMiCPTio8D
         KRrZDTt2qAFI46+vVTpQ7FhF3Rz4MZEsEPAfdD0nLXHjK44bh/CQQH6b57w/FH/D33gm
         j5zFgT6bOXoFRsghRitNcjRf6JIt/QepX1kqNLnTOqLz7rd6hQwEJ2GKCruxQqegvDHz
         F4dGvpuqYdsZZ1Qpl4rQbdn/RTJwEAqCJTh9YNkFMAb6ghUc5TVxAXE8afWdVPoWtuwS
         ZGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052226; x=1690657026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqKTh6JU9E4o6Tbbl+uKMqcjQiPIz0h/9oxSjci2OVA=;
        b=QuiBpOJiUZyWWcPEThzT3Ule+s93NdEBnqh5SJ/9rZGWPylMB9AxM8WZTEXvfmQ6Dh
         qiOP2aNucfENeoHoFatHCSvjq6MjcGXwHZJRrdQuEEQ1g0Zt2PRvwhr4qlS9h+0genwd
         AAjQi6Mnvb2IDYGf01dVc6mv2Bu14v2lXnsmUqALIHCfdO52zfj2BZXvHkI9r6GPerU6
         5RTdgGeIpJl6fMFUi0SNF4NNj0fvcIArj2yLEF4MhrXo5B1wnfvYhLRWaszDKZup4NES
         mP1cQHgHQEEXfDhhMQG6mgt/AIQbGHgOeXeIxcgK5xpAZGaycF+kDeNZGXiT1GyLsBqk
         2bQw==
X-Gm-Message-State: ABy/qLaA+MAkCX889xuR/qttaD+wla3CLiZVaIejeIS/BAUYSxJ/iKWs
	GcEHKbzbAqsgL63yerJOb22pNLuUV6A5bLVbfAY=
X-Google-Smtp-Source: APBJJlFqeyoKSwwuVgY1+ifFPbIUO27PVyYgQkdOWGZtn6SbhD3JbllPMRna78ZdjOQgFqUgdl6D4A==
X-Received: by 2002:a05:6a21:6d99:b0:138:dbff:f41b with SMTP id wl25-20020a056a216d9900b00138dbfff41bmr2089650pzb.27.1690052225877;
        Sat, 22 Jul 2023 11:57:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/11] qemu: fix CVE-2023-0330
Date: Sat, 22 Jul 2023 08:56:45 -1000
Message-Id: <3be283237a9e473112430bcb614b25b7ff7e64b2.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184724

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability in the lsi53c895a device affects the latest version
of qemu. A DMA-MMIO reentrancy problem may lead to memory corruption
bugs like stack overflow or use-after-free.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-0330

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-0330.patch             | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4c9be91cb0..15eba6163f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://ppc.patch \
+	   file://CVE-2023-0330.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
new file mode 100644
index 0000000000..f609ea29b4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
@@ -0,0 +1,75 @@
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
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]
+CVE: CVE-2023-0330
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ hw/scsi/lsi53c895a.c               | 23 +++++++++++++++------
+ tests/qtest/fuzz-lsi53c895a-test.c | 33 ++++++++++++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 6 deletions(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 048436352b7a..f7d45b0b20fb 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1134,15 +1134,24 @@ static void lsi_execute_script(LSIState *s)
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
+@@ -1596,6 +1605,8 @@ static void lsi_execute_script(LSIState *s)
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


