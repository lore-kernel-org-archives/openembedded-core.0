Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DABC54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:48:59 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.8551.1710366538915977498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LNR7Yj/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso348576b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366538; x=1710971338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTlZdo2HB/rHSd3Ebsb4amwtkRBmvSqGh1nnjnraosQ=;
        b=LNR7Yj/yciXbiEGPo/Q4C0IFY15zXrQpov+fADKCvj/TFm/ZSgsAHsN+klYB91khb6
         43sRcFTMhJN6fdGPRR6z0PHiGRJ6OB62xMY75o42idMvHLHN/PIToWYQFlwldm40hLms
         lnLrNtIoqq1PHXY8KN1UbFF9gNYtkUyVeMdzB+Ullknwptc+ElCyXhpJL0gvk2c2VhdU
         RmoD9594RlAXEQ8bsvDgOZwpLgskoTTKf4iy9aB6ZS7AQLLRnGtoYzkFJJPMcTTR8Fih
         TKeHbwalIsgEQFj9l1ljVgCtYI/SovabKlthgFohSBWjx3vW/q1hU8V2tZkyrIks1mmP
         JkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366538; x=1710971338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTlZdo2HB/rHSd3Ebsb4amwtkRBmvSqGh1nnjnraosQ=;
        b=mCJ4paRathIG5qZr1UGkqCP97kkyfJ7JHe5wllActGI4hn2d+q9+4PdsjDFAwGDB2P
         Y76cUWv72c3+Vzqa2BwKKuOsBTYb3qizJR579ZFQCl2+ThiYvlJagMnwB/uJKRF8W+/4
         1v4rsuiYfEYYhgKnnSod2E1m2UKS7OR3w5xJg2xnfIQ7TfOYDsIItX79FQmXjaepFm3C
         TWc68EO6FIkf40Zjg0ypdLakXxqhuPzJ8YxMVsyC0RygcTovtOrLEQUtdx+girjRblWL
         nhVbiDy/n1wSkH1hpQDIMXR7g0Ga/RlHqw1EJnj9kd58all7kn/r4WseOrWGmxeQEpP0
         8bjA==
X-Gm-Message-State: AOJu0YzDP3FDURJESb6u/EoNDVzxbtC2bZWoYc7IS9ycgvThOPG7CAe4
	EzRDPR6gnPgsLZxWCoov4A8aEtlMAoGdzFK9Xps8R7yVqaHbudXhphSgJcGKxTBRxDt5vcX5Sc6
	deQc=
X-Google-Smtp-Source: AGHT+IGrzuHbrjXRvj/+mLaKo4edgdxyWiqG7CJFrPVKjhHEEPuPuyhgYVKBZ9JgaTRzG0IVC9/yTg==
X-Received: by 2002:a05:6a00:23d6:b0:6e6:ab7a:7753 with SMTP id g22-20020a056a0023d600b006e6ab7a7753mr4824601pfc.21.1710366538200;
        Wed, 13 Mar 2024 14:48:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.48.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:48:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 4/7] bind: upgrade 9.18.20 -> 9.18.21
Date: Wed, 13 Mar 2024 11:48:42 -1000
Message-Id: <6977b7ac4202a1dd4264a6b4e4e6fd5c3dc07d37.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197088

From: Wang Mingyu <wangmy@fujitsu.com>

bind-ensure-searching-for-json-headers-searches-sysr.patch
refreshed for 9.18.21

Changelog:
==========
-Improve LRU cleaning behaviour.
-The "resolver-nonbackoff-tries" and "resolver-retry-interval" options are
 deprecated; a warning will be logged if they are used.
-BIND might sometimes crash after startup or re-configuration when one 'tls'
 entry is used multiple times to connect to remote servers due to initialisation
 attempts from contexts of multiple threads. That has been fixed.
-Dig +yaml will now report "no servers could be reached" also for UDP setup
 failure when no other servers or tries are left.
-Recognize escapes when reading the public key from file.
-Dig +yaml will now report "no servers could be reached" on TCP connection
 failure as well as for UDP timeouts.
-Deprecate AES-based DNS cookies.

(cherry-pick from Oe-core rev b750d54622a0fa0a35d83ddc59f07661e903360b)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 .../bind/{bind_9.18.20.bb => bind_9.18.21.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.20.bb => bind_9.18.21.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index f1abd179e8..38d07cae39 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 246087f89e9434b726c7884e4c0964f71084f091 Mon Sep 17 00:00:00 2001
+From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -33,10 +33,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 10e8bf6..bf20690 100644
+index 2ab8ddd..92fe983 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -814,7 +814,7 @@ AS_CASE([$with_lmdb],
+@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind_9.18.20.bb b/meta/recipes-connectivity/bind/bind_9.18.21.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.20.bb
rename to meta/recipes-connectivity/bind/bind_9.18.21.bb
index 187685eef5..f5fb4bd1e5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "4b891ebf58d3f2a7ac3dd2682990f528a3448eaa1c992ddc5c141b8587a98ec5"
+SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


