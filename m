Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DC3EEB599
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 06:25:02 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.5722.1694586301555033793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 23:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JOH07TW6;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68fc081cd46so2779142b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 23:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694586301; x=1695191101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFHIVOutEXqGFLhjrQbScijD5Qdmo2Tqrn4K+cPtay8=;
        b=JOH07TW67Z2IV7sh0uMmhH+Y6NaT54+zsocdki+svgNo/b7bRMdrEAwugqQXD96LvO
         WJ3JIm2TjcS3DT9319h3SWueBnQpjqFHkw8VXvrTs7a+CyELK22HW1fFMu3wqUznSt1b
         miS3+JZB565m+9LXd5i2MP3fKDr1VjRc2Tnn4PCaV79QIJvsAmVCvbSmu8hjvpv9cPKs
         vIvNOr35it9bFHTyhQeKB9WPlOHNRA9ArzxcrySE200JLulSBR95Yr+O5iRS7lW4KsGl
         bHUC1swKCO5fz9yZg0oRFmibuowxfjJFGw5Y+jYHJS3s0F1gXRlFrtneiz/CFqbLfC5j
         qxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694586301; x=1695191101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFHIVOutEXqGFLhjrQbScijD5Qdmo2Tqrn4K+cPtay8=;
        b=AyMqUsUZpsErHH6xeMGQukCtMZpfv5J7SDqMddIsdSo5h436ZSEeuX3yI/X/wmQ2FA
         xbIKOHNmi8vBHr8XpfLU9aU9+MOI2/vxqKpm3AZow2EYa6x1qvifcjLFaznQNA18HCCG
         oJkmwuBQ/t39Lrw6IIz1xzsFWv9889TrcQThFqKEEWk0sc+CCUPQ9u2czugTHUCL/LST
         OOP8SSXdgGd2ShesZoP/X/2wAskHKNH8AhYtsWcCuk5OTCe4iVEEXwXLKHSE8TwOLoNi
         AxLpSSqO35Jf+W9FlYS8VHeJXDH24BVmgRVGEJyXQaHl1PIvQTk1xA/qkPvRcmeOq6ZW
         5JmA==
X-Gm-Message-State: AOJu0YzoKBauVWxfT67xPxeYkP+CnUavhzljt0rpoCSR+HQIZYbwzk+1
	3Eer2fylyR1rbvM877yq/7QzQTDAYZS3JA==
X-Google-Smtp-Source: AGHT+IE2aIiD4U7XPNy9s6hZrkCKXQYIqrk33eIhBLAPxYsfwPa8O3GqpVyD7RyALKblhKzmo8El1Q==
X-Received: by 2002:a05:6a00:1395:b0:68e:3838:a2dc with SMTP id t21-20020a056a00139500b0068e3838a2dcmr1903406pfg.24.1694586300664;
        Tue, 12 Sep 2023 23:25:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id q12-20020a056a00084c00b0068fb8080939sm5498095pfk.65.2023.09.12.23.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 23:24:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] coreutils: Add config.h to ptest package
Date: Tue, 12 Sep 2023 23:24:55 -0700
Message-ID: <20230913062455.2856264-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230913062455.2856264-1-raj.khem@gmail.com>
References: <20230913062455.2856264-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 06:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187551

This is needed by several tests during run on target

Fixes
grep: /usr/lib/coreutils/ptest/lib/config.h: No such file or directory
inotify-race.sh: skipped test: inotify is not supported

More tests are now passing

 ============================================================================
 Testsuite summary for GNU coreutils 9.4
 ============================================================================
 # TOTAL: 643
-# PASS:  509
-# SKIP:  131
+# PASS:  516
+# SKIP:  124

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index 13a637baf86..e3e27e099d0 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -181,6 +181,7 @@ do_install_ptest () {
     sed -i 's/ginstall/install/g'  `grep -R ginstall ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
     install -d ${D}${PTEST_PATH}/build-aux
     install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+    install -Dm 0644 ${B}/lib/config.h ${D}${PTEST_PATH}/lib/config.h
     cp ${B}/Makefile ${D}${PTEST_PATH}/
     cp ${S}/init.cfg ${D}${PTEST_PATH}/
     cp -r ${B}/src ${D}${PTEST_PATH}/
-- 
2.42.0


