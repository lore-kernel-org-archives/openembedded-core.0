Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17C2CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:46:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.89571.1756849602887673645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B2PVBsKG;
 spf=pass (domain: konsulko.com, ip: 209.85.210.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7725147ec88so235564b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849602; x=1757454402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmZHDEJcXTatBQg1nG3Y/7Sez4QHDFN08NRIk7trkD8=;
        b=B2PVBsKGGdYopU/BsRBXRnq84IaYDr7GTYcw79KO318K1wR8W+eZjEjlF+d5UhQoEt
         fg0ET7qGndhMYiuYH0yLYKzaZwhu+lqXU9KLPNQvTMOTBfpZ7M5Vbletld6Gd8duXCMM
         FwEiMfFWjBmityFP3dfXiDvPPd3gV5M6ZKOPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849602; x=1757454402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmZHDEJcXTatBQg1nG3Y/7Sez4QHDFN08NRIk7trkD8=;
        b=PVb672pgeBzii0aM48yt//EogS+KI54jF3vCeJ5YiZOy39UYKN/VJYWWGWvX74VvDc
         OfRhjGNujykkkD1fGjNfrpTf4/88WWnvKDFnLxeMkW6ePRznRhIcl6W78qfICCbdLbV9
         gd6dq7vkf8zgV6Cd9s+BU0aRAfGH9PvmOU6e02BJcTjkskPLUOm8C1sz5cYmYtwtaL5l
         qwNeasmJBumt/a6EMrrK26noQelsnEpGbCsvOFHJtnK9BPtYICcZ8chhgdIg3xJ3bk/7
         4fnJSSfx5EgUtNYNvkTzhFYbzdxnZXJIDl1EBfCdfCEej3KDr534AguCLnBhvJMjdeyA
         c5/A==
X-Gm-Message-State: AOJu0Yy1MxYQ0FRpjapwmBQwJap5SVX9orkKGzSkcxyOpll2K646Rkge
	pqoE8E4RXTUqTfPodRVtmQ/V1jX6fxiil0milFWwsftgO5oTMZ+YSVJ/RKmU3Qyq8vT9fokizNi
	Q1GSd72E=
X-Gm-Gg: ASbGncsNVAm+wSiPBeecJZQILHDz0QoAM0f7UIrpRMs9QmyTiYFLvg1Nyg9K3eX+VP/
	9VO0ho8zUA/pWcMCuhP5yATBiZrAF1j1eXiUVa0U1QMikHExJcFC6fdEFfmDpx4exdXMcogqqWJ
	eIgKo5W6tlAw91BpTbriV2MlQWy9QmKcTDOvO5NtAJXrm1kHd/0c5ZMe/mVzLxr5Gz8oKkLA6OG
	e6jQFp9pksm3tGUmw1XXliQmf+vSY79DuhuX1XVBU21/8yu2suUc+hSVpN/TIcRV66s96wAb/LL
	89am4SCAfDc0jcWFNO18D8ZlZyx4Dn5fUI581T/kPCedfELKOipGaz0LiaCrSOvG9I7NnL6qW5s
	TM1jQyvtsJnuERgNH1u8iEaRte9/05R1s1UYkS1kWq0y099QL/FSdgmNiqmqEQWOQXK88L5vA
X-Google-Smtp-Source: AGHT+IEWVi2AF4WLkaMIsK4jThzPUCuAoa0SaTr6i1oLNkYm02G/kG2CBaFsBjgOce3l4ZXxQe3LQA==
X-Received: by 2002:a05:6a00:2b86:b0:76b:f7da:2704 with SMTP id d2e1a72fcca58-7723c503bc8mr10049215b3a.11.1756849601792;
        Tue, 02 Sep 2025 14:46:41 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77231f40553sm13403512b3a.43.2025.09.02.14.46.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:41 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] python3-setuptools-rust: upgrade 1.11.1 -> 1.12.0
Date: Tue,  2 Sep 2025 14:46:24 -0700
Message-ID: <cc4cc789bc3d12285be86d8b4cb37b82d62ae862.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756849390.git.tim.orling@konsulko.com>
References: <cover.1756849390.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222747

From: Tim Orling <tim.orling@konsulko.com>

1.12.0 (2025-08-29)

* Set PYO3_BUILD_EXTENSION_MODULE environment variable when building
PyO3 extensions. #540

https://github.com/PyO3/setuptools-rust/blob/main/CHANGELOG.md#1120-2025-08-29

Reference:
https://github.com/PyO3/setuptools-rust/pull/540

Comparing Changes:
https://github.com/PyO3/setuptools-rust/compare/v1.11.1...v1.12.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...uptools-rust_1.11.1.bb => python3-setuptools-rust_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.1.bb => python3-setuptools-rust_1.12.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
index 417ded009ec..491f5127063 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0"
+SRC_URI[sha256sum] = "d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


