Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAACC87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:45:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.26650.1753469098305077184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oNEUAfg4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23dea2e01e4so32194995ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469097; x=1754073897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwwUi9JuNSH19d7iE1Oeh8hYS90Xyi53paCrizCwBBI=;
        b=oNEUAfg4g8ht2mFf/akYzSxoIFXrGGyTWHRrENRMiAp7thLrBeFARcycwhfqr+noPv
         Aqu2k6hBFgHvbvyoL9/a3XJTJU6c98yJTA9i0ffdQkXhaCFcw0OAjjyVObR4R4To7NoN
         rbbiLqjlkeNSlOf6enIYhir0j01tiSTa/WlDe5biO8Xlp39OsjuGiwvIstDwB7kAHpab
         a4YSasgaYhqlcrtdgHoMm6awtfVfWo/wYVSBOXOc6rNbsMfFCJOpbTcd7vkZANazGGnG
         Cc0KWD8E1nSdnwtmpn9hV9kprtEvha+97GqwfRMTlYv2T6kE0dCuQh4txgX1t127J/ft
         6uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469097; x=1754073897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwwUi9JuNSH19d7iE1Oeh8hYS90Xyi53paCrizCwBBI=;
        b=KdaU3aChonb0mM8cFOaVYCQ3VxDnSMeQmcvJ/aSr7x+synxPWhoN41DLpaO8nwOdrb
         eXh99tASvxGDFFjG8ukmIPclYFUIzh+8Bwp4nIGenMmAJs3Ge7nkErTbHpXTkd0eC3R4
         RKT97CWMHSjEOQMyYsgGAR3hT6AFDn/6pjXaszi7c4QjmNZHN6dBB7Zn8pRRJZ/pSxyo
         A3vW+4LSSZzVvgyHHMzSY4n7h+ORfWDCKLYUlq1yGfURFy3qvdZcOsE2HuT2443rXEvG
         qSZSRwYURp+cXkXxvdyUsdbFsoiceOk7o0aceNnsAbbP+CMDRcustuJDD0bxJPVPb+Ki
         kGkQ==
X-Gm-Message-State: AOJu0YxknXuoOIMMmHwecNE4A2oWDNWQsj0UTmfChxXHyUnXAdrJlkV/
	/uEwCH0GL/sMJJI0PZM58Q9DBUDxYDhXj6ewbtx0Uh22ay0jSd3NKSlnvmUjBK+XpNy+9hrEw4/
	RxrRN
X-Gm-Gg: ASbGncuFZjKTVl7uzxp/oQ5shkvOhJKHQuvcPvL8kMkUX7nkYV/xBNrNwuD2/cXeZJN
	gavAxRvjy1FggWidXh3PUwTAjeAuJXP/LGXYka4ErMj7nVX/fmWdMSTwH9vxtIs4LR8Rko/PYV1
	gyHrDj5sBH7J+GhSIPKfQTDkagiCpMtalsFaxmlhbTlIJr9HlPs1xDYjCHlwzv+0BTA7dcYz2gg
	knN/UpdBdGdKY5aOx8V+HE5b7I0ZU2cnWYQWrravZ7SA8L31asjaRwmsoXM8wgsbHUWnA7mmlui
	pm+LDFM4hq9MTnl5l+If3vtvRFZTyiMG3vWXf5WV2E7D5oviNkUjQTXq5AgSxcoDrpXDPy8/3Wd
	uKE5w8NlUlBhGJg==
X-Google-Smtp-Source: AGHT+IF2LHt+D8/i7s34p3/1hYxn6QkQCBYknaBX+rgqCPQNVcmrofMtyanF+6GHixNytTbXlooj+g==
X-Received: by 2002:a17:903:2ec8:b0:235:5a9:9769 with SMTP id d9443c01a7336-23fb30aaffbmr41987455ad.25.1753469097357;
        Fri, 25 Jul 2025 11:44:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 14/16] mtools: upgrade 4.0.46 -> 4.0.47
Date: Fri, 25 Jul 2025 11:44:28 -0700
Message-ID: <cf705382534d8f5af6880511221f701a733d84d7.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220930

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


