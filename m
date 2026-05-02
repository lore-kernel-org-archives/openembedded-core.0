Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D898CD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9387.1777739433222483053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MlEzqysO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a5174670eso855701f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739431; x=1778344231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8LGNdJolaPsb/hQiKdiRK64OenLW+HnsP1UH2l0Fwo=;
        b=MlEzqysOKeZD86R4xT1ofywNRD0xvNwG0SvXsojYldMiJHCtNrxy5YlSLOxgNePHNN
         Kt5BKZGHDmDH0c0Qn8cY3A1Nq3MESX2BUq2tPYgXvy6ZQKmdEQgbs0xTlGMG+HhfR4bi
         0mMWEAj7aN3xucDhwM6RzizboHho/rBn07jRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739431; x=1778344231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8LGNdJolaPsb/hQiKdiRK64OenLW+HnsP1UH2l0Fwo=;
        b=E4xevVzTRUY/TJvErfNAajEWDgEz1K+ajYQc8tDf0Oyqmp+tbljb0OOpoKFtSZ1HGa
         vp7IVMRCxlA8KmcAAoYhQLJr+Xx8d2Xnz/Q0nXcvYMluy5wV8f9ePbPeoYUlhV31tFPq
         5zzcerMcEf02bpCgByf1QBH8se3l47k7XjJv86r250YXq9CbbGmXG0cEFLEbOvfg9Apt
         6Jf4gqep975aENvkzA+8wvk/QtqrgQ72FUK+eoINjv70YyOZ6fdD2LcgJt1hSvKL1ncC
         zfOV/dlFQdaMnROwE7j674rqJ3jVxWtjXwy7ykjZFBDv9B9yp46rWQ8otypz5mcANgKk
         igLw==
X-Gm-Message-State: AOJu0Yx8btQPwZVsohE+lbJVCs3pHhLdb3qDSrgVUHjbRZQwRyts8gGM
	DW9WKhnlucb7/YxG9pvHoNEwVCkiFM0YvDIR7favR+If/yyw/z8MwylmBFUgPrZoloZazXFCrBc
	zCON9tLBwr1vA//0qtCvjUtJzFD761cNOp5OBB3I3RA3K2AmQi96cSLe4DgccTp7DRUf/eQgSYA
	8yqaBuxOg9pSZ8G7Q=
X-Gm-Gg: AeBDievSEtt8OWlUvnTv/DDUtyBcaAqBZuufTFx4yNi6AdZ0QznHWwfQaTiCrlrzpfn
	Y2H8xxCjXd5cw8Sz6lIGr4WeV4hVMXgJhk4XKk01wbgom91PhPg8U3oCZFeZJvkoEg+GRo+bZ4b
	U/u33ddlaOLfANoTUNd/KzSQDHBDos4y11wv/Uj+ewINWWJd85zV5OhDD8cR7f4WdODGMPtAt2E
	9HTcjmuxXWnA2/JDAUdZGBvN7ChRlxhAJgSHREFOL6HGUQ1570dxNz33TD1j3avVi8jiwLcvBfV
	WkxbubarvseChiimN3ddw2om0QxcJkHG94F/CO3WC0D6J4wQGQI8i6zzoPrPVv8QgzrKDflYigS
	89/tmrbKgeOZbubKt/8p+wso1DUGWoUxbAJTIKZ7bUEPD+DIp0GRxeTPFh56rIlLp/4sHLSCaeo
	CEEF7hCmF0RMJScIhi8o2V3/InXkTfl8SD2NQhgkUi/QWeqmIhf6RPmTWQnxJyJG4=
X-Received: by 2002:a5d:584e:0:b0:43d:7946:badc with SMTP id ffacd0b85a97d-44bb558c966mr5855643f8f.26.1777739431051;
        Sat, 02 May 2026 09:30:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/62] python3-attrs: upgrade 25.4.0 -> 26.1.0
Date: Sat,  2 May 2026 17:28:51 +0100
Message-ID: <20260502162929.1377831-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236340

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-attrs_25.4.0.bb => python3-attrs_26.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_25.4.0.bb => python3-attrs_26.1.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-attrs_25.4.0.bb
rename to meta/recipes-devtools/python/python3-attrs_26.1.0.bb
index 7bc581b8759..03621e41a6f 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
+SRC_URI[sha256sum] = "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
 
 inherit pypi ptest-python-pytest python_hatchling
 

