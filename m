Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AF7C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:40:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.19086.1693914008680736873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BEBlC3K8;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: xmdy61@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26fc5a218daso1345085a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693914008; x=1694518808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4JHvcSXynGZC5kBoR4Et+zMyvfl9qOR4eeJuZtjTqlo=;
        b=BEBlC3K8+IcqzteUU114Z2Lin6iXhqMpX5OEqfV59E0MzvV8QF7EkJF3nPcK3QiCST
         uuGxiP0n9fptGT/cIQg+Kh+oQhNLfiiBkviZj0Ak0GcZOVsYGi/0tSUixQapxtSc5TNY
         8M7GYX73pZxLr5lOmJg+i9iHkRZKIY8EQ6l6dw50E27JFjI6HgWag3IJsBdgIye3LBBB
         f8J/RCJeMepx8iFcEvWxKcZ7gX2gegIaSV3sJ5aUgXU1mhgQOz9qyoskFRyL5kNtoOAQ
         1d+D/dDYJzIxoV4vqE0PKndIxpf53KaRzOo2xH4wLwcyX35c+OJzCF62J0hPQykdpIEz
         k3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693914008; x=1694518808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JHvcSXynGZC5kBoR4Et+zMyvfl9qOR4eeJuZtjTqlo=;
        b=W3dZtFsg2CfMhJJumJUsAHbSqC5+ggz7D9taYDl6wM3f8YCniIR/xUrzHBmtb+/6T5
         aGovpUiOHE8IdyqAiQzXAZOg3HUtD/YQbhqZ07w9yFKM3y8ZWnnboql/NUT6lmXXNzB4
         bDHr1/KdFQUgydHhBglQ53B+oxlV8DACaO8weFJLFlPR9P7n9kuh2JJ6VB+ICtYWuEjW
         R7wgUOaT7sWGRMY14Sxp682AvoARo817avqhUM/D6/bjQ+xFlQOB/TNOxVs9qgn3bSsE
         px4UmBiXQdLU94fnvyUNbEIVEpNw3sa4LrIc0306ozjybwe4LkPmeTo291sQFF9TDfCi
         zCdg==
X-Gm-Message-State: AOJu0YyODu58hiohKQwn8pEP9WHFmowYihfpOesBsqIQ/zkHO0OcrYXA
	mFrpEVPCjsCN/RYPj+IALVaSW3H5F5WoIdxN
X-Google-Smtp-Source: AGHT+IF5zp6XkfRjFJM/h85k6eaP+RNCB2IhhoxKuU+aCrq49gsVrV0+JTjT5V1I5PSZFbmTjkEreQ==
X-Received: by 2002:a17:90b:1483:b0:26f:4685:5b66 with SMTP id js3-20020a17090b148300b0026f46855b66mr10253997pjb.8.1693914007805;
        Tue, 05 Sep 2023 04:40:07 -0700 (PDT)
Received: from localhost.localdomain ([112.20.109.102])
        by smtp.gmail.com with ESMTPSA id g14-20020a17090ace8e00b00263f8915aa3sm10654614pju.31.2023.09.05.04.40.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:40:07 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] [OE-core][PATCH] qemuloongarch.inc:Change to use virtio-serial-pci
Date: Tue,  5 Sep 2023 19:40:04 +0800
Message-Id: <20230905114004.18770-1-xmdy61@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187210

If virtio-serial-device is used, the following error occurs on loongarch64:
qemu-system-loongarch64: -device virtio-serial-device: No "virtio-bus" bus found for device "virtio-serial-device"

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
index 77245ff85d..30f560532e 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -29,7 +29,7 @@ QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
-- 
2.20.1


