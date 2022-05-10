Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8E8C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:55 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.10755.1652193592719513955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y+vRm7jE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so2179785pjv.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D+bjDfMCj4/zeS4auXFBj+qxrPffmzZOETYWfpVHU9c=;
        b=Y+vRm7jE1cDZwCrYIJI4l1eprl9/4oByDQmH07w5UTHOMTRZDBUe8G2I9eYA+dOEbc
         3WsnsNA0d0sqigJsYE0juygTcK1ZNaWHITIbJmrTx5R35Kn4mF+uIiFQZ9IBIG5XADWM
         zSPfJFLOHi2rHaMEiNHoR3EVHNVsCtSQmnb4nrxucVRgoQ794SVSj2DCFIbyL9nv28eE
         oxdxZHvCM+QYjB47Imo/bSA+3Po4rrfGZcB28WwA0mB8FKN1jLmUv/Ran4ZVFZbFk+Kd
         DzD0Q9HUambOQhPQ9RQyr41+5139zaf5KzE/7FrPxtWv42Zz1BGHMLbdgJvtVvrNkUHr
         NOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+bjDfMCj4/zeS4auXFBj+qxrPffmzZOETYWfpVHU9c=;
        b=UxuabQRBBYokYkbDiOGVECTvSUP/s25m5ZsUfMZmNFgW2IfK+ZL2/6asbAZ42//WiN
         lnx7hTtVunfThwbOlme84vLvAi6n+J8/CvSAh1MjVOQ+EA6UrcEpMNoPOTO0K+mE+oru
         rDrOI4/KljldICmIBTYoUDnvxYYW5Row5r3nDeevXbvRmcQuSu/sVEYRqovvZtFMTC8y
         M1hwYxp+nmd9CX+DkgY4ZSE3pXPzx+mgCJRqxcbrQylFyYfYFzV3vr54IpLxRPp/MJ6T
         bjHgT9yyUv7SMYBGfs2Y91VdrSHK/mjhctSMHZmHN+zedO1VEkpuyAmnK9mqzS7yUuFs
         1CwA==
X-Gm-Message-State: AOAM5314qFPxeAdMjvUpIh1g9aSPHG0+ugZmVPyHqgsuskSgh6VMLje1
	iypdBCOQOB+0/BfQHo2wEBW/k8oCXBjA30F+
X-Google-Smtp-Source: 
 ABdhPJxXkuKxsEB4QMsUbiUU8tix48zv7a/i2ZvFFYGQm0c3SoPhB9eGu/Evnpco4+9E4ZLo+Q8fWw==
X-Received: by 2002:a17:902:e809:b0:15e:c67d:14c5 with SMTP id
 u9-20020a170902e80900b0015ec67d14c5mr20443979plg.13.1652193591490;
        Tue, 10 May 2022 07:39:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/40] cve-update-db-native: let the user to
 drive the update interval
Date: Tue, 10 May 2022 04:37:09 -1000
Message-Id: 
 <0007dd0edb39123201a46886a4e71d001c118ddf.1652192957.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165447

From: Marta Rybczynska <rybczynska@gmail.com>

Add a new variable CVE_DB_UPDATE_INTERVAL allowing the user to set
the database update interval.
 - a positive value sets an interval (in seconds)
 - a zero ("0") forces the database update

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe7bc6f16184d5ebdb1dd914b6dcb75c9e5e0c9c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index af39480dda..c8c1cbf115 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,6 +13,9 @@ deltask do_install
 deltask do_populate_sysroot
 
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# Use 0 to force the update
+CVE_DB_UPDATE_INTERVAL ?= "86400"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -44,11 +47,16 @@ python do_fetch() {
             os.remove(db_file)
 
     # The NVD database changes once a day, so no need to update more frequently
+    # Allow the user to force-update
     try:
         import time
-        if time.time() - os.path.getmtime(db_file) < (24*60*60):
+        update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+        if (update_interval < 0):
+            update_interval = 0
+        if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.debug(2, "Recently updated, skipping")
             return
+
     except OSError:
         pass
 
-- 
2.25.1


