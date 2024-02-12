Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1EFC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:47:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.3963.1707734850293355505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 02:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dB8CQW9U;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d95d67ff45so21340025ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 02:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707734849; x=1708339649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCyitrHlZwujh7JpOUjcG9GqBQhvaKF43hRl9QIShfQ=;
        b=dB8CQW9UgR75+1oMos4f5l0Pf6VoAKa1U4Z8WSapiLAwXslS1cgEKQiLRlwBXcK/he
         miL+PxqTx9SEptwQkjdBN7pRd4O/YJysi+Ifh5K7uoa4i799WbcnUdtKIA13P60HedF3
         G++a0n458OaOTOq+QSVpkJ5EH2H8s2JCXs37jmu6MyUQLzUURZmJ/XvSXBzWlNiSl2JK
         i13ktuyZlYXtnJOFX4vV6nVRV46vf84MZQmr3HRLVIEPpdzYITrAa3qxECXnazFT2z7K
         +GqJ09mg+7O8SamKw19DR/4upTr0l4N2khm8AZetIzEkBoZXlcnUhz+feZ+PfPauKY3T
         xtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734849; x=1708339649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCyitrHlZwujh7JpOUjcG9GqBQhvaKF43hRl9QIShfQ=;
        b=o/bxpPo9i6/Tk4sEukAzSwbz1lD+gQ+rVToQQO4AmoRBnez7dXPWh3N2nhLRpduApZ
         cNtpvV1yfhYevkwngReDJ4KsSAe9WuniWN3/7pxMho6YF1BgyK/q001XCOblAGaYQvvO
         EU8V1gC01TylkbpzFW3Pl9JUGOZtVCBQiyG7n4AAJ2ZH4Vm5bgNFK8g+rtGrUGy2uqWx
         NxSDcQteMrqTwjvMSE44T2MHg35tj50drpXqPOpUUdu7uBYBi71NYJHVnTb/thD/6VV5
         kFmC6RJfCqsVrB/0BVjJZViWzhRQvyrOFm9P8nRciplOs2ZgIgbFHvnSkTtT0SMDSmtA
         DOzQ==
X-Gm-Message-State: AOJu0Yz0ICedG+BfsfeggxfhoNwn3SzG4DEBvasKzzTx2sy+fPc7Dc3K
	DrH4EqJN2Ec8DQLzkhj+cdnZ7H979C9GYoIvtZXQyusnWSgsWGbC+jdlBDX8
X-Google-Smtp-Source: AGHT+IFF3637iWISlzKZ6Bj070GHZiyWsq7Aky/+CdNgHJOL2ccByvEcvEd+jasjPoimpahA4OQOCQ==
X-Received: by 2002:a17:903:22ca:b0:1d9:d8d2:eabb with SMTP id y10-20020a17090322ca00b001d9d8d2eabbmr5991514plg.46.1707734849467;
        Mon, 12 Feb 2024 02:47:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX82Oetx+UUUvE6etFPiI0tmxWrOiDncIZHyXy4aZnwsNQtt0W/BI+DnszqVj2ffvb+G5UwaHcOSCKPbplFT8qgMaqb3gTp
Received: from L-14805.kpit.com ([43.231.237.204])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001d986ce6893sm95746plb.198.2024.02.12.02.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:47:29 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: virendra.thakur@kpit.com
Subject: [OE-core][kirkstone][PATCH 3/3] qemu: Fix CVE-2023-42467 Disallow block sizes smaller than 512
Date: Mon, 12 Feb 2024 16:16:47 +0530
Message-Id: <20240212104647.376386-3-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212104647.376386-1-ppjadhav456@gmail.com>
References: <20240212104647.376386-1-ppjadhav456@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 10:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195309

From: Poonam Jadhav <poonam.jadhav@kpit.com>

We are doing things like

    nb_sectors /= (s->qdev.blocksize / BDRV_SECTOR_SIZE);

in the code here (e.g. in scsi_disk_emulate_mode_sense()), so if
the blocksize is smaller than BDRV_SECTOR_SIZE (=512), this crashes
with a division by 0 exception. Thus disallow block sizes of 256
bytes to avoid this situation.
Link: https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-42467.patch            | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9f85aa846c..f97dcf289e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -105,6 +105,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-5088.patch \
            file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch \
            file://scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch \
+           file://CVE-2023-42467.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
new file mode 100644
index 0000000000..d53683faa7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
@@ -0,0 +1,46 @@
+From 7cfcc79b0ab800959716738aff9419f53fc68c9c Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Mon, 25 Sep 2023 11:18:54 +0200
+Subject: [PATCH] hw/scsi/scsi-disk: Disallow block sizes smaller than 512
+ [CVE-2023-42467]
+
+We are doing things like
+
+    nb_sectors /= (s->qdev.blocksize / BDRV_SECTOR_SIZE);
+
+in the code here (e.g. in scsi_disk_emulate_mode_sense()), so if
+the blocksize is smaller than BDRV_SECTOR_SIZE (=512), this crashes
+with a division by 0 exception. Thus disallow block sizes of 256
+bytes to avoid this situation.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1813
+CVE: 2023-42467
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Message-ID: <20230925091854.49198-1-thuth@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2023-42467
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ hw/scsi/scsi-disk.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
+index e0d79c7966c..477ee2bcd47 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1628,9 +1628,10 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
+          * Since the existing code only checks/updates bits 8-15 of the block
+          * size, restrict ourselves to the same requirement for now to ensure
+          * that a block size set by a block descriptor and then read back by
+-         * a subsequent SCSI command will be the same
++         * a subsequent SCSI command will be the same. Also disallow a block
++         * size of 256 since we cannot handle anything below BDRV_SECTOR_SIZE.
+          */
+-        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
++        if (bs && !(bs & ~0xfe00) && bs != s->qdev.blocksize) {
+             s->qdev.blocksize = bs;
+             trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+         }
+--
-- 
2.25.1


