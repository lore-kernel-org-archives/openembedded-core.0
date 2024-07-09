Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16E5C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 22:44:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1300.1720565078652249530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 15:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FQ/+dQlr;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-36799fb93baso3823887f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720565076; x=1721169876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAkiXiLQnxFJN7gGTr0dCQ40iWbwtp191FYVE67JbzY=;
        b=FQ/+dQlrG9h6KAQiqAAyI6mkmYxiPoR/8DVkyYNpPMeFCwqDxcOAsEUfggQA2ZOQZ/
         DyLRF6n1Yze2UDI4JqNGRRGC+8xt3yGogayVw+rT4syhTyWOSvblMAwf2A4pKy0SSzSm
         awDjGiTbRT8xHPX/qQAC/s7OTSEQeeh6qpmDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720565076; x=1721169876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAkiXiLQnxFJN7gGTr0dCQ40iWbwtp191FYVE67JbzY=;
        b=RduKyFqASdNGsKltR5FngUpFsiwRLTFyyN8l4+p1Funbsk7qA7UTKEJsBqqB1ho+Kn
         5pcSDSpXxR5HD1+PdndDXcte0YvCNEaF0tniVsrDFXTgy7s63bLuRnHomJrsL1axQzhj
         vMLzRUjHedpw02+LUNORSsinfpWv9tw5qLLZJFXiUogn3gaJ/3cDhJJl1+BoWmnoImrt
         Qhd0sfnUl9LPoboAFHqpqtUnJdEiXVnhmoq01Vbtg2WgUUXwQ0hxLtflZKrNcCb19fKO
         dcxDlGZV6ebXc2jPyfFScqkF3WA6lCiM9m/B5aWxsrJcygJgnW0HbMFRGy6P9cnIrmva
         P5sA==
X-Gm-Message-State: AOJu0YxPReAFCE5EK+48KJzA6dFijnddeACiYAZyqcuFst97ypB7mj4E
	L2bvWpldw6SUehOHOcc2SWBsMAJSJAX6Tlu8gIdK1ICMGGU1BL7At/QFtF/9Hf3QdsHQ1J8KOQp
	1
X-Google-Smtp-Source: AGHT+IGkbKtyHXdCx16F5Z1v7TRdtlw4KSMQ/7PhL28X9soAhioL9BvKed7X/K0GdXITEym6Ix8rog==
X-Received: by 2002:a05:6000:186:b0:360:744e:4f23 with SMTP id ffacd0b85a97d-367ceadcd97mr2434420f8f.63.1720565076384;
        Tue, 09 Jul 2024 15:44:36 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa07c4sm3597677f8f.67.2024.07.09.15.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 15:44:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] insane: skip unimplemented-ptest checks if disabled
Date: Wed, 10 Jul 2024 00:42:33 +0200
Message-Id: <20240709224231.2092887-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 22:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201685

From: Yoann Congal <yoann.congal@smile.fr>

This avoids searching through ${S} multiple times if unimplemented-ptest
QA check is disabled (the default case).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---

While I have not seen decrease on build time on my machine, I hope to
see an effect on world build time.

---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 6888fa06f0..3b04944f0a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1361,7 +1361,7 @@ python do_qa_patch() {
         return False
 
     srcdir = d.getVar('S')
-    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) or not bb.utils.contains('ALL_QA', 'unimplemented-ptest', True, False, d):
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))

