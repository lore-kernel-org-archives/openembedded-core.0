Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0DAC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.29852.1644427818892552131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=5dPA5GQ8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id m25so2199367qka.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KJvWeOYSiP97AS+357izwER9XythvqOZ9WyL8kjfYZI=;
        b=5dPA5GQ8MK1DriRJldqNq29/dYFRnmkG9bGolSG4N1/2adOjfccn2r4IGvIxnAQRNx
         LCuWVigplmQSjlJX8pdX5uHv3nXLeihP2TBFHOpBcxXToGGAb6PttyrhbZeotldmeTCH
         YpAfEoyDxV4ruQ7g8vfsqH/zrw5d5A/xzXTiJWBHbNCaiGNl7w8GC9/gy4fUjMfKYpv1
         jiavQ/j0a4kcoSZTeZgkchiYVuz0JE6vrsv5ELGJ26+YCmtKDRxhdD3kXZCJZiLjMkia
         SG62zrcrRcGx/930VItM6R6uVw9fY9LXJCGvPt2Yy1g54fqppbOwIxSP2RzazKTWDBr4
         jpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJvWeOYSiP97AS+357izwER9XythvqOZ9WyL8kjfYZI=;
        b=pigz6eLzbNhYsJQtq3b5JfJpURLHa9coqaji8JlBJQS9XH4PlpCp62JUaDd+5r3lik
         yXvZHD0xut4+fWSBh9zjElZLLRAiGsWTweDdTWso61WrexqbDRdWcL83EjDyv5wQsoUU
         Sz2O48WmQk6rMo7eMYkv2RRLedr46XCBLz85Vj14y9hMiBxpadYAtgl2BhKzhnLCPaou
         6sSYJU/QCNk3D4M0t6zIKVSKlmETxRqJuUGbHFqmMDV7MBRDVMoZPAHxhkQUTCChim0H
         BBYYt+x43qRf4VWbaVWWkShKeLGwA7rtPMIgd5HxtqQ6MLGadSnhM/DbUqZID5H5PFN3
         F48Q==
X-Gm-Message-State: AOAM533dLXoVTZ0nntFJuJrit8VVFZSEUhsUg7yUmKXHIMRPluagz0kV
	zmflPVzg/2Cz4BHwR4m6lyVX4fOkwL6O1A==
X-Google-Smtp-Source: 
 ABdhPJw5bw5YXp0VqfyovZIne9mM1g4vqq+gn2RTuFIpUg5u5FXdAwYctq04kQv/Rly3n92iKEEJPw==
X-Received: by 2002:a37:9444:: with SMTP id w65mr1719495qkd.468.1644427817748;
        Wed, 09 Feb 2022 09:30:17 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 br35sm8935640qkb.118.2022.02.09.09.30.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:30:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] qemuarm: use virtio pci interface for graphics
Date: Wed,  9 Feb 2022 12:30:12 -0500
Message-Id: <20220209173014.1389378-4-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209173014.1389378-1-jdmason@kudzu.us>
References: <20220209173014.1389378-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161572

For uniformity, use the virtio pci interface (which all the other
virtio devices are using for this machine).

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 1bd4e3e154fc..12da1557efff 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,10 +17,9 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
 QB_SMP = "-smp 4"
-# Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_GRAPHICS = "-device virtio-gpu-pci"
+QB_GRAPHICS = "-device virtio-gpu-device"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-- 
2.30.2


