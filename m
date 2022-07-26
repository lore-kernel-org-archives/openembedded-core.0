Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF85C04A68
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 14:24:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7307.1658845457003726225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aWggyA1x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so1069311wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fA8Nwq0mIlMUUbtrwBTWgFWJQh6aRRd65r54y3bzkyg=;
        b=aWggyA1xSK1Kc6uI0EMfDiLSiFaAMF2XSo1yP0mmKBDcMKy7+XWZsMGt4kQFyWbIws
         8ZOf1VhM23Zhgkt/hXVQRTenTYabqJCGHBpeIBlPTmQxJUkHg1Y/a411PwIn61C1u59r
         9YDyNiih4rrquL4uMIFg5SMbwWsbv9bY0091Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fA8Nwq0mIlMUUbtrwBTWgFWJQh6aRRd65r54y3bzkyg=;
        b=D4g6TsVqSf51jAgFA47hpAL+4Rksgc0O9U1xacKOWclja0gJG8RJc0OJhMTARLg9dP
         twYOSigk3ES0LcAaQtJjdpxSu7VRPd44n4TuO7q8YeFrMxmhC46n3mTCfeOcqXOax444
         OCLucUhmGJEjff3BknQoVYsiG+jqDkwDsv58wQ4SX2W0Menpl3SdrZwgAaL4QY31IxJr
         35GhOcH8lX/njzkhshnJ/uUWg826tziXEci3+yRNuE3z9kofZiclTEJEYXY4j+xH7vws
         e3kcowetOKYfWbQOZSTIxASkMGkexzEmLu+LwLCh1oxO4RwW5qO50NCVhYr5Z1OQA/P5
         Wl8g==
X-Gm-Message-State: AJIora9c/Oogc6OPOUJzh0lc6EFOw3C2+p8FrTEciPxwkkz5mbj/iB+6
	jhmU1Hpwk+ZvCoxiGwQB8cxcer5oHbHyAQ==
X-Google-Smtp-Source: 
 AGRyM1t94vx0AJeJ3DtPtoVwJDxbA7gSR58aluAX+ZZbQaIc/m/9FicX8Y95LOLuBZXKEJEWcvUFTA==
X-Received: by 2002:a05:600c:683:b0:3a2:fe34:3e1a with SMTP id
 a3-20020a05600c068300b003a2fe343e1amr12918576wmn.192.1658845454673;
        Tue, 26 Jul 2022 07:24:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b0021e50971147sm14522654wrl.44.2022.07.26.07.24.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:24:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] native: Clear TUNE_FEATURES/ABIEXTENSION
Date: Tue, 26 Jul 2022 15:24:11 +0100
Message-Id: <20220726142413.2262729-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 14:24:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168507

Some recipes reference these. Rather than continually trying to chase down the references
and taskhash issues, clear the variables for an easier life and simpler code. These
wouldn't convey anything useful in a native build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index fc7422c5d7a..5a273cdebba 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -23,6 +23,8 @@ TARGET_CFLAGS = "${BUILD_CFLAGS}"
 TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
 TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
 TARGET_FPU = ""
+TUNE_FEATURES = ""
+ABIEXTENSION = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_OS = "${BUILD_OS}"
-- 
2.34.1


