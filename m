Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B32D75BB0
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:13:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.3504.1732162406820626738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gkKj3GoR;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d42003c302so3724406d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162406; x=1732767206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKEFZwV5fpVcGrp108xLwKyG/uFkKAMQbc5h5bAbqdU=;
        b=gkKj3GoRYnkh/3zKSaihZSdLwJZOnqeCxd+hs0JO1WufHWao3V3Zdlzh0AkfpF8MwO
         55KDz/2T1yR53yRmp788IubWDK6oMbxM8GdGOg6HXeGtHHyhAvbOldaNb/zovKw2GCoT
         e1npek3OQxUfG+zUP5q6E7+BDXk4N+HNqGKi4wj7U6l+6IhczA0V47qX1D+knxgA3Kur
         Nkw9cITb3xD7BT4fbW7/piTe25DAYP1PvTbA3fssywdHbyTdwMB08IwL+0GkPNUAxwZ+
         W8gajnrDGPo4SUzUONL4uE2RrFC6uWcfnv3+1OdGZkTlkVdqZL0SEGCyBuRxeTYJrPyb
         6jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162406; x=1732767206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKEFZwV5fpVcGrp108xLwKyG/uFkKAMQbc5h5bAbqdU=;
        b=ZhzyiV7INqdjtk3aoztkI88Nlu6Jn5P83MK6j/IO4bwk1svT2WmvuYTmKtGngibrlb
         K4/d9icVSsVmS8T01LojsNEE+UO0Wol2dgGMBetYPzIG9WR8WwJ1jItyoQTranwNZc+1
         jiePpWrHEouvltxlbFhgfj5eOqCjr7fdYs8stmgSiZNJWru+QWXTDul2/2Mi6IGzVIxo
         Mq8M+DGK7vRNL/4C87phmCEDRc4FpIxdLj8d6fyxfD4MV3LkSIhGKj70mnM5mOJeZpfY
         wkGPPDCbjopSaF6JG0TSMPuSRq9fJZNkwsR94dvbS/Nec0F+4rBosOdt5LO+HJp9ntIb
         ywLw==
X-Gm-Message-State: AOJu0YxAJEWQgHWvHHkY9KQYfc/e2IKULsXqkBNQ2BbEbNJTCH6ZFrvn
	PSQRG+771aYFlZFGLy9ewE7Fyn2xAoNur3dInh9ybGNELMNMdvAT0/oEWfGT
X-Gm-Gg: ASbGncs7YKiCRZu4n5piuRjf1MkfzUzZEyc73CuZk/xazAerqDJARaI5YSwNxbQC6MR
	La2gsYF92OB6uNKfegrrsJcTEJLM9XU5U0Nu0X6Eam+w+HXlUH4CLPtAuD+IR9dmpmZocj+qFLE
	z6TstHIca1u1iFZkvczx6Rb4Zyw2gPp5kJJsNR2Tgwf1ltEmdrxuswc7xSWJutUY2Js6SzPM1vt
	EgkeAPK+auXP6pJv3SHa7PAPuyD243Xj9fn3Lyv+MQECz8sWVn5teQzrG7eSYRz99gPcAFfT0hG
	9xGBIhuQ0MdKz/Pn2zFBPEoHYMdflrRfVC4GUtjkgEkJXsIi3Bo=
X-Google-Smtp-Source: AGHT+IF2mn3mg61AhxIRzVA2bR/jIjuLw2jHjDOf+yw538ZM1O86jJPc0a4Zf5MjnMQEfOmHXeyXjQ==
X-Received: by 2002:a05:6214:4011:b0:6d3:6577:ab11 with SMTP id 6a1803df08f44-6d43785b7d5mr72380526d6.30.1732162405777;
        Wed, 20 Nov 2024 20:13:25 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380d8b06sm18238846d6.37.2024.11.20.20.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:13:24 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] kernel-devsrc: fix powerpc for 6.12+
Date: Wed, 20 Nov 2024 23:13:16 -0500
Message-Id: <f7355d3b8d2366d8bdb4b18b0710802b3da05a17.1732162137.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1732162137.git.bruce.ashfield@gmail.com>
References: <cover.1732162137.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207504

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
index ed7a1a973c..5d706c038f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -226,6 +226,11 @@ do_install() {
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


