Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165B4D5C0C8
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 13:40:05 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.12827.1731073198069667491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 05:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVQ0jKYx;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cbcd49b833so11859516d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 05:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731073197; x=1731677997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GanZRwLpOeh+U2kRVhQUe+ggkAozsUrYmP9p1MW2J/U=;
        b=HVQ0jKYxhIYHAY9UFJOf6nPUIBRmP0+pR2vM9NajEd+SyI+PitIx4q2GiZq0461wCS
         N2/iKEfXP5+xFnwO6bClxCWrOXNJLmptGTyr7Ry+X1pe8+8pBTFRkSy3Hz7kxesAB9lC
         lky0E/ku9SShXOsM8QdB1V2nH6Y+IXDzCAPiJdrDJfba3VX4bQjQQf9qSbODZY546lTn
         C47qKw2p3BGeKObpiV0CLuMDX/cL9YOB8HCUQob2kF1X0wAgL2W0xp2+X+h+DyM+PyN8
         IZ+ccPyb+mGMVL0l1JU+v2C8u0hYh2oV3crD0mOI+1aSJMKBLDTQD4TO/L0wQYMeeKjN
         Plkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731073197; x=1731677997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GanZRwLpOeh+U2kRVhQUe+ggkAozsUrYmP9p1MW2J/U=;
        b=TSo+O41pyfUwIW4XCqHN0I6H8Hy7WGnUUAMXfVaMPvdh+Xv1s9e1Em0fuO+enpqUfp
         zr7gu+mUKiaZZ1DkV2e1WDy9msjK8j3q8rjGywgiVf8zciWZ1MUVg+dzd1SRAtMakfAN
         l2i6V0S2adeNsSPsBuwGqMgrLTfLUAofnd0i4tTuUcrsNqTxrvZVXKb18VJ2r9VZHplA
         oBd4OeORY0+60g2rQPZUeUssZeizaHsRJpyvZqMv1fdIrxVCNYe8L762hrVxfPQQFINm
         r+4h2n6ox/Y+moCwPdKke+TbqcXawffVVM3tSiOpt22F1yeYLI1u81aSUI1qic0fhVeh
         mekQ==
X-Gm-Message-State: AOJu0YxwiROYdgS5dlMqvkZYC1CFKzt5RFWtOKLk6SeHOTQRXJ/6bCZO
	6AxlyL9mq5yfHQT3g100QaUb4QOfol+aPOo4KVPyWn/KMLtUpHe7b/RfuKUW
X-Google-Smtp-Source: AGHT+IFhs7KLgphETurQXg5S432V1uUE+OLfx3GYyb+8mgx9jmvFyJSKjZOXz5c2ViYat7PPDWjZNQ==
X-Received: by 2002:a05:6214:498e:b0:6cb:e7eb:fcf0 with SMTP id 6a1803df08f44-6d39e1a5315mr37293096d6.33.1731073196946;
        Fri, 08 Nov 2024 05:39:56 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396208792sm19323996d6.64.2024.11.08.05.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:39:56 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: fix powerpc for 6.12+
Date: Fri,  8 Nov 2024 08:39:54 -0500
Message-Id: <20241108133954.1512115-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 13:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206871

From: Bruce Ashfield <bruce.ashfield@gmail.com>

crtsavres need to be available for scripts to be regenerated
in 6.12+:

  commit 699d53f04829d6b8855ff458f86e4b75ef3e5f0c
  Author: Christophe Leroy <christophe.leroy@csgroup.eu>
  Date:   Thu Sep 19 20:55:57 2024 +0200

      powerpc/vdso32: Fix use of crtsavres for PPC64

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index bc77129656..d09d1bf4b2 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -240,6 +240,11 @@ do_install() {
             # v6,1+
             cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/powerpc/kernel/head_booke.h $kerneldir/build/ 2>/dev/null || :
+
+            # 6.12+
+            cp -a --parents arch/powerpc/kernel/vdso/vgetrandom.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/powerpc/kernel/vdso/vgetrandom-chacha.S $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/powerpc/lib/crtsavres.S $kerneldir/build/ 2>/dev/null || :
         fi
         if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
-- 
2.39.2


