Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9F8C27C41
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.1225.1716311091765636585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=N4sAiUh0;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-794977cbcc3so11228185a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311090; x=1716915890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXYiCUgdKrBcRj+A8eNMnxZZfYGxWLNqYwRW5ihjEvY=;
        b=N4sAiUh0S4Toy1Hk+HT8Elx6M0wpAsVIeSc5NFAOGfd8erFbxUE/ahAtPu2sbnf5s1
         tEHYGPOmhfQw1iQ2F9cJtQhk1z9cQVpFEEFbggIS6r2ae3VhvruloNSScrC0532NXfgI
         JD8uhzQgUv+5iyS3MTxf+g4a2HmUUPKTqzpYdWGaQAASEULcWhnvoBCVzEwPP08mmrj5
         dHehBCnmacurLBFjBy4sYjo2RkDwvS8ZO0WiH+KSxkPKEce3nTpevIamuAfaH4vzNEe8
         pnN98jpj9yl4AtV7H5fLqL5iFmNX3w3jvFtAJPQ0nsYCa+6qJAO/dkwDag8iDQm25FWe
         iyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311090; x=1716915890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXYiCUgdKrBcRj+A8eNMnxZZfYGxWLNqYwRW5ihjEvY=;
        b=ZsFAVDKSopi9m9kHbAG0K2Io0TqHF7wA0zGiEorfoMvxrVdl3arK3GwTMO306HlvAQ
         elEc5lDfYW9SUbmWvNA7EkS6Rr9vxe8i1FL2Nezd1Vc7dEX1mu7eTO/T1EnVcx1PFcg5
         CoXkLcReT/UE1xwx1Ffo6Py4XDQPPm8xbcoX5tFYm+DK4VfuHFsrOfq9KtgvNhtB9QmD
         r2jenrzHEqYiZOLJU0DHkanRC5d30KnFknOtr5E48r7AgE46WMM+1cqtS5IcQNped7q5
         B4QPK9oE0i1QA+YbX3765HUHX+9o6AAiytfu6aO0JMxNlHil8muIi908V/tOU9i4yNLx
         3Nhg==
X-Gm-Message-State: AOJu0YwBCn+oJNkYJo2Bb7C5X97h/QNKR3zplaRzFIQwoYdfb5In8Ew9
	w4eMSSyXV5yG/dOLKlrHiTDToLxIDBm1nmKH8ykTcrjkYvfP0NTJU7OoHvJymKyD+TJCZEQdFee
	R
X-Google-Smtp-Source: AGHT+IFQg9tMAOCO0vApCsiFkKqkvyDBkHTYpw4f3LJcHADX6zy3b2U+kjgQMatDDC7U79WkRzev4g==
X-Received: by 2002:a05:620a:815:b0:790:bddd:dd6d with SMTP id af79cd13be357-792c7576934mr3306976085a.14.1716311090379;
        Tue, 21 May 2024 10:04:50 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 05/10] python3-requests: upgrade 2.31.0 -> 2.32.1
Date: Tue, 21 May 2024 13:04:40 -0400
Message-ID: <20240521170445.1892398-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199661

Also transition to using python_setuptools_build_meta.

Changelog: https://requests.readthedocs.io/en/latest/community/updates/#release-history

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-requests_2.31.0.bb => python3-requests_2.32.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-requests_2.31.0.bb => python3-requests_2.32.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.31.0.bb b/meta/recipes-devtools/python/python3-requests_2.32.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-requests_2.31.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.1.bb
index df48cd54c3d..e0295313ee6 100644
--- a/meta/recipes-devtools/python/python3-requests_2.31.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
+SRC_URI[sha256sum] = "eb97e87e64c79e64e5b8ac75cee9dd1f97f49e289b083ee6be96268930725685"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-email \
-- 
2.45.1


