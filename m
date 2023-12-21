Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B63C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 13:49:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.51538.1703166575231301379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 05:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lo1okNpF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3363aa1b7d2so757127f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 05:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703166573; x=1703771373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojh3xmhSDysZ9vNifdhxmRl+6fYpNfe+FvyfZUciI3g=;
        b=Lo1okNpFMm3ri+09m3JAWETvIbxXSzSk0AG+mLOV2+eyGTnC1I/cJoJXEo7IBhVMsu
         Jt7BvHpx554oODc+6AlCSdWf7gOpsQUPgdioCtJRXKul/KjTutQgxQbo8N/CkcV05zNw
         63LlrBU3hIz8wakDRYVnFfRVOJFlQY+pZYymo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166573; x=1703771373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojh3xmhSDysZ9vNifdhxmRl+6fYpNfe+FvyfZUciI3g=;
        b=uFUahCFm995pDgslr/Neyxn12AgtpuBEeEG/vHWESveVBk/JQNHP+IFQPUzAsbYjFf
         ak+pCiE9Xw9uQTG5XJiSYKVAc3UiD6DLfXal4RRFMYk+YsSYgm0FVZUuEBwIeu8XqTpU
         QuZ8BDt1/zyK8IgUk/9pzwPcesfd6LQKH+sJFP8jNpQ7KlCinSbaKO8kh19w8XcoHxii
         8TQXWc+arAMuskpUd42KrRT37O+hPIhHhBCex7ZhzV66K0SahRm6HgxbpWaHtQAUw0of
         DgkzuUp16rdE16mO3wbvWmvVK4+9aTxIpHEJ3n4InB59jwl2dOJ63lJpSLgy84XPRNEA
         FQhQ==
X-Gm-Message-State: AOJu0YxqmQ25e7bmq2ZaBM79Ee/BURELt/onS5HAM6UwTLS0Z2LFDc7m
	T3T093dQVYxeOLRK+IA3c/6Z273vRMEyvxrsBdY=
X-Google-Smtp-Source: AGHT+IFqrJbDcUyGX69idYx7THWIf6QpLsRyAArj9d2DRCYICeYiYmHL/uL7SWUGHtaPOOdxS+3uaw==
X-Received: by 2002:a5d:54cd:0:b0:336:89fb:8207 with SMTP id x13-20020a5d54cd000000b0033689fb8207mr394228wrv.166.1703166573170;
        Thu, 21 Dec 2023 05:49:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:916f:409d:c5db:4918])
        by smtp.gmail.com with ESMTPSA id m2-20020adfe942000000b00336630c31b5sm2098657wrn.9.2023.12.21.05.49.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:49:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: Disable two intermittently failing tests
Date: Thu, 21 Dec 2023 13:49:32 +0000
Message-Id: <20231221134932.3827206-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 13:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192827

These two tests seem to fail semi-regularly so just stop running them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/curl/disable-tests | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index 833c6400019..38a4d944765 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -1,9 +1,15 @@
+# Intermittently fails e.g. https://autobuilder.yocto.io/pub/non-release/20231220-28/testresults/qemux86-64-ptest/curl.log
+# https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
+337
 # These CRL test (alt-avc) are failing
 356
 412
 413
 # These CRL tests are scanning docs
 971
+# Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
+1096
+# These CRL tests are scanning docs
 1119
 1132
 1135
-- 
2.39.2


