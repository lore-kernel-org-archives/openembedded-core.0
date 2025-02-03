Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C05CC02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.92666.1738600919124033771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NbIPinFI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a39e659cso32215155e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600917; x=1739205717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTmUAZa7AsABdUhLlBgHyVlTeKYnp3qdVDHc7Y6prU0=;
        b=NbIPinFIOBrj2eeyofdJBLPdfqZLEgBalEpSHiSl+0O8F8WcnO0f3WR1dk02nuhaVv
         O037o95Z1UxWaEkfaa6j8inaEsELfpaG9pCTMXif5keFdKjJ+gKNyURInF+W4+K3F5WV
         Yfk+IJiWg2n/+y//C0E0d+DsyDLDtYUER1jr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600917; x=1739205717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTmUAZa7AsABdUhLlBgHyVlTeKYnp3qdVDHc7Y6prU0=;
        b=s+m1Sd2BL3a05439qV3KT+2LN6ZKutU9CSkVBJoCUH5XwO7cEkjnyV1xcPz3obogEs
         RBWtDUzPToC9B+Eh9GHGyuJvOKwTQK4h1snCZoROR++8EvtJKayTLKyfyLWWYd/fUWtm
         p3HSv7FWBlfObhRN96t/aaHNC4CS7KNYy6vvwE/i6HrDiEwi9n6k7RRv3fhl6TjnCdxR
         EBVxWIYNMtCUMbl8VA3xJ7aRE18mkBX/YsQMHU4AepMEoanusFsAChwjXREQ3hsV4i6E
         DxwhWuuyK7qeunDxnlrR5ff9aWMaQsgTNp9G8bxRYIK0+b9T16JRxrYZfSElRhjXphZI
         edWw==
X-Gm-Message-State: AOJu0YwupfbYVnHIm1+3ps9fiseeyR6GA164FrMT7R8E8P5hY72kMeW/
	sdWwifq18a77U19HTMFD/PvSa+gXNEXkkruli3YD7AKV/Nc90iNc+HRkunvenKByzzKISZ7lk55
	L
X-Gm-Gg: ASbGncthfwPmlyeriDhmKFp+rliZhvqb6ToT9qm8gNHRtkgEYLy5wOUuDbYKXxbHwiw
	CMSVBcdLI6sIuEsdPkA1feAQQfJ+J5qNwSIEPsFUFb9ubYc4LWUoHRDLHCIJNJbrACFGJUjULBv
	btyGdjcNUaIzHGUXi8ChH7AhgkOHkMGY6ArSFw1loGderscbh80sanVkEI3oAOFgvLnPiFoPfVR
	LLaCdLzE6j5dr+f+tRv3juOQ5VfICDRGLF1UrMYEoAnUH5tyg70pBbndoAvhqeTnp73XaKg9fyK
	kujpRiwuduqPMvGmiq644mqOkCYv5Ne+QthhM6KOcBlN
X-Google-Smtp-Source: AGHT+IFVfFRyd3E5TG5hXRxNo6UPyIsIt6WyyA8ecCIKZU0cGC4XXiyNPsNd84cjYUa/O1F5rNzGxQ==
X-Received: by 2002:a5d:6c6f:0:b0:385:e2c4:1f8d with SMTP id ffacd0b85a97d-38c5194c432mr17718838f8f.19.1738600916913;
        Mon, 03 Feb 2025 08:41:56 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/46] mtools: upgrade 4.0.46 -> 4.0.47
Date: Mon,  3 Feb 2025 16:41:09 +0000
Message-ID: <20250203164130.3403325-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210698

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 4 ++--
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb}           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 1420d84b867..2f3c4524200 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
+From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1bed4e76147..1b3c3e003dd 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 0953b744b0257e26c170fb6d6b4c0f6210e4ae43 Mon Sep 17 00:00:00 2001
+From 4e51cf33fc34e8e82661b9bc3ab13858a2ffe43d Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -11,7 +11,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 358282b..8ebafb4 100644
+index 436c94b..794f098 100644
 --- a/config.c
 +++ b/config.c
 @@ -868,14 +868,6 @@ void read_config(void)
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 8c80040f91b..fb7ba56eec7 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From fd1e84c66852c2c906ee292aad942b4bfbd9e306 Mon Sep 17 00:00:00 2001
+From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -39,10 +39,10 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index de108a8..0fd9ef0 100644
+index 37f0d00..c93cfb5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -33,6 +33,33 @@ AC_CANONICAL_TARGET
+@@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.46.bb b/meta/recipes-devtools/mtools/mtools_4.0.47.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.46.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.47.bb
index 11737186623..70d65796213 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.46.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.47.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0"
+SRC_URI[sha256sum] = "31aa06078cc3f50591b95e71a909c56dd179d87e9cbdc07bf435e595bd7cc7ff"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \

