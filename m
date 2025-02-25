Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A114C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:42 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9046.1740493839979437428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2KjfjOBp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220bfdfb3f4so13956245ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493839; x=1741098639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef6vvRjMWdqPIXNP9V4+maCc2GWlsx2j49kJGJFbL7w=;
        b=2KjfjOBpHcjXrOB0uIIrUGLYzJZHNd6lfj/mT08X3zSWGNkEHlTiXiairvn5jq34QY
         VIgnk/56AEqCdTI16zXwczflu3kqBZLcGkbcvDOGIo+d5/Fiv1vvqLb574xxlvHsSw1h
         ARoNVAFjgaDfMYKuRnNuRA38pZAoOkcD1dKncnDbnArthQqoK7DLaE9pQpsyzKPFV++B
         0iyKu9FJlpB2f0BSCKP4hDL3HPagCoICHqwKQvcBTopSK1U+kREAn8ShxdVP3clJoilQ
         Tn9Z8TBohxdfLRxSBID8/5q+wH3qqGBf+CrX8R1etvEyTDOULaGTAGhtp3zQXVRzfzA0
         xg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493839; x=1741098639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef6vvRjMWdqPIXNP9V4+maCc2GWlsx2j49kJGJFbL7w=;
        b=K0dpYX6cdQGi07nBQ8nI7XGpbnPaEdYd0ILD+ytoCAs6Otse48sKwmMi5a4ijmfCCA
         ehMg9jrbeYs8jVyxQ0NoqmyRTMnxuOBqE5F1z9hRfgedqPhRbeoZZ9z6qN2sms/f6vrV
         0iMR/Bx32d5mpIUrw1LIDDyGeOpPqW6e6rMmSFpBgBnvCQXFMH3QkgheE7DGY6Fp2Q0d
         juNizNgB+pSGkuW2xoFkBbsPqVzCto4idBu7m2BEz2FE8xIhIDH3hgdwEgBtJFbzqVwG
         x8uKbO0JrGo7aL0O5kuLFqMbckuu4cJjaHNwmLnJDAfFNVaWjImP/yZ3x3xpDS+a0AWx
         QpHg==
X-Gm-Message-State: AOJu0YwVIWgrfhovTQ34N/RFn8u6HiVzKLkvU8ZoakR8KXbkNNmb/wvi
	ZDlv3U4XJ7HSF3svs4DeRrwhGXeTG3V7VIOCnRW5X/9rrqynDUMWYxX0m95P2QgzyrhL/CYUyoa
	f
X-Gm-Gg: ASbGnct0KuvUB4w7btOHdaqzwXJvRIz8U+BbRkWBHBl1hJNsEPgJlp6TbE2uFvFgdzM
	VxbWSBLAFRoP4l7bwSVmR4N9wPqLVJYSkI59fHa+gZfEzXf1WrJSAp9qnIJKUaL2lZHqSd0VeLQ
	kmGHMFX3QCKkCsVEQtQT/EGG8ts0xKxbzb5VW1xoe7EoS29wcVYyQzeGHlX91RCYM5zqLDUq1jU
	daKAd1Ql/vRIHA2kCUEfqbPoaTsdbspXy91FZZKWfDmRKEF1kk1Feb3yESojQRELYNx6uCVrCUW
	DdeMt5um9mUTb97ABA==
X-Google-Smtp-Source: AGHT+IGmOmH5oBG6jcTH8NJeqZYLjIj/tpRQBMqx4eo/Hn3FIo274zp3Vml/AvsIebbkPhD9UNJhAQ==
X-Received: by 2002:a17:902:da88:b0:21f:164d:93fe with SMTP id d9443c01a7336-221a000aa36mr312506985ad.53.1740493839267;
        Tue, 25 Feb 2025 06:30:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/22] vim: Upgrade 9.1.0764 -> 9.1.1043
Date: Tue, 25 Feb 2025 06:29:57 -0800
Message-ID: <73b5570a16708d1e749b1ec525299d10557cbf56.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211907

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-22134 and CVE-2025-24014

Changes between 9.1.0764 -> 9.1.1043
====================================
https://github.com/vim/vim/compare/v9.1.0764...v9.1.1043

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 582eddcb9d..4ac9c58c80 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0764"
-SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
+PV .= ".1043"
+SRCREV = "9d1bed5eccdbb46a26b8a484f5e9163c40e63919"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


