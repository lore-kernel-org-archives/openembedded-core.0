Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.197581.1598282129423873558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GsH7J98D;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id g6so2491806pjl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dqtGqlcSYj5dDBZOoEdzmkAG7sBlG15O5Hhbrg7CKNU=;
        b=GsH7J98Dk8uszP1KWZU6Tyi3BccYT3OssaWL+KujJdGbOMxYI929Vy1izXaNgUqqBY
         FALP9RnFl4HwtycufnVVL28U6PVrbKdymdsasCWpvuMBjOKiJ6Wp6hb2X5uordTw2aBQ
         dZL4jTL9Z9cEI3040QSWzC3xr3jQwwbLCE28JF+4Xak627MMwLaD+8UMN8UbZsShi4X5
         eDgcJFp9NBxdg3j3ZMa3hqtARa5V84ufDlk3XQTI4xUAtYUImEEtnbwy8WfE6OF3bb1x
         H+BfkKSJ3PFTYDS2jBfGB9iHvgjJFPLpgAMrbq2F1sQyjc/f19Yz1keIn/f8AP3fR6kX
         tR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dqtGqlcSYj5dDBZOoEdzmkAG7sBlG15O5Hhbrg7CKNU=;
        b=pmZHr5XkN4cRKmwt5UPVCxJU9DvH6TouOZu5Gp8GVfmILh0FNXnkUBuRn21IyABOYM
         uvuiC5rbFpk/mBSYAZVEgDzUlMq5NZG2XNj3rNeXciu4GbRXO2m7FBqKocZDIJmhd4r1
         7a9e/USRNsWNROlxIapBCVOR7Z70TCYGSpaNFyDDFx8SZZooqeE6cp/8nTYui/hj6+wX
         BiD+sbqyqIG4qNCV6CAHOJBFokLlQFmBgxhjwQ5aARL0okSZg8/+kCHMO0pa8WBa3ekF
         PL+x1SQDyGQwmNEt+eH/C7QsLHVKl103S2pPF7yFu+fZUGXOfY6tXNg0kgUq4Yq5GeBR
         /OuQ==
X-Gm-Message-State: AOAM533Bo8XMJ6AGgJYyqhvsHXdqwx99B7RRGUFl5yjUWi5lh2SOQVi3
	D7qCzheVf0dqtoJYMcHp5OHt1/bNafAICEEeEls=
X-Google-Smtp-Source: ABdhPJysXQLRIWrfGkjH5zQpm1Gcnk1GYDIJz/Rf+QsVKTRHnAYp0nXenfxI0m4p09wg308e8Shw1Q==
X-Received: by 2002:a17:90b:eca:: with SMTP id gz10mr4906336pjb.3.1598282128479;
        Mon, 24 Aug 2020 08:15:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] selftest/tinfoil: Increase wait event timeout
Date: Mon, 24 Aug 2020 05:14:52 -1000
Message-Id: <c0292d36dc79d0b1864eccddaa48b033c183d2dc.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing this on the autobuilder when IO load is high. Increase
the timeout to give this a better chance of working out ok since
there is no particular reason we only need to wait 5s and searching
for files is IO sensitive.

[YOCTO #14001]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c847ed207795bc03f791ee5a3348fa5860c53e70)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index d1aa7b9afd..206168ed00 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -100,8 +100,9 @@ class TinfoilTests(OESelftestTestCase):
             eventreceived = False
             commandcomplete = False
             start = time.time()
-            # Wait for 5s in total so we'd detect spurious heartbeat events for example
-            while time.time() - start < 5:
+            # Wait for 10s in total so we'd detect spurious heartbeat events for example
+            # The test is IO load sensitive too
+            while time.time() - start < 10:
                 event = tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
-- 
2.17.1

