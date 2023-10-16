Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF7C46CA1
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 15:51:51 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.130297.1697471505389850257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=SnxURvaO;
 spf=pass (domain: smile.fr, ip: 209.85.218.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9becde9ea7bso428892566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697471503; x=1698076303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa74oJQY5c/B3XfKCEQG662PK5dRTMsxV6DQE4wVL8Y=;
        b=SnxURvaOL9+B3yH6K7jGY8coAsjjyCdt4IBu2cUNiCdIoxzsglzZSC6nY39Z4gyZvj
         nac+XhXmEA02LrDD2k7peTPSASzyqsdc6pxYBZIM+rHGGqTs2jr2pPJKcH0HdDp7tMhG
         8l6OK5lJnI6Ks2wpTLd4uVbZVB6V+0Qo5mNbd4ovZR9zcrXm+RGleAjHQcxdtViIUEH4
         oNaZtKwxRMC4gsxQmOPwR38Xpm6v24WbCnfObx91EC9dabwucAbA65ibvWkT8qig+BXt
         qmqgib1kglcUac+p3R2V0HJ7dbNRHp9rw2nLQe1Hkk9QgH5PRKQ4DruMOLfjKmyCOlwh
         FM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471503; x=1698076303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa74oJQY5c/B3XfKCEQG662PK5dRTMsxV6DQE4wVL8Y=;
        b=CxfWwGSMj5RmLNF2wzMy20KzXEDD5lE174z3kgglEY+wnCFC9d+R/CnQbRh83NIvFO
         BbN3wq4YOPVpBo/KRDQL8TN4GDb5XsVMmiB3VQli4fczNbjE5MYpxvcQzRAgs3u4h0QC
         xxio3yP5Bbc09JscKzuwuF/3Q8bPVHuYTljuxgzioQtAvi4Gti1p76In4wrhmyevT76D
         +Vr/gEJrgPfJnTe8mcgEHRuJsfq/z1yCj/FEr5Z2PsZu1H88tb1gi2Q+VfjwTTyRfgA9
         e7bLIlmoeSWdI4J/BXQ/98xOuT+Il8EnV+ZqMRYhpIv866w+EtnodvYm78lN0KYg6Ld5
         Q8pw==
X-Gm-Message-State: AOJu0Ywkyy6ysSrgIN2pxfkPYtxc2nMcCo0NZwGnbbdQ7q2YQOmaEwRK
	WGvUr1lesWqLXaVW/3x7ZnAdO6UzwCkWaHdEwtU=
X-Google-Smtp-Source: AGHT+IHkjfJxB76a+bzfMY0nUdr8LqnooLTPt/9jVxsMoRBeaICumDxVM7VPTkvv79A9kK2UDvJTxA==
X-Received: by 2002:a17:907:786:b0:9a1:e0b1:e919 with SMTP id xd6-20020a170907078600b009a1e0b1e919mr7143334ejb.4.1697471503556;
        Mon, 16 Oct 2023 08:51:43 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id l23-20020a056402231700b0053e89721d4esm54132eda.68.2023.10.16.08.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 08:51:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Mark Hatle <mark.hatle@amd.com>
Subject: [PATCH 1/2] insane: skip unimplemented-ptest on S=WORKDIR recipes
Date: Mon, 16 Oct 2023 17:51:12 +0200
Message-Id: <20231016155113.54796-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189301

On S=WORKDIR recipes, the unimplemented-ptest check will scan the whole
WORKDIR and "see" disappearing file and directory.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Mark Hatle <mark.hatle@amd.com>
Closes: https://lists.openembedded.org/g/openembedded-core/message/189254
---
 meta/classes-global/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 07de974a54..f7a2c392cf 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1370,6 +1370,8 @@ python do_qa_patch() {
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
+    elif srcdir == d.getVar('WORKDIR'):
+        bb.note("Package %s QA: skipping unimplemented-ptest: This check is not supported for recipe with \"S = \"${WORKDIR}\"" % d.getVar('PN'))
 
     # Detect perl Test:: based tests
     elif os.path.exists(os.path.join(srcdir, "t")) and any(filename.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):
-- 
2.30.2


