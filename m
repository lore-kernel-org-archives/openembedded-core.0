Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FE7C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2261.1743577899681551202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DgcZH2aF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45925435e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577897; x=1744182697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9k8MCa6thzSXA0FFRBDi8SzAodvCNt8pUzXzlF/FwU=;
        b=DgcZH2aFEJbByfXWlOD2CI5q+6d8SSJNL0Yed4DZjgyrs6RTWPMmyeI3IuHxrcLmkO
         QqRQJGItYA2wN0Rsqwy22tBm4IQqZoxAMLiJLSQA8XKdxZpX5VJ958G0MW2AAvlHy64r
         yG4nyF7m1yXUDCocaSTTP2K0qQ4fn1Kx3W4pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577897; x=1744182697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9k8MCa6thzSXA0FFRBDi8SzAodvCNt8pUzXzlF/FwU=;
        b=BnL7Ntc1PdeQcNxrUp3NFBQiXmwEwNNniAS9hlxtkmrBmlyWCviTS/+C0Wbbn9Z+Bp
         piFlYTH78FylzsMHUkGLkrVFePHCV3wp5PJeQHfUcxLX+PwdJPg5FJM9z2GA399gznuN
         QVklKAJUzn4Jqo/c+P26qay/0A3QROkOf/j5euLse5OZcL6uJeIdKcAN6RoysXTJqM9H
         xIIlhFiXyP50X4d106Yn4yI0w7rRmJ/OkM7aPGH8hoIBCOtDGA5jUi4V/xfFimE+N/aL
         9cRHAbDcs33EbjLJqEEa2Z5+7x0t1Vhdr8h/AcJJUY86yT8PGG3gKZvvsP6GzMTaLTug
         qAXw==
X-Gm-Message-State: AOJu0YweNmIii7nSp1gNctkkglTtpO/xa/2iRdMwVy6Vh+P7FvcRaLNK
	i4iVyEqW0cjtSW0Lwy1b9+VDOVtULtwSCRugkOHJcTHy6VErqmzSpnjq88+bkFedwc8ZxKsnVV+
	6
X-Gm-Gg: ASbGncsRPVBHYiTUVbArw6rC1r83jZLymeYwrKwsDvJdu2Fa+nnKjhm/sebNiEqvIub
	rELkBQOu9oeyICEJT2YctGE3Z/DxXgcP1rUmXV80fcs7MjYDEt2FkfwIjXrsB9L2/WYR7OCKjTS
	e81E6nDisabmoRxqOH3lBVugXECeZ6vc5igJXS2AUeGvRJWR9enfiJdBP/fV10JUcbTv3QPaqhb
	GbXJXEgV+uZNLVhV9EeyXF8pCAWJ2mvcUjc54r5BpyhkJSld/E+5ZZ5pgNev3C8gN17GWrurRJH
	F7o2LdQ6RS8Ex5p9+jSUtrgt8sNCJjuW/YNwi+V5ksTvet9Dg40LaYzUJriGONmb9PRYYb4epYy
	NVuNzHK9H
X-Google-Smtp-Source: AGHT+IEKLF4YgPxVDhqlQZGH4Xqxgk7EJxj5IxnO6bfKHSbJdQ6f6Ubvemkx3gc62JvT435k9WA2cg==
X-Received: by 2002:a05:600c:3591:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-43db61ffdb0mr122175295e9.16.1743577897566;
        Wed, 02 Apr 2025 00:11:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/48] python3-numpy: upgrade 2.2.3 -> 2.2.4
Date: Wed,  2 Apr 2025 08:09:59 +0100
Message-ID: <20250402071017.2157620-30-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214203

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.2.3.bb => python3-numpy_2.2.4.bb}   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.3.bb => python3-numpy_2.2.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 437bafb54f5..3e08b43587a 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From ad6c0196e4c97ca37368610c010e46c90a4749b4 Mon Sep 17 00:00:00 2001
+From b036c984b019d941ead2efd5a05d1588c4bc193a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 514073d94e4..8b39b7bcfe2 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 061a8ae1d1d000892d6dba89a444922e7a28804b Mon Sep 17 00:00:00 2001
+From 45d76002bc989a9098141f2bfcd2d2fabc5a04d5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.4.bb
index db9a99946ca..a2ee2b48d46 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "dbdc15f0c81611925f382dfa97b3bd0bc2c1ce19d4fe50482cb0ddc12ba30020"
+SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

