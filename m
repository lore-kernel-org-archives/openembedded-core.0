Return-Path: <goledhruva@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A81C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 05:43:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.72670.1638251028808170093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 21:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eVAizQmm;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: goledhruva@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so13191373pjj.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ftxj/kmA4CeztCQbFjn4lRxep/Mlmnteh7eXYZk53YQ=;
        b=eVAizQmmEHyo9YaJ/Kwh1XKA+qt5nov5GWvTOVUTglRb9bCdKUnD0go3NHHQCyvgbT
         9gfKpcvRCmz5xcruGhGVu9dTxqQfPale6eH0R4aCPlN870luYYjO4EYUeoV/WBwEoCOE
         PDF/CFZcjE/O211yRh2cfVd3A7ymDv8SZ7wi+zhvjCeIxN1F/JGCJV9dcgkTDeaXYxDF
         9vm2De4gf9QxJczb4pZkmhHatogzRZdwIe89XYOZcmvOUqv+Zu88YbbOxo/cujreIWvF
         BaRiBlbwDqmG4NYJMbGX04zBpXKS8WRPyhOBkQ3ZGDz1fwVj5bRCI7NPXv+3SiEVbHcF
         gbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ftxj/kmA4CeztCQbFjn4lRxep/Mlmnteh7eXYZk53YQ=;
        b=mCQyRMGqNB+61g8wOJ7avzzpkS+zYUStcPVd6ebK2Ax8uF/VvhZCNzn1Xf21siUOPe
         2EPUjyRqmCo2rHnalHjF6ykrD/Zho76EudS2KTN8vRt8XKsfQuoVXAo3ZpQRhlT35Qs6
         SqxM5pNWwt7GspsDYJ+FxxXKsrd1h59eZcisU/1NUgmGpSkwPWdfo3GGJ2/k5ZmIf0J7
         JJ/bYIR8tPtU5wKtuJVmlIxQfly1bmGugG5pUMUXIXE4gEmzxpN80tRE1DwmBKInp/wP
         WWo0x2zxLPLRTXLwyoNQ1cHUkrTKDuYvHFxmACCoLAsFeXVSngXe8sw8dCj84YbD/r+G
         dAAw==
X-Gm-Message-State: AOAM532E36w5grPz48RbhqZg1PreXE64Tsqtj/QQOuymZI8fS+829N28
	FrkdZSK3I2INpwTVMzIOXO5tTUkfzKUINw==
X-Google-Smtp-Source: 
 ABdhPJwaAUup79rGhwgqrEux/PN4WrPKOQvrrqMYI8+aZQLs/9PvUNc753kcNZQcVXe7wytt/qKtHQ==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id
 cx12mr3435750pjb.11.1638251028153;
        Mon, 29 Nov 2021 21:43:48 -0800 (PST)
Received: from pop-os.localdomain ([103.226.237.223])
        by smtp.gmail.com with ESMTPSA id
 a23sm13783170pgl.37.2021.11.29.21.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 21:43:47 -0800 (PST)
From: Dhruva Gole <goledhruva@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dhruva Gole <goledhruva@gmail.com>
Subject: [PATCH] yocto-check-layer: Address Bug#11131
Date: Tue, 30 Nov 2021 11:13:35 +0530
Message-Id: <20211130054335.58255-1-goledhruva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 05:43:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158966

This adds:
- Test case to review if the README file specifies the maintainer.
- Test case to review if the README file specifies the word patch.
- Test case to review if the README file contains an email address.

Signed-off-by: Dhruva Gole <goledhruva@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index b82304e361..8d4aab7973 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -6,6 +6,7 @@
 import glob
 import os
 import unittest
+import re
 from checklayer import get_signatures, LayerType, check_command, get_depgraph, compare_signatures
 from checklayer.case import OECheckLayerTestCase
 
@@ -25,6 +26,11 @@ class CommonCheckLayer(OECheckLayerTestCase):
             data = f.read()
         self.assertTrue(data,
                 msg="Layer contains a README file but it is empty.")
+        self.assertIn('maintainer',data)
+        self.assertIn('patch',data)
+        # Check that there is an email address in the README
+        email_regex = re.compile(r"[^@]+@[^@]+")
+        self.assertTrue(email_regex.match(data))
 
     def test_parse(self):
         check_command('Layer %s failed to parse.' % self.tc.layer['name'],
-- 
2.25.1


