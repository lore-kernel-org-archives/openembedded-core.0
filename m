Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D32ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.26640.1661956793022348865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cqF0snJ+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id z187so14591018pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=UOJWFudqQ7Q0e8gggH22I4ULiXzRfjlcjm3uij+B8jM=;
        b=cqF0snJ+Ao9cifYrfS65HipL2BRVu07Vn+kM/m0SpfXo/+PGPiJOPevhh2136GqY12
         qZrXwMv9LvwsUJYm+oT/1mXAIYxF7mBQJzFznnw/0Z1qLQwC3msgB1AzNDjBx067tVNb
         2LRz+WqFQFKF0Tz2RkyvJNcV8TZ+tOredqcveG+meNIDBH/DrQekqp7JeuR3sUVDVuv8
         LqC4n0rHizP55wN4LJcX2OqmwYzuWSTv0nTM2lolglTBHrvFrG3PU3gJajjvyBr+4pNj
         nj3jRBa5N7Sa4W1QIclW19xcSj4rq1v61dctrX+XpZDSyneUTpyYyP3Ng8wondIdg7nA
         8x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=UOJWFudqQ7Q0e8gggH22I4ULiXzRfjlcjm3uij+B8jM=;
        b=0O9s2qFE+IttXNhGE2rLcFrj/2MzVX9+DPx3P/5bep+KTLnv9721az9ERcnX57worr
         mc8VBEaE+MMIo8pGoaPBt1Fd/A5Gua+dCbJtau+WcbO6k/EeVLf5KWSgjb2ynGJXYB8Y
         lnxrL70tdTeOeQMijBwh6eIUBvE+70l7N7+eE4n/Zh4tcbytjfkOJAbAXJOY0h3wM212
         eqtERShMFUyIO5/xgPSAQK6mUQMP8fLf53SXsMv1et8dwaWi2fxF2Pe8WXUoP8WQxKYT
         l9p7scPUfWtN901EK1/PFDYaT7w4ASmOIgH8Egmry9wdHz8+yoFNsFigzQTdaKx0bMti
         LadQ==
X-Gm-Message-State: ACgBeo2JB4IMva8f7fKYoJuPgNjG8Ex9/oV5tu36WyJkDYfdoPeYWsU0
	4mwSlSHt12cK4yfc7KossP8B7Os+8MghN2ii
X-Google-Smtp-Source: 
 AA6agR7SIwd+5Wc+IKCQ/56WYNBSkoE+hQKq0Ttc0vC5GhqndjplWFC+mW4ShIaaIRYDaGAauN55uQ==
X-Received: by 2002:a63:eb46:0:b0:42c:4d35:1c8 with SMTP id
 b6-20020a63eb46000000b0042c4d3501c8mr10306571pgk.459.1661956791835;
        Wed, 31 Aug 2022 07:39:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.39.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:39:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/19] sqlite: fix CVE-2022-35737
Date: Wed, 31 Aug 2022 04:39:21 -1000
Message-Id: 
 <fdc82b2314b580c0135c16b7278ebf8786311dec.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170112

From: ghassaneben <ghassanebb@gmail.com>

Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737.

This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21).

Signed-off-by: Ghassane Ben El Aattar <ghassaneb.aattar@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...riables-in-the-printf-implementation.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch

diff --git a/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch b/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
new file mode 100644
index 0000000000..9e8f039ef6
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
@@ -0,0 +1,26 @@
+From ec75530b8d8268cb07d8e476d79e1b0e59492fa2 Mon Sep 17 00:00:00 2001
+From: drh
+Date: Thu, 18 Aug 2022 15:10:46 +0200
+Subject: [PATCH] sqlite: Increase the size of loop variables in the printf() implementation
+
+Increase the size of loop variables in the printf() implementation to avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737.
+
+This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added in sqlite 3.39.2 (2022-07-21).
+
+Signed-off-by: Ghassane Ben El Aattar ghassaneb.aattar@huawei.com
+
+CVE: CVE-2022-35737
+
+Upstream-Status: Backport [https://www.sqlite.org/src/info/aab790a16e1bdff7]
+---
+ sqlite3.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index f867d62..490199a 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -30234,1 +30234,2 @@ static int vxprintf(
+-        int i, j, k, n, isnull;
++        i64  i, j, k, n;
++        int isnull;
-- 
2.25.1


