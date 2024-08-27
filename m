Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9DDC54732
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.70874.1724736244797555225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b8trJ3bB;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so4856821a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736243; x=1725341043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrGq5Z08bz85LLFk917HjMDADsTg9Wgb1dL3OmMLdqo=;
        b=b8trJ3bBqQY0q4DkiWPbe1WQOxpSzaI6S3OLary4pPdLhvZPyu2lkJLLcFhC4KHW99
         H4mvVR9/wdZOgYeSR7dkq3vBrPFAFLOZXcFVvKl+HBE/0A6lEgbVAU+Ym9ZuWOVy4+2e
         +dZZX9SQdjkP8j7/hlwPw+EsIHZDJJ18vN56SPU/FEPNu7AgDVY9jFR/pHfRXFNZUZls
         CcT4eehi4fG67ywUrdinrSDlcCc0M6PTJMHViqWdEcu9/Hz72Ypc4ZOx3ZmSWauy3Pa7
         DsVIpHIPfx1LXh9rSQM3xJul6RUrhXlr4kD/naVskp2n1M/nYQxe0TbyCejQ591+hPSZ
         xhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736243; x=1725341043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrGq5Z08bz85LLFk917HjMDADsTg9Wgb1dL3OmMLdqo=;
        b=mNISm1GfyK8p8gdLXru6n4MqiwBQi0/4Nn16UEetZ6Pr+4pwwmUewHhx0cZ+p78Rsd
         +lXTZgkeb8sXN5l573i4rmqoQ4bIxGXeGhqwTVPB79VsrcCSjsON2vRWKi5rpjPX5Lvp
         6ytCCl25jAAVgElCFvVkAoOGjni3wsQN/6UCZM44WEx5sohsrksc9m5jsdcfDzAjBWAH
         tDHsLEP+3t5r6I8Ikv2ioaxJKpgh4UFlju7IZRUZIcd0efrPoYUZg5FytZXQvjxTx/QB
         TK49HLrdFpSAaEkU198JugIslWTmfL5a/xlxxnurBhJzPIg6Af10X076HDjtFpjipICv
         xMGQ==
X-Gm-Message-State: AOJu0YzKQJzXM7SULQlINPhjnWOPRZ6W2MIk5BD+roDA5ddWwn0WSva6
	CjrzsbOtHQhAq5iKR6zFqtu0Yb9h6gGIGJCZobLDhqcqK3zJakJYPfzjSA==
X-Google-Smtp-Source: AGHT+IFdTgePXiKz4CnlIL0E9TfO2EYgXCdMCUxFPNRS8F4pO8hAOBs4zGPvkwlO4r/f8R1FnCc7Wg==
X-Received: by 2002:a17:907:2d8e:b0:a86:83f9:bc1f with SMTP id a640c23a62f3a-a86a54de2cdmr746558166b.61.1724736242541;
        Mon, 26 Aug 2024 22:24:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/34] perlcross: update 1.5.2 -> 1.6
Date: Tue, 27 Aug 2024 07:23:29 +0200
Message-Id: <20240827052354.1319810-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203785

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ile-check-the-file-if-patched-or-not.patch |  3 +-
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  9 ++--
 .../perl-cross/files/determinism.patch        | 41 +++++++++++--------
 .../{perlcross_1.5.2.bb => perlcross_1.6.bb}  |  2 +-
 4 files changed, 29 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.2.bb => perlcross_1.6.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 4e9153ebf10..7efee733c67 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -1,4 +1,4 @@
-From 3eb33dce6e3c93e1b3efcc9649f871100adada30 Mon Sep 17 00:00:00 2001
+From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
@@ -9,7 +9,6 @@ one time.
 Upstream-Status: Inappropriate (OE-specific)
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index 6c3f08c4324..6d387fe66a0 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
@@ -1,4 +1,4 @@
-From f824cbec9ac8f113a4ae35d57bd18625d415a71b Mon Sep 17 00:00:00 2001
+From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 01644cd..be811a7 100644
+index 4b80079..c6d6042 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -180,7 +180,7 @@ endif
+@@ -191,7 +191,7 @@ endif
  
  ifeq ($(useshrplib),true)
  $(LIBPERL):
@@ -22,6 +22,3 @@ index 01644cd..be811a7 100644
  else
  $(LIBPERL):
  	$(AR) cru $@ $(filter %$o,$^)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
index e9bf752bcb6..29de36cbafb 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -1,4 +1,7 @@
-Fixes to make the perl build reproducible:
+From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 5 Feb 2020 23:54:02 +0000
+Subject: [PATCH] Fixes to make the perl build reproducible:
 
 a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
    whether the shell is bash or dash which can cause the test result to be incorrect.
@@ -8,7 +11,7 @@ b) Sort the order of the module lists from configure_mods.sh since otherwise
    the result isn't the same leading to makefile differences.
    Reported upstream: https://github.com/arsv/perl-cross/issues/88
 
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
    there for good measure)
    This needs to go to upstream perl (not done)
 
@@ -20,12 +23,26 @@ RP 2020/2/7
 
 Upstream-Status: Pending [75% submitted]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+---
+ cnf/configure         | 2 +-
+ cnf/configure_mods.sh | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: perl-5.30.1/cnf/configure_mods.sh
-===================================================================
---- perl-5.30.1.orig/cnf/configure_mods.sh
-+++ perl-5.30.1/cnf/configure_mods.sh
-@@ -82,7 +82,7 @@ extonlyif() {
+diff --git a/cnf/configure b/cnf/configure
+index 2f451c6..86bc865 100755
+--- a/cnf/configure
++++ b/cnf/configure
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ base=${0%/*}; test -z "$base" && base=.
+ 
+diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh
+index d4ef5a7..8e88b48 100644
+--- a/cnf/configure_mods.sh
++++ b/cnf/configure_mods.sh
+@@ -108,7 +108,7 @@ extonlyif() {
  }
  
  definetrimspaces() {
@@ -34,13 +51,3 @@ Index: perl-5.30.1/cnf/configure_mods.sh
  	define $1 "$v"
  }
  
-Index: perl-5.30.1/cnf/configure
-===================================================================
---- perl-5.30.1.orig/cnf/configure
-+++ perl-5.30.1/cnf/configure
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- 
- base=${0%/*}; test -z "$base" && base=.
- 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.bb
index 48bda7e4b6f..34d9236cabd 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
+SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.39.2


