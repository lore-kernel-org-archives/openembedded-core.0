Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D24AC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:47:28 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.3916.1707734845101902766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 02:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FtqHjwWm;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1886967a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 02:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707734844; x=1708339644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj9/jkILHRllV9hYClPte7TKLFoWeIJB3UENS5CtcJ4=;
        b=FtqHjwWmWM6iFjTXnso5/hZIchcTN89aSg5IzhCr2VVwJDH0+FeeT5YZr8vqozvHnY
         9eGpSsBXPjNU7SD+bUhnl6u24yDws/T0rfIvTpcQ95bDeNzmaDXsWwIFqz3MaZPbStoP
         QIQAxGepI6CzDYIT/eSa6w0Co1Qud0oM27bXu5T0lyQ2HPjMXqDcQfoi/6rYRGjpvY9s
         jQK94wvYGHkZX1PYRYrBHNkLk6/PXYmLM5+3ky0PPIAn12IFbqcO2gfz5NPYT6FN1gs8
         Wip4dz/vOzakg+7L0AVkhvbIGJEguOzQF3L1yz6D8d4FECi+DinTyfVcBjTZLrVDmhnv
         D/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734844; x=1708339644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xj9/jkILHRllV9hYClPte7TKLFoWeIJB3UENS5CtcJ4=;
        b=Z3y/7Z35N4dQXXRggvha4xbD9kFGjGBuFB6MYwD2pRM+vOqOV9USkf01p7fvvKIY7o
         Jbvvg28kUMYTCzqzzYRwXqhyEzuxvg7GljpSk9eD7bdoBPaiGdR55SnznNhnnELB+pXf
         IMNWGta6GXZROvf3M2PHXIWkkBJJnQpDXmUx3lC7qyD863WHbKT2jQSf9Bk8UqzEv2AO
         FZunTG2FMkt6zpC9S+FU7zvdwwswSgP9h82kNcRdyqzcHd+F31RUTzcMfgGsbLIJMwML
         vwYLET0sqhGxd20Ehy1eVU0pOnKBJEULD0QM4+SsrJn1XMi5PKqyc5OLlZjZswea11be
         khww==
X-Gm-Message-State: AOJu0YxSvPjvoLXAQG1iCalU8xTQ3sUhXoQvIu9JTgshY8eOVkS3KhLb
	3UKkm/ASMJvYtw0PCMiMLv9YzyGyBPMyS05j5H7AAAZ2MnIvpq2MRTJBsQN8
X-Google-Smtp-Source: AGHT+IH6JI7vSkxx4qx9KsiQzRd9o3w+7pD9ChN2XUjKWmf1Z7LBypU8KtENREBEUJGF3P2NUaT1fw==
X-Received: by 2002:a05:6a20:9f98:b0:19c:9d37:ec59 with SMTP id mm24-20020a056a209f9800b0019c9d37ec59mr5489180pzb.28.1707734844222;
        Mon, 12 Feb 2024 02:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2OShqC1LpD9IA+bS+fF73M8QYuu+oM4LpamJiM/mBFxiaDzxeFMWa0AKA1pFCswO+0WktUPi+083TVW9IG+cvodCQA31f
Received: from L-14805.kpit.com ([43.231.237.204])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001d986ce6893sm95746plb.198.2024.02.12.02.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:47:23 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: virendra.thakur@kpit.com
Subject: [OE-core][kirkstone][PATCH 2/3] scsi-disk: ensure block size is non-zero and changes limited to bits 8-15
Date: Mon, 12 Feb 2024 16:16:46 +0530
Message-Id: <20240212104647.376386-2-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212104647.376386-1-ppjadhav456@gmail.com>
References: <20240212104647.376386-1-ppjadhav456@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 10:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195308

From: Poonam Jadhav <poonam.jadhav@kpit.com>

The existing code assumes that the block size can be generated from p[1] << 8
in multiple places which ignores the top and bottom 8 bits. If the block size
is allowed to be set to an arbitrary value then this causes a mismatch
between the value written by the guest in the block descriptor and the value
subsequently read back using READ CAPACITY causing the guest to generate
requests that can crash QEMU.

For now restrict block size changes to bits 8-15 and also ignore requests to
set the block size to 0 which causes the SCSI emulation to crash in at least
one place with a divide by zero error.
Link: https://github.com/qemu/qemu/commit/55794c904df723109b228da28b5db778e0df3110

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ero-and-changes-limited-to-bits-8-15.patch | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 13355238e8..9f85aa846c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -104,6 +104,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-1544.patch \
 	   file://CVE-2023-5088.patch \
            file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch \
+           file://scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
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
2.25.1


