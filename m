Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D336CD3430
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9507.1777739457316132052
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QEkEEs5f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so21067345e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739455; x=1778344255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orOIBSfDRdYQujnR/6X5zyCLX1IDwDlwCHjVrHkL1kg=;
        b=QEkEEs5f09YISRuRJloPbqDNl5BNdF2SNeWHapwfPXLB2pkknhSYoyksVCNqEMt/ut
         QagD/9Q3otimzwolD9xCj0UM4uy0jLiAEXX0iKDL/EAM2kkFmmd2/KThqd9CSFVk3Ize
         PtcTsmXibpAQ6/mYFEmIHar7PxwvNrwaJJlfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739455; x=1778344255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=orOIBSfDRdYQujnR/6X5zyCLX1IDwDlwCHjVrHkL1kg=;
        b=AiyJHdSmfP/uCcSPtgKAPCPkpsPM0bK9J0zRYPHxOiENL6qI8ywx0EwdOyOiONLU2W
         Nwj/SQp0ctl8nRm/Up5qxLm+4silgJxqWrqETsoo9M4NEgI8MAElDSs/LlvRcBq2oUNB
         +EdBggWKnshYtKgwiSSz++78uFwGX1OvxvUbUFXitwXng4nstd8i/5cRV0ZFNVHMto+a
         0YqPMnayocxsqhomVzUnjoBj4K9Ioo/piYFy8kL1nnfQE5vY9EGdisnRtQk1wHg08xoC
         12xfK6AEuVMe/5YaIerigwrsemRbVmwPaZCT1LdkHJjUR13YijxPl3X8E6fr1BAEeejs
         Ecsg==
X-Gm-Message-State: AOJu0YzZcfveL6FaCGlFRMf8VJ+Ealmru7h6vOfY6Bd9TigXhxks7rCO
	/ilT7J3grD+BsVvKNTlAskB052K5Ss1+orCkaDBt38DbnzVNuLLZVv9hbr/Qgw1PNhA8+lys/yc
	IX7rhrElKg1AgRtl80JQD+YSo05GoLeLMuH+SxRBnMvCZgWdLXd4qU8gadqnjg8okDx7YKOQ4ao
	WttaNQDqvWf1uJgMY=
X-Gm-Gg: AeBDiet/PYs2BkEd4h6sIxUon2uxqWCUkk1FWD+EmTGgtxLwSP9s5puyzeQvbbLHhxF
	E/VaHUi7wdi4V5OSkH9L0DLXK7xMohyd2Db9/y///OnnyuRFotABu/W2YPA3bTEN+dhHFe0qBEP
	A6ECciT0VBuZDNmaDZnxsYqhf0fQJs+Ppn+RbREIgtY02FDX4tt31NvZp/TNLLVC3olJg1dDZ98
	tJ5U8/MIDLmt/wIFV7uXlz/GDtIwCupPltaRYtuTsco0fcO3E+3uRLTffOXHKJDvnYPNwymZNgY
	ts7Nj93h+qg+ad/qRB23j2zwDNp62NNLGLjlbe0N5KFIHKJAikDmeaSa/4R1pSqfTz+4ohaI9a7
	bUlVkvPHX0cdhJDhSLxe2K1NFOsrn7CuEPU3w1kfN6McC0DqV02kj0RmshJWCsjVMAMQNSsYZ8f
	ERb7N9mEUs0rsvGxnOfy6Lv2QjP60FZqXaVcX45FzbDn2iQ4XIxhJdXq5tkTCozRU=
X-Received: by 2002:a05:600c:4a22:b0:489:1927:5c0 with SMTP id 5b1f17b1804b1-48a85dbe3f6mr108279345e9.0.1777739455201;
        Sat, 02 May 2026 09:30:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 40/62] python3-numpy: upgrade 2.4.3 -> 2.4.4
Date: Sat,  2 May 2026 17:29:00 +0100
Message-ID: <20260502162929.1377831-40-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236349

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/0001-python-sysroot.patch            | 4 ++--
 .../python/python3-numpy/fix_reproducibility.patch            | 2 +-
 .../python/{python3-numpy_2.4.3.bb => python3-numpy_2.4.4.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.3.bb => python3-numpy_2.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3a77ffa4e08..4015e05aced 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
+From e1feb7f7052980d8df2635ecc30a30b70ba73a44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
index b22c1234935..7575e011f57 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
@@ -1,11 +1,11 @@
-From c40218577305f5953ef63d943c26a27c5a931770 Mon Sep 17 00:00:00 2001
+From a4609765d97bc25cdd6d9ee06c7026a2ca3481e3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 21 Jan 2026 14:12:36 +0000
 Subject: [PATCH] Add sysroot to pkgconfig libdir
 
 When Meson uses pkg-config to introspect the Python install it resets PKG_CONFIG_PATH
 and PKG_CONFIG_LIBDIR. However, when it writes to PKG_CONFIG_LIBDIR it uses the
-_target_ library directory without prefixing this with the sysroot, which breaks 
+_target_ library directory without prefixing this with the sysroot, which breaks
 the build if _LIBDIR is the primary search path.
 
 This has been fixed in Meson since 1.10.0[1] but numpy has a vendored fork of Meson
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 71b3634b77e..e9ac56c59c7 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
+From b9ab979957e1ba14ce42b696c476a5910a07f1aa Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb b/meta/recipes-devtools/python/python3-numpy_2.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.4.bb
index 7521a93f990..a8995b08df3 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
+SRC_URI[sha256sum] = "2d390634c5182175533585cc89f3608a4682ccb173cc9bb940b2881c8d6f8fa0"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

