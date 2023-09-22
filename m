Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4103FCE7A8A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 21:05:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.8652.1695416716628236798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 14:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LFot0YTv;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-692a885f129so1249815b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695416716; x=1696021516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XGlLwqyZoq79Z/pbkTp2ov2XmH5lfeBLVaP/JxN9vY=;
        b=LFot0YTvO6Jph9NyuIH2IGi6OEiPV16/JfUGZPTZ5VbsDGVgMNcZd32RVaVl5lRGa7
         tOKZ/EDZN4S+Aje8k4J097TEHM0UzcXjkTCuz5X8gkTz6yvJCd1EhjEtvPvOYwPdXLPi
         vPaUS/k8Mj4kYWrZwtKIm3IDD6AaGJ09B27sDGX8lAZgkoWofGg/QVhzr4kumFE6B8QC
         82W6XiS1tZmBnqxWmTyemiczTpFgGBgpGoJ82t8Fz58M8F11UesNWmu9QDmsqJCOr2fk
         5lLTg9tMYZ/l9b1h5yH65crmayUj7RDNXQtNB/VJVdkRFaweWAVGVkWaYI2dpoxNm4br
         Lo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695416716; x=1696021516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XGlLwqyZoq79Z/pbkTp2ov2XmH5lfeBLVaP/JxN9vY=;
        b=Q32hJR+O1R1nTfeW8d68MKD1B0IR7qtmX5ietK8c08rbHjd+Zkpa2K+sAAeaumULjR
         8wwNG5RKx2lrHSQ7PE4j4BTPS3nWwpUVJjLSUddRkbeEJTLEaxzbGVJOE1eqJ+Ls/MgI
         PpKL5i9vcuAe7giFiaer12dn+oggTa0RZcre36howidMBMFiYUQlcesGwAxrRzltH9Ie
         q5bbtXbI3T+XQWf4RYDQk2bSaOn8ytV1mVRxLG/4nB90U7iEnsKWCWjtV1Sb1ua8Mpe5
         eapIqs0qQUd5JyH2gBw8RDzuphlCGTvZ1bMfLUjkV6v28AvspVgxrTWoKY4XQIk7QsZ1
         yMKg==
X-Gm-Message-State: AOJu0YzLTelg28o/QWcgR8kQoj3GxcJM7uuESg+bVk+q7iTz2l9dGc5I
	6yB1P7Xelo/n1+GMxVsNae9jZiBoebspSg==
X-Google-Smtp-Source: AGHT+IEjU7Wg4bI+YqkYSwLblwdzTT1/S2Lv/r5y3LXJA10l/H/sFHpe/IRhhFjFqJdr7Wj10qt5Yg==
X-Received: by 2002:a05:6a20:3d8f:b0:159:b4ba:a5bf with SMTP id s15-20020a056a203d8f00b00159b4baa5bfmr921037pzi.13.1695416715703;
        Fri, 22 Sep 2023 14:05:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001a5fccab02dsm3943623plf.177.2023.09.22.14.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 14:05:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] elfutils: Depend on musl-legacy-error for musl targets
Date: Fri, 22 Sep 2023 14:05:07 -0700
Message-ID: <20230922210508.24087-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922210508.24087-1-raj.khem@gmail.com>
References: <20230922210508.24087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 21:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188136

this ensures a gnu compatible error APIs are made available, the patch
to workaround this is no longer needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Added

 .../elfutils/elfutils_0.189.bb                |  3 +-
 .../0015-config-eu.am-do-not-use-Werror.patch | 37 -------------------
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index d6352de5cf5..d8bf82b0229 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://debuginfod/debuginfod-client.c;endline=28;md5=f0a7c3170776866ee94e8f9225a6ad79 \
                     "
 DEPENDS = "zlib virtual/libintl"
-DEPENDS:append:libc-musl = " argp-standalone fts musl-obstack "
+DEPENDS:append:libc-musl = " argp-standalone fts musl-legacy-error musl-obstack"
 # The Debian patches below are from:
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
@@ -24,7 +24,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
-           file://0015-config-eu.am-do-not-use-Werror.patch \
            "
 SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
 
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
deleted file mode 100644
index 9ee5801c561..00000000000
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c209233857a73970d7a7dd8da664903570efc7ea Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 22 Jun 2020 21:35:16 +0000
-Subject: [PATCH] config/eu.am: do not use -Werror
-
-Due to re-definition of error() on musl, gcc starts throwing
-errors where none happen with glibc. Since upstream is not
-likely to be interested in musl builds, lets just disable
-Werror.
-
-Upstream-Status: Inappropriate [oe core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- config/eu.am | 2 --
- 1 file changed, 2 deletions(-)
-diff --git a/config/eu.am b/config/eu.am
-index e6c241f..4136e7c 100644
---- a/config/eu.am
-+++ b/config/eu.am
-@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
- 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
- 	    $(USE_AFTER_FREE3_WARNING) \
--	    $(if $($(*F)_no_Werror),,-Werror) \
- 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
- 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
-@@ -109,7 +108,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
- 	   $(TRAMPOLINES_WARNING) \
- 	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
- 	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
--	   $(if $($(*F)_no_Werror),,-Werror) \
- 	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
- 	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
--- 
-- 
2.42.0


