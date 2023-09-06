Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDDEEE14BC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.4105.1694019406346376820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qK6MXatm;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bcd7a207f7so1230101fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019404; x=1694624204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmkLrZ8Trz4N4VIsGiKKKDGj8nS2jxTWryD+S30WFTI=;
        b=qK6MXatmpoc5dbylph7PPmPM3J303LqEkwiaPNiBZbq6nRVkce/bszOmgliwxYe4v5
         B0YxZBpQN3mC9VWXD3RkjBLjlDEhBz46gipBfcv2YRwj1Dz/UdbbbAz3w5LLEb6cU0MX
         J/8qgAciUX0utc/f/DikofrDEQIec07gcZa5uINZJQ1zf7HRRB0CG+qGqBNlw0G2Xuva
         p3D6XM+UmVCGp3gR4sqV3VNsjEaq5UfX9M/iT8RV+behaFvwejyXrF4RwYkxS1MuY2nD
         h2IMsq+uyNmqLEO+Qp90J5oZLKf+ykvBuubvi7nxbMyAVDVpjAQHKUz6WeTRXu3A6J+x
         9slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019404; x=1694624204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmkLrZ8Trz4N4VIsGiKKKDGj8nS2jxTWryD+S30WFTI=;
        b=mGxTJr/5oXNJL6mw7/xTyPWgjKcQ/ZBbUrozyB2NOstDU7epsIDCCqKsO4ITlNf7En
         jk1CLxY7ZC0KFFDhjhXs4P1C58z+j8ZQcFosgzyNHn508PUhE7tF23ggHOmwLOLpy6wn
         Do29WKxaoXGKjXSfEo/oKtXgcGzJlxNSf6RTRv4CcwQ9Hj8B/6pPbHsUt+RC9UEkaw01
         5G/gNRCEpaarPwDul+QznyczhkamiElN87jH9Rb3c7hZmt2jQNctUr3blT+1fI9bo6rS
         uNF478arklocY0jcZsM2JuqPVJHboq3q5GhPhQ0uGwF+It6c6aQEN+4NZRs2vSARSl+B
         mQzQ==
X-Gm-Message-State: AOJu0Ywt4bgxOO6Mb3hcA+SyzYeKLkPpvtMRj9jaEbYJvK9ORRKs4sPP
	jzktdVl/k9W5kXd37jYEcVqduwkBItU=
X-Google-Smtp-Source: AGHT+IFTW5Xv1KwGZ0P0rSDTs5xzx79KfjZPSjOV/bEpScX/PMCmBMeACWR5zf1wIcvH8ybpjn10sw==
X-Received: by 2002:a2e:3a13:0:b0:2bc:ed75:1ba with SMTP id h19-20020a2e3a13000000b002bced7501bamr2500259lja.16.1694019404461;
        Wed, 06 Sep 2023 09:56:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/17] libglu: update 9.0.2 -> 9.0.3
Date: Wed,  6 Sep 2023 18:56:24 +0200
Message-Id: <20230906165633.2382629-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187330

Drop backport.

Set gl_provider explicitly, as upstream changed the default to glvnd.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Remove-deprecated-register-in-C-17.patch | 32 -------------------
 .../mesa/{libglu_9.0.2.bb => libglu_9.0.3.bb} |  9 +++---
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch
 rename meta/recipes-graphics/mesa/{libglu_9.0.2.bb => libglu_9.0.3.bb} (79%)

diff --git a/meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch b/meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch
deleted file mode 100644
index 95d56e95739..00000000000
--- a/meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1910b3a83a7e5aa1a31c4325829c94134fafce76 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 13 Jan 2023 20:58:07 -0800
-Subject: [PATCH] Remove deprecated register in C++17
-
-Fixes errors like
-
-src/libnurbs/internals/varray.cc:76:5: error: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
-    register long ds = sgn(arc->tail()[0] - arc->prev->tail()[0]);
-    ^~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/glu/-/merge_requests/10]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libnurbs/internals/varray.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libnurbs/internals/varray.cc b/src/libnurbs/internals/varray.cc
-index 1cb2354..41b3b18 100644
---- a/src/libnurbs/internals/varray.cc
-+++ b/src/libnurbs/internals/varray.cc
-@@ -73,8 +73,8 @@ Varray::~Varray( void )
- inline void
- Varray::update( Arc_ptr arc, long dir[2], REAL val )
- {
--    register long ds = sgn(arc->tail()[0] - arc->prev->tail()[0]);
--    register long dt = sgn(arc->tail()[1] - arc->prev->tail()[1]);
-+    long ds = sgn(arc->tail()[0] - arc->prev->tail()[0]);
-+    long dt = sgn(arc->tail()[1] - arc->prev->tail()[1]);
- 
-     if( dir[0] != ds || dir[1] != dt ) {
- 	dir[0] = ds;
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.2.bb b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
similarity index 79%
rename from meta/recipes-graphics/mesa/libglu_9.0.2.bb
rename to meta/recipes-graphics/mesa/libglu_9.0.3.bb
index 525d6316111..8151727c52a 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
@@ -11,17 +11,18 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 # Epoch as this used to be part of mesa
 PE = "2"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.gz \
-           file://0001-Remove-deprecated-register-in-C-17.patch \
+SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "24effdfb952453cc00e275e1c82ca9787506aba0282145fff054498e60e19a65"
+SRC_URI[sha256sum] = "bd43fe12f374b1192eb15fe20e45ff456b9bc26ab57f0eee919f96ca0f8a330f"
 
 S = "${WORKDIR}/glu-${PV}"
 
 DEPENDS = "virtual/libgl"
 
-inherit autotools pkgconfig features_check
+inherit meson pkgconfig features_check
+
+EXTRA_OEMESON = "-Dgl_provider=gl"
 
 # Requires libGL.so which is provided by mesa when x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-- 
2.30.2


