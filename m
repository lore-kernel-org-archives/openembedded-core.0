Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5154FCCA47F
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.7280.1654699205704826136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mV28khcH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso16154254pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=irI0wu9WqLOkBUUzICNg23LruZXecGyDrTu8d51pctk=;
        b=mV28khcHmkN4ovMrwGlyVhJ6se251ffpQKPvoVhNo5hNkUXNr/JA0xXJe1j81uuYf/
         Oa5PuGA5OYT5xJhFbL/HSqSoesFUkxsQ8rOrkmWJfLeWIkhVI6K+AXe2tKLpoBSeSXgJ
         QZh+AbWL4RqPLgrLl9ZOzDc68vLImE3YQS1EIUn3J5LpT/OSm1C16ugRXlYUN70I0u05
         +hsxdBHUNVchngpjZR0n99tWB/NCPBAYnlsmK0UQN5CSKgRtvVzMxbaaJRNXeoExMcPt
         oYccpBwhh0135MB3H/C7wtLD47YsjZV/QOYui4zzHkRFIA7OkT7tBxcsr0YDSZ+GEVoY
         MCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=irI0wu9WqLOkBUUzICNg23LruZXecGyDrTu8d51pctk=;
        b=kbD3bgzq5lGerk2IbMgoUGWxIlBcDGD6ufowmtGJMrsiyR5lQalCkmbroTsQegwXS3
         cDYPONQTwdgxTr2At+Oz/DlMI3UNrYd1A1Qt6I5akXwz+anDawHz4Sv9dvFzR0csCwRP
         wdVNoLHnL1jlBE1FdHR+bqwGyboGAkYxDnb77ZeMU0poOUZUkPQuoeDN/cJt2X+S+ENx
         5AROsRFjsmpj6VRYJ1z0fAoEm54xABVlsHgUiuhPywjMwkGRqjZYlTwLXgCjhID2wn8I
         C65rY1tCnG0jEsvGThw0/RrSW860+LPbDz28r3rmx6Qu/vV/PC6qnACPDWlkkIAm5XzG
         IzWg==
X-Gm-Message-State: AOAM530NqRqof+zb2MhVCFQarAkw4e8xfqXLP0/7GCZjOyVfPXRNKl2e
	/xDyI+aW/XUhwTtRlF9/w775rvZ/pYCEqhIc
X-Google-Smtp-Source: 
 ABdhPJx+9QuW5JmK71JeKd1DdqZJlaxfTqlIKlZP0zQEJyAA6N4x0nzyie/a9s6+ytdqtmDokWSw3g==
X-Received: by 2002:a17:902:d044:b0:166:4d45:2b0c with SMTP id
 l4-20020a170902d04400b001664d452b0cmr30023394pll.99.1654699204564;
        Wed, 08 Jun 2022 07:40:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/22] cve-update-db-native: make it possible to
 disable database updates
Date: Wed,  8 Jun 2022 04:39:17 -1000
Message-Id: 
 <ac6b4900bc0d8b4554f666de8d9d041653935a03.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166715

From: Marta Rybczynska <rybczynska@gmail.com>

Make it possible to disable the database update completely by using
a negative update interval CVE_DB_UPDATE_INTERVAL.

Disabling the update is useful when running multiple parallel builds
when we want to have a control on the database version. This allows
coherent cve-check results without an database update for only
some of the builds.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5c2269240327c2a8f93b9e55354698f52c976f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index c8c1cbf115..18af89b53e 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -15,6 +15,7 @@ deltask do_populate_sysroot
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 # CVE database update interval, in seconds. By default: once a day (24*60*60).
 # Use 0 to force the update
+# Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
 python () {
@@ -51,8 +52,9 @@ python do_fetch() {
     try:
         import time
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if (update_interval < 0):
-            update_interval = 0
+        if update_interval < 0:
+            bb.note("CVE database update skipped")
+            return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.debug(2, "Recently updated, skipping")
             return
-- 
2.25.1


