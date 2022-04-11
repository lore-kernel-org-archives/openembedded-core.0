Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BEDC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.31613.1649695333634278860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ls7sOKgp;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id j8so14323364pll.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8haJiCKwU5LuI63W0TXkkTXqKhRoTgvWjldmst1LkY=;
        b=ls7sOKgpuuDeEk6oFJQ+D+o5nUBU+LDtbD9JlA50LTgeH9VuuI83ELm/mzTXBWvuo4
         qagFnLelitYC7sv+GivuzNs3zuUjqqWJtfif4WXwV/BLVzTvoPCHprQK2J2M+crfYBvV
         6Ja3W605Wwdrd8d6+7fdSCK0byfKn1BZhlPJkmx1pvh0WYXs1z/RTt+Q1Ujsg84sPqxH
         4u7IqSiSXYGUVWJQ/FMJXP5Z0Ml2CZu6F1ruLYGTpehs0iaznEPqpi9K/mjtJ1q7G/cA
         XTcuvMUBpzXikgcKAEDISkAHxZEUzmKIrEnETwj4w/XSZlCXv+vQgqRJ2QTkrQb3BJrH
         ftUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8haJiCKwU5LuI63W0TXkkTXqKhRoTgvWjldmst1LkY=;
        b=IFIG/fQ0RBGcEbpRLMPeGSIJasIPixkthbB1FIdl1TlMYDpFAVdSOfMyaTCYuOorc9
         sula0S44gQZw1nyl8KFThkmA4LecEh4vVt1mctnvKaR2ivWDHpjL0EGKww3CVW2VYPrb
         xB5FZgNcs38wfEwLhJg1rIr3kShNibDwVkXslCroc1UKllQD4f5pgpzxC0TG7QBMurb+
         gB2AdIFcH5eMhpvDS5oHFoNXJqLQs4Dqz8lwZK4Lcw3WrVsYzTLFbRQUoIBwEdLlZXCd
         NOIzlWlmdaLQpzlt+6MmhQhNKXGEFMOPIlZpg+q6akV4+RjnE7rHvHKuY1ZhWe67brCp
         BxNg==
X-Gm-Message-State: AOAM530uvTKNEAhekenAH6hk2zRJ+108SyinPCwPj9BR6fRVfeP/sVCC
	8QpG5Lc8A6p2skUqNRJk7CnXrzFOlWoZGw==
X-Google-Smtp-Source: 
 ABdhPJzddWpL1OtRZuS3e6x3xqn7MqgG8wiy0l6cnHQxFLn0lvXu7f8LuV9fifp8On3vmf/owJo+AA==
X-Received: by 2002:a17:90a:4889:b0:1cb:646b:e33a with SMTP id
 b9-20020a17090a488900b001cb646be33amr50637pjh.136.1649695332676;
        Mon, 11 Apr 2022 09:42:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 y13-20020aa793cd000000b00505f0e3fe0asm35029pff.91.2022.04.11.09.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 09:42:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] kernel-devsrc: Check for gen_vdso_offsets.sh before copying
 on riscv
Date: Mon, 11 Apr 2022 09:42:10 -0700
Message-Id: <20220411164210.65785-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164233

This file is introduced in newer kernels >= 5.15 but some RISCV machines
still use 5.13 kernels, this ensures that kernel-devsrc can build on
older kernels for RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8d360ed3f38..508e13026f9 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -190,7 +190,9 @@ do_install() {
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/build/
-            cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+            if [ -e arch/riscv/kernel/vdso/gen_vdso_offsets.sh ]
+                    cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+            fi
 	    cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
 	fi
 
-- 
2.35.1


