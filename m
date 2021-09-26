Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5F1C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 13:35:02 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.18667.1632663302107727561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 06:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VCyibg2M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id r23so18115148wra.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mwSG7uJ4c0viWAGMYSRYGi9I1ivhB1MVlBRNxkDo07s=;
        b=VCyibg2MoBs/6KhcdliAQjhsQi5/N/ISE9MyEAqiZ3qIcCK67uR354Ri2XbJ72qo94
         EztOAusfV+CEPZog1RZGRmrVByfVrFj18NDIbmB6EoZchCABAdo4+DA7vhHhBeRR+V65
         GBpmORDMF0Ee2lqApHR7zPuGojcYnkCb7pdQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mwSG7uJ4c0viWAGMYSRYGi9I1ivhB1MVlBRNxkDo07s=;
        b=tFu3vgH+wujOptiFhhfiiNHU03mY4joKrO9c/nUf5QDFvr1HDkm+C7lENWJbcsVs1Z
         Nx7nbQqyt2BwQxrmg68l4jOnX5VUPwQlqk4ZvRZd+5BbmEw1FUAvrNIOQawaAlvaaBCy
         EaiYwRIUiZnw61y+M+ie4Zts8+cp5hHr1u5SXegQSbMPCoNKaA7t4ixTP8m9WBYX8O4t
         cUHzNWO1yqQxUA6DiwHv/gqIK3h0okltk0kScrI3HXxHt/B3rLavMoOzHDGpeR4TPiqd
         2ApMwuA8KegGfFNm6QvklZxi6qK9vatTYGDIC9TYbuh98NpBg6w5UnhGt52b/kfl1Dl9
         2Eiw==
X-Gm-Message-State: AOAM532QiS7zAPBn4GwqskfNltQ8LrVOStpCXPWDws3RkFur5MB6qJAW
	3sJNkfKkELloxXE5G7+KCKqk9RXaS+JZiQnW
X-Google-Smtp-Source: 
 ABdhPJwiViXpRbLXe+hdqErwg0JjNPqUwaFfi5EPIir5/xOz1El5+K2xAwBkalUHvb4EKHkIyfu4GQ==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr22012590wri.93.1632663300532;
        Sun, 26 Sep 2021 06:35:00 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ea95:6e9a:b58c:3d3e])
        by smtp.gmail.com with ESMTPSA id
 20sm19431104wme.46.2021.09.26.06.35.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 06:35:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/tinfoil: Update to use test command
Date: Sun, 26 Sep 2021 14:34:59 +0100
Message-Id: <20210926133459.2011281-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Sep 2021 13:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156361

We've had IO load issues on the autobuilder with this test. Avoid
those by using a specilised test command instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 51092805d8f..8fd48bb0540 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -94,14 +94,13 @@ class TinfoilTests(OESelftestTestCase):
                 pass
 
             pattern = 'conf'
-            res = tinfoil.run_command('findFilesMatchingInDir', pattern, 'conf/machine')
+            res = tinfoil.run_command('testCookerCommandEvent', pattern)
             self.assertTrue(res)
 
             eventreceived = False
             commandcomplete = False
             start = time.time()
             # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
-            # The test is IO load sensitive too
             while (not (eventreceived == True and commandcomplete == True) 
                     and (time.time() - start < 60)):
                 # if we received both events (on let's say a good day), we are done  
@@ -111,7 +110,8 @@ class TinfoilTests(OESelftestTestCase):
                         commandcomplete = True
                     elif isinstance(event, bb.event.FilesMatchingFound):
                         self.assertEqual(pattern, event._pattern)
-                        self.assertIn('qemuarm.conf', event._matches)
+                        self.assertIn('A', event._matches)
+                        self.assertIn('B', event._matches)
                         eventreceived = True
                     elif isinstance(event, logging.LogRecord):
                         continue
-- 
2.32.0


