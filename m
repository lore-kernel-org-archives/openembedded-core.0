Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0488DC4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.16589.1672594968318677853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TeY9eVOx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so30757402pjj.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KU+BnOXpsnwiyfTgbc4HdgjIgBNg+LC67ETuaJcHWfI=;
        b=TeY9eVOxZbbgVcU6oYF711r9cHdUjnIjzyNQbgK7YlfcqO9gx5aq8BcEKW2zkL8UJe
         lMGPTq9gzhTxvvVkflPH+v3K86+mSb5TIzrdUoR0tTiG8yYiJK1eVDAmDCjwlmmembe0
         c6pJvYjlXzFVEw6vN7W17GBN0H5XmVan1rAlLEaFA9X3NFUP2zETNm686kV8nvdwhbxR
         q5EfiO5mP/3+6YLFFL8ZSEBGp9XyV/CdlKFZd4TDzvRzLnBehZwSu62PDZMJxjIIzaKY
         s2InC2uW5+Ncej13V161Q8GQBMmhfcopQWddLnKd4hN8s/xa3puDClinhIn1fzJ3dbBh
         pXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU+BnOXpsnwiyfTgbc4HdgjIgBNg+LC67ETuaJcHWfI=;
        b=LblFyGRk25llS86DDTDu2d3GioBjpoWFYL6ZSfkP06IHOH7gY6AfjG4DaQRhDkROyO
         qeRvfnb5JxSqwT82mqxtCpW2dNsxeR4DGO8ZKNmh2BP/sNZpahRkcqmqHvSJcMVLN2Sd
         Ut/z8BiAoKNLQbPYrhtqUhjaBdBjgmXyr7vk1K6JXzWlAyjMtUvVGmvxjUPNgDO0uLoT
         nmAHrI02Yyokr3TvoUgJHo4ooyo/+YlX/lbGxSa9WpCdgBrN/32XFF8TZ3eEbxF9pUWE
         STipLj33vhjq/HiipMYszr8k7VBAEilEm4w/mCG4TlHe3LAiPaA/AJyNTrJT03Io7sxj
         v28g==
X-Gm-Message-State: AFqh2kolCwGcmDxiHNjYXMqqJCCBOr6zuweOgaHaAK3jBKs+MrGRsbqe
	QevqHKp96oDgEM8jKMUNrZJlF0kIH2AIUJizoyQ=
X-Google-Smtp-Source: AMrXdXubhXLH5/XrrkX/lSnnjkjgQzxSm20pAF6jsFgN1l5/LjSjDU2vgJXEBiHnlRNzGA+nWpBKcA==
X-Received: by 2002:a17:902:ce90:b0:192:8a1e:3293 with SMTP id f16-20020a170902ce9000b001928a1e3293mr31272787plg.63.1672594975422;
        Sun, 01 Jan 2023 09:42:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/18] qemu: fix CVE-2021-3507 fdc heap buffer overflow in DMA read data transfers
Date: Sun,  1 Jan 2023 07:42:21 -1000
Message-Id: <24ad058918a63dc14b1560ebd48f5e38bc5c907e.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175223

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


