Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BFBC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.11468.1634657665398631392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ghSTUIdr;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3394129wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xAJjKeNWl5VO2a+XljgxroosCuae9uJsQvO97WlHys=;
        b=ghSTUIdrRdoXrrMwYrOxsR2NycXiXB7ZDAjd1eneMwhvAzXHEdcV1GfzW+RFVCE1Dw
         6UhjlHjCSkjKSaCInwefLxkiZH836zhkdH3fU+p5+wmq61zIE2IfC4GPk5p2zgr8Secr
         tu12s3p+O16sg/eTrTEoL/+2/nywebv/AeUzxDFCZ5oW3hDSN4HLJgbEWgiViGSE+Krh
         eSgHVdXIVkmsm3fSTagbnFlBqooMGAFawrtW9mFYhTiwWh5thYaz/QQRZeFVVsssdF5i
         zp6jGqR24cfXQCYJF6b+AEgbUW1YxW06CcfYgutkQ6PQDbiFog9FduygdIErbqKgiS4v
         SxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xAJjKeNWl5VO2a+XljgxroosCuae9uJsQvO97WlHys=;
        b=izRGE+mzwqK8hyVGG8LpijnE8wm+UlOkv1qfPIhLxX+j+F5t1/3jz7I/p2G2WQETkr
         Iz70Qhq+zThpTYXOZyzLGhW5aqg3kwjQd2j70NVrhAZApqkmy6/eFqNrWvYzQgUVh4ix
         c3A9Zd3DgxuHiO03t86j0M3UfWVvDPn7RzIq0js9k2gstOCmsNJCO/hQ0BzL8x6AvuJD
         XaxVzu3DHviLfN1iRXTFZ8GkG/ZFCYDZ5DvwV7TSYX80efaL8F4CW3gjsVhzcGVMlMt1
         7voqNh/i/qWZU42J22SvOIz/wBjTjW+zvPzABkvDp3ozLF9zf9Qa+SS+YvhFK8tbaI9l
         l2+A==
X-Gm-Message-State: AOAM530nX9/gEfqlcmBC4HN++VmxSpfR7juD2M/RRTx/etHLnN6UgTG6
	G0naOZV2otrvIqaLkDZZOAx/c4yc37U=
X-Google-Smtp-Source: 
 ABdhPJyTQPlvkGovX4Y6reWxQkT4vYUcPqdeNOmp+DGCAEUM4Ka6gqKyzdALxTqET7cZp+Egc+7oIw==
X-Received: by 2002:a1c:4645:: with SMTP id t66mr7010394wma.179.1634657663829;
        Tue, 19 Oct 2021 08:34:23 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/65] libjitterentropy: update 3.1.0 -> 3.3.0
Date: Tue, 19 Oct 2021 17:33:15 +0200
Message-Id: <20211019153419.3319802-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157120

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...kefile-restore-build-reproducibility.patch | 27 -------------------
 ...opy_3.1.0.bb => libjitterentropy_3.3.0.bb} |  7 ++---
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.1.0.bb => libjitterentropy_3.3.0.bb} (88%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch
deleted file mode 100644
index 3290ff7b18..0000000000
--- a/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Makefile-restore-build-reproducibility.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 905333229103510e9dee2fec29b261ccedb031d0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Aug 2021 19:37:04 +0000
-Subject: [PATCH] Makefile: restore build reproducibility
-
-wildcards result in an unpredictable order, and thus different binary outputs
-in otherwise identical builds.
-
-Upstream-Status: Submitted [https://github.com/smuellerDD/jitterentropy-library/pull/67]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 42932d8..dfb96a8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,7 @@ LIBMINOR=$(shell cat $(SRCDIR)/jitterentropy-base.c | grep define | grep MINVERS
- LIBPATCH=$(shell cat $(SRCDIR)/jitterentropy-base.c | grep define | grep PATCHLEVEL | awk '{print $$3}')
- LIBVERSION := $(LIBMAJOR).$(LIBMINOR).$(LIBPATCH)
- 
--C_SRCS := $(wildcard $(SRCDIR)/*.c) 
-+C_SRCS := $(sort $(wildcard $(SRCDIR)/*.c))
- C_OBJS := ${C_SRCS:.c=.o}
- OBJS := $(C_OBJS)
- 
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
similarity index 88%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
index d9fbb5e9d6..dae2fb1791 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
@@ -9,14 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
-           file://0001-Makefile-restore-build-reproducibility.patch \
-           "
-SRCREV = "409828cfccf4b3b07edc40a7840a821ce074e2c3"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
+SRCREV = "418c1e64231255aec2167cbb20aab62a0863415d"
 S = "${WORKDIR}/git"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".2"
 
 do_configure[noexec] = "1"
-- 
2.20.1


