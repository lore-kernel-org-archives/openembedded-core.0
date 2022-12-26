Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5008C3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 13:51:00 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.136627.1672062657900798649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 05:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TvAVT8cV;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 79so7186812pgf.11
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 05:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LcIsx6ykgjYCLdBdctjUT7kq4WjcNTITocNdNzrmeA=;
        b=TvAVT8cVdzzUxOLh0J+nB992ZrnjhjnmrtjMpjsTOiB89NTfBMSmHEQta6RJwIbbXC
         GDeNcjhr77Gpfk9m25hItVrN9ztCCe5/P+LYlklPrUiHG/MYb1bdrTkIEdAioTicwG5N
         jVwpgYe1qHA3YqX442OCqNEfB7XGfuV0CVNxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LcIsx6ykgjYCLdBdctjUT7kq4WjcNTITocNdNzrmeA=;
        b=7rn/0RSKe4cTCTJbCk7IXIV3GdF2jVOz/aBd2ff+SD96oqjyxeHAvsyYPKcckxTImn
         eodGpFVOlM1IerRAFngK4Spx/EH4MwNcy3dcmMvot0wwjbObT6MyQA97dtTTe59Rt7bC
         2/kXUUw21LmpfOULVLBslfrPDh+H2g/L39Js4D5fxzyj/wpACD7VpWyAbj5obfNDjZfg
         g7KImLt7G9yayfuDaS2/slx2RsbPJWWauM/xGwsxqzBX2XAy0Mu4vQZ75sH7y/u1fiDb
         tdVGXQYIHpWBvFvlSWReUYfV4NgT9sYy7yZXGwLwPv48t8DGLM/SuE97eO9jhDfXPNjK
         VYpw==
X-Gm-Message-State: AFqh2kr9sQcP4JNGz4EO9vihZXjYemsokxlP+FLuUvcpBiXnj8s2gvN9
	U7xURQFkPGzbRdCcCcK6MpEFJ7xwOTidH/BW
X-Google-Smtp-Source: AMrXdXuP0GahBUaDqzcc1B+wd2NsuRexPMZHuAVua9OYypMmHrzk7MscFovnT4ZlubnNQxV52Cegpg==
X-Received: by 2002:a05:6a00:1f0d:b0:573:d183:4218 with SMTP id be13-20020a056a001f0d00b00573d1834218mr33189679pfb.10.1672062656677;
        Mon, 26 Dec 2022 05:50:56 -0800 (PST)
Received: from vkumbhar-latitude3400.mvista.com ([116.74.155.15])
        by smtp.gmail.com with ESMTPSA id x68-20020a626347000000b0056bc742d21esm7103001pfb.176.2022.12.26.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 05:50:56 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
X-Google-Original-From: Vivek Kumbhar <vkumbhar@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: fix CVE-2021-3507 fdc heap buffer overflow in DMA read data transfers
Date: Mon, 26 Dec 2022 19:20:40 +0530
Message-Id: <20221226135040.259265-1-vkumbhar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 13:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175021

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3507.patch             | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a915b54c1a..fff2c87780 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -114,6 +114,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3750.patch \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2021-20196.patch \
+	   file://CVE-2021-3507.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507.patch
new file mode 100644
index 0000000000..4ff3413f8e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507.patch
@@ -0,0 +1,87 @@
+From defac5e2fbddf8423a354ff0454283a2115e1367 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Thu, 18 Nov 2021 12:57:32 +0100
+Subject: [PATCH] hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per the 82078 datasheet, if the end-of-track (EOT byte in
+the FIFO) is more than the number of sectors per side, the
+command is terminated unsuccessfully:
+
+* 5.2.5 DATA TRANSFER TERMINATION
+
+  The 82078 supports terminal count explicitly through
+  the TC pin and implicitly through the underrun/over-
+  run and end-of-track (EOT) functions. For full sector
+  transfers, the EOT parameter can define the last
+  sector to be transferred in a single or multisector
+  transfer. If the last sector to be transferred is a par-
+  tial sector, the host can stop transferring the data in
+  mid-sector, and the 82078 will continue to complete
+  the sector as if a hardware TC was received. The
+  only difference between these implicit functions and
+  TC is that they return "abnormal termination" result
+  status. Such status indications can be ignored if they
+  were expected.
+
+* 6.1.3 READ TRACK
+
+  This command terminates when the EOT specified
+  number of sectors have been read. If the 82078
+  does not find an I D Address Mark on the diskette
+  after the second· occurrence of a pulse on the
+  INDX# pin, then it sets the IC code in Status Regis-
+  ter 0 to "01" (Abnormal termination), sets the MA bit
+  in Status Register 1 to "1", and terminates the com-
+  mand.
+
+* 6.1.6 VERIFY
+
+  Refer to Table 6-6 and Table 6-7 for information
+  concerning the values of MT and EC versus SC and
+  EOT value.
+
+* Table 6·6. Result Phase Table
+
+* Table 6-7. Verify Command Result Phase Table
+
+Fix by aborting the transfer when EOT > # Sectors Per Side.
+
+Cc: qemu-stable@nongnu.org
+Cc: Hervé Poussineau <hpoussin@reactos.org>
+Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/defac5e2fbddf8423a354ff0454283a2115e1367]
+CVE: CVE-2021-3507
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ hw/block/fdc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 347875a0cdae..57bb355794a9 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1530,6 +1530,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
+         int tmp;
+         fdctrl->data_len = 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->fifo[5]);
+         tmp = (fdctrl->fifo[6] - ks + 1);
++        if (tmp < 0) {
++            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
++            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
++            fdctrl->fifo[3] = kt;
++            fdctrl->fifo[4] = kh;
++            fdctrl->fifo[5] = ks;
++            return;
++        }
+         if (fdctrl->fifo[0] & 0x80)
+             tmp += fdctrl->fifo[6];
+         fdctrl->data_len *= tmp;
-- 
2.30.2


