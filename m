Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6939DE95A6F
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:32 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.27672.1696717527481276280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jcn66flP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690bc3f82a7so2644625b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717526; x=1697322326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTLWICTGlNOG205GaSUKN6SJTfkhTQZDTW3w9elOViU=;
        b=Jcn66flPh9rL2IVkSA9PcjlPWvFPLsc0zZVmFYiUEJBFSVdc1QU1tJS89s1zmaCKnl
         WGPglry1VNhoEUGX9jUUlSMKaonffLlgKTaNBhnT12w4I8bK+9jz+E73vLyEHsYd17op
         ONbXk3m09ZvTV/lTjalfA+DgAERohg+OxwhmO0LIDyLqsOgBFwQgLmr8yaOVqsjyzzrM
         t8pG09LIV8//w/od4IqHaFdGT/Gy78f6kIoqaRH7IYDXEmyrdq4lED2v+3LRyfcgQ9OA
         LwVk4C0lEq2iUz1yf6MAeRo23tXbIQeRHagZ0cXg2mU/yL8U8AD5CUNcXfpGKGOOptHu
         +Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717526; x=1697322326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTLWICTGlNOG205GaSUKN6SJTfkhTQZDTW3w9elOViU=;
        b=f/6/UdmyHxBqFDqYqQWM4ODcJ6JxJ3NasVHF+hG0SPNgnAeU05QvNJV/N5GTgORO2M
         bE3OePQpPWdMjqN5llHT2iMkcZ6E5ZUZGLPlLy8jtiUJqmJ/t+eCGGQQ4HwgszmWfkps
         wJS5LQ22RI1tMn5qV4N0kOxGxJ78W/5WX3Hn2JCZsK9R/Qb2JdYGaHfUVyD8LK8Mwd7D
         uKiz65oG5qQuf8IjNkiZ3qoGgTZNlRzFSOohRhikZ6VWBaYjxqxL9RwiqoVglcbt4Tt/
         8rrN/nOEYtU/SoEPpFEg13nomzURldlLfmJTsg9UlpU1K6jKwQ5sKj4jt9+JGzaKzRVm
         zcmQ==
X-Gm-Message-State: AOJu0Yx4LV51L+biE5bXEYZ3WCBYS+TzZuZ6bshOv2IYnMW3z/4dYDsY
	Oo0ThaZiuNfSAkAYumbXQ2fxpFpGYKNWAKzAVOY=
X-Google-Smtp-Source: AGHT+IF+RcA2qJx/j1JnKKA6RAOUGIA/YfwHA67+UpRmxeE/kBrDx1lIsrITShhsG97OurMlzoJTfQ==
X-Received: by 2002:a05:6a21:778c:b0:16c:bb6b:3303 with SMTP id bd12-20020a056a21778c00b0016cbb6b3303mr2849417pzc.7.1696717525887;
        Sat, 07 Oct 2023 15:25:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/19] qemu: fix CVE-2023-42467
Date: Sat,  7 Oct 2023 12:24:58 -1000
Message-Id: <4925ac7120605d551e1b28196b4a4dab7bc72b66.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188803

From: Yogita Urade <yogita.urade@windriver.com>

QEMU through 8.0.0 could trigger a division by zero in scsi_disk_reset
in hw/scsi/scsi-disk.c because scsi_disk_emulate_mode_select does not
prevent s->qdev.blocksize from being 256. This stops QEMU and the guest
immediately.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-42467
https://gitlab.com/qemu-project/qemu/-/issues/1813

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-42467.patch            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cd17a11335..00decc57e5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-2861.patch \
 	   file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
+	   file://CVE-2023-42467.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
new file mode 100644
index 0000000000..0ca93494f0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
@@ -0,0 +1,49 @@
+From 7cfcc79b0ab800959716738aff9419f53fc68c9c Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Wed, 4 Oct 2023 08:54:13 +0000
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
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/scsi/scsi-disk.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
+index e493c2881..915e0369c 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1624,9 +1624,10 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
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
+2.40.0
-- 
2.34.1


