Return-Path: <mihai.lindner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5EDCCA47F
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 12:11:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.39919.1658232691395035912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 05:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iebd//th;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: mihai.lindner@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id b26so21315466wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBphbVl54nhVJ44KutubYI5dXCTblEsVCeOnHiRKX2U=;
        b=iebd//thwAas0gUxUfL+FkiUBKGKTlWr+N1Z7psJ8j3DnkZQOgx4Eo/5Xtb0iqJGZX
         Vala4ynlfVqg476PH6dTqGtq6IIJSrBs7tFI6JbsQClZjYFazc2/EQ5/UHxV1ImdnpVk
         sFL1dcltbc6wz24Y4zTWarOLGTORQ1m6K0NLWi4/vcuwWrLK5A7TQKD0zxLaG1SEmu64
         SL18QdmtkAFX6mYJyIiI9tF/Lk8/oq4I9p2pw+0THUngxA2WrAxwSxxjl5/04VIbXdDO
         A4JF9amnZIAapI/Sdo0mPTd9OQAfujqlwbqw5U6okorqV7cV5MQpUZsUEILBozGe2OzC
         8VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBphbVl54nhVJ44KutubYI5dXCTblEsVCeOnHiRKX2U=;
        b=MYWKe71ZSzpsKcKLNmuWUj918/sPHF57sqUTWAjlrb+RZ4G9JrMApVhJMSJfU9vvFQ
         j3jKUYIOUJIXDLfL1/ro+jeKxXRb/hbQKhHN69OH9I2GyPxwrO+LJO6N71conl5nL00Q
         s+VH0LjzFQkXminnb6f+9WwzPnfJmW3GkDwZPjF00CehxPt41HAicsJB6SKrQCAkbnmY
         RnK5rpNmvlqxAc2TZ4vpcOtknz7FYap8mNu5Z9Qlb4iHId5D1E81QSzbLARjcRyXMVfz
         LH0p2BcpzOGqGQTF4c4FLNcqgHRZJkUM/vh/QHRE9Y3pXuK5thldHg0+zlWgicUfclV7
         PFuQ==
X-Gm-Message-State: AJIora8MGRP86T9ugFbkqPJbr1NoRm8yxFTVD5hlUIAngth1bkxHIvIR
	NjxFNqPY4sXuDXoRVvuJLXSL1XKHaue1aw==
X-Google-Smtp-Source: 
 AGRyM1vv2wEfpI705xfpkr/iaZcm3aQaPnDJv2O16M0i5FY54/dHPO/T2nJxE4U9lCTCA2tMcEjNTw==
X-Received: by 2002:a5d:5a15:0:b0:21d:630c:a609 with SMTP id
 bq21-20020a5d5a15000000b0021d630ca609mr26436462wrb.468.1658232689721;
        Tue, 19 Jul 2022 05:11:29 -0700 (PDT)
Received: from fun2.lenovo.com ([2a02:2f07:7215:e600:b43b:ef09:3bb9:3e14])
        by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a2d47d3051sm21148598wmp.41.2022.07.19.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 05:11:29 -0700 (PDT)
From: Mihai Lindner <mihai.lindner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mihai Lindner <mihai.lindner@gmail.com>
Subject: [PATCH] wic/plugins/rootfs: Fix NameError for 'orig_path'
Date: Tue, 19 Jul 2022 15:11:23 +0300
Message-Id: <20220719121123.31872-1-mihai.lindner@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 12:11:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168278

Fix "NameError: name 'orig_path' is not defined".
It's a typo from when this error was handled outside this function.

Signed-off-by: Mihai Lindner <mihai.lindner@gmail.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 25bb41dd70..fc06312ee4 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -35,7 +35,7 @@ class RootfsPlugin(SourcePlugin):
     @staticmethod
     def __validate_path(cmd, rootfs_dir, path):
         if os.path.isabs(path):
-            logger.error("%s: Must be relative: %s" % (cmd, orig_path))
+            logger.error("%s: Must be relative: %s" % (cmd, path))
             sys.exit(1)
 
         # Disallow climbing outside of parent directory using '..',
-- 
2.35.1


