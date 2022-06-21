Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9257CC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.47965.1655842627315424022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+rMXyen;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id c13so16436679eds.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QduIpIy53ETnQqVcGeRHpzNrnu6QxnzJGEQMx50voME=;
        b=p+rMXyenhZtL4eurwzJRcOSYt60u8RUmKAxjZ5vE3o5fWNe0F+0KdcfJW0pSlpggVY
         mnHcwLoMDGJW7wz43hbYFNkt16ds2+BO3hfSSZT4Mnr8EbluSIg4KItmdvNqQELypWHC
         pEgKWwaYIYXx56Ssc+C+OMVSXdp50Eel8WuNOShraOqgSAsolGLsyA47XDieYLRKJQ10
         eP2X4HhwdsvzTQ4nYSIF6XgwL33Xz7bmrhw4QhcXdVAtoW8P3qfbdtRV9Sa3b9RpyfIe
         E47R6n165oq7zLPzp3VOjkbuUIQ/5Eva8kKzk8H1oU/Zi2oRk+MXXrr/qpG5zQnWf2L4
         W2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QduIpIy53ETnQqVcGeRHpzNrnu6QxnzJGEQMx50voME=;
        b=zo5MCLrgTUKkmqnvEFF2J/olWjgo3Zk+NWzYDT3pBgVXCs0F2b0pwAzPQXPQ6nEuAF
         beqTyTxNWH7KnZhVjdllROor/hM9lD1d7P4hVmT+I8DJC/EstFgy4El7J0vu0Xt/Mtdy
         eArulhiPRgcVRfOTzohoE8tmw3gz8LuVySaOU8yNmfvFmgkBjDFznoG9tUJdUPHPr3ab
         tw/FDMEJmv5EUB6aKw3aTxnvmGnAzj5pN7MsbMXES+wodrZv352VxLQfd0Jyrkq/JgsC
         /m44YoD7LWY5thd81yVLD+VGfJ5G7SHkCzGimt5iAuq2tMmvQHUYWIMxnlnzpY6Azao3
         JFIQ==
X-Gm-Message-State: AJIora/3ya1+EthjzNV2lsUhz4EEqV7tJf92bJyl8xbiFypUU+rrDS/D
	vSuBEkco/G7SrncFsl4RnRXOwSMo6KSoug==
X-Google-Smtp-Source: 
 AGRyM1vNW20rcst+uhUt79YNUjTP+3adMRK7JmBYr5jF14Wj+slftTWZhv8GAemNUc91sSKM5xW+Yw==
X-Received: by 2002:a05:6402:11c7:b0:42e:c47a:ffdf with SMTP id
 j7-20020a05640211c700b0042ec47affdfmr37367778edw.113.1655842625958;
        Tue, 21 Jun 2022 13:17:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:17:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/18] x264: upgrade to latest revision
Date: Tue, 21 Jun 2022 22:16:36 +0200
Message-Id: <20220621201637.1378306-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167185

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 51ae9d1179..2ac2b6f1a6 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "5db6aa6cab1b146e07b60cc1736a01f21da01154"
+SRCREV = "baee400fa9ced6f5481a728138fed6e867b0ff7f"
 
 PV = "r3039+git${SRCPV}"
 
-- 
2.30.2


