Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72070CCA481
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:38 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.1304.1655854108202225547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gfS8sqXO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 23so8332639pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uSmz3vUNXq/SNce6yotvje53ueWC0jxGVMrcFDQLNs0=;
        b=gfS8sqXOzfHUfiXnw7p6y8KEvQQuHqWu7NaiEagOL9xZwDlqkvaswr3zygtoDq5EQi
         kUYLJBOEgLuOpaTS+K1lLlNxJNaUXWlsxCfe1nfqQk3wRe2A5yiPOSN32zVXy2GTzpgH
         /WYJawreDV4oxB1rYpfRZV/5gRWbfWjN0YoTm0sWG9qTnzN1sG5bCOFBzg6mYhke2dDx
         l4PRHT1qlpQGHdyjmUOHRBOkWCq1ZxR9M/izmgN1QDwS5Gvnx35YYCmr/Lo5+eJ2Pj9Q
         0y/bGYF9hLY40ife6FZbqw+/V2DRWTMqND5OeP3hG4AOwgMnrlrEATolPOoiMuYqc37p
         VXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSmz3vUNXq/SNce6yotvje53ueWC0jxGVMrcFDQLNs0=;
        b=40ZEb/Q+SK3ikiLXdpblgXbsz6fIs9284QXPTiDNpa8WNcRQjpz8p4LJCb1YR6Af0g
         bEhuzMe8IulLBYjenzOK1gNzvfdeSGn0N7fib+S3OMVkGZeY+saqcWQ7LXoAfX45cJfx
         DBfEl1L0AVXrkkD+0mKjd1fXaVGOdL2JKHPTlomTjNsXIY5hsQbRUPMx2ZnPiZtjONOJ
         mJyEWeLwK6YS1ftGjGywmK5B4SjjGUkVwYb5d5DBbcFZh291QcutI8Z6hymrAZk+O6dq
         4L7OkKW819NQM8OTTYMkxaKWupmEgroLE9zuK3qGXy0Gh5pdhpuyU94LOxkeK7e/PVhn
         QDmg==
X-Gm-Message-State: AJIora8gyrN7Z5342yvW8duLtDrAxnsbiC8UG0M5jBKXl7TKJlgpZOAq
	kpfluCOjeN1Zql9B1W7AzPC7Dp8QzwJM5CRU
X-Google-Smtp-Source: 
 AGRyM1uA4HP8qosccBauseSVxv7fRLmSfx1JT8rUx+jYIjsg5I6K/nNhS00r1i95uQx2JN/9FbOdtQ==
X-Received: by 2002:aa7:8091:0:b0:525:27cb:19ef with SMTP id
 v17-20020aa78091000000b0052527cb19efmr10921360pff.37.1655854107274;
        Tue, 21 Jun 2022 16:28:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] python3: use built-in distutils for ptest,
 rather than setuptools' 'fork'
Date: Tue, 21 Jun 2022 13:27:51 -1000
Message-Id: 
 <8e34686911269e461dc646068f7a4d7c0e5da53f.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167195

From: Alexander Kanavin <alex.kanavin@gmail.com>

The setuptools version is now used by default when setuptools is installed,
but it  is incompatible with some of python's own tests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c0c1ee33781733d712cd983be460001cd7938014)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


