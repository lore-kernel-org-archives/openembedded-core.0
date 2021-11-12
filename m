Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A8AC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 22:29:33 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.2957.1636756170880250781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 14:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CLLTkt0A;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id z10so16947637edc.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 14:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BD7bZuFT2CIvXXgfgo0P3l6/o4kAX6mimt2xJ/Iiym8=;
        b=CLLTkt0A/vmXG+UyaKS+TC9B/paMKHwk4m2crSr3S6NiYoeEgujnqmAdZrmkoyFl1c
         Ypn6/GTki166iHDFRrFHA4m0knDMkTkRBiCoHHhT9wsEt3NTUXDdqhXvy1ToswWUdah0
         QrYFSDR0cLwnmpwCdGOZnNv9jdBqj7fuiNmKoy9Bwa46STPK5PRDzW8S3wO00Ufp+vJk
         e+OeFKWYvUB0df2m3JpMtqQoNE1oEnffxtDtTao47EpLVjzyj4EHE46iyDCvRY/PDRBH
         +9LFbRun0eRWniH41f5s7LPcbC+KbmNGHJ4D7B+y2Ba+Hd248pW6fgKZBb/x0QifkeDx
         RfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BD7bZuFT2CIvXXgfgo0P3l6/o4kAX6mimt2xJ/Iiym8=;
        b=jGWQRqMeez1h+PcWf/cHc32OVPGWyaZHwdUCO4Zu5OIcwGtqP176SkETK3JPCP7Wmo
         zqNE5KWn6Cdth0ylZmE7aGX2rDEuirhBh67jSzvZ2ZHPXko5N7kL1EI4G760wm+F93vq
         +ZvjODDvY2S7+p/q44M2D6LGAjnTFwMCk3wjx+XwsPsjEaHB14meTcaRFoxKUjSJ3BjR
         FqyAdg84VJivJuDcgSHytBzBa1HQYRp20on10LQLqUI+muZH8DVkQRUCqiVd+xfKJhTF
         i/G/bLM57IoxQEWWSJYRISACernG+H81jWaUCbEaZHT4xdjSYD0GoH40lR9LwWz4XKkD
         HMmA==
X-Gm-Message-State: AOAM533ODkY0krCfshVQAsSidTh5zJ0WnLazmY2riiwhvLJjWutZu51n
	+ptvHJpmfgAvPufaZlZfPg2Thh03S8Hy9A==
X-Google-Smtp-Source: 
 ABdhPJytLkN4lJA45Bm5UGfpgBql6W6iD2CJogymZUczKxgg58ZKUbdM0C3TABNdVkJCoJivo1QSew==
X-Received: by 2002:a17:907:c15:: with SMTP id
 ga21mr23266776ejc.349.1636756168688;
        Fri, 12 Nov 2021 14:29:28 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 b11sm3702353ede.52.2021.11.12.14.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:29:28 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] runqemu: support rootfs mounted ro
Date: Fri, 12 Nov 2021 23:29:18 +0100
Message-Id: <20211112222918.2871675-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 22:29:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158236

Optionally allow to set QB_KERNEL_ROOT to e.g. "/dev/vda ro" to mount the
rootfs reay-only in Qemu.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/qemuboot.bbclass | 2 ++
 scripts/runqemu               | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index bf529e9aa4..8cdb544a94 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -36,6 +36,8 @@
 #         in system mode, where system is experiencing entropy starvation
 #
 # QB_KERNEL_ROOT: kernel's root, e.g., /dev/vda
+#                 By default "/dev/vda rw" gets passed to the kernel.
+#                 To mount the rootfs read-only QB_KERNEL_ROOT can be set to e.g. "/dev/vda ro".
 #
 # QB_NETWORK_DEVICE: network device, e.g., "-device virtio-net-pci,netdev=net0,mac=@MAC@",
 #                    it needs work with QB_TAP_OPT and QB_SLIRP_OPT.
diff --git a/scripts/runqemu b/scripts/runqemu
index d4f0888f8d..efb98ab9e0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1266,7 +1266,13 @@ class BaseConfig(object):
                 self.rootfs_options = vm_drive
                 if not self.fstype in self.vmtypes:
                     self.rootfs_options += ' -no-reboot'
-            self.kernel_cmdline = 'root=%s rw' % (self.get('QB_KERNEL_ROOT'))
+
+            # By default, ' rw' is appended to QB_KERNEL_ROOT unless either ro or rw is explicitly passed.
+            qb_kernel_root = self.get('QB_KERNEL_ROOT')
+            qb_kernel_root_l = qb_kernel_root.split()
+            if not ('ro' in qb_kernel_root_l or 'rw' in qb_kernel_root_l):
+                qb_kernel_root += ' rw'
+            self.kernel_cmdline = 'root=%s' % qb_kernel_root
 
         if self.fstype == 'nfs':
             self.rootfs_options = ''
-- 
2.31.1


