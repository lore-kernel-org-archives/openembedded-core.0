Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D73CC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:12 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.464.1652293207982169279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Jp9ENPu+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d17so2719872plg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CFDJuYpeDLImoVA2SoCeHmKXpnHEmGUyV9GpMlBYtW4=;
        b=Jp9ENPu+LJCrJ1iUSB11nqR7IRdGxzbyKHYH5tJeRHFBzgR3yebhSyWyPVBO8ASVYP
         Jo23mSu4MnSlzt0+bWrYRaS7QgvzGQtt/2dnX8OtpkESIhj+8Yi9rk/OFEN6COfVJZ0e
         oW81LVdhhVugcO9V1OXuM4369916wbQ1Q/EPcjTD/aonYmkQS08wWZkSaqIfxrpWp+Ej
         khMEqIahWDJR/Ts9oNoqeHattDupBEWWx/hXbXUWH6+qZKMJSGA8x2q9QvDyweeGxRHe
         Co9uiER+Tl7TGhyFMf3D1upjdp09M86nn8aWYGzIXKt05U28i8WsTqJBVXAB3qDmKaNU
         9mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CFDJuYpeDLImoVA2SoCeHmKXpnHEmGUyV9GpMlBYtW4=;
        b=XU5rE4X2MASYpmryU4O/PG6acbBamFlCmfDxR4gqxjyrtvqwaNu+sN7gmoUmJ40KUG
         Lgy49kuR2HYEXjAYV1Zr75EiU2+WgY5mEk7iD7SAvJz0BY8anFfKoHElaAx/CuVCbGB8
         ICiGF9+6HDZliGcYaMM9Ge4FjoieoxOsDnwiIruLqGNLkulsU20thGRkGKWA13DZ4hj2
         V7REQtd1fGKWYQ62jSbg8mLqTIObjBWeuCiBZJhfn4fZIn9jR4FXo9ytuVYdTpK0hMkd
         sFYKU8NmDcf78qsevvPK8xafqMI5IKtzloorJJ8RIsqVc/rC0X1a+wVmhUundNsT0rBi
         2HQQ==
X-Gm-Message-State: AOAM5335lMQ3ATLw6QAPHGkglEVC4a0ZJpBcCaSbFgOaYPWdxl8c2IXM
	t9rvP4QYDtAwTP9rocTOJdPZVRrobjMztfWa
X-Google-Smtp-Source: 
 ABdhPJyp4CFgxaZ7ly5BYqJWH6SJN1rF2TmV8wbTTyytiokZnu2M2+DxpZyHnB8iwRxUzDOphU4b7Q==
X-Received: by 2002:a17:902:b48f:b0:15e:da68:8f12 with SMTP id
 y15-20020a170902b48f00b0015eda688f12mr26283336plr.27.1652293206695;
        Wed, 11 May 2022 11:20:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] cve-update-db-native: update the CVE
 database once a day only
Date: Wed, 11 May 2022 08:19:25 -1000
Message-Id: 
 <d0a56ad3a278e18e766f833619cf97869bdf6a4c.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165512

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
(cherry picked from commit 88f2fb1581a17b2cf59a694ca9afb89e38ed40b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 50052f8532..a6144979f0 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -42,10 +42,10 @@ python do_fetch() {
         if os.path.exists(db_file):
             os.remove(db_file)
 
-    # Don't refresh the database more than once an hour
+    # The NVD database changes once a day, so no need to update more frequently
     try:
         import time
-        if time.time() - os.path.getmtime(db_file) < (60*60):
+        if time.time() - os.path.getmtime(db_file) < (24*60*60):
             return
     except OSError:
         pass
-- 
2.25.1


