Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA2FC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:55 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.10881.1652193559123929739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EgJkinjx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d22so16900040plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uoosCIyK4qNjwfyTTQdO99wkmqAo/YtefGBFGQ4Gjq4=;
        b=EgJkinjxjORPrVVuv/ZSUEn9iLCl4SgmBGb04udSzdIcukK6RTKt0FhxoxfboOKLCR
         MdWH0eHBKpJUjlY/dMr7LImu0dliJVb2ukOW4EvBOqQlMA2XyNJEuURnRxL0t7f6phCW
         5La39IgtQYfm2f24lbGiClIRUzy2YRadqyDQ8mtNoCuxK3LMrZIpytBnsPiZQTyQLYGE
         VJ/akQPCrtXsOHWLyZVVtXPv6sDiPQdRzHmPjVDsHYMuBd0laaVxdxibxbUSsLKRvSlu
         Kp/6MXUpzsWgzCJq8Uj0yrcROAyJY+Yqcu6WQ2kcRMMrTsUloFIFuxqphxWwlrl/Nu21
         0U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uoosCIyK4qNjwfyTTQdO99wkmqAo/YtefGBFGQ4Gjq4=;
        b=1CQllfgTyza3Uro6OwMBcWe55GJ4Z96HS02hFSK64tz+g347ROp/ZTYq+QUEt0U6+b
         94PVYbhKzXcTdn3qqBdJi3c2xwuKLNFYXQfO3vOPjtBx3hg8KRkPTNoKIFDbBHGYt/Ha
         o2cg3c3Mj7qiR/Tvn14sO9zBcuF2HU0E0WeYidI9hHiUV/CHlf0UvvPDlNQ1/kWTORAP
         7/l507dYaYkMpcUXOeUTloB08VvzZVGaw0BXzbSJh2t4pK2duPTdCiRKLira/HuR1z0L
         fbbfz5SekCLvkzWj3JKxJRtIpEArRDym4iebjUWundqKC+9sXbZ5qhpM8YY4GJG5xp/o
         jv+A==
X-Gm-Message-State: AOAM532uU8WdDl/6r1oqwcbPe0RP8tztpMSXy9sloKarrVcusGWizpKo
	+R5wYKeaYpliidk0JtlPF4MEWFNhuOShg5hm
X-Google-Smtp-Source: 
 ABdhPJxuHDoaHWL5jXlK/2Q5vdyHShWM+QOGejpwWXlgd6BuOKIBXd9Km5rOQFMpvRYb8QstD5Z42w==
X-Received: by 2002:a17:903:32c6:b0:15e:c1cc:2400 with SMTP id
 i6-20020a17090332c600b0015ec1cc2400mr21105558plr.153.1652193588739;
        Tue, 10 May 2022 07:39:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/40] cve-update-db-native: update the CVE
 database once a day only
Date: Tue, 10 May 2022 04:37:08 -1000
Message-Id: 
 <27b1cb83ec666cc91930f2a7b5a6282fde77c730.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165446

From: Marta Rybczynska <rybczynska@gmail.com>

The update of the NVD database was expected to happen once per hour.
However, the database file date changes only if the content was actually
updated. In practice, the check worked for the first hour after the
new download.

As the NVD database changes usually only once a day, we can just
update it less frequently.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35bccdedadeaba820d58b69fe74ce5e4c1f577e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


