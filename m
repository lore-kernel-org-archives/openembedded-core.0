Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B788EC47082
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.1065.1649350846290534056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LONbQUkv;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n6so12087255ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v8ew83uoAYXjioUgQ+wJplIIoQACDsUMh4b3DJn1ey4=;
        b=LONbQUkvNVhtytyR4XN1lvaKer2TDy0r3pEwPlLzxpbdAaGbb6/WpwJCBUnIGdHNGK
         MTmSj45CMDIIOf8BjuOs1JXaVZ1lRlR1nreFLYQi/d3wYYbjwqyg/azgdmML0aCvfSdV
         FcFn3CWRO7sp4OIRsoqt/c6OLM/MCl0R/6WkhQupd3kWx9gm4N1KvwBkhrmVtLljnh6f
         Q4YLr87HNN5b3DjKH3TA/jA9EmYaVcL/F70sBF+G3Sj35M9JZczCz7Hv8SnQsLFG9C8K
         tUFW1K/VB+Cco7RCgSIKk8v0QoqcHVzsCpC0NyO/FWsI4jZLI5Yj/Qx7pqncbTqcpYFm
         TYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v8ew83uoAYXjioUgQ+wJplIIoQACDsUMh4b3DJn1ey4=;
        b=uWkHJt2ml9YMKqhkjm0n6nIX7BHBjVGrwHkv3JQN5cTLD9S1L+e5Pv1XGFM6I/iA2Z
         0RrMLtMxuPshSCMWlZXXcnsuk6zYEVsDbmVZZJ4g81AbhvTPbNgig4JCRtV4uGAJCzz5
         1FMMdMn7m1IiIsN/JYJeXnikG6CQPqTAO11wiIJNLHUdRZYj9qKTlJQ58aofOoRK623L
         0mt1NUJw2U9EMHtT4j4flrqv8Cfn5PkJXbmTphfLcIGGJXYoO+7I8O7jagX6QMooo0hl
         9lJlRp+s8a3Cu8J227ZMRFxX8KAmsze8Pi3igK5Rt7TNmVgnFuXTCmAcmeHSTTBPJAKM
         cnBQ==
X-Gm-Message-State: AOAM531Xnn7EBvc+LuGoJRLKxeGXARkPmCH7NngBOClGTkwuJtChiM7I
	qChPi7tX+VUoDYZUT19l2U1LdEd8yIY=
X-Google-Smtp-Source: 
 ABdhPJyEAa7cFmEVmzBpVTY7DQD5bdEE648H0v+7wTSnjnf9j73bAz4+Sju4jBANRUUydBevOuK9ww==
X-Received: by 2002:a17:907:c02:b0:6df:fb64:2770 with SMTP id
 ga2-20020a1709070c0200b006dffb642770mr14782767ejc.221.1649350844853;
        Thu, 07 Apr 2022 10:00:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/17] go-helloworld: update to latest revision
Date: Thu,  7 Apr 2022 19:00:17 +0200
Message-Id: <20220407170029.3500874-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164120

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index b3a8631794..1e2434fb17 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
-SRCREV = "787a929d5a0dfb8bbfcdd2c4a62e0fd89466113f"
+SRCREV = "ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.30.2


