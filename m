Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A341CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 08:58:42 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66294.1781254711001276926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 01:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KCoTCRnF;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0aa420401so5739585ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 01:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781254710; x=1781859510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA6ShW4vh2IvzTlrXUacuGU3HICP+co6NT5qqd5EAc4=;
        b=KCoTCRnFPlMUunaBavoRmsnHp+hzHVJVtdqAad1aEeUluPqKXCYI7IPWHI2DowHPen
         h6vjqLY6OVkRK/cCoKABsymlXq3zHXo1U3mzwvB5WMozrAmZBwzHcKpgOnAdEquE5TeA
         7lnCofcT88d75slQ5ihdGWMRKMP+KTSU5LUh2hM55yVl7bXk40781pyqZIhVyA52BLnb
         Q88xfOt5SHlwqS5tCY7M+G4iwZMzGTEAsuQ++59Of5Ehc+CDA4nW1N72tm7YzrjtZEOp
         m6VlIo4YRxKYoRaFkOMoafkzgTRLhiHnTaL50KK2OOG4Me/MztPPDQ+J9jvdIFmrXjUi
         rBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254710; x=1781859510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA6ShW4vh2IvzTlrXUacuGU3HICP+co6NT5qqd5EAc4=;
        b=AmGOdyIzGqLHYkg3ul9avnEsWVjh3aRDEDtwRXrlFxJnzaE3K4o+VajH2wOqcn/pPK
         9I/vsQhScVHFUutnMkuruycxYkMkWeBqUfqGTr5vq3FHvuiOdQpwut4EBmHPmP1+PClG
         JJSFL7IqpUeUIq1ViEK4Wis/QzC78TFlxRvZsCvYzaAdivB+vFkGen5JoKlycvdLjfp0
         02hrM7wPaLzAW5bWXeJVeoAyvGFn4XpPBcZu3DWwumVzNFUBs9rUWXzHwBhz+JR9/d7V
         nSO92M9AmVjgfBeDlp5Sko9cjfOQB1lcVwkyMEdI2wPDC39e25kFf/asT8oi4Pnu5vNz
         AcSw==
X-Gm-Message-State: AOJu0YzQ/YtOCy9CXNRo+mmCunRx7AR6772NJeaAzqNLPlu8gepMhlWs
	8OoVYF/R4uArzZN9j+aZEYOPZHCC6es8pJWsiZOIGwh1i/QBKLxWNZ0COZjRnhA/
X-Gm-Gg: Acq92OFlwxgAXXL+8q0rC2Q2uAv5SJHTy/KVwoiWVGrmvDgWB7fvk9aQLQtBbT9Pdc3
	mtcEeFC7p8fMEP8FkFhnJy5s697EX+S9rGdKMUvY5SIE7rSBhbK2efxdCgLqjh6xBIkDbqYpSoN
	Fl2ca/F9ROYYRA1kxPhV4TC4juVbApl6e23WtRZZeZEIiKk/oysdUs5jtFg/SRZ9W2sgtrKxxnc
	iLrDu/2xgAijkw/p4BTbuU32fTPoqvn+Eb/X+nHGjY45tnxS9/n3Kpaf0pp+Gab0H8QphuJzCRa
	bFFMM5iCRw6Cy6rLDleFByPQJbSt8yx75jJP1ehe0ztyRMBU2aj+qCB5wxt/uSP039IZnpt6puL
	9+dVxYu83mUzIlC8BgHgErPeuA2IdimmD0spKvYXhvJi575xr2/GXyuTzzAbouMxwzTxj1e5IkP
	7VuZCtz4yCuNogC5lefSkSWOT7BoWE70FZCcLxRT4Ycjvtb4l7vB0zGRBCzB/ZVISXNqVxv800Q
	C1DL7A=
X-Received: by 2002:a17:902:ea07:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c4134ec603mr24109185ad.33.1781254710254;
        Fri, 12 Jun 2026 01:58:30 -0700 (PDT)
Received: from naduvan.timesys.com ([122.174.113.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433078264sm14172755ad.65.2026.06.12.01.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:58:29 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH v4] qemuboot.bbclass: add missing task dependency on kernel deploy
Date: Fri, 12 Jun 2026 14:28:22 +0530
Message-Id: <20260612085822.854156-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 08:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238595

do_write_qemuboot_conf had no dependency on the kernel deploy task,
so if the kernel was rebuilt without invalidating the rootfs sstate,
the task was skipped and .qemuboot.conf was left stale while new
image artifacts were deployed with a new timestamp suffix.

Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a
Python inline expression that skips the dependency when
INITRAMFS_IMAGE_BUNDLE=1. When the initramfs is bundled into the
kernel, linux-yocto:do_deploy depends on the initramfs image
completing first, so an unconditional kernel deploy dependency on
do_write_qemuboot_conf would create a circular dependency.

KERNEL_DEPLOY_DEPEND is defined with ?= in image.bbclass and is
already used by do_build[depends] for the same reason.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14520
Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/classes-recipe/qemuboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 56106b1958..d1794c7899 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -128,6 +128,7 @@ inherit image-artifact-names
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
+do_write_qemuboot_conf[depends] += "${@ '' if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')) else (d.getVar('KERNEL_DEPLOY_DEPEND') or '')}"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.34.1


