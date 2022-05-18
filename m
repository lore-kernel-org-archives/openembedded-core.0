Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCEEC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:46 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.3441.1652871571559419393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IfKw8Nxf;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id fd25so2502305edb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxL7Z/hSOhnzeGH/4wZIEd8eLITT5a7mmc77RZbLtZQ=;
        b=IfKw8NxfNbSLP/jGOgd6frWZEDoLLOv7O1/+8zWea8SqlIPoWZdnFbdcXI8aaot49r
         m59oenFcFUXWljFWXM+Qmo1g67imTW+PTzXVqSqG7ySdFobvECMz8HQu/G/fzy73Ku/O
         tzpOTsMtyIHkZdfjqD50Ty4iRUr2Q690OFo4p2uIQMgmUBifxbCKJmsyXjy+dVueCCxU
         XAFIg2wr1BgvpZ4v160hBPXHz9ZULpRvEk4WDQUAl3ReL0fsRZHt8r6iRkqUfB2n9Ln0
         bZ+SkAS1ZvCiB8KXpulFk8zW4UnUK6jBrSPfXk8ERSlow8qz2HhWGwJtEu8vg8uzspqB
         t7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxL7Z/hSOhnzeGH/4wZIEd8eLITT5a7mmc77RZbLtZQ=;
        b=z4ebEOTz10/zuXGztT9RVj1mAAIBB1FYglhyO6Ti6PeiWZh2qTh5jv9sqbAt1S7/sP
         bSuhpjrCS9jiCDx31/glYnFzKqrewyn5UXFiQSJG6CXtdqpowN88dlgyKmGLEPloMmBa
         QRCV32PcazbnjHAx+XIUrzjlJxxodNs5sEFmy+WbVC/u/pG4Ysp2gsH/S2/KTDepHiKT
         5ex+zak32+9SMppkwIo/7LjDKFeAsokoPdheceiKDcCJBZZzMUck2r5fvqst9/uywapa
         P88iNfHjYXTeYjlyCo3lnIT8rKM6OZGNvlYOB0kwP6AyfkOsbJmucCVure2LErSny50o
         N4gg==
X-Gm-Message-State: AOAM530jlZAYv5HSFWOh2sdXrPpNLP4s5r4oylHpR1EQQn5VIesP+mql
	4ZbdtdJgb2DrzghJloa11XeDGFjZYB0=
X-Google-Smtp-Source: 
 ABdhPJy9aJB05qvHjiDKLYpmrdH0EUr/xtYS0G4zhZaTThY0VHraZBdhSlbFgbRGUv3ailmp7m4nyw==
X-Received: by 2002:a05:6402:430f:b0:427:d034:295b with SMTP id
 m15-20020a056402430f00b00427d034295bmr23898179edc.126.1652871577014;
        Wed, 18 May 2022 03:59:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 49/49] python3: use built-in distutils for ptest,
 rather than setuptools' 'fork'
Date: Wed, 18 May 2022 12:58:43 +0200
Message-Id: <20220518105843.3299331-49-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165846

The setuptools version is now used by default when setuptools is installed,
but it  is incompatible with some of python's own tests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index 405b07f495..05396e91ab 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
-- 
2.30.2


