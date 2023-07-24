Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FDDC41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.39766.1690166024556210915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=f26xBHmC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6687446eaccso3682239b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166024; x=1690770824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMWdzChQD4oGPfaSSdkb8H5OQMQpCQg6q5UpPVqvY9s=;
        b=f26xBHmC3Ukh0Ekc5MeQBi566KpyfFx+tx4b4ortgoF2P0KvMnS9hJp6PuOLZQxCbe
         irNo3v/9nJHY09CnUHXZm343q8ODBjsqtGW5k/uBvE81df0kN/Y0L/WkVLyM9Knkg6E7
         /gszf5sYdZVg5E+ZFoJiMT/frWpx1bQeH5u7hcZVBrxa6HF0EPbZUPt8JdW46uzVcKY9
         TeMceIxfHzZlleMhp47wpPoisQx/tN//Qp4j4QJMnb8VO9tYRv3S8/Y1UqSl7t/MaFKj
         8Stj9of+/qIZiEpZbORbhdhKwE9hRH84Mytk51TwbaH4s+GvR5p/7/Jxu0xbnjZmpl19
         DlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166024; x=1690770824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMWdzChQD4oGPfaSSdkb8H5OQMQpCQg6q5UpPVqvY9s=;
        b=C/wNzFmwpYfjk28FVyZYABNuGcwg6vKki9ylRxK3UbntVIvhSXsf+nsYoFKktktxih
         upv6Cz2JTAJu12k9d0zjFDlgcvWtaR7iFXVBNClRS3mSE2A/5Ow1TR03M6Lolt9vtwWl
         dRKFWhnU4LGe0vca+jS3sFM3oFgMYRpMocmSjPbnuKT6q1RPHieDdQp+FA0XTLUJ8t0l
         GlGLnKmr4D84xrmzXk2xsCNdn0vcI8KFZnWd4k6bHU6NXll8ZPGa22oCvzr6vSHBigem
         4ld7NSBTwu2h30fyNPh1UK/WEBgozUV6Xq8Li0L7GtjVnsf1+Fd2IoumPzsc3oIZ6E5g
         Baxg==
X-Gm-Message-State: ABy/qLZgdoRYDs4EiVq8ClC0uHIEk9ELGhRwSO1ejWMioELF9fq4Q0I3
	F2y+D3kyPOwP16nZb5ZbXuDJouLb24agOm28uRi15Q==
X-Google-Smtp-Source: APBJJlFTJYaiBZz1OzpK8LFZYjdYLNQXxFBQgqbkUdY11x2lsXw7VVHuU6A0Yx13GrVERkZExfjn1g==
X-Received: by 2002:a05:6a00:170b:b0:686:2526:ee70 with SMTP id h11-20020a056a00170b00b006862526ee70mr10201072pfc.14.1690166023480;
        Sun, 23 Jul 2023 19:33:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] qemu: backport Debian patch to fix CVE-2023-0330
Date: Sun, 23 Jul 2023 16:33:26 -1000
Message-Id: <aae5bf06ad3c67386544f9da55aa21fbf32c3418.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184770

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2023-0330

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


