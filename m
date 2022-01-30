Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1933CC433EF
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 06:20:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.16130.1643523648037343268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 22:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXi4AN4F;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so14987957pju.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 22:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eOuhJdEOdisNXfX0jp/JEgD1+XHjgy6UrnqFFnwaNk0=;
        b=gXi4AN4FWc5pK17RQv0yjoGAlefE4NaTJkh5yX06aTJfREfcxHCsEqSpbrT9nnfEys
         iFoTyO7IluZgJi6yBSOXp6yRa7voaXI66T2UiXqMlIQVfvEYoGzyF4TOchujlGQ/abPp
         7xAozSdphrZTMEv6I2JOaQckfkqhnaZ4vpM8zmhQV+64bNyA2ePz66uodnDlgD2KNWON
         u+SJKLFLkK53JLIFqQY+yYOpymTfG2cJROFHoYQ4+nDMYfQjuHP6iCdFL+cg3y/JhwxM
         pXjHuNmjTAMqGWvlOb9+2iyVHJI4cn6fZnhNg7fIL2ahmvJUSnaOkEgqQd6Q+WP5SlYp
         1hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eOuhJdEOdisNXfX0jp/JEgD1+XHjgy6UrnqFFnwaNk0=;
        b=gKRHf91P8+0L8tukE0HRcJfcxomPHLrk+jm4131wvRxfO4cu5x1tdX/8hczFHtOmNR
         X+v6OHuda4wMW72cAPE0Shz7HM5lFI+vqAduNef4p8smeGojscIhoEYEqMhJkBBwclnN
         awzkNMAKd917+BPizcIedZZUzEiE2ZpoRl2c9srDNcY69tAyibqph4HiwCHftUtgMysA
         pnYuzk4kTUYlaXCb1nikvXITsQvdLVMdYU19jTCpWwCva/KIHZoBVck6ssNyCrSq98We
         QXGOrwrZdwq8kHjnAvfA4kaCIzb1QncFgcQQ+ZtJKzq+0UEkCJeNGW8nT+GjfBA7ZZSF
         bwFw==
X-Gm-Message-State: AOAM531VG425v3e7u1cMOHX/4C9V82Jrvt5qqLislbmY46B9z/Tdr8TM
	yNMA8jo5xZGCfYcgetVNW7O1pToeVPQ=
X-Google-Smtp-Source: 
 ABdhPJziReUO0UFF3NcDkq6pYgNm4NpJoRkVbijHUeP1IrUqLHdnXnY9+7aPA7gjyGgeWm5roO8juQ==
X-Received: by 2002:a17:90a:7a8a:: with SMTP id
 q10mr18289428pjf.55.1643523647403;
        Sat, 29 Jan 2022 22:20:47 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id 9sm4570161pjl.55.2022.01.29.22.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 22:20:47 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest version
Date: Sat, 29 Jan 2022 22:20:39 -0800
Message-Id: <20220130062039.151292-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jan 2022 06:20:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161106

glibc-2.33 has been upgraded to latest version that includes many CVE and
other bug fixes. Ran the regressions and results are better.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 63241ee951..e1eefdee49 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.33/master"
 PV = "2.33"
-SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
+SRCREV_glibc ?= "3e2a15c666e40e5ee740e5079c56d83469280323"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.31.1


