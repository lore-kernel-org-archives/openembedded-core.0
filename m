Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE00C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:26:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.1166.1652811957327149215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ntjRo9qO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so3020518pjq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WbUysG+UT7LbBORZg0rnEnb6B/Vo09zRN6ds3byeFXY=;
        b=ntjRo9qOoCtuEBY6W/6OzmgaOGHaM/9Mi7HFsx670eDutDMvlfD5K97lw7bhsVJYko
         GZqTxzU/0njjy9DBrZR0P9OMNsXFRhYrqrSIdS57ykjDgTUAe2aqh/YhWPzKv73+N9p8
         6/AE8raIqZ46BOJEPadK6wbOhcYfMJAKKTta3wIqL4oauLBGlK7h0MYnzd4qs7XIqH4q
         Jgab5INqiEE9lPLGiiUBDUcF7c8hYn3/8eRn7rGQctCE9CZGDCeh25wfP/3B8ZWXrshl
         VdfQOtnpjwuXEtAT0X6Pev3yz1eRi2J5ihh/pDrO5Y2axoLVvoZbblBUPKQiZMR5tZ7x
         epUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbUysG+UT7LbBORZg0rnEnb6B/Vo09zRN6ds3byeFXY=;
        b=jti6oOKT5PlGl/n4ZulSgWJOy/n/uYA/pHrk2eIkb6pJiqH7RihNk+hGpKe81IREvc
         4KyQ+ojeEiDqJbKHSsDvMPgegnYvoqwhwBpCPcvDDB/a+TZHarJY9RBCxZG+wjB8jiip
         0A5ka8HAvVGGFPC8Um/gVl2OIuGommPajEgKfReb8i/DVL91k8Ro1gY/PALcu4+3tEJc
         BaXEeWI2+MUhRe5f1N2uR8MC1CE1De1cCkYv4uwjsthN273CxFsXEPnUr6vq5tg7EcyT
         7ejOprFrUP4PG9NmwcjSGLOazuQjIulTZoktsnyPcPHhTBTe4Ym9Vc39uXqKkPW1ELL7
         wZBQ==
X-Gm-Message-State: AOAM530Cw3R7f228gCJ67L6nzlEw1rIJOPbuPdeI+uf6iK/C0mP6IIQz
	hrxgSeU9MBd44Af1rjEH4VH8I6gzbJX5kM3j
X-Google-Smtp-Source: 
 ABdhPJyO45Shj2g8mEoKa9VR8HZ/MJ3Zj4fGcx8r/e3WZUfG7RDCdY887wDIiuYnbFMIWMHsGD2zJQ==
X-Received: by 2002:a17:902:e84f:b0:15e:8edc:dec9 with SMTP id
 t15-20020a170902e84f00b0015e8edcdec9mr23624133plg.78.1652811951838;
        Tue, 17 May 2022 11:25:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/31] strace: Don't run ptest as "nobody"
Date: Tue, 17 May 2022 08:24:16 -1000
Message-Id: 
 <c20a5f83e9f0483f5458513eeaaec60436dd9d68.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165776

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

strace ptests can run successfully with root user, there is no need to
run as "nobody". The ptest results are the same.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ab213178c011152e29dfb0a80251c5e5ab79900)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 02bb91e07f..86daed9220 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -3,11 +3,7 @@
 set -u
 
 export TIMEOUT_DURATION=240
-chown nobody tests
-chown nobody tests/*
-chown nobody ../ptest
-
-su nobody -c "make -B -C tests -k test-suite.log"
+make -B -C tests -k test-suite.log
 res=$?
 if [ $res -ne 0 ]; then
     cat tests/test-suite.log
-- 
2.25.1


