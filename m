Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EB5E7109A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15999.1695367485136768109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvuyCHpW;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-986d8332f50so230694266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367483; x=1695972283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s/rQGIBk7ynJtKPuKwF9GIhpefSSeXicm8MsU7xNRI=;
        b=XvuyCHpW9TiW31c27NktVnEWvQ46FiLchbLBfJbbvOI1E8d8PuHlrA7Ky2hVIL3Zxi
         2zGOxbjLCwujJhVoxygWodNQMeCNEXZyc47vwsD/kRAeMtIA5sjW5uHofd+BGb5I+vtq
         4pY/6nQKdGaOp42I8s8e77N40LbHhK+cpYS3jL2F0EEzFhNxQI+k2Da94mfEh8vxlQf1
         R6biU8fxhIlrXN8SrFLenjeGBe/PE5xnvWDcleG7MmgDt3ovRfBS0TBQ1NNfjTt1zCG2
         QlfStLplkeMKbltAFOCyCCcDPDgqFOAQZsXKJVkTeozmaneZvhB9epiTQ3eGFhyzPa/+
         dghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367483; x=1695972283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6s/rQGIBk7ynJtKPuKwF9GIhpefSSeXicm8MsU7xNRI=;
        b=JMDJmaqphLMFUHGcCJh99JFxx9OsdCx43Hbu3eMdGsP5Nv2CLvGmZsYRtebs7jgCp9
         k37Ft8XrI9gxCxdJhUWRVsp1GBIShxFkaNvQgVh72+G7dAjJbSVzWMlLxRlpwAx7Ii8i
         yEbLaSIhZy1CRJhSF+JoNQ7jIemYJpC5N335TidD0zkMqyTZ5BwygzKqCIr4E0EcdfAB
         eOKdhqjJJVay3YMUs3MzCUy/Orhq8zXmYSKnnUuNPEn+HB/53clC77dneRHmvvCqkaN1
         2m42CRXwEDAJ/KAAVAwXwUAzAGtDktDPrRxhMHDeEfrw+TIJpSiFlxL3cjUAhTa58zC6
         OFiQ==
X-Gm-Message-State: AOJu0Yyx5NrZrUxWGN0rVX2PGapXYJ73RHkSZK5TGaEdQ0TU3O9SYkQg
	AM13pdloWh7fiRVbo4X/2npA6t2GEO4=
X-Google-Smtp-Source: AGHT+IE+xzJ1Q5ImTCYIoHWhMUP+ETICKRL/ILBj8B4qAIL8q03GHvMFpS4AnEsDZu4NDhPom6zthA==
X-Received: by 2002:a17:906:310f:b0:9ad:c89b:482d with SMTP id 15-20020a170906310f00b009adc89b482dmr6616584ejx.33.1695367483476;
        Fri, 22 Sep 2023 00:24:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/40] ethtool: upgrade 6.3 -> 6.5
Date: Fri, 22 Sep 2023 09:24:05 +0200
Message-Id: <20230922072431.1481743-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188057

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch            | 8 ++++----
 .../ethtool/{ethtool_6.3.bb => ethtool_6.5.bb}            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.3.bb => ethtool_6.5.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 5e9024834cf..409c8de6858 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 08f887f4bc65684397bf8ec30cc61d91d894deac Mon Sep 17 00:00:00 2001
+From 0c77437267601d40d7ce9efd87eb4b82a5675d2f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,12 +15,12 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c1e0012..c460398 100644
+index 11efb99..b5ce018 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.3, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.5, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
+ AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
 +AM_INIT_AUTOMAKE([gnu subdir-objects serial-tests])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.3.bb b/meta/recipes-extended/ethtool/ethtool_6.5.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.3.bb
rename to meta/recipes-extended/ethtool/ethtool_6.5.bb
index 504e6459664..ef925e16b9c 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.3.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "342d37d3fe19da79d0276c4c69c34c61f1ad8f87b06514d664bf1eeb29bfd525"
+SRC_URI[sha256sum] = "aed41ca58b3129126f18429172064d214191d7e7ef52c6e3f6b2ff7503706c03"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.30.2


