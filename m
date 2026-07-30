Return-Path: <halstead@happypunch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F5BC5516E
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 20:02:57 +0000 (UTC)
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20280.1785441770879090658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 13:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@happypunch.com header.s=google header.b=NEk2iqv5;
 spf=pass (domain: happypunch.com, ip: 74.125.228.1, mailfrom: halstead@happypunch.com)
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so170112a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=happypunch.com; s=google; t=1785441770; x=1786046570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCq8EfNJd+T6J8CYf+qVxPv0YcPSMRvJe67kyE7GoyQ=;
        b=NEk2iqv5kAWFvTjpEO8+CJlyXMMRoIrbt2QQgrD5yXIFsFO0lA+L8cBe0iZCFYYaxg
         4dmX9+jWKFIigDUEsvZ3E2j1F9YcfiwUaJptLqXCZTVx2gLvVAjMpYHVj1sjbuSNiiO+
         IjWqArDVt2rjU71E39Zwqs60WPBabh1pGKKXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441770; x=1786046570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCq8EfNJd+T6J8CYf+qVxPv0YcPSMRvJe67kyE7GoyQ=;
        b=B2M43SqfEPpbKl47CKWXCHu6v4XcdgfORNMOzWDOsT8drY27ftKZEInOrf/Oh3eoLp
         fq2CzdpHEvC04JNmlz57Ts4FG+tRPWzKAwOBbs5LIdU5qLpEjCMYMDY7eevANA42pgHC
         0a7Mv7cl1/aCtPPGEBU9giLn0RVsCfVZ1dpSG5gvYeUdgyPaB28BPfpAPS4OazdQWwm7
         5rA6+H1Z7f64ChPCeyh8kukm1pLLNPsEgAUmXih4fO8ZdwDauOlrrQMxeOzP8At/h+Ro
         udqXu1F9NVX8rcZVK9h9JVmxdOnctxZb8euKbCoXvmAuaHCpwYZZgC2lG5ITUfA16XSw
         GTqQ==
X-Gm-Message-State: AOJu0Yxsq/tUQBTMLIioGtKYrLSyaYCfCbtcCbUe742ezsWmMXpXxeIy
	maJjjFfYktv/xzTlGOo+W2c3MEil8cW7zju8jbdWe10PEBaSOMgBIEGvfUkRfoyD9xMY5UgtfMY
	sXIfjapQB
X-Gm-Gg: AR+sD12V3DJ3rafvNv6kXxbgjKu6P/rKWnRloNOlBll5qOq2LHvFGzU+L+fVC6lH8Ze
	XuzW4DkqfWbjnEhfzxHGY5hfBHaFw+hidOFUuaSbcGtC2bHsegPqJXwopne5FjVXR3jaRVejCbi
	QCIX7t4VFxDs9HBc6AzhENSTB7fWCNWqpk69IbZsUtlvnF8TqHOWB/BceYrzWXLg3thKb0hUNwr
	ldKHfbdvhvHa8OqIwH1PNgCoZ1mk4E98iTbeLKvmu4M7mA255R8LQ23UM8+DlfHXjmC4cC3+1d/
	51sNnKyvSaw0FqEV/BWtE20u2ytZ3j5e7PA6seoEGsxSI18Yrjvmj4JMO4eLt6280yoVNRFUY7N
	i9Vn3ursMfcsR59P0zdepsFPAPyoYWYmZOP5jZN0iEFUuGT8Jt4+IZ6ETbiYlloIt8t5Kyt8AvW
	UB2X+2vgjziedu5P1UrHsLyJoQsWcIyLItnhZQl9cd7lAD90wTg3esllIYEOZixufrpBrFC/Ar6
	NndhbSUu3cPpS13Aip8e/fAMqUK91I8W/scOzULrAARqsymKaWIbNoS6YQKnMvG5ckee7o9IQ==
X-Received: by 2002:a05:6a00:17aa:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84ebc24fb10mr3814649b3a.18.1785441770153;
        Thu, 30 Jul 2026 13:02:50 -0700 (PDT)
Received: from yct-bluefin.taild15c8.ts.net ([2a02:6ea0:d802:6232::40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84eade11c0fsm2785105b3a.20.2026.07.30.13.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 13:02:49 -0700 (PDT)
From: Michael Halstead <halstead@happypunch.com>
X-Google-Original-From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	richard.purdie@linuxfoundation.org
Subject: [OE-Core][PATCH] yocto-uninative: Update to 5.2 for glibc 2.44
Date: Thu, 30 Jul 2026 13:01:56 -0700
Message-ID: <20260730200155.142954-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 20:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242377

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index d97c96f631..d3beb08195 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.43"
-UNINATIVE_VERSION = "5.1"
+UNINATIVE_MAXGLIBCVERSION = "2.44"
+UNINATIVE_VERSION = "5.2"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
-UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
-UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"
+UNINATIVE_CHECKSUM[aarch64] ?= "8cf46c7ba75ebb1863fd6b74cf7d7ab910a3e99de4f01b1e9490babf8e6b9e05"
+UNINATIVE_CHECKSUM[x86_64] ?= "1a2749c1379fd9f60ea3c82f1bf4844924d5a99117b74a70c57036e94e2379d4"
-- 
2.55.0


