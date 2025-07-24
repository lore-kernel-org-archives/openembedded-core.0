Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB05C87FCC
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.5258.1753392966666665841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UQjHLVDk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747e41d5469so1672537b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392966; x=1753997766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwwUi9JuNSH19d7iE1Oeh8hYS90Xyi53paCrizCwBBI=;
        b=UQjHLVDkxmsPrdKeOAouwQc5YhRXZmYDFb6GMGq7tZgdoiO4Mibhg95Wug0jPtlo+w
         OqgK0ekZEeLChGNpMq0SIUrqSjazfgQ1Q+hSPI3guqWzxqH2JwmHPoYPHudhiZZ3hL+g
         eF7eNS0LrK0CuyywBjGKscY01G6kHkQYf5DQnkeNO6KPKFRJe7h3id0Uz+VvG+Z66Lgf
         UePYN5450cVjOr1A3A5ApQO3gqrXe0cbEaaCLkSlfqMfyTYjjYA1FWW7W+AUaFCWouHB
         iYxmitU5N1Y0rxqGPPodmCYzVLA047Vl62xM7nLo+4ySqKKUA6Ck9TegeSCrgH2qurM1
         khzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392966; x=1753997766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwwUi9JuNSH19d7iE1Oeh8hYS90Xyi53paCrizCwBBI=;
        b=p6zYqa9XNJcl6iflytdcC7JmMVn7PZ9q9yKRkqtzngywXqPMJeMb5b0JDMeFlU1BJp
         AukxxruzLu5Rriyu8E5/tXPFmh0DeR0R4gppN1DoWO1HaUbUuzX5h8dmkLPwV4R9mHj5
         SV0SUAbMbJTHvLLZLQo0YDWCPAGMoc22oqHWIXM9SBSJXgqOKfnooO9YQCfJKehUuJax
         uPC9Lt/JWZsDJbqghl2u8SRSxEp//JK0rrHnp7XRuXuwN5v7rOQmDwwERIQXQk2dsrqO
         K2BHcbNRlvakKXGC+kmeELPS1ZcFhPcSExDmk5DqgXp8xKO37NP2m1MNxKsydyG5OvKG
         lftQ==
X-Gm-Message-State: AOJu0YwMWQl/jqUeUxSAAvSMHFOrt3zuisPKTHbEqAuoDFAx0iE0bzqa
	i8aJI7hLddsriTOyz18tkTkovA8N76ro8kkmlHvgguns0dsnmhLqcR8uHtHmGpNGsXzR7JyDDSR
	pWeIy
X-Gm-Gg: ASbGncsnc5pshRYkEd2XPafKXGyyLmFAaIWdZwwm1K71ZC+NhrCz4CAq50Gf4wwhBTy
	mwms1WeYjPaOsOs6qvQyEU2y+dbq/1YOgOT3mhIycMJuRWw1abi0Sxkicgc8SgwlND7LenZ1sUB
	aYO9vUc6dZT0DPPmpMXcMJfhJUok8f3vZaiKTleQ8bIknWdo6X/tAAmTjz8t6mzbckWoVrj+NIY
	j1o1ZSOHw6lJYhyi9Fhe4XAdXXJojeYuQBjNZyRREN+NL/pt7P9zVbv/zygm7qXbBUuw4VVJYCn
	pE01+fL9QOe+IeApWNuL8w+H63Q+5wMVDrkV4aRm90MVyHMbO9M0Fi1RwP4psH9s6C87ONU3m4D
	Jcg6VmlGBXiuWxai9j7OKaZ8=
X-Google-Smtp-Source: AGHT+IFeUSYk0E737fDPOKoe3A9t1/n2XR9RgHYnkwa/HjCylITq1M4KIbuz+urjK7SUxdWm7TMazA==
X-Received: by 2002:a05:6a20:5491:b0:23d:54c1:f1c2 with SMTP id adf61e73a8af0-23d54c1f3b2mr8361920637.23.1753392965894;
        Thu, 24 Jul 2025 14:36:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:36:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/16] mtools: upgrade 4.0.46 -> 4.0.47
Date: Thu, 24 Jul 2025 14:35:30 -0700
Message-ID: <831d873ead2d38af1461a3b12b70d17528d10aba.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220887

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 14ef270cc003646e6ca97ff3405507f2b9e92736)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 4 ++--
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb}           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 1420d84b86..2f3c452420 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
+From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1bed4e7614..1b3c3e003d 100644
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
index 8c80040f91..fb7ba56eec 100644
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
index 1173718662..70d6579621 100644
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
-- 
2.43.0


