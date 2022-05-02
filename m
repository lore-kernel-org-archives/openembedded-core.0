Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB98C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:25:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.11168.1651501549734226884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 07:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bIaWfkXc;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id dk23so28088844ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mArkltS8sZlqOLw0py1XmOFAsqWGfUnrdIV/08z5b+k=;
        b=bIaWfkXcQzTfIDydTjXsxlFZI6FWAmIp9ikBBXwpwD8dgwecIikXBrRxlQl4h1kC1+
         F/JMOInZFT3K5TgvecK49T1b5LNp4aBpwMFfIp118WxhMSpBDYBmkkZLuwrMS1K9ZnTu
         LkFfwhR1vqZrL4dCkm3CMD7y9S7JZqLPd7lV9PAXMEAtgFsReQCQ7aIWL61trI4SYt+i
         GqgN5uhvXRa4M7KkOUE7NB1IkTH8KJUcZuZFMBKbjew5dqi/uJDBOpx1al2f0acBGmMs
         TV9j+tY2kW+84cmp64PQmxWitDzmKPAvGBODZqQANd+Qlx+BzwIITdILlhmPjwRsrCh+
         dnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mArkltS8sZlqOLw0py1XmOFAsqWGfUnrdIV/08z5b+k=;
        b=0EtT60VvsTrLfNikjoTne7burwoxMu6yQMEEbtos1dPRaT9mqVt17ql/FdZT5xmZeJ
         m9ZnvBowFu+kv8pIHndVBqj9ZWZoQtAaUeDtT+cuBQ9BtLA4JNaYEYN61sdGHXpabqJc
         qGV5KajXdGxOE5u1Thng8Ox6ft/LUv4dURnYMqgrvXIpJ4iBNLewtNAsT7+4i6z1fMCo
         yN/kQD+GhIXqRwge8PGqdrmVoTdEZc1+SyShtSPcK6wV/jqeJkTPwino0B4B1ZSH9zdc
         6T6pzku8GUsPiw6Ne9uLy3J4Csd7OP45mJmMaibN84mGIPz9wo9PnXN9QtuM+E0h5D6e
         jPXQ==
X-Gm-Message-State: AOAM530vo/jZd0e3KhFa01I73sHFBDvST2V9XZdO92PM+Vt/ZPGW5u3T
	mxbA1pxjamB8It8UKh2CHN0oQLFZViw=
X-Google-Smtp-Source: 
 ABdhPJwIkidLNgLrOYgBLiPR26/m4niJ25tdcs7rKOc87mAQxOFgsnQ0JVVvMvJwYDuvVutCnPFQIg==
X-Received: by 2002:a17:907:62aa:b0:6e0:f208:b869 with SMTP id
 nd42-20020a17090762aa00b006e0f208b869mr11510084ejc.270.1651501547814;
        Mon, 02 May 2022 07:25:47 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.199])
        by smtp.gmail.com with ESMTPSA id
 zp26-20020a17090684fa00b006f3ef214e62sm3634874ejb.200.2022.05.02.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:25:47 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [OE-core][PATCH v2 1/2] cve-update-db-native: update the CVE database
 once a day only
Date: Mon,  2 May 2022 16:25:35 +0200
Message-Id: <20220502142536.1654021-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165169

The update of the NVD database was expected to happen once per hour.
However, the database file date changes only if the content was actually
updated. In practice, the check worked for the first hour after the
new download.

As the NVD database changes usually only once a day, we can just
update it less frequently.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e5822cee58..af39480dda 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -43,10 +43,10 @@ python do_fetch() {
         if os.path.exists(db_file):
             os.remove(db_file)
 
-    # Don't refresh the database more than once an hour
+    # The NVD database changes once a day, so no need to update more frequently
     try:
         import time
-        if time.time() - os.path.getmtime(db_file) < (60*60):
+        if time.time() - os.path.getmtime(db_file) < (24*60*60):
             bb.debug(2, "Recently updated, skipping")
             return
     except OSError:
-- 
2.33.0


