Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9395BC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 23:31:20 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.57187.1643758279657230535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 15:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l96Dee3Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.180,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id s185so36536068oie.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 15:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AZGbIXnpJMelKs/YWiw+kZ49BznD9vA9tgjEYIZeaZI=;
        b=l96Dee3YnPu7RK1MZm9eVOd7L3v0pjyiAcy18NESJZ1oM0q+9C3vTaDxlGeOHikKmy
         JnFI23JjXulvEVpXGgZc91yMFvDSGyRLsvrWGIeV72AHGR6rvCHJ5jGGia1a/VjbX5KY
         4oK+NStD7uLvUD21f6p/bkw0ySBi3vtGt5qAMFXVA0/ye1c+Xlilw8QRxJjthZ1z82ZB
         OFTJi4tGFE2Vuhx4DTsvMQWg2W1v26LZGtds9d76gA3snx43LxVVhGBfkhpErpYHVXNz
         ua4zJNbXsFgIWB7QVqjralZA6S/ZUPZlCbeNX8gRGg5sqRCHN7UzACb7nNYuX6QA2mzd
         77jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AZGbIXnpJMelKs/YWiw+kZ49BznD9vA9tgjEYIZeaZI=;
        b=Ul9pAlVh1yN9DG4AhLehDORKi1cQSr1HNPwdnuEF5FDfTDUuh0G1lNtkV7p/48on8B
         x1Pe/MS+RhbDddlhaVA0vobM5a5NTFZHNPuDLuDGe7JSG5zbK+LKeIFkV5rOLWshRjj7
         gthiCbwfotxrxdRPdi05CgmDCIs6QpaZ/unRYcdEItCfjUdr3JgCBWx/Ea7G8kW//JQc
         jcUvY17Zy03nocdXnVZdgXtcBGbhon98lLiMRQ7+fndAiwDtQmc0QfTzpDCKSn/V/4Gl
         GeXvOirQvCXKvjK3G3UU1C3d7h95Lhny5RqcCju2vOpAP+6Ifk428gh0QJirro0XZ+ev
         DoOA==
X-Gm-Message-State: AOAM532XFnMhHkyReConwUa5hheV2CHTXb14zpdjzFHwzSWCC7WQiUiv
	UizQZds3rtzpCcbWRp7ZdDK4Bj7K4O4=
X-Google-Smtp-Source: 
 ABdhPJxrsQnJnQ/+yA+hngG8Lm6rNXp136y8ukHaknl+iCVuiY8xl8LnHm5MGLQY2DlDCoXO4OU5ag==
X-Received: by 2002:a54:4490:: with SMTP id v16mr2886109oiv.157.1643758278769;
        Tue, 01 Feb 2022 15:31:18 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 v4sm13211927oou.1.2022.02.01.15.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 15:31:18 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx: Add set helper for list properties
Date: Tue,  1 Feb 2022 17:31:11 -0600
Message-Id: <20220201233111.2290188-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 23:31:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161169

This adds the set helper for list properties to allow list members to be
replaced with a new list. This is necessary as it is (currently) the
only way to replace the default value for a list member.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 9e7ced5a15..14ca706895 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -105,10 +105,13 @@ class _ListProperty(_Property):
                 obj._spdx[name] = []
             return obj._spdx[name]
 
+        def set_helper(obj, value):
+            obj._spdx[name] = list(value)
+
         def del_helper(obj):
             del obj._spdx[name]
 
-        attrs[name] = property(get_helper, None, del_helper)
+        attrs[name] = property(get_helper, set_helper, del_helper)
 
     def init(self, source):
         return [self.prop.init(o) for o in source]
-- 
2.33.0


