Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ADCCCA476
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.231.1759261824644393224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q+MRTCGM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so2790249b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261824; x=1759866624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6F038zZhDvxl7CKkidWtUnU+G74vVsYh8wvKquPZgBw=;
        b=q+MRTCGM7Kq13sbLnp2kcjAFeEu7U9+3nCY2rKQBCaNzUlHtASPVm0LMLD5Cgsxo6n
         ZSEvLt68SHjZ2NA2CGPaPY4IaSCSlDqY3MDNkW3y2zIF/K/Ohm1KpqaJq2NVQLT1tZSf
         3zvqzw94lv5UU7Ck4Q042LknT0u1byOovONfAn8uIlnorxEylxhcqeynQ828Ng/ZSCr8
         HYLN6jagAiMRoYfuVeq9vKwM97I7uoUgKQHcj0ctJh5RD7UgGRrMSmXSPHXCfJZHVCly
         tpX3rTn+LsI70eV33kN+iF22DaYsI30qXegYCsFn7noVXEJDroNYvB2AoTNTlAWqBbov
         kG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261824; x=1759866624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6F038zZhDvxl7CKkidWtUnU+G74vVsYh8wvKquPZgBw=;
        b=CO6aJR+M6BylOtZ857YzQYZbv4VObclHC58ob77hYLTt3rknP7Y7zZc90P2NOXup6n
         ydAgyrbxt2mGjNWiN43L4Vbbk9kqRONAaW2h78WeYvfcv+wGn8RekyvSc3UG81ajNNuI
         379cn622oMiWUnERG+c7kKL1HVaxxJqQnlxA95q7zXgzOOUT4+KGrZRY8/tOMZ+wva5x
         Lx+DTs9S1DpxdLItnCL3s1uJZlS2+sHzhj92YSYIu8ROYfssl3jy/kqEnSat7LcO5DNf
         TIly9ySyHJRQByqfePkSrEf9NShxTB9zLgYF0n9W78mVtInshriAagqKrPJZZb7WI3pl
         Epzg==
X-Gm-Message-State: AOJu0YwCrXCjJG+7nhC4lFiTclz2ArrFcFAvVQEPKMVEpLGf/KNhVokz
	JC7QVonrf6g1TrnEOIUSUDuGSAKe3pe4kKaXo7rw4qmgbhKPBHlVMnVnoPdupdjE+HlbZD2ikKa
	cQFlI
X-Gm-Gg: ASbGnctBpVWNnu3eM67wriETaJQh0PCYCzGSiGEWvvPacxmrDuxDPm7SbN4laWv47pT
	okhHPtmFmjG8kMqnwcw9tSBfNldD8FLWCKgAKkYFGO9eA+alWJzsPl7TU7Mogb+MDVl9Pf7ROBj
	kyRhg5qOKwmUNnXcBMNSO7l1u+ulzRWtjYKpKpJ6V+SsC0Uj4/lHlJDNBWwqBp08UZkK1OsUBOo
	k9LsdLg4CxHZ6D7cEhi5V3GEeSWW1RBrJ6jfgMGBwmJ6ev4Fvhqlyqd+q4+EGd0aAGvkHsPKulB
	likyUOau5RG+xUGbFdyQXxQIdcwYvXhqcCMRWRks+xHxMYd3JtZ8tOJtzOuW4QsOx0+R60GCTXf
	UyuU5QRsF8OGf1T7RkK3SSAduVo1YnXU2k+jFRg==
X-Google-Smtp-Source: AGHT+IGnL1VlFmy9CNCbNlkCRUY7Ix8FQTvXugrMrNbeqnb8/PDz7bZKzylNx6pdICSyrzDr6kfHeQ==
X-Received: by 2002:a05:6a00:1146:b0:783:c33f:fe7f with SMTP id d2e1a72fcca58-78af3ec2a39mr775693b3a.0.1759261823821;
        Tue, 30 Sep 2025 12:50:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] vim: upgrade 9.1.1652 -> 9.1.1683
Date: Tue, 30 Sep 2025 12:50:07 -0700
Message-ID: <24b7e7f719ca600a88aa893b87f6ea821caeadce.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224198

From: Divya Chellam <divya.chellam@windriver.com>

Handles CVE-2025-9389

Changes between 9.1.1652 -> 9.1.1683
====================================
https://github.com/vim/vim/compare/v9.1.1652...v9.1.1683

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 2a9fda5376..289f31be70 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1652"
-SRCREV = "3e152c76adb9542af86760786d42a0beffe5354b"
+PV .= ".1683"
+SRCREV = "b922b30cfe4c044c83bac3cc908084ed20a83598"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


