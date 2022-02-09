Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF98C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:17 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.29744.1644427817207597797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=RE6QSJgB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id b5so2399484qtq.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZNN6qbr2Mba7TEs3rxTphrSk6O6088kUacYz4OQIXj8=;
        b=RE6QSJgBchjcQCf8LJ7NmRsQlpsPdf1hvxsKsYj1JletOjinGviLqI9JYFlVckOuVW
         tFu3lj7RfGLCBaQoTEVJrpLupJNBncPAyhPG39RtRywsIa6IsJqHAV3PwVoeHO4/JTCE
         8ksB64Hti+CzeGcnuj9v+fR2XV8qi2UGwTV/AeM58FGQtFkguY2XfpMX3SXS0+S4clfz
         bE0fv76OMQOjOo/JtuYXweuqbk7ioD01aGhjH10iYFE3FxPt0DeoV8VkTnAbknzFBtfW
         zY0UHu87lKhpkN8RBhstybNN0B1+LbSYs6EULV+IT2mVLSraefsQyL/W8FDLJitR/Hbz
         4djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZNN6qbr2Mba7TEs3rxTphrSk6O6088kUacYz4OQIXj8=;
        b=SIPF4L3rHN7iOYaYr1830HoBL/rWwfhcJpMet3YFYeHBVF2TYsmoPAHzJhBBUs6nnC
         IRIgbGfBQqkoEFQTbFiDaIppMgRqIJfAZi/At0jtdY8rTafLOx8oz9AXXvfGhqNZ9yjl
         FOV3I8cnToewqxsC53f8cVaEBrssMMlmc+DX+ttbednrxnbFxALi0YVcshBCii+e5LlZ
         XNtnvCSXGNGJI3laHM6eeuDURmt2jmh5ZfFn7UZAScIJk08Zq0PUFz20pOnFKa33DSJH
         syUoSOrzNDdZq9wfn27E8RlsiYsn7KPNhRtWC1mhdROmdIjPky87Y8AwAviJd59OxlMn
         RAnA==
X-Gm-Message-State: AOAM532QR4tdp4JXM7n1UEJZmqP6WxeykugvMiedxZDC3BR+UBq3pa1O
	+pRKeUV6uXK2J9dgGXHkZCfj0uHS78XtMA==
X-Google-Smtp-Source: 
 ABdhPJzkeqd24m45TbQBYsQPZs1LuHz4vAAvlT1h+tvzwsh8khaYCOVm4uMbTRUxRnHarR2BrszhAA==
X-Received: by 2002:ac8:4e48:: with SMTP id e8mr2152920qtw.52.1644427816049;
        Wed, 09 Feb 2022 09:30:16 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 w14sm9940958qtc.29.2022.02.09.09.30.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:30:15 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto-dev: add qemuriscv32
Date: Wed,  9 Feb 2022 12:30:10 -0500
Message-Id: <20220209173014.1389378-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209173014.1389378-1-jdmason@kudzu.us>
References: <20220209173014.1389378-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161570

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 0d946373523c..98a42235af54 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.30.2


