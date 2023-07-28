Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F851C04A94
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 11:13:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.30018.1690542795582996882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 04:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=exbih6ue;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso20992125e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690542793; x=1691147593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oniJMkN0jYjIX6IAvaSr977qphYCLC+Zj6FOsUkT8jc=;
        b=exbih6ueStgTUxO6DeRtqJs8XGI9kt0i4Eue0Qc3BDW5CMwifI7IMW1/snWrMRGdeA
         49mXhPnGw1iaC4zq7vkPypQ1rbltBG5n9tMiIiYcP4T3X7SJYnIwtFbxU8u1O5xK5u/N
         DE15gn7oPPOSy/CfAQtun+YOtI6SMlqnggXh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542793; x=1691147593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oniJMkN0jYjIX6IAvaSr977qphYCLC+Zj6FOsUkT8jc=;
        b=cP+0zKfof1iPHXKS0dKGT1rob44qIFT2JbQTbucXrx6/TbxKKzqVRse+WHS2vjLCpu
         aTxJvXDzHg2QooeWKIASJWiZf8eMrV9lv/a2L6slLkOWqwMt8iaR5U5cUhKas86B8iMQ
         ipJmJCg3c5r2wI9iyD0+KrL1uS/LnrHeJfERzX5oUugSuTGfWySluvrzHW5vrkDP1DbC
         JeeTBQjTVppuNXnUQFtOpQFzcweHBoIhPKozLTclcAg9drF9rsNHQQ5EuAPMaVDhhtrN
         U9GLQ+JMF+AFEssVZQG4KBqwX4RlDSyH5b3xS/YvvE/S1V8kDg3aw0UYEIo4PEwy3Z9v
         HREw==
X-Gm-Message-State: ABy/qLaauJ1WXoJC2Ybt2VYrzEqi1RLYcKTO8m++jRMmcuxZnUMf1VUE
	gEEqc1sIjri24gn3WcZNnhGbXvqZRDfwapNbxCs=
X-Google-Smtp-Source: APBJJlGhEjaljEd09QMMbeWGAf5fc/6qqNf5dN/p7v/WV/W2WgYagKvhPidC1FlPVv7RDJD0uySmXQ==
X-Received: by 2002:a7b:c019:0:b0:3fd:2dcc:bc19 with SMTP id c25-20020a7bc019000000b003fd2dccbc19mr1518372wmb.15.1690542793402;
        Fri, 28 Jul 2023 04:13:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4e39:f3a8:af2d:87a2])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc311000000b003fc02218d6csm6730736wmj.25.2023.07.28.04.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:13:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oeqa/runtime/ltp: Increase ltp test output timeout
Date: Fri, 28 Jul 2023 12:13:08 +0100
Message-Id: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 11:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185021

On our slower arm server, the tests currently timeout leading to inconsistent test
results. Increase the timeout to avoid this and aim to make the test results
consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 29c26d7d324..13a4f84ac00 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -71,7 +71,7 @@ class LtpTest(LtpTestBase):
             cmd = '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
 
             starttime = time.time()
-            (status, output) = self.target.run(cmd)
+            (status, output) = self.target.run(cmd, timeout=1200)
             endtime = time.time()
 
             # Write the console log to disk for convenience
-- 
2.39.2


