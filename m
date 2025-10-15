Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023A9CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 14:52:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.19120.1760539916886558694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 07:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LMT6J//H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46b303f7469so46365125e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760539915; x=1761144715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lOSOh2g46bbhVXhuI36v1+S3lPnNA8LkG/5buAln8ew=;
        b=LMT6J//HRE3i1BwI4RCGT3DWKltwmIBF/MFStaN2wvevNkX9bFc3v/9h0KVGL8aaBD
         1cw26njFvV4g4llhRClJJDB+Pi986VBMohn8RIZV3MKFKT0O4YKEqxpJqDwqfvuCxKoC
         d6OfWYTkqZADWsnH/DnyIEjYTtTBLxXD5j7A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539915; x=1761144715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOSOh2g46bbhVXhuI36v1+S3lPnNA8LkG/5buAln8ew=;
        b=QFrt56LSl0aW3au6p8AX9/pP5C6ac9TXSrfcR7U2IPandRwUpPNFETmynix+ZObZn6
         i+V6VE98nzeg1xUEjsSh11ueJSX0Y0BDMZ05fM1U3/2fMG3LpoTZ5Yc/iO0c1WSGMkUR
         aZykOdXgBYS8L8UXUY7ktEJQosjotFh0oc5NPdVL73NvuEQDssQy9xgRl/1e10Dkgwws
         ecrVcathdMlbcg0PXnAQfN37LgLoSMf1Jl1yLCsYOCEZOw6iPv+OJn5LgDlNYdpDRXRJ
         6fBSNs6o+FHCgbE81ZCG6lXLPWU2zKc4uPMid3DbTL+HKSlwUWpSQFzf+3cdEIJovWZJ
         vqvg==
X-Gm-Message-State: AOJu0YzzLTpIcMajmlu6r08SkCHDVsD4uIaPBGC54M4m6vYsDixma8rR
	v/AsugBd4Go3Oy8q0wSxCFTI6NLtYytF6VG3oih+/ohiFxhKcKVqZdf5Ge4gk+2r1kXJIoyIhtl
	2y6G6
X-Gm-Gg: ASbGncvV7VN6Nqi3HoJz2m5SF+LZUizVOcEOaetVJB61hCmBSokWGstT2+AXgplAHLf
	rwuAkNNWmYUsqR7FULupu3Qvdv2FUPCeZoulNrA4xvRtWKmBlySgT1Wtb+RIeA5kjCz9XIEMHj8
	KTlwzWd1InLZa3B1Ov497TJAQskbb51sM5VXBQs/IOoqCyQ7t44bWeUqVKrddYx4ATT+ScY4P8I
	hlnVg3jA9I7N/TZ0TV9puLTxT+FJgb8TNwFli7nVgI4tDuF36LK7f1dgQp7yHOLa6stYYpuuQBA
	/gLve0AU61Nvv3AkMc4ksHr/jt82IvEIPE8e7RMgzYfaBFQWOEvbWWZUZj/tfDwMUPdO270scWn
	2mLNzTe6gphJA36NDbHYbL9j9+AC7rPbNrGYr2Y3+peiGoFpPxwNhGPVyTW+R0MMzlZ7PHOzL88
	q1oe8=
X-Google-Smtp-Source: AGHT+IE7uQynXg2kLGrvRw5e/ZinpmbyrEXpBbqkuJ5bEoTxl2Eq3OfQyN59uN20UZiYuvaBjvkSXA==
X-Received: by 2002:a05:600c:1389:b0:46e:41b0:f0cb with SMTP id 5b1f17b1804b1-46fa9affe50mr194128605e9.25.1760539914631;
        Wed, 15 Oct 2025 07:51:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce79:b94c:542e:d1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb55ac08dsm295681825e9.13.2025.10.15.07.51.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:51:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distro/defaultsetup: Add buildstats by default
Date: Wed, 15 Oct 2025 15:51:51 +0100
Message-ID: <20251015145151.801657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 14:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224895

This has been the default in poky's local.conf.sample since forever. It was missing
during the migrtion to bitbake-setup and that created a few failures. We've fixes most
of the places but found a new one in the performance tests.

Having these available is useful for debugging and doesn't really add much overhead
to the build.

We could push this over into the poky DISTRO however I've been wanting to
try and reconcile things where possible so putting this into defaultsetup feels
like the right choice to me. Distros can still override as they would the other
classes in INHERIT_DISTRO.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 80de23f517a..c087943698c 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -10,7 +10,7 @@ require conf/distro/include/uninative-flags.inc
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
+INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx buildstats"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
 INIT_MANAGER ??= "none"

