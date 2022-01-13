Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DD9C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.9338.1642084659047412001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LU7ZqzlK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso11389340pjg.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DAqWE+22OqK9+BPG3DkvYZh3Q8pAxYX4dozCaGolQWc=;
        b=LU7ZqzlKButJI0tclR+yqwWhx9/NLeRp/nLTsVd0Wu3Pu0Ew6jwlA+BQEA7whdz8r/
         6t+TXMZwaZbrDkCEe7/Kv7/wGv4qfDpJ4PipZWpVBI6xVGhX30E4+1EdYML4c+Y4cK3W
         TQzRIdvByNeeC7dqjtcdSEK7X4gjLwF2PaeGdJ6wZWSWv6mFhcFAF2MfoiQrjrvQ4pL7
         rftkeTB5Hx5qIw3UI+L/8tQX4qgLZS3nL3bUYtyOoJYfi4kcZh8M3FlP0l8SCSgM1lOy
         xcE2lwmMYCDl+XAupmL9fXLazKZBSj2Hxi7p2oL1UaM5Q4iZs3krXBAb3lhk5JVo8hzP
         Q+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAqWE+22OqK9+BPG3DkvYZh3Q8pAxYX4dozCaGolQWc=;
        b=eBCy/Td0USSAJ0pXhysC72f5yJ15i7RlB2dD9IpmWIRa7qjlYmTNfikVrNQpH5tg1l
         zNtHMZ+3DOslcN44Iafs8XjjnMZ0QzxFElqILYU9lkoJFFeh1OYDlkevcWofJs3Ja72g
         goXHxx4ybUzZYjBZpVU5splkhgNcWaWTgx+76+n6YH1wF1z7OZ3slIibNmLWGLObkHeQ
         4EEDIWIr3cPq8HM2IyB0a7Gd7u2Qd64i4+9TWv0Q53WZ2BUzpCF1bbJdixISV1K4cwF+
         5qac2gCqR1YXYd8eAeD2e77hELo9enMvydagT+HbS0h3IHn5k43MFu8nDUGwuXBkRquo
         MBJA==
X-Gm-Message-State: AOAM532BGSzcuhOs58Wnp84xtvgmuXHG+Jt8WUNdU0DTKr8I+fRhhoqP
	z63EBM9J8ryFMvPanHX3/NuQhOzciFmlsr1aFlk=
X-Google-Smtp-Source: 
 ABdhPJzMMB/Vwg/SnVvfUhgCpk4sCvijqpApTw/yGOyYCO7nlXF7gQ3fJ3o2IC7dWLhctV0CZCpTzw==
X-Received: by 2002:a17:902:a982:b0:149:60fc:9ddd with SMTP id
 bh2-20020a170902a98200b0014960fc9dddmr4652247plb.110.1642084658006;
        Thu, 13 Jan 2022 06:37:38 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] oeqa/selftest/cases/tinfoil.py: increase
 timeout 60->120s test_wait_event
Date: Thu, 13 Jan 2022 04:37:06 -1000
Message-Id: 
 <f8e726479d5f4d89f9a7cf8babfe25fd5c73f66e.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160513

The test is timing out on fedora autobuilder workers

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 0204537d49..4fcbe594c9 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -100,9 +100,9 @@ class TinfoilTests(OESelftestTestCase):
             eventreceived = False
             commandcomplete = False
             start = time.time()
-            # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
+            # Wait for maximum 120s in total so we'd detect spurious heartbeat events for example
             while (not (eventreceived == True and commandcomplete == True) 
-                    and (time.time() - start < 60)):
+                    and (time.time() - start < 120)):
                 # if we received both events (on let's say a good day), we are done  
                 event = tinfoil.wait_event(1)
                 if event:
-- 
2.25.1


