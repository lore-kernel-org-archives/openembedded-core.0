Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1EDC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 14:54:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.6870.1658588062852467559
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gnhI4hfF;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 q43-20020a17090a17ae00b001f1f67e053cso6499836pja.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HjlnMYiB3+/dv8aM9P3TlXr8M7zR1kyFLnXgTb3c8FY=;
        b=gnhI4hfFivjvwnhgJS7LCgU+/nkDcpBXqpgreuOtJLrEJI7ZdVe9qAQfc5SGGmhjjs
         T6SkaybldaU5i/x36vAMLmfvY/wI0mIsDM/OZNXTmkr1d/bTx5YSbjG8oWryPhg9Raj0
         wGwMLwI56luPkXJSZ4e09HwuAUdkUY0wxZQhLdZmVIR8uUSJwCNxlQo1ABXEPDGMlzh9
         nihZ4e9v4hDcRbgRLpK/2Eq10u9uEMYSgaO4MQkZvt4Tw+/eZLU3qGyE5bjQmwh8rSGI
         EqsWz6PG+fj6DIdiHPq9ArJc428w58P9CIGzAh5wU1vYQZ8Z7LtwpdXoQKaimpTwjs9O
         adaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HjlnMYiB3+/dv8aM9P3TlXr8M7zR1kyFLnXgTb3c8FY=;
        b=3GsSHYXKok3MJxBjvUtZU4fxeie3H+OqzaKclC8kg+Pqze2HRwkhzLbSHTEGil1GOF
         uBscOraVYa3e8On63/9cw6xy62BSjjlyjAKU+B2D++B6bG+d9lo+bzmPqbE9uiCy+7CJ
         LFovNx6X4msqcsOrd1EnpKHXTtFzjXVlfq6jjb0+iGeksOXkBXOkB3XilKRx4CTXkmVa
         KOFoaIiV12DHRqAsWMshdrbvPLs+I94Swj8jLNBn/XzfMnj0TCaqStn+1OuVUC61DFVG
         9udFzU4d0OCa3C6s+ACzTSrAYVcIo/j45N1lWQ2FeWvWiFiTg96vaGzDpg9kWxST1uoK
         Rhrw==
X-Gm-Message-State: AJIora8KLzNQRt89Zg0xeZvnSD9AbEDFjqZB6188ZWnTOSk66AKlciZK
	SxuMlxoDRyeNjIWXwWKQSp2F7xkicOGLbA==
X-Google-Smtp-Source: 
 AGRyM1vq+lxn/APeVSq2lx4NR9GgVf1mJxpTBuEMBJsP6UW7/RFMZpYWIeTM89W83vuFXata/sOOuQ==
X-Received: by 2002:a17:902:e80b:b0:16d:67a9:36ad with SMTP id
 u11-20020a170902e80b00b0016d67a936admr429772plg.102.1658588061744;
        Sat, 23 Jul 2022 07:54:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a78c])
        by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b0016191b843e2sm5771533plm.235.2022.07.23.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 07:54:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc-runtime: Use --with-target-subdir for baremetal
 targets
Date: Sat, 23 Jul 2022 07:54:16 -0700
Message-Id: <20220723145416.1374755-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220723145416.1374755-1-raj.khem@gmail.com>
References: <20220723145416.1374755-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 14:54:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168442

This disables tests for runtime system specific functions like fcntl
there is no other change seen

+configure:77372: checking for fcntl
+configure:77372: result: yes

In libsttdc++ configure log outputs.

[YOCTO #14803]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 15f4175214b..91b74c732bd 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -16,7 +16,8 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF:append:linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF:append = " --cache-file=${B}/config.cache"
-EXTRA_OECONF:append:libc-newlib = " --with-newlib"
+EXTRA_OECONF:append:libc-newlib = " --with-newlib --with-target-subdir"
+EXTRA_OECONF:append:libc-baremetal = " --with-target-subdir"
 
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF:append:arm = " libat_cv_have_ifunc=no "
-- 
2.37.1


