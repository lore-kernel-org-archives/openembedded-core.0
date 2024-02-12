Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6395CC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:47:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3957.1707734835167257998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 02:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PaUzInwI;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d76671e5a4so25038115ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 02:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707734834; x=1708339634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xmfBw2zxluvWVmLe9XROWse0ks0Fo6vsX5K3UQY3Qk=;
        b=PaUzInwI5gCsnOKtYwI3BYtS2evIrJNMwQ4li638RXPJbcINwHMutfukQTBSpBz+6t
         s9pRmZ2Bztcy+GicVPzGrmRelSiqlsoecS07CQqCL3WIotCSL922hPT+FhKAHj9KZCET
         liKazpy8Y+4B3JUXBs11JMNOZ96VDet4QGT692haqDlKW7mZjNtKW66KTAlVW+oeHA8q
         Ahb04VwHKZU4ZejxSmiOgSemOj2mmEFXHhMvTQf0NGG+Mp838kHYcVyJoKkI/rAdmPsh
         BhFs+C4PH95Fv6xVZ6iIoZ0gJardAfXimgCC2H0XqY6XEhkwN8ZbBBnkwHk76PRjwBgv
         XjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734834; x=1708339634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xmfBw2zxluvWVmLe9XROWse0ks0Fo6vsX5K3UQY3Qk=;
        b=nwXY5maIjRwUcw8A0wZ/ILHltiSbJI/9oAptRXhMkeAilR4QTAillk2nwmzheLGXbf
         WqCTywR3jp/KdxvZZbQsAF9m8+nKBkImyl9y9XhFfDOUMmvA+JqzfLYU7P7L4EBAXPUR
         AtFiOT1dqKAA07UU6XZ53U7prJ8X+w3mnM/obWN8DYtCHXripxj3g56ynqO5O+jHxu44
         HveCTyB1LbbTyXgreuMRLsVkRGNCOy07sz59naXfkY3VYS77wfh2afTh5LcaYjezDk1S
         M8zhgG1o+cArIO1wri0/6cVMfQFe9Uq9MTVMgGIAQ8wXJOusMquN1kBImpAYQZltX1K0
         mILA==
X-Gm-Message-State: AOJu0YySEG1/dUildM9nG7xtlK/U1opcUw2BtYtsufiZ5dNhPtIRshMr
	Y3igatuKm4bgupmfRcS8oCcRQbG0qycF3MF3rksBdJZ+/deqP8Nu//Z2qn0I
X-Google-Smtp-Source: AGHT+IEJh9N4CYJ4yeyAAdorBRGblu6IvbkG9oERUkhXtzDz2BPx1S6mHQUb0aa8TVjGvt3YjTZ8tA==
X-Received: by 2002:a17:902:b589:b0:1da:1daa:e2bd with SMTP id a9-20020a170902b58900b001da1daae2bdmr6560056pls.19.1707734834245;
        Mon, 12 Feb 2024 02:47:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkQKnzzAMtalndqeR0QTAx/OnZe84D7R+OP4hy3J5xGxMivWKGyzQdTWXWWdhtGZ1ioCPjLmqZR+/J9cKpRalTmnJhu8Mx
Received: from L-14805.kpit.com ([43.231.237.204])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001d986ce6893sm95746plb.198.2024.02.12.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:47:13 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: virendra.thakur@kpit.com
Subject: [OE-core][kirkstone][PATCH 1/3] scsi-disk: allow MODE SELECT block descriptor to set the block size
Date: Mon, 12 Feb 2024 16:16:45 +0530
Message-Id: <20240212104647.376386-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 10:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195307

From: Poonam Jadhav <poonam.jadhav@kpit.com>

The MODE SELECT command can contain an optional block descriptor that can be used
to set the device block size. If the block descriptor is present then update the
block size on the SCSI device accordingly.

This allows CDROMs to be used with A/UX which requires a CDROM drive which is
capable of switching from a 2048 byte sector size to a 512 byte sector size.
Link: https://github.com/qemu/qemu/commit/356c4c441ec01910314c5867c680bef80d1dd373

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...lock-desriptor-to-set-the-block-size.patch | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c5fb9b1eab..13355238e8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -103,6 +103,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2023-1544.patch \
 	   file://CVE-2023-5088.patch \
+           file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch b/meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch
new file mode 100644
index 0000000000..d8e48d07dd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch
@@ -0,0 +1,54 @@
+From 356c4c441ec01910314c5867c680bef80d1dd373 Mon Sep 17 00:00:00 2001
+From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Date: Wed, 22 Jun 2022 11:53:12 +0100
+Subject: [PATCH] scsi-disk: allow MODE SELECT block descriptor to set the
+ block size
+
+The MODE SELECT command can contain an optional block descriptor that can be used
+to set the device block size. If the block descriptor is present then update the
+block size on the SCSI device accordingly.
+
+This allows CDROMs to be used with A/UX which requires a CDROM drive which is
+capable of switching from a 2048 byte sector size to a 512 byte sector size.
+
+Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Message-Id: <20220622105314.802852-13-mark.cave-ayland@ilande.co.uk>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Comment: Patch is refreshed
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/356c4c441ec01910314c5867c680bef80d1dd373]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ hw/scsi/scsi-disk.c  | 6 ++++++
+ hw/scsi/trace-events | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
+index db27e834dae3..f5cdb9ad4b54 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1616,6 +1616,12 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
+         goto invalid_param;
+     }
+ 
++    /* Allow changing the block size */
++    if (bd_len && p[6] != (s->qdev.blocksize >> 8)) {
++        s->qdev.blocksize = p[6] << 8;
++        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
++    }
++
+     len -= bd_len;
+     p += bd_len;
+ 
+diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
+index 8e927ff62de1..ab238293f0da 100644
+--- a/hw/scsi/trace-events
++++ b/hw/scsi/trace-events
+@@ -338,6 +338,7 @@scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 ", count %u)"
+ scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
+ scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
+ scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
++scsi_disk_mode_select_set_blocksize(int blocksize) "set block size to %d"
+ 
+ # scsi-generic.c
+ scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
-- 
2.25.1


