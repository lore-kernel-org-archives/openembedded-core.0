Return-Path: <zach@mandolincreek.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43590C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 00:06:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.1957.1653609977640519782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 17:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aquabyte-ai.20210112.gappssmtp.com header.s=20210112
 header.b=dD9+xJ/G;
 spf=none, err=SPF record not found (domain: aquabyte.ai, ip: 209.85.216.50,
 mailfrom: zach@aquabyte.ai)
Received: by mail-pj1-f50.google.com with SMTP id cv10so3160533pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 17:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aquabyte-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BqsJXcWrvMNUAnfNm19tF3chS/x/2t9fbG54eZaUrM4=;
        b=dD9+xJ/GEBKTdA/84kM/Yz++bQIj/U+UwngIkrjR3d4L/vGUExxv82Sy0F3gKKAXiK
         bFjZxQaTK6A2VcqwEgSAXJxbOYawdZzrgzzuFJAxBKSv4WlAndgh0wiOCt6zcHvs/tD2
         LN6pfn12zlsz5x/Ck20dl25DLmjAlUHvN9ptK4FTnZk7+d9LD6uFcckdmbq5dFume8pq
         pbQR+nJLeEBU56eDnlqFamMtCWhSQXF5IVjE/cBPg3c7hb+OuApiKlGwl0ZJ164IFG04
         cmbBV8LCAF4xhWNGBfcu0eQ00OUETRMa0fGjVqtlAx4MYgUrJNP4hWAPZty9t1M1DrXp
         vXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BqsJXcWrvMNUAnfNm19tF3chS/x/2t9fbG54eZaUrM4=;
        b=KiSpT/pJ6EhIxTMXp5Xi7/NtvnflcFwg/CrQV+8DiD/y/wg8zxfmOOQoTNTfRuHMIo
         jnFN2n+Oh4q353MfkmtpVYjzJtqwoyvCMihA2LXCXQWjWxVjH19eElJnRVHvcFeOgBhS
         K9gTHytDJdZjJNmE+nYhuBzrlsRa2YbIKgP4OYHa+Ec12DVLee7hf4a6zFdXoqn+Tt1H
         xm3sOt/zbekJo/zVDSeqiJQObymr4gMgoLCrXL3Dx6vGsOMPDfxPsUOCwfKvIagbvMXQ
         pnByqi/Yt28yReubc3JderE2FmLfzAkphNKqinlC79yamBOUsKJFaXjTBPglDUnFd7Rk
         ehUg==
X-Gm-Message-State: AOAM530vduA6G26hf0JZGPsayRVJg5SBCcb+RrrTGv4nle54V5sfa5n4
	ftMa0k+BFrFTWxeuVUb/IZY/Zg==
X-Google-Smtp-Source: 
 ABdhPJxWd10HpZ3bTNWRhxLvaUdGGEFD1BUmRxIxZvZJrVdggI7A37Ae86Fzlm6jE8pVjJ9i2M8yPA==
X-Received: by 2002:a17:902:e84b:b0:162:445d:28aa with SMTP id
 t11-20020a170902e84b00b00162445d28aamr15141481plg.84.1653609976895;
        Thu, 26 May 2022 17:06:16 -0700 (PDT)
Received: from aquabyte.at.mandolincreekfarm.com
 (fluffy.mandolincreekfarm.com. [192.173.156.26])
        by smtp.gmail.com with ESMTPSA id
 c9-20020a170903234900b0015ea4173bd6sm2144290plh.195.2022.05.26.17.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 17:06:16 -0700 (PDT)
Received: by aquabyte.at.mandolincreekfarm.com (Postfix, from userid 1000)
	id 2FCAE25200FC; Thu, 26 May 2022 17:06:15 -0700 (PDT)
From: Zachary T Welch <zach@aquabyte.ai>
To: openembedded-core@lists.openembedded.org
Cc: Zachary T Welch <zach@aquabyte.ai>
Subject: [PATCH] ccache.bbclass: document CCACHE_MAXSIZE variable
Date: Thu, 26 May 2022 17:06:10 -0700
Message-Id: <20220527000610.648627-1-zach@aquabyte.ai>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 00:06:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166197

Setting this avoids premature cache object eviction during large builds.

Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
---
 meta/classes/ccache.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 4532894c57..913304ab35 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -12,7 +12,12 @@
 #   Set CCACHE_TOP_DIR to a shared dir
 #   CCACHE_TOP_DIR = /path/to/shared_ccache/
 #
-# - TO debug ccahe
+# - Adjust the ccache size limit to avoid overflow during large builds:
+#   export CCACHE_MAXSIZE = "100G"
+#   To find a reasonable limit, set this limit to 0 (no limit), then
+#   observe how large the ccache directory grows.
+#
+# - To debug ccache:
 #   export CCACHE_DEBUG = "1"
 #   export CCACHE_LOGFILE = "${CCACHE_DIR}/logfile.log"
 #   And also set PARALLEL_MAKE = "-j 1" to get make the log in order
-- 
2.25.1


