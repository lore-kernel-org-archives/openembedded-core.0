Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDCEC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 14:24:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.14414.1713450239092277371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 07:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=KBykkhLf;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.221.53, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-343c2f5b50fso569497f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1713450237; x=1714055037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JnupohzTcZ6/J/ho90DNb8YI5b101a9neqavUYOGpvw=;
        b=KBykkhLfYsOgwn3ppjerA4pFUKOm8YDLF1asNC775mWccaHcj3lfqpcKStZOq9khzX
         PDEdyLqLBJR3hCOMDP1lW13mASF8UW/W6+n+vyUbY4PszyXzUQH6DJFVIjssmv+EnBxS
         z9FGxujGRd8fU2EA9sex5wVMrR8sjWyvqJAPWlRSANLe9S15CJ2rG0X5Zy50H5iTfmoe
         uC9Q9a9mLHBIyTKn+AjzlPd0mFV5yop+Zil4HHpDYSC6t+aZ04eW8+WKA8bvjg7nOrBm
         z8EUMmpBKfdE1JoBMTVzt/0FWP2NNR3HjFHvWfH7RrV9FVU2XSQ2ORb9G9vm1SnbiLi4
         Vokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450237; x=1714055037;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnupohzTcZ6/J/ho90DNb8YI5b101a9neqavUYOGpvw=;
        b=D7y5WTyFUx+LA3a5kAPdOLLwaPWAlPTVn6CRzQaUr8DqffaGNBXOJr2wxL+9+eVRCK
         gk3pidMvemvrMq7P4g9wGYpr1tAmmWWybD25UqM5QFKENCC50el76Qk8VmuZcE2QCYCb
         XXjlUBKBbkkdqYYlGhcWghVSKkudDHM16qhJwX/Su5S6FjipigdJ9M9VFpeu4DLKi6cC
         Tkci/dCXOVaq2k238R7u3Ylphbp+CKek3cGZv58xhGp8jzO1WDYmqC+T1fw7wKq8bciS
         J0Px2QxqF5vhsZiYGrcnlHNF5JUWdzEPipWiUcmbXQfRuLPNRb0NeUBA4PcvCX7HxLIm
         NrTQ==
X-Gm-Message-State: AOJu0YwB7HeQCJj2HqD3+H1LFKmhmDrmLuYoiPXtHP+KL1i95kZtUHnu
	q4pxzGT3wWlvTTmo/DPjVrvWmP5p4JX8N49hbY7rEbbCiR2S61QyS5beywLqZkvJVBmb5KhL4Tr
	EyBn3CQ==
X-Google-Smtp-Source: AGHT+IFAQ10j79bf7wtaKxMYdzgxMzV3D66MJOkiRfZ0tvvGdJcxT+mL5NDoXECeJp2aupJksTjozQ==
X-Received: by 2002:a05:6000:bc7:b0:343:d06e:51cc with SMTP id dm7-20020a0560000bc700b00343d06e51ccmr1686383wrb.66.1713450237140;
        Thu, 18 Apr 2024 07:23:57 -0700 (PDT)
Received: from localhost.localdomain (lfbn-bay-1-432-16.w90-30.abo.wanadoo.fr. [90.30.140.16])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d40d0000000b00346406a5c80sm1954250wrq.32.2024.04.18.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:23:56 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ross.Burton@arm.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] oe-build-perf-report: Update chart tooltip format
Date: Thu, 18 Apr 2024 16:23:53 +0200
Message-ID: <20240418142353.24353-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <14BFCF16-AF38-43A8-95C2-EDDDFF5A98BA@arm.com>
References: <14BFCF16-AF38-43A8-95C2-EDDDFF5A98BA@arm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 14:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198519

Update chart tooltip format to show value as size in MB for 'rootfs size'
and timestamp for 'tmpdir size'

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 scripts/lib/build_perf/html/measurement_chart.html | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 9acb3785e2..07e92dfe78 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -25,10 +25,13 @@
     tooltip: {
       trigger: 'axis',
       valueFormatter: (value) => {
-        const hours = Math.floor(value/60)
-        const minutes = Math.floor(value % 60)
-        const seconds = Math.floor((value * 60) % 60)
-        return hours + ':' + minutes + ':' + seconds
+        if ('{{ measurement.value_type.quantity }}' == 'time') {
+          const hours = Math.floor(value/60)
+          const minutes = Math.floor(value % 60)
+          const seconds = Math.floor((value * 60) % 60)
+          return hours + ':' + minutes + ':' + seconds
+        }
+        return value.toFixed(2) + ' MB'
       }
     },
     xAxis: {
-- 
2.44.0


