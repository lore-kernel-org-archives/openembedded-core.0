Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCBDC3DA6B
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:14:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.24370.1661944459645155651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GDIkEmcx;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u18so5126561wrq.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rXJSQ7ZwCs3657OxftYZuNacMZCLx7wshnYBTDQdLZA=;
        b=GDIkEmcxyiEb867p9L4UscvfLfJ752JyOKKH8+U+cREOV4jZhKBCUzUo/OTB62wtkc
         YvnzrP1YSbMnD6W3+RkC5ophWzw+p7MB3r1DjcruvVRizDbaeg2ZyUb+PJe8XLXYpKuu
         zeMT+kFLt0RSgmNtU0fjqJfJWhdQWSugxMBoDn0wqLFY9bqNEcvxSZ2NgdvjImIIUXSu
         KdmiZuaDtTVZv5v2dWgAdaLCjPmBe13vG0D6Y8+JDnDeohlinZld6Jn4hIk8S051Ce2m
         e40pGAgGKws6dG2/UrNlfeXBpzkCfmLDzjDSfCw5J9bfp8rbrsuZd5OymB6PkNHSH+XA
         ++zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rXJSQ7ZwCs3657OxftYZuNacMZCLx7wshnYBTDQdLZA=;
        b=Xe1r3O1z/vlvHSxrDUc+0mqxSx3LiTITlY7qqzEoXm78Qg3nrAUBcR5xppVNVEE8sS
         zWhb4XmJADn1PJdLMO2Rkv+uplXSakt71STgCCC85DwL/kEzvU9iDwmKO2QMsklhICTF
         u0EzyRLZBMWuKvNh4fBzCMrIch6JHQ25oV2LPpRM7aIv9sbtyNuvwj2kV4SovZ8pseJq
         Vl/epW617CY5IUkp1TbPTmndPIqZM9AMoYa1uwkgI58Q3NSKzaIhbsfxZtA9GuBObpiR
         HGizoMAYSrBGz/rVNXNqsX+oIIWNj7A9dfUELhH6Q9WkjGursLY0hSpiSCQi9BZ2qOGP
         V/Ug==
X-Gm-Message-State: ACgBeo1agl6/8Pv0MMNeCOIPIP3Xd/GRmGiEqU+PB676e5ziM4gc5RAu
	3pDgWoliRo0YLmBT8MKd0s/YLpe8tCg=
X-Google-Smtp-Source: 
 AA6agR6f9jJAA3/VPvrEkO9035L8TgNLz4MQnKmwx/Dkaur+Zv6TF5QtePPHQfuddDibOtpXRyf/HQ==
X-Received: by 2002:a05:6000:817:b0:226:3d89:ebb4 with SMTP id
 bt23-20020a056000081700b002263d89ebb4mr11932770wrb.699.1661944458179;
        Wed, 31 Aug 2022 04:14:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a60edc3a44sm2324753wmb.5.2022.08.31.04.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:14:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] selftest/bblayers: adjust the revision for the layer
 setup test
Date: Wed, 31 Aug 2022 13:14:01 +0200
Message-Id: <20220831111401.3330342-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220831111401.3330342-1-alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 11:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170107

Using a tag is not actually robust enough, e.g. poky-contrib
checkouts do not come with any tags. So let's use a revision
matching yocto-4.0, that ought to be present.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 18007764b3..c6bd5a1f6a 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -149,12 +149,12 @@ class BitbakeLayers(OESelftestTestCase):
         self.validate_layersjson(jsonfile)
 
         # The revision-under-test may not necessarily be available on the remote server,
-        # so replace it with a stable release tag.
+        # so replace it with a revision that has a yocto-4.0 tag.
         import json
         with open(jsonfile) as f:
             data = json.load(f)
         for s in data['sources']:
-            data['sources'][s]['git-remote']['rev'] = 'yocto-4.0'
+            data['sources'][s]['git-remote']['rev'] = '00cfdde791a0176c134f31e5a09eff725e75b905'
         with open(jsonfile, 'w') as f:
             json.dump(data, f)
 
-- 
2.30.2


