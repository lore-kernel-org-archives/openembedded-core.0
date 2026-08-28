Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77037C61DEB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2995.1787945912868084306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RyHjs4iE;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso16807915e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945911; x=1788550711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tIXSxFdmfu78gfdR0bXa8FhDTkF4Ll8zx2cE+3AprqM=;
        b=RyHjs4iE42X4PYlZ2EUDLloeC1V9sPdFD1PaBgCrhk20w5MHNQib71Xv7t0pR/NFj+
         oIKZ07TpCnr+/y3ke03WkpSjx3dUF4zrC2VUIFl5WdU/PFf49gvhn9FrgfjhzyWJTfkr
         Ajw3zi5NfAXOTMEamhe4LHDNB6NW+cmNTxjuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945911; x=1788550711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tIXSxFdmfu78gfdR0bXa8FhDTkF4Ll8zx2cE+3AprqM=;
        b=RyxdvOy+6+w+L9yXd8DlzXOkNLEmPY94TwOTgHXSjPDrpk+maDb4lZRulgDfddO4RD
         y9Z71tXu1c0bpwEamghUZA0oimoQ0b3qm+4DOX8XqpFJML9eC8GG7JvYyE+PynBrObmY
         md+1sz8RaMR47MReHyhrFjluzD/lYvStLNecylehbwhy7UGwm62ygEc+W2ojpCY5fY49
         2G//wuibLkt4V1cMPS5b4Sw3V784YdiZPtTO8EFe/+g+C2YLtZHNpqtX4P90novU10b3
         3eFWwE+E96RE5aRIdMT5zC6/954cPybAChSkyG+xtHLFBearI3Yiu27OLsgkx93jMdQY
         sILQ==
X-Gm-Message-State: AFuF++l+2E7C1m+JjozUUEjNWHcricJuHqI1N7qnpE5846OAr3OkW1Qp
	otpcFaF+QfSWT5Lc9enEt6iXqoXa6sKMQ/ZnycLEY7oAlogrvIhxwk+rLgZ3JSURVLfgLz9XynC
	sZDD9RKk=
X-Gm-Gg: AR+sD12xgvUO87RZ+NSpe/ohdiEFrKjeIup/y5xHMFNxQ/OQ7dLgreGDEE3bBLEwpig
	9yOdXjc6zikgtQzWS6dtiOJqyD5uamS0XrQRLfuyLm9tmpvABsUDPGzq2yuK0mJhE4mJUEuw6B0
	Sc2l4c3eMKPQplr4sh9RIydGB5Dkqb54vAsnhZAvj8g8MwKB+7KPMdEvFY7FCuSl11tkJZP6oPX
	XAutx6QBDSMcuWtxWs2Xng1njCKKhnqyhmgBw6DetzmLqrcmtPLEhvqSw/RkG5XawQrnSSjCIHg
	cRI09GmbZpLYP1jw6vxdFz+0cxKqrC0iv1fHiJCrVPNjyPGNA8iZkv0xg8N6lx5AuRLMU2+KV0x
	Kt+BblhuqLoLAXeG1jV32sLWNTiuO+QxicPi0NYXdgWhk9gQegSYSeyu4nhTIRtqGlXXrj+acCH
	m92BwotejITtW42jcND3vTb0IXqQW/qE4TsdhujVED0VH/TXSDJ9sfZo0eriCEenQ1oml4Nu1jT
	pb4Kp7AW0fJbtZ0yrUtMUMI3qKZOFapz1EHNNGyXEYQkmcSH+arVOUKoSqjGoPr
X-Received: by 2002:a05:600c:1f8d:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49b91c17c41mr132023485e9.3.1787945911108;
        Fri, 28 Aug 2026 12:38:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 47/56] kern-tools: bump SRCREV for conditional 'depends on X if Y' support
Date: Fri, 28 Aug 2026 21:35:57 +0200
Message-ID: <a96e190960a5bb2a3448e1078afadf8ef839e194.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244608

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Pull in the yocto-kernel-tools fix for the kernel's conditional Kconfig
dependency syntax (kernel commit 76df6815dab7, first in v7.0). Without it,
do_kernel_configcheck fails on v7.0+ trees once a config uses the syntax
(drivers/hv MSHV_ROOT):

    drivers/hv/Kconfig:77: error: couldn't parse
    'depends on HYPERV_VMBUS if HYPERV_VMBUS': extra tokens at end of line

This SRCREV also carries the symbol_why.py/kconf_check audit hardening
(surface parse failures instead of swallowing them) and the new hermetic
Kconfiglib self-test.

(cherry picked from commit 4f592ee59e90e536af33648112658dafe00f5d0e)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: $ git log --format=changelog a4a362d9f4f0..96a8d58bcd260
  * kern-tools: add Kconfiglib self-test
  * symbol_why, kconf_check: surface parse failures and add a parse self-test
  * Kconfiglib: support conditional 'depends on X if Y' dependencies
  * kgit-create-buckets: update classification for 6.19 kernel
]
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index bd903160507..2e13e4ca31b 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "a4a362d9f4f0abc8ab145a8673166b9bd875731a"
+SRCREV = "96a8d58bcd260f104c193a81b727818424d7b263"
 PV = "0.3+git"
 
 inherit native

