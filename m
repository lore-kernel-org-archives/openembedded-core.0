Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0919C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 17:57:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.29752.1647280656545280482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YphB1Ue3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id l10so9822115wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrFEl7cApqqT89GM9Efp/vvGT8xk41qR4+1oRRyYAR0=;
        b=YphB1Ue3KVd6sufGjhAHdiMANFC78Py/Ly/DKPvHIU+8fy+vC0BaKly3wYKI+7fwFL
         yI2oZ1FTe+7C2gqJ2keU6Am2ll1g75QYPFTqbwSemoaL5cisCkhPUQGyWvV//fHuYRMN
         QHZPT2fuwPkbPXHborp/jZwAHAkd2s2QGOxTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrFEl7cApqqT89GM9Efp/vvGT8xk41qR4+1oRRyYAR0=;
        b=t3szaTofqVQMRGSIFIwLZVnsQbaHRAAZYRLpQnFU/zkEjTZsyCRivqVflbMOQwB/II
         RAlc367A9oM8At49KXo8xlhwse/0Woqte1YA5dY8ha23sRdZfS16wKkhEZquSM3VIp2K
         t2M0t3rnU7IWUmtPH7r3ebPLz8aO8hF3vVEjzayK/52ZJQpzdXEgLSPbQ2xdy22YBvkC
         6m/BtdUqhQh447SymvGm0rLGBLqc1WEkG3LCchVyKD4ihuYGtaLiRuiVcAt59DhisYAP
         1tAvWzedWUjk051Ex8tQqHOvx+vnW0AL8n96WE/QnO7ahMf8JXg3EtIovtf49b/0QFJ8
         hCrw==
X-Gm-Message-State: AOAM5302815OjE1qsnBS3Dj6HJhJcEglDxmhLktSnZUYU1U3f7+viAAu
	CH/Qj6/TB+xe674H21NTNye9qJM1zjKX8f4u
X-Google-Smtp-Source: 
 ABdhPJwRv/ms9jj0Sps8S2zkBnVjYwkMMnqaSKYg6hMq1ux8b0p/9/X7jfzKqvEV7k7DOM0huUNEWA==
X-Received: by 2002:a05:600c:4055:b0:385:5450:6717 with SMTP id
 j21-20020a05600c405500b0038554506717mr259460wmm.13.1647280654398;
        Mon, 14 Mar 2022 10:57:34 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5edf:6bc1:541a:c26f])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c2c4c00b003816932de9csm166718wmg.24.2022.03.14.10.57.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 10:57:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/runqemu: Fix memory limits for qemux86-64
Date: Mon, 14 Mar 2022 17:57:31 +0000
Message-Id: <20220314175732.827665-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 17:57:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163161

When setting memory to 4GB, qemu is only running with 2GB for x86_64.
Avoid this by removing the mem= option to the kernel and letting the
qemu configuration handle it for x86 in a similar way to mips.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9ddd47267c9..2f77a7bd0f2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -814,7 +814,7 @@ class BaseConfig(object):
         self.set('QB_MEM', qb_mem)
 
         mach = self.get('MACHINE')
-        if not mach.startswith('qemumips'):
+        if not mach.startswith(('qemumips', 'qemux86')):
             self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
 
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
-- 
2.32.0


