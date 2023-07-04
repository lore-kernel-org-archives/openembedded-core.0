Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2034C001B0
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.61513.1688484636411469692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kcfsPKxz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b7ffab7ff1so32829215ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484635; x=1691076635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BsJc3z6/txgi8FfvedjFf7ehmncQaHxt7B3b+7BnSs=;
        b=kcfsPKxznqxMZcPD+zHgLw8xe3r/vkjT7siITzR1zkvqhZOj8ib3jQSSKM7/vrSUEX
         /2ixqigOVuJHiMdbffudIabZEqkaH5i0zH8l1PLsUyQFwlRpF1bZlZZHEssTZA00U5oq
         n1KMD3wJksiZ18ZouPJiYk7KE+5TUQ7oh2EQJhzVqCl+4bsT5v7qudrOyksNXWGgHiQ9
         0xWCDuf/j6NA6YxGpsfpCN539qUDVFq2kA49GdSMtYpwQ575456bkTs5KAVmXDwtjDH3
         Y7mqUOC6l+Q61HmUyJtLr8rwxGgW1OViyHvJ20mH6exBNeBJMUBEDPCvESzJTEuH9XTR
         Ed5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484635; x=1691076635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BsJc3z6/txgi8FfvedjFf7ehmncQaHxt7B3b+7BnSs=;
        b=MxIIUE3aH9DI3qfLHasqvEPJbE1AmX+JHR5B3BQYEjnv2j+WTb4zry1s+N+xLASe0p
         KquQGC0IDhURzqsNLwjyEsicFi393J2suEXU1tdbZi/skJg0YqeaN4Owfb1FW1yPoXUD
         QWpe8FT3M1XgPPWsSXWhyI+54h6e4I7rziVcrBuNjsUCIeSuliF40jhvUjTdzB9nrZEm
         vqNhTWc8RsqQr8H/EU6ruTXIwfwR09m+r1HZ9gErvFuli0W/lOW7VFXPGH/ZTIjqjqPS
         mYgyZr6aNWllUyZY5k8aH1hD3TY3ohotb453AUUK+A5Jmw8xIp4QgndqmlnoNM4471Ny
         n3TQ==
X-Gm-Message-State: ABy/qLYo3FcKdX9tnsWIsxRxxfIIq9syhHik5YEBU82/3WPwTp1RdSLQ
	M16eufUhUCTMHlhFDaYndBLX/BI03NiuYpEwJvjkwg==
X-Google-Smtp-Source: APBJJlFqM7c5AG1VC2KV7gzcuL6bCLQUZb8ygaCUqmP6Uk06hj8RTSk/pkOF21UgXpeVNb3QZjPHRw==
X-Received: by 2002:a17:902:e80d:b0:1b8:a7f0:fd95 with SMTP id u13-20020a170902e80d00b001b8a7f0fd95mr1123620plg.57.1688484635522;
        Tue, 04 Jul 2023 08:30:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 28/30] ptest-runner: Pull in "runner: Remove threads and mutexes" fix
Date: Tue,  4 Jul 2023 05:29:30 -1000
Message-Id: <c0ebc132c279d3195aa8ed086d596ed1b000cc2a.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183863

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fix simplifies the code to drop the pthread and mutexs which should
address some of the buffering issues we were seeing in some test case
failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bffa6d381d7ea0a6aad19d61cd973c82aadef070)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 9a9b8ec260..6f3104499f 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "a6c7dcda520402adb62a31b8b1c7686c5b8a4875"
+SRCREV = "8259375d306a8129f6c5d8528314496fc6ae1ca3"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


