Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C9C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 13:27:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.31972.1654522020899714197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=yIZ0RbK/;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so7174129wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z62DdPjTIlYZhtuHETVWba28Y6OJ3OQ4Xtq9mnjMKkM=;
        b=yIZ0RbK/tRCoQPs8L8NwSJIL6uHna0JhYcgTv39Kk6kqRzZ81/0xYjYsayBLVrLjL5
         ykn7aty4ryhc0nqhonGKgsCTD0fElSFiR+Lr+tgh9Em6emat5nTmEfzn2KGmnOnR+bdr
         sId4cYgyVzAtBatnm6GWpyuBBdb7ZWLM8bo35BdsHraSi6HXm/4BYJe3K4R7mIUrg/ov
         PurgVBCgUTxPdSDqTh0+1ql4eEijQfAr9COXY0ewUiqe6vaS3a3HgfaEPGAPaDfcDqc0
         4riLH8bUBB2uZFDYqzmQqquu8Zgw5f8Qj05qTqGnbF/iq7uuu5TuHMFPjtdKnMDupWQI
         Eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z62DdPjTIlYZhtuHETVWba28Y6OJ3OQ4Xtq9mnjMKkM=;
        b=RJNA2ZpLln1JCLMANfd7l0Vqyb9SRD3ZoDHPkt9paQBazC+W1V4On/EegFhtbPWdUk
         yY0MmK+aEqsvpHiuZYEnrkYw5eI+DghostOOaKypAfc9E9w+OhiU/fqqsWUcxf/ctct/
         V5TbyVNoTssTcV1Tz0gqWo54gysLAas+yW0GGrN6xINhbfZM+nmiul16HzFryl+e/sNT
         frEnRgvhq8yV/XCGFsg/uwtIF41zRlu2nMf56tdmhSwDS5ESZCmaO47pPxO9u8oXf2nJ
         H7PB428phb3T7yOnCIYUWu9tq9Qt5nB+DBz8wHn6/2qs0vl0ZqsLa+0/I0fmN6NsYDvC
         LxeQ==
X-Gm-Message-State: AOAM5309EdZ0igXnTmtVbSN0ydpTC9odKUtEBm4jK4ZhFzkzfsa16uIx
	Y3CTuMzgR6sKOAeT4dCXpoMHEKq+0n/dfQ==
X-Google-Smtp-Source: 
 ABdhPJyh++Y+LyyybhaTOxHvp0J2B/tMmy8I83nkpTKh+DPReOkKcA3zjRXUEbk7XtIYThJmUokfuw==
X-Received: by 2002:a05:600c:3d11:b0:39c:1c62:cebc with SMTP id
 bh17-20020a05600c3d1100b0039c1c62cebcmr30283754wmb.147.1654522019421;
        Mon, 06 Jun 2022 06:26:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:46fe:49d5:2ab9:ca49])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a1ca101000000b0039c4ff5e0a7sm2840911wme.38.2022.06.06.06.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:26:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [OE-core][PATCH 1/4] cargo: don't update git submodules in --offline
 mode
Date: Mon,  6 Jun 2022 15:26:50 +0200
Message-Id: <20220606132653.60232-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606132653.60232-1-brgl@bgdev.pl>
References: <20220606132653.60232-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 13:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166628

This adds a patch to the cargo recipe that prohibits cargo from trying
to update git submodules when running in --offline mode.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta/recipes-devtools/cargo/cargo.inc         |  2 +-
 ...-t-update-submodules-in-offline-mode.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch

diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 607c51fc3d..6ab4e0a5f7 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
 "
 
-
+SRC_URI += "file://0001-git-don-t-update-submodules-in-offline-mode.patch"
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch b/meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch
new file mode 100644
index 0000000000..d138c4b911
--- /dev/null
+++ b/meta/recipes-devtools/cargo/cargo/0001-git-don-t-update-submodules-in-offline-mode.patch
@@ -0,0 +1,32 @@
+From 4768c657905356da417f50d3cbb203c76baf1ab2 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Mon, 6 Jun 2022 12:13:02 +0200
+Subject: [PATCH] git: don't update submodules in offline mode
+
+When we're running in --offline mode, don't try to update git
+submodules or else we're bail out with a network error if it's actually
+inaccessible.
+---
+Upstream-Status: Submitted [https://github.com/rust-lang/cargo/pull/10730]
+
+ src/tools/cargo/src/cargo/sources/git/utils.rs | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/cargo/sources/git/utils.rs b/src/cargo/sources/git/utils.rs
+index 4eafae1c9..9ed991e36 100644
+--- a/src/cargo/sources/git/utils.rs
++++ b/src/cargo/sources/git/utils.rs
+@@ -177,7 +177,9 @@ impl GitDatabase {
+             Some(c) => c,
+             None => GitCheckout::clone_into(dest, self, rev, cargo_config)?,
+         };
+-        checkout.update_submodules(cargo_config)?;
++        if !cargo_config.offline() {
++            checkout.update_submodules(cargo_config)?;
++        }
+         Ok(checkout)
+     }
+ 
+-- 
+2.34.1
+
-- 
2.34.1


