Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75860C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:40 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.101496.1709565810862274174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AlP6GYGZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so3430749a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565810; x=1710170610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sb84XiNmPcz+p3oDaq2vnOTgISFP4QYkOYSvolqDX8=;
        b=AlP6GYGZFd5ETa99hRlxlh40d8eaKWAqBVY510SRpbEClLAp+dEA/tbcaD+/MnfVC5
         iaWW8pHsSUY7y2MAc8Jx6h4G6c9tnyy+UnpGX+vwLEqKtzf/22CzOW0VeHnBbVdOXNg/
         xbKtBlElXxqa/nWPcSY0EAsh2ZvRx2+aTWOQqQqBdLn3MzH859uVhDYGymafJKApNz1M
         +qc5V3xx8jX8e8+B+MvB1+ATrZneNYVSWCy0e5RMXQCRDvm5vNAVvYlMaGivYznHkqW+
         45yoci0+86OTkF+Ym+WVnc+LJOPyrp9MdQ4E3far61mcU92cIiI/5Ccj7Df3WTvFrA4q
         vrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565810; x=1710170610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sb84XiNmPcz+p3oDaq2vnOTgISFP4QYkOYSvolqDX8=;
        b=wdzC9Gh2QLCGqB/N5HW/HZrUllbVUa+hJ2ogXYPyicMIYCpSQGbjOiCetNndxd47UU
         NtPCS1p7LM6r+kih7A2Jh4nAMxCaE9utPYvxoQ/qARRLLK3U62JVGcpLaTCzAU35Ln1H
         1bFgnYo2wUzrdMNLkWIZPh3/Y9LPC3GWyoIIz9aXAEu7TTORFdaT4A23CGwe/x/ZcDpW
         6HekV91AnoolRH0lJ9KvztOtzjb4j/kC48bj5JM8PP0+vR90pXtmqvl6OemG44Rafabf
         xaf744FC0Qy2moND1EqNlCoksS4cdhk1h/cU7TJXRrJf4MZbwL50Bl3zc9fihmUxPH/U
         08gw==
X-Gm-Message-State: AOJu0YxZNYuUUSUkib+FVJ0NK/zscurCuTFXgIhPN0mX/YplyVCnMcJE
	YRXnXQAJY1fXF9OphoDBfvKiG9sXf1+JwWjIL4hbVMGfBND/Hh9Ty88MQ3Z6bW+rCL3tte1Pq88
	PGhU=
X-Google-Smtp-Source: AGHT+IHFoLzc0V5g+sF4qOXy+P2GQJk23OezgB7qjZKrrywdKR6J0VneoyEZr5+0QwmqfRy/LSq0vg==
X-Received: by 2002:a17:90a:d48c:b0:29a:bb75:d727 with SMTP id s12-20020a17090ad48c00b0029abb75d727mr5854296pju.44.1709565809950;
        Mon, 04 Mar 2024 07:23:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/11] qemu: Fix CVE-2023-42467
Date: Mon,  4 Mar 2024 05:23:10 -1000
Message-Id: <e9af3d328db8a32c22bb0798fa8dbb749e3f607b.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196603

From: Poonam Jadhav <ppjadhav456@gmail.com>

1. scsi-disk: allow MODE SELECT block descriptor to set the block size
Link: https://github.com/qemu/qemu/commit/356c4c441ec01910314c5867c680bef80d1dd373

The MODE SELECT command can contain an optional block descriptor that can be used
to set the device block size. If the block descriptor is present then update the
block size on the SCSI device accordingly.

This allows CDROMs to be used with A/UX which requires a CDROM drive which is
capable of switching from a 2048 byte sector size to a 512 byte sector size.

2. scsi-disk: ensure block size is non-zero and changes limited to bits 8-15
Link: https://github.com/qemu/qemu/commit/55794c904df723109b228da28b5db778e0df3110

