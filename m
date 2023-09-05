Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C18C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:42:02 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.19223.1693914116925373976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aHxttwMs;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: xmdy61@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a88ef953adso1913880b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 04:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693914116; x=1694518916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SN2p42YtEqnh5ciW5NJ4Cr3erJESBuwlubmPLg4d3QA=;
        b=aHxttwMs0QXLxjAYhSiHVKJe++jFjM2vJyPvcPMGFlZoCZj3YOOtCIQ+qnN8An6Dp0
         808oe75l1W1+BZStJbyAkv/d8dBeZcaLWCJE9idt1UTdfA1rlMl+MfrpkGC+YZGIR7Cj
         IbZG9kReRU5VKaUegYZhIhoFKgdhO/1Z3JJ9mcAyy5sVDWzPjDi6afeyGx6oMm5QPsUF
         cgSPCEbChOTxwzCfk9Yy/kUrTjiWadB6mtCKdg1lyM3zznT1osnmBmJAR3RVJq0gP5M6
         FJvPneQoL81ZwLg8V5uoRIdGND87cX3upFSmFsStVIt3gc/YYzuZjSS+hRyiiKMHHhqW
         V1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693914116; x=1694518916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN2p42YtEqnh5ciW5NJ4Cr3erJESBuwlubmPLg4d3QA=;
        b=cIIBnMcLiIXBAGJPWyQ6c4JhwGWiPAX10ERuSUSY+weVgBbGKoWNn6X8FU5k8Pi8Un
         DoUIrXUGK/XNK66R9Ec0Jck/IeGSZf0Pv/+TUIH6uz7XqP7C0sACJk6eINdWQuZUss/g
         IaAM9W9hpDr7YV4NIViGTWaLawfdG6G0yehw5qHgj3aR5uD6o2qfScWgQxHyblh4Yakj
         p6dmjICd6N5AmylgzrKGeU5IOV2tFui32lMfU+352V+pISm6eXyC8mbDHV8uk7YZMhaI
         AWiaaHwMSGEBC8p2ajpS4ciF243xQeE7DLcUJ3K+fwPybAcl3GziU44b4Y+szPlezRE5
         lK8Q==
X-Gm-Message-State: AOJu0Yw8QSnh9MLTLPXfQyS0kmx8R/2N40jtK0JjhdUSSabbWhHxpBj2
	NCCMLUXBa4wbK5s6cFEBx7meLXKMDht9J7Vq
X-Google-Smtp-Source: AGHT+IE+558ptnGla5zGZvWdTtFahw3TXi7f4mtcRuxnpeXxlJLdjUUEkAF+kcDp26UwB1jg+/H3Iw==
X-Received: by 2002:a05:6808:1414:b0:3a8:17f2:f97f with SMTP id w20-20020a056808141400b003a817f2f97fmr18451875oiv.5.1693914116106;
        Tue, 05 Sep 2023 04:41:56 -0700 (PDT)
Received: from localhost.localdomain ([112.20.109.102])
        by smtp.gmail.com with ESMTPSA id p29-20020a637f5d000000b00565d46c5ca2sm9250167pgn.27.2023.09.05.04.41.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:41:55 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] [OE-core][PATCH] kernel-devsrc: Fixed missing loongarch64 kernel source code when test_kernelmodules
Date: Tue,  5 Sep 2023 19:41:50 +0800
Message-Id: <20230905114150.18980-1-xmdy61@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187212

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 6764598d48..ce5777fbe9 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -318,6 +318,15 @@ do_install() {
 	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/mips/tools/elf-entry.c $kerneldir/build 2>/dev/null || :
 	fi
+	
+	if [ "${ARCH}" = "loongarch" ]; then
+	    cp -a --parents arch/loongarch/kernel/asm-offsets.c $kerneldir/build
+	    cp -a --parents Kbuild $kerneldir/build
+	    cp -a --parents arch/loongarch/vdso/*.S $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/loongarch/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/loongarch/vdso/*getcpu.* $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/loongarch/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
+	fi
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
-- 
2.20.1


