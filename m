Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66976C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:48:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7676.1786690132722745584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S4PQHlva;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015532f7bso593494e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 23:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786690131; x=1787294931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAEJvNzyT+T8wj7BDyrFo7D3PZ2ay8janR3FEANRM8E=;
        b=S4PQHlvaxrnGeGc409jwH0VrIhgbAjrC6PXAylRmlRrBo2A9lGAJ3AW+Q3DqSqfHUb
         z+z5UDiRWnHx0Pf7viXpymaRKusZkOzWWZHTOqPgyzcuLsxKR9kvYtciT5oEQVgVz1wy
         vV6GfbcfKWbe8pVOE/ejU+esZPfNWjIs5IWksDB14vtOEgxDYWjq0GMHCQuTrRmumtc0
         TqWfwk0wSf4T2cWb3b0orD3bTxf5Sp0r4NKW2t/vpPs5YCmHam1kuFkoUPcMU+wbrmDi
         lAUtok4Ljd4ST/zOyTFpwyn06byyR+BiMYvQH4Q8bXjxZ/rUw6rNRXouyGjcFfscHBeK
         NZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786690131; x=1787294931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAEJvNzyT+T8wj7BDyrFo7D3PZ2ay8janR3FEANRM8E=;
        b=l1dHkPpujVT+Its/gBIZC5jjKWQ4SvGio3ekxVQHxpR0xH6KCNYNwC4SYhC2sY+EJp
         mL4CD8YUVN4QSHKL4sSaqWuHZUB2XjIQ1EPtEX+aJ+kXC+NHs/UbbdafU0z5DExkSR3K
         TgBDpj8uqpbF8sy8kbpj05tYA+4dPqYm1eoDOtREhBTa5HecZKI+lVHxD1/0yXoR38CI
         FR/Y7JMxNoPc79f3rxaUXG6YM3sPypXZ4SoGQbuj4QKw0ddsah4IrEmvsuj8zI44qudc
         yJII1tWzAYoANPL6uqz4Z2otbU3uh7/3g/Wj+/p+N4dCcpsBGvUUNUdylKHHqLfJCgB0
         7ywg==
X-Gm-Message-State: AOJu0YyKMRUb9Eghhf1dGjYHxjSi1+e83EEIA5k4nPLv3ENZNHbMllWK
	CFLbYBFwK5mQO9RhzyYePJoKAON3H+LJDwucxfXJoOcYeEEZu4CjX3bHzUbZrWwmBsXEqoKg7qC
	N+Oo7
X-Gm-Gg: AR+sD126ZQ9Zl9veXLVs3xdHjRvKS/Z1EC3V9DJiKoBtA6bYRG5MMUAFe0uL2jTnUEO
	TauZSXD3yC9685sb2IfhCTxK9f7uTBbTDEPWUQFC4+vqqiRnbnpV15Giy6LH2Z8Fjvr0dwReOQz
	NSSjRTAC3ohqCERdJS9CYX37Armh1mGfVYAX2y33nrsKlMmrNym9fvT6bJDYp913rdUM0LgF42i
	zuilIMzlzVgRVlzhhojjvJBxANoCKBquH4bs9qyMbI+wk1a+d1yXbjlscAH1mS2QMCWOuw/igGx
	Q+G4LedDXSUz7kc5yncp3Ib7WdorI5y2R3F8aS1qbo1oNYMOs/zeQYSZVksa8W0qauD5faeoUQz
	TocQV9wpecQthD04Oszcs+WFgEFdWc7MLDIEki2qFkMdroPyxSQd8fKQJkb3B2WckjWVt/XE3P5
	Nx4xIVLIk9JRTxqpfSRAQe3nPACtr829yyHUw17rFEbMsQieE111cSBOqUP41PgUWsbf5yvWCc2
	vmxsVMQH1QQLYU=
X-Received: by 2002:a05:6512:3409:b0:5ae:b136:acdc with SMTP id 2adb3069b0e04-5b45917eafamr400631e87.35.1786690130653;
        Thu, 13 Aug 2026 23:48:50 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0e9dasm349285e87.78.2026.08.13.23.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:48:50 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 4/4] kernel-devsrc: copy kernel/sched/ext directory
Date: Fri, 14 Aug 2026 09:48:12 +0300
Message-ID: <20260814064812.1071873-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243422

ext_* files were moved there in upstream commit
bba2c3615bd sched_ext: Move sources under kernel/sched/ext/

Fixes oeqa kernelmodule.py failure with 7.2 kernel:

  CC      kernel/sched/rq-offsets.s
In file included from kernel/sched/rq-offsets.c:5:
kernel/sched/sched.h:4214:10: fatal error: ext/ext.h: No such file or directory
 4214 | #include "ext/ext.h"
      |          ^~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
make[1]: *** [/usr/lib/modules/7.2.0-rc7-yoctodev-standard/build/Makefile:1408: prepare0] Error 2

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 0b52f5d48c..da33e9facb 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -368,6 +368,9 @@ do_install() {
         cp -a --parents kernel/sched/ext.h $kerneldir/build 2>/dev/null || :
         cp -a --parents kernel/workqueue_internal.h $kerneldir/build 2>/dev/null || :
 
+        # 7.1+
+        cp -a --parents kernel/sched/ext $kerneldir/build 2>/dev/null || :
+
         if [ "${ARCH}" = "mips" ]; then
             cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
             cp --parents $(find -type f -name "Platform") $kerneldir/build
-- 
2.55.0


