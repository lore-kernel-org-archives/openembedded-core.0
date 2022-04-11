Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD33C63718
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.32406.1649696345787495756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFd3NGB6;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id j17so13646831pfi.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aG1IC445pz0rzQJdYY9o3tiGwTt02ryOvaroHJLRhsY=;
        b=VFd3NGB6hhE1B3vOH8aW/82HDcZuFA6v9EVetGlkjyj/1cLD/GOCG8qc8QCr8+Aiya
         59l6/SVRZY8B4woCnorK5rtQLLAZVAzefcfdIEfi1+lZPRzuvR24GRMMr47kIc6iydWm
         2VQum8def0Imjez/7cVMfPYy/RudtGM3sl6uWxjqCmT/yHZn7kxdkCPDP8Dlt6Mrkbra
         03EFXNgpksnNHPzX0G28mOAv3N2F80kWGHJwDeLPb1ocS5w4AJy+KD8uZ9yf3iuqAmTQ
         /NqBBXC5cOMgA2mHlb/Q2gbKWljhKeEQTGwTD1S31ASEon6yN10pReTgvt2XJSxDjCyF
         pK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aG1IC445pz0rzQJdYY9o3tiGwTt02ryOvaroHJLRhsY=;
        b=Cmydboev6okkTnysys+YD9og/Yi1G/5hlzLDm4e7YbkiCzNmPkgIGfk2rEChHEWU2+
         oce+P2hDNEkBR0bObNx5dpkRFiZU8aHfCJCrjO14RiuYhoPQMvFJeP77WXYmUDAASBii
         J8MzN9oaZpMHl+4670pzaGokF0p9BqoRO8t2bZuit6Qm3klPR1/yHADrNqQzzkpXI/QW
         kyf/LZ+F2tKPcEWgFB+BOg3CFu4GeUp7llyvs3Saio55rsYO/CgbFEKFGNgIK6L3ZDj5
         WYq9QolSF7574VR3fjMtZoUawgKCYPqsAOPg1/63edjcdDHisMq0NrF1wXuFmb4e6yG6
         OogQ==
X-Gm-Message-State: AOAM531xpOSPSP/+KtTZjJjcX6cvwcts5LEwz39yxcqpRNXDAb1Dj4Zz
	pFXhhfjwK6YkHuu/pfspciEh0wsDRl182A==
X-Google-Smtp-Source: 
 ABdhPJxmcZJ/FY1ISyP0/ue/JXOIrp2PNDe6VJtBqMtK99Ec7b97pOsnCQnNkHHQOCHmD9q3EWKFzA==
X-Received: by 2002:a63:590e:0:b0:39d:1a2b:5907 with SMTP id
 n14-20020a63590e000000b0039d1a2b5907mr10531607pgb.188.1649696344785;
        Mon, 11 Apr 2022 09:59:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm292353pgp.3.2022.04.11.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 09:59:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] kernel-devsrc: Check for gen_vdso_offsets.sh before
 copying on riscv
Date: Mon, 11 Apr 2022 09:59:02 -0700
Message-Id: <20220411165902.154739-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164234

This file is introduced in newer kernels >= 5.15 but some RISCV machines
still use 5.13 kernels, this ensures that kernel-devsrc can build on
older kernels for RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8d360ed3f38..9654488a540 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -112,7 +112,9 @@ do_install() {
 	fi
 
 	if [ "${ARCH}" = "arm64" -o "${ARCH}" = "riscv" ]; then
-	    cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
+            if [ -e arch/${ARCH}/kernel/vdso/vdso.lds ]; then
+	        cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
+            fi
 	fi
 	if [ "${ARCH}" = "powerpc" ]; then
 	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
@@ -190,7 +192,9 @@ do_install() {
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/build/
-            cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+            if [ -e arch/riscv/kernel/vdso/gen_vdso_offsets.sh ]; then
+                    cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+            fi
 	    cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
 	fi
 
-- 
2.35.1


