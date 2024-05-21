Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7A3C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.1247.1716311089437536972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cQi3Tvib;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-792ce7a1febso156926285a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311088; x=1716915888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bFY+SOatxVPyN8nk0AYOUOR0Rx+nTEFcJwOk462K5s=;
        b=cQi3TvibMb+F76cINcQwxfUvFzTB62Axy6KI7c5sH7k5SiwuNaxb/nXz5+IqFlbRP/
         LQrhlBZMJlpXuIaAs2nkQC0Hj+dLipKf5Um/u+O3Z9ZQqsqgshMT/VcR8/EiJmScIUnm
         qRNLPzTVMc6/CY9KfRupCh10fOvbUnzWbGxNR1Ybq9hHzeAc1Gwbiieo8IYnYyQ25o9j
         uK4a8+bRsZlY33gerL07tgjkNS1BHOE+fN+Swv4HsTVPgPNjXoahaDRuBb07RS5neFbe
         +n1lez5HjQPEAsX4gROZEJJW9Az4amj+GtbagkCvSgxEbWFbxBpZ8OQb1fpdvYRcIa8F
         3MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311088; x=1716915888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bFY+SOatxVPyN8nk0AYOUOR0Rx+nTEFcJwOk462K5s=;
        b=CimCTCvD90LFFCacjN10BKPd22DTjaTr+RoA7p/K3q2CdPRbGo/7xA/XvnUOi5LmAv
         nQlTVe3OLEo19qHL0Xh8jsZ/RTOmH/F/tPMnaLRutbCfmMixLJB9FSh7NmuQSQI4DfZr
         eR0hI1nZL1QZA1dWnpasDEJyPpD1cvv6DcjDt3tAbBgv3pQuW3zKTDdDAJXBpWzYa3Zn
         Y+g3S6LVtvY1ZV1lXc2A/qF45x+yojdRjOhFH3gYSrUwAHlSCvMbu3cjcFSnAcheeo50
         8oUZ7ZtiYYU9HCkfBJ1FqbTG5vWexKpYmpjqLFPCuUNvWgKw0z+ZFaH7EeMGZrlW5Uqn
         J8hA==
X-Gm-Message-State: AOJu0Ywy0kw9F5JxPxPJDEqoXBi63I1m9McvX8b2RpLkzCUrI9XrYnpf
	zj4KVqP9FLKTdbooWdk7xIh7AlQBF5d2q84AGzRCV3zj3toyuYMAT0B1r28x1nnosuTLDDLfxI1
	2
X-Google-Smtp-Source: AGHT+IEtjmc9Xei9riby1Hzdpdqxg9kOsfG3tZBnE2EeSz1CavRzi2d++hf+12c7XiTviZPq2KjtkA==
X-Received: by 2002:a05:620a:5a6f:b0:790:ac9e:ccfc with SMTP id af79cd13be357-792c75ffe33mr3379848585a.49.1716311088151;
        Tue, 21 May 2024 10:04:48 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 02/10] python3-pygments: upgrade 2.17.2 -> 2.18.0
Date: Tue, 21 May 2024 13:04:37 -0400
Message-ID: <20240521170445.1892398-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199658

2.18.0 offers new/updated lexers and various other improvements.
Changelog:

https://pygments.org/docs/changelog/

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pygments_2.17.2.bb => python3-pygments_2.18.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.17.2.bb => python3-pygments_2.18.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.17.2.bb b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pygments_2.17.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.18.0.bb
index 8b98064b784..fd373656810 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.17.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367"
+SRC_URI[sha256sum] = "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
 
 UPSTREAM_CHECK_PYPI_PACKAGE = "Pygments"
 inherit pypi
-- 
2.45.1


