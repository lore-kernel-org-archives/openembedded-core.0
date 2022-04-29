Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CDC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:32:55 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7159.1651213965789697684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 23:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WrnFswpx;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id k27so7928705edk.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mArkltS8sZlqOLw0py1XmOFAsqWGfUnrdIV/08z5b+k=;
        b=WrnFswpxX6yfjrueelbRyzH31yFzKAJihX1Qe1P5Q6hBPeW/7TbrZNqPzuw4tvLYX3
         32u0ustR3AgUiE5imQE3ZEAZREbsHAQEPUH8MyFDpXzFeKeHUu0TOiB5S8Ivq9vtNZLv
         vgvly8SZAecOy5FAmeKDD8nVNv2fKLk2AmhfjNZ7QJOUtRI+iYDHhc0IQ60xO9W9LXri
         7oFUPINoPeLY2PV8VphzdNLlTRePJWtbhOjFNl7YZVz4Ad/b5XckeHy+w6WdMz1AyPLw
         AgfeO1xTDfWnrdgaKVWPMz87JBqyfCHHUTXfBNObmx9eBt4EBjBSLZlKLKYG37LyFShf
         gw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mArkltS8sZlqOLw0py1XmOFAsqWGfUnrdIV/08z5b+k=;
        b=WlduAjBuxPEpLhq21JklaGSTfasIKHCej43YF2NloWeItkBUwSR8iQHDz+uQ1VW0GP
         Wc8UHwElXepBC1d9hQxRsaTbFs/WBa6gJK4lZqJoBGN66v5rniaM2+0oaqKWAR980L3n
         5p6BcVex0MmGdyqAsTVgmbC+lUW3DjmJmuTbRDQdFiZacEmwHjsuPRpuvbpc/peABsbF
         RfMWNiS8v7n5xAVeK+0edTdXRWhmWCL1VBVuf9mVeluZQbloT05z1/PEsDGSfbkQY8J2
         333xr6syNP8VyMecwaQbCOcrDIcFAkSO8FfEzUPl5m987vuA8n1YAiu7jwzxRa5Ralk0
         plcQ==
X-Gm-Message-State: AOAM5306hCoca8+HbuymHM6TPo+mmXE3ug+fPaqWH5zo80jgv/cljYVf
	aHbcZD7sXxnxyJqKg1TGsn+l1c/6JXo=
X-Google-Smtp-Source: 
 ABdhPJzMlX10N7sqNBH426+hl8z+xDQL8Rh3CbEc3+oXAJfscLt+9Fi10xB5vkdyZOVYfUdsgGnnoQ==
X-Received: by 2002:aa7:c49a:0:b0:425:d526:98ad with SMTP id
 m26-20020aa7c49a000000b00425d52698admr30975065edq.352.1651213963750;
        Thu, 28 Apr 2022 23:32:43 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.17])
        by smtp.gmail.com with ESMTPSA id
 og21-20020a1709071dd500b006f3ef214df8sm337149ejc.94.2022.04.28.23.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 23:32:43 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 1/2] cve-update-db-native: update the CVE database once a day
 only
Date: Fri, 29 Apr 2022 08:32:25 +0200
Message-Id: <20220429063226.22192-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 06:32:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164992

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


