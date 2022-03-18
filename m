Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF099C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 01:03:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.4435.1647565409549940576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 18:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uc9wgsKK;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso9207996pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 18:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o5C7VT4yVWkOzKPOI/UQBj2QQz+UL4JEqbHpag9QjOo=;
        b=Uc9wgsKKaFkWyg+GruBmuUSUuTzxD7wq0uAlGrjhGshOwy9cSMJ4+UZuyT3vIdfpoN
         QPa4Nf/1ovOffsYJz16W9CebAPe0qoDyxHwScSkBCokrJR5UkjjGHEIisBekVKLcqB41
         fmumgfgqUNuWSjvDJeAlj8KXB9ayHuZZweRkwzhcuq8hwZmiP7nIRlsOJowAL7x3afcc
         3M0x3vpVXd1JsDf+4rtYJ9D71puyMnxYZ+OmVSbOHkFiJ6fG7gpHrlnNunSm84ClCvaK
         2qJCLAA5m754+nLIOlBtfyWohFOPQAFhPmvKxA3czdYGfV04pNT9EDel4NLbxNniNksF
         ajVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o5C7VT4yVWkOzKPOI/UQBj2QQz+UL4JEqbHpag9QjOo=;
        b=u8oGL6vGL2JF/hY4LDAHsuDyKWhnk2GkuzHAK6WvpcYhUoFjrQiv0unAFGw6GDJJSd
         ogv8o4blbMaZYnr0QJBWijvKe7ebQeNekeyciGlV6TwsE/51Oq6hehGSnB4LOi4fb08e
         IQafdPrxPvC3txYBVoCPQFQn46WBFvF7CgvLlCjSvWaVjz5LhavB1msseldqxO9FwyjR
         r2j5/RjawilrOrMRR86mHl1hO+ltkPDeUyI2qsGBlKq1NxHY52sdg0+hZiubjbrWrc7z
         M0dIRi8+QtsuvWXtYbCdthTXFx/mIkbnEeMEmUG0cvftI8VDQX1vcUqQXFdMU6VBtNsO
         i/CQ==
X-Gm-Message-State: AOAM532wIPJDGd16QEnAxgAAp9UaKJ+EY/lyXkvsXT90AmJiYc2Y+kdq
	NA6yHHPPnM0kJ48pldhNZAlxx9duwsYdKg==
X-Google-Smtp-Source: 
 ABdhPJzdZfPaQhZu0j0M1rGMb2TXuwLSzQ24bkygohZNwoup2Lp5YxUh6nTQOBOIBktAqhyFK5NjYg==
X-Received: by 2002:a17:903:110c:b0:14a:f110:84e1 with SMTP id
 n12-20020a170903110c00b0014af11084e1mr7730392plh.7.1647565408767;
        Thu, 17 Mar 2022 18:03:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 3-20020a17090a190300b001c61add3386sm6536667pjg.35.2022.03.17.18.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 18:03:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemuriscv: Use virtio-tablet-pci for mouse
Date: Thu, 17 Mar 2022 18:03:25 -0700
Message-Id: <20220318010325.4086061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 01:03:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163438

This helps in making mouse response better where transition between host
and guest mouse is abrupt and not precise and as a result its difficult
to access stuff near the edges.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 14eaf5d64a2..1d32b4a5820 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -36,4 +36,4 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 QB_GRAPHICS = "-device bochs-display"
-QB_OPT_APPEND = "-device virtio-mouse-pci -device virtio-keyboard-pci"
+QB_OPT_APPEND = "-device virtio-tablet-pci -device virtio-keyboard-pci"
-- 
2.35.1


