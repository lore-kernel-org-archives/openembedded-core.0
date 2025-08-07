Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E96C87FDA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:45:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3723.1754592299531838849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q2pyjl2s;
 spf=pass (domain: konsulko.com, ip: 209.85.210.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bd202ef81so1903332b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754592298; x=1755197098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoPXyIuH1S9OoC2z8hEdlt8v1hMoGAgQnA7qDXcRDok=;
        b=q2pyjl2sVDgm/zaiYdhORZysbLyKldylV4FF6QZhn4EhHEdZhsM+PbLzf7FXA+4qob
         eg3hvw8SLHEJ+xyK/gKyltfB88jymR5BAIT7kvr63FkF/c65Y1HIGcX+6ca41zI8ynvY
         eCahhYSANgYx6soKn6kUpTZMRXic/ndwnUmCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754592298; x=1755197098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoPXyIuH1S9OoC2z8hEdlt8v1hMoGAgQnA7qDXcRDok=;
        b=VcAlBJpjCSm4dKItmnLDp41sPQ2/ZtNpx4mxQN2q02XpVP8KwIdyOPoQoS+s2pYd//
         o7TBDInzt14V0VftNi6X7lwIu/M6UQ6aUdseHBlvhHY3WXhUa+QML9Xx45QBrAxioff/
         YiKDh62BgvfUyKSHaQBZU4dSsagdiI40mdmpJtM2WPwesnN8JqSYFDmzgcrPJPH6Z+Nv
         Ps7Lpgerhl8Wgky8dfoHgki3JrNHnLDilXzj6gfW6lNqPJs1CcywaW3LBollrIrTo/ff
         T3Z9MOgWDJygvgNbICo7VlyzkJ2tpus8DN2z0y9iqJv9xfnC/+klaE9/U1AUqGlzxV4N
         Qs8w==
X-Gm-Message-State: AOJu0Yx21CIQBr5efHfQ3wUA0fnx8kQynZS0mdFZX29iwNGvquiSmfqs
	iiZA8aI+EoJWqxNknOBpKmP4FlkgmrANIz12EPjjV82QgTJRMW/stsRZKF9ooYZ62pkjoArUbAh
	FiPYM/xU=
X-Gm-Gg: ASbGnctVg/5pgT8MzWGLB5okuEVj6Tj116d99KqG2jYuQ1SQ2MbKhzmJYoxoc/k6h1a
	/3FjEXo4Hk5BOCfGCDvHpKT1SV3rGKuFDfWIC+2dSpAnlqOTayUvSGR1l0WKcklEOCcZXY0F5F2
	ojfpJ9X4jL7POgXSefs7k8LuyxHvdeLC3LF1JpWK6W0lSL5lMTcS4EpEuifnq7UubV5HpZm2PCV
	3hXclPANzQFA7zcEVwmfLGw1ozE+oF4xv/YowV4fNqFLxvqq9kIAa08nwfgD+jETgirUfkSQVsg
	zkliQDxotXH80d036pQqVE8u+0Ns+Pn40uDLsoNRO2Ns2xb6waoBqmRO6YZb44K3BgugA5wXpG6
	RwEaCtKnqgrg201bNaHN34Dcsl4GJFZu9F3hHEPMqsV9cg6P5lfyTHbLjv6FjDw==
X-Google-Smtp-Source: AGHT+IG6cTryxBe5AbsS0wWfico+bX9RDswcMc6cJ1EdV3txBrdqcYcLZb2hL+rtsaajxIz+dfjhng==
X-Received: by 2002:a05:6a20:1584:b0:233:14ec:4f83 with SMTP id adf61e73a8af0-24054ffbc94mr20021637.6.1754592298537;
        Thu, 07 Aug 2025 11:44:58 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8b59esm18450602b3a.37.2025.08.07.11.44.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:44:57 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-zipp: upgrade 3.21.0 -> 3.23.0
Date: Thu,  7 Aug 2025 11:44:41 -0700
Message-ID: <a3eb2194866253dce443cbdfe1815109f45c40aa.1754591996.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754591996.git.tim.orling@konsulko.com>
References: <cover.1754591996.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221582

From: Tim Orling <tim.orling@konsulko.com>

License-Update: add copyright year; update to match SPDX license text

v3.23.0
* Features
  - Add a compatibility shim for Python 3.13 and earlier. (#145)

v3.22.0
* Features
  - Backported simplified tests from python/cpython#123424. (#142)
* Bugfixes
  - Fixed .name, .stem, and other basename-based properties on Windows when
    working with a zipfile on disk. (#133)

https://github.com/jaraco/zipp/blob/main/NEWS.rst#v3230
https://github.com/jaraco/zipp/blob/main/NEWS.rst#v3220

Comparing changes:
https://github.com/jaraco/zipp/compare/v3.21.0...v3.23.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-zipp_3.21.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.23.0.bb
index 135a1ae5337..bf9ae7df133 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
 
-SRC_URI[sha256sum] = "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
+SRC_URI[sha256sum] = "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


