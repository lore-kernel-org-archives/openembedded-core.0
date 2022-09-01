Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04B1C6FA83
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.9380.1662016905864594897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlhC3Lh9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso870868wmb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xeqPIErXWK35dttjKNF4dpNNvN+veOk4MEfdXMxlWh0=;
        b=AlhC3Lh9HxzEtyLGNgXisBmfoulvSTuOli5vZzOc8ELtmq/64YOUD/Cc7uCCn+IoUN
         LOYIzxMcwEzjXu6J8XMb1Dj70ef6i96ywCIQ9YeirA/3iKPzp759oufjZDzBOAdQpP+1
         HKqjMCRgDfSPIhdK+VVSdIVa1jqJcw1vKLdq1faBSwyTczFb0ecGr7oHufSs9lfQyiJJ
         7h0OTYZxI5n97qvfiqsU4HEQjoLifZiBZI35SuHyHQAh5hPRZPVnJDEkW29DfLdW4fJx
         xU06ajLoJsC+jqm7WmBI4lcSXqlKTMHG/yNSIbHIJVwAhpzfCwfqBuPnODjnIyLFvFWM
         OOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xeqPIErXWK35dttjKNF4dpNNvN+veOk4MEfdXMxlWh0=;
        b=Bw/k8DahLJL7wX6+KDhR0F67oDzRsd4eFZ0GAnHYS0YoFUe8cVGqFupzZa1rnykIYu
         qzWRdXYE4SyXQuFElvCHU3Gzk3BwAV6KGtZxY0OM7uezLHPwcEsE6LCM80Tr9p0VDM5S
         2rQ84xngXiCOX2Jbmho/WpBWsjNAy1nvt0BlysflWXUpG7M5XDVrkltwkLzKzdVTPyjV
         yhEVGoylMgQO3aYLs7XSyLoqM8ElBm+zKGvlt2lSNqneigZff8S/0/+eoxgKkxrCHmgx
         vGh/SPh9RDha13JceYza0XlNvKiC3hjqt6E01HIxbV2RkpnI0kinbYAx3XR7pIIVSxoX
         dE6w==
X-Gm-Message-State: ACgBeo13/i3Iv6Q2CmoscCIsqFK6ah1AsPwdvg/9SFOn/LbhxSH7QleP
	eb4M8T1G72vHvnJ6mHaKfbR/+Dxj8hc=
X-Google-Smtp-Source: 
 AA6agR4wv26DQNm5+lRSlvrWo2j0mO3htzDPGY2p797hBdxvXWO/4KP4IT2uptxQ9JpyDYt1Ozn8zw==
X-Received: by 2002:a05:600c:19ce:b0:3a5:ffb3:d546 with SMTP id
 u14-20020a05600c19ce00b003a5ffb3d546mr4245009wmq.6.1662016904417;
        Thu, 01 Sep 2022 00:21:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/14] sysvinit: send install.patch upstream
Date: Thu,  1 Sep 2022 09:21:20 +0200
Message-Id: <20220901072125.3366367-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170152

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/sysvinit/sysvinit/install.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
index 90563a6294..bc6d493c2b 100644
--- a/meta/recipes-core/sysvinit/sysvinit/install.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/install.patch
@@ -3,7 +3,7 @@ From: Qing He <qing.he@intel.com>
 Date: Fri, 18 Jun 2010 09:40:30 +0800
 Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/13]
 
 ---
  src/Makefile | 53 +++++++++++++++++++++++++++++-----------------------
-- 
2.30.2


