Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3674C0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 16:40:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.50495.1661618425679689475
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S6Uy0zel;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso5965308wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rXJSQ7ZwCs3657OxftYZuNacMZCLx7wshnYBTDQdLZA=;
        b=S6Uy0zelqvQO7iSkVZ8xzrdDEO3wof++Q201T+KKUDHu785ikjrKHXN0MZUQrHf/GW
         yZt7ZMZCaA4P7kuxStUZsUMeYs6D+7enL236Mwsn5ZqHBwiGFFxvnC77nuexFV832BiU
         Fk1y5GuB0I49T5L3pZIAbJaSCru3+pjUO624BaPeH2t7qP2OTORXQTBmJSO0G0aqcZ/q
         R0r8kA/zoMlsgQzFB7F7tz8GgVdxsYeGU+PECqymAKPQ2Ml2kkdAaC51/yijx3Po3A3Z
         9bvyaZvtpYOqB4QZLea5Ys6m/qNtZSyxPNHv8QsOJmsgHjEpa7cFAa0wiDpEBMT5fwAa
         1qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rXJSQ7ZwCs3657OxftYZuNacMZCLx7wshnYBTDQdLZA=;
        b=O9QoHssZmD7rL/zWrM2erjVSMGLnx+UvAfEg4fw/EKUrelxxVxtkg6HDJdFSF4kbX5
         qJES7QgJ8K4otOGwaMueoYRmuahtuWvBZ6+gytCBJMRMOoWwI4zd4+F7ci0OZwuFPLa2
         irQ9KQoW/qe51nc4qfp5tteIs++3t/UDYcqzNVtrp2BeP6jiO85PPXOO51IrMZX9uhkr
         r4L8G97senJ7FyTU2JNq2ep3E0TPer0XmWGY49lteYt6dMHY+j8glraK1VOxBjAzOrwf
         OwIGQdekEK6zNyQR/LtEGY2cUQZW+ZeJBIT986pVQqiMfpWUW57TxEEtvPv3ftv2T6To
         QY1g==
X-Gm-Message-State: ACgBeo2FjfFVHVvEznX9C1nX5Aote/O2TnO+nQvXhCtACWmy7ykBjBV/
	ppbtvFkrMLKuxW+JOBisT6UbjFaEf0M=
X-Google-Smtp-Source: 
 AA6agR5xKbPwgjhXwS01Wym9LOBkWKqwhSGATvWLqGg1JjET38lXmfZ4EDSRrg/U3KTSpY9/6LEmoA==
X-Received: by 2002:a1c:e917:0:b0:3a6:85b2:e8d with SMTP id
 q23-20020a1ce917000000b003a685b20e8dmr2716961wmc.154.1661618423997;
        Sat, 27 Aug 2022 09:40:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c66-20020a1c3545000000b003a4efb794d7sm3748198wma.36.2022.08.27.09.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 09:40:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/bblayers: adjust the revision for the layer setup
 test
Date: Sat, 27 Aug 2022 18:40:19 +0200
Message-Id: <20220827164019.2247014-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 16:40:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169931

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


