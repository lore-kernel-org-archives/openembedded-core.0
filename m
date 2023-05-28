Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E4C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.32983.1685293688982938348
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TbKFME6y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d41763796so1851240b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293696; x=1687885696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=missYJgo2TR3DImUHe9cDI5eue9+bEOvCK4NoM7DyFY=;
        b=TbKFME6yWbmylk8AnvAI8xw+GfsZZ1m1yw+xdRR+FY6ZQY2A0QIrTV1SXq89JsgDqV
         Mw/cqvcGCMbvMV/dPdnK/yqmjJI1+kNzRBwQSG/G7EX5p4MDBAdP9XKz6x0JWOA8aeiD
         xk1Un8ADpEh0zZ66aS+CCijT+cOS5mOJyzUv2rCs9kAZe+i99gy/8PN+juDK/eAfcG5l
         3h3QHS+dBQIVQqujGvt5TMsY1yMXawuIbVSKTvnPtNW74oZnRPYcJ/iMfj3XFTx/V7lM
         eIoe9K1X1OcSHhAVjvK8VagPgpxOLYMqln0sKGsHP4i4QgojrDFJaJew0pFO0bMosEbP
         gWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293696; x=1687885696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=missYJgo2TR3DImUHe9cDI5eue9+bEOvCK4NoM7DyFY=;
        b=F9rVD1KWqOWlJxcliiVz/OgNRt1dSzUe1Ceb9xBq3fB4egk3/bhTPGXcUbSjo21tKm
         Ly0hSQXXjNGuSzu2j27fbL3yRyPhO1JZhomlHjFoLZMKzzEv8imRWRCZHiic0FXQWRr5
         5nNwa2eCk+Ieu6Sk/2TxiEldqeB2m07yl5tCefkaa8+9qUJmz6HKS1x8IHFEONbpQX8Z
         DUENAHH7f2xjNnxvYC3sc8vwAHgqfiRBST10VDFJZnZNnOySg0MxkA6XpqgTNdTHg57g
         d2uVQ3fBnli516gKMFLF2ZMOLM7xcCVMxjodBwraGLoIeFHh5mO8/fo9IphOLHGSci3n
         BbnA==
X-Gm-Message-State: AC+VfDxEnXxZQ64qi/84z2kd3ynr/uaZcJPMB+0Ld/Px5DsXhA1k3ALt
	UF704wSbofzn8+IoRFJTthcc48Q+LoEWFNvLb/8=
X-Google-Smtp-Source: ACHHUZ7MaBa26v6fMF8+/D6XNVWGW/25BDu6cIa5v9+izCnIq9YukEV0X8cBV3G9kl72L7hUS/Tquw==
X-Received: by 2002:a05:6a00:218f:b0:64e:bada:2411 with SMTP id h15-20020a056a00218f00b0064ebada2411mr12378513pfi.25.1685293696404;
        Sun, 28 May 2023 10:08:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/12] scripts: fix buildstats diff/summary hard bound to host python3
Date: Sun, 28 May 2023 07:07:51 -1000
Message-Id: <db3f62378c54ebdfbf5cccdba4c83f503372138f.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181843

From: Paul Gortmaker <paul.gortmaker@windriver.com>

Somehow these two got left behind and hence on older hosts that
are using buildtools for a newer python - they will still fail.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1b11b83a6dd991f393940741c930691463e6d53)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/buildstats-diff    | 2 +-
 scripts/buildstats-summary | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 2f6498ab67..c9aa76a8fa 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Script for comparing buildstats from two different builds
 #
diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
index f521d78650..b10c671b29 100755
--- a/scripts/buildstats-summary
+++ b/scripts/buildstats-summary
@@ -1,4 +1,4 @@
-#! /usr/bin/python3
+#!/usr/bin/env python3
 #
 # Dump a summary of the specified buildstats to the terminal, filtering and
 # sorting by walltime.
-- 
2.34.1