The existing code assumes that the block size can be generated from p[1] << 8
in multiple places which ignores the top and bottom 8 bits. If the block size
is allowed to be set to an arbitrary value then this causes a mismatch
between the value written by the guest in the block descriptor and the value
subsequently read back using READ CAPACITY causing the guest to generate
requests that can crash QEMU.

For now restrict block size changes to bits 8-15 and also ignore requests to
set the block size to 0 which causes the SCSI emulation to crash in at least
one place with a divide by zero error.

3. Disallow block sizes smaller than 512 [CVE-2023-42467]
Link: https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c

We are doing things like

    nb_sectors /= (s->qdev.blocksize / BDRV_SECTOR_SIZE);

in the code here (e.g. in scsi_disk_emulate_mode_sense()), so if
the blocksize is smaller than BDRV_SECTOR_SIZE (=512), this crashes
with a division by 0 exception. Thus disallow block sizes of 256
bytes to avoid this situation.

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  3 +
 .../qemu/qemu/CVE-2023-42467.patch            | 46 +++++++++++++
 ...lock-desriptor-to-set-the-block-size.patch | 54 +++++++++++++++
 ...ero-and-changes-limited-to-bits-8-15.patch | 67 +++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d3e6ced988..ad6b310137 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -105,6 +105,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-5088.patch \
 	   file://CVE-2024-24474.patch \
 	   file://CVE-2023-6693.patch \
+           file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch \
+           file://scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch \
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
diff --git a/meta/recipes-devtools/qemu/qemu/scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch b/meta/recipes-devtools/qemu/qemu/scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch
new file mode 100644
index 0000000000..1e1be683fc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch
@@ -0,0 +1,67 @@
+From 55794c904df723109b228da28b5db778e0df3110 Mon Sep 17 00:00:00 2001
+From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Date: Sat, 30 Jul 2022 13:26:56 +0100
+Subject: [PATCH] scsi-disk: ensure block size is non-zero and changes limited
+ to bits 8-15
+
+The existing code assumes that the block size can be generated from p[1] << 8
+in multiple places which ignores the top and bottom 8 bits. If the block size
+is allowed to be set to an arbitrary value then this causes a mismatch
+between the value written by the guest in the block descriptor and the value
+subsequently read back using READ CAPACITY causing the guest to generate
+requests that can crash QEMU.
+
+For now restrict block size changes to bits 8-15 and also ignore requests to
+set the block size to 0 which causes the SCSI emulation to crash in at least
+one place with a divide by zero error.
+
+Fixes: 356c4c441e ("scsi-disk: allow MODE SELECT block descriptor to set the block size")
+Closes: https://gitlab.com/qemu-project/qemu/-/issues/1112
+Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Message-Id: <20220730122656.253448-3-mark.cave-ayland@ilande.co.uk>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Comment: Patch is refreshed
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/55794c904df723109b228da28b5db778e0df3110]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ hw/scsi/scsi-disk.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
+index 3027ac3b1ed6..efee6739f9ad 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1532,7 +1532,7 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
+     int cmd = r->req.cmd.buf[0];
+     int len = r->req.cmd.xfer;
+     int hdr_len = (cmd == MODE_SELECT ? 4 : 8);
+-    int bd_len;
++    int bd_len, bs;
+     int pass;
+ 
+     /* We only support PF=1, SP=0.  */
+@@ -1617,9 +1617,19 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
+     }
+ 
+     /* Allow changing the block size */
+-    if (bd_len && p[6] != (s->qdev.blocksize >> 8)) {
+-        s->qdev.blocksize = p[6] << 8;
+-        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
++    if (bd_len) {
++        bs = p[5] << 16 | p[6] << 8 | p[7];
++
++        /*
++         * Since the existing code only checks/updates bits 8-15 of the block
++         * size, restrict ourselves to the same requirement for now to ensure
++         * that a block size set by a block descriptor and then read back by
++         * a subsequent SCSI command will be the same
++         */
++        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
++            s->qdev.blocksize = bs;
++            trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
++        }
+     }
+ 
+     len -= bd_len;
+
-- 
2.34.1


