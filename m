Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42571C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:58:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.10301.1741856325954584455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 01:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dHqfAM3O;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43948021a45so5625155e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741856324; x=1742461124; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GNYrSHe6bcaa3yIMeds4psdenBqjFUJ660LrJ9iawM=;
        b=dHqfAM3O6bC4ed56NH/QfrAlW3KLci7MkFV+B6aX2NYfeOTONAKyqsAYuDawmBVBtm
         nSk3mx2mlysUvGXj6SWkL9x3vNZmdRLi2ptSHeQC2kVwdNgxPRp2IXV3Cn2RnE1QRDHS
         4CIGWcXkAyP3u1yq1M23pt+NmbTUY+oFqMuttTgLmPMSnAIsat2TILfjLogrMsenOOqY
         L7EgLyyO5UHuaPveKuUuShNr8bzW/G6MIVBm5LK0VQWlFNkqwhpcgHiknaTdhJF/KVQz
         fSF34yRleMn2zZecD5k58sjRD4NEBRvBJLoAIbKjHBJk5ZNmq9YS7Ahbl/dopA9XSt5q
         eHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856324; x=1742461124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GNYrSHe6bcaa3yIMeds4psdenBqjFUJ660LrJ9iawM=;
        b=OgNxC/N2EOBRAkwj9+IThxJN4GgvKmzCJZAk4pGzh6GwRT/hmxUgYuesEksGFu1r/q
         s9989WD8Fga6myegigz/JNhOAy+cFCWQ3A5zxrd/O95k3NoSAogQQJNTUwJHbWQpfl2Z
         NxvMYRFMfz5Q/5xior3m+s4f0XZxr9G28Aih/cN+Ch1fbbtb3MEZr4K432KGItsdm5jj
         CsY4NpFCIjX9jG4m3BFpqyfVks87zbP+3yRqeR5V2dWukZSLTQRd7iy/ZYXn/4Tsi1rJ
         EpMXgY3QNyrZwA/sfbUCSB5mbnmSjcsh3pnZlhphjF5+IUKNFGXLLYRn4XYWfblXxyp0
         tzbQ==
X-Gm-Message-State: AOJu0YyFWHA/1lNh7v3IxTGydNEFTUNRqG8Db5DR4NPtGlLPTizAoy9I
	MzfSjx0KEdDiy/QX2+hufEZh8VyZeB+iZ1sNQ+kt3eews6v+5LbIK70sYHPh
X-Gm-Gg: ASbGnctvVGjaUB/6b7hOIiwhGaHidZJYd38sXHp394TeXQNwtWHdizYKsiAGKW4pb/P
	6OpKn/PGrpA4HCowIw4qgfHQuLhZsc/K/ITM3K6rmKjQ/zWoG6zRiFlAv4VHtoSH0BzXr70gCHC
	Ae/2jQZCFRqaIFfENqUIbPluAYslWzjxO7nlE8I0Qpt/UFG+el/AHSByaCsRW3SMF8eunGctoWa
	JTnyb5Nf5N2oZ0iAq/zj2SoOUC3bJ1UY/xQYFJh8YI/hnzZxl94wHhvL9g6cT+ukemsvSxqZl9p
	LcP4DiybdXiacl8y86YZ5hs5cwj7TnYtkweef0oKO1GX/+lpkvs6xbdUlwPQ+STI4BXTtTLjMJG
	bSF1572ZWqws=
X-Google-Smtp-Source: AGHT+IEJ4ZDPLHc8SyWGsSW1Pv1kArLp4/74xTRT12j9X4MTBVG4tPjVcREyU3tWSw/qpyYQhk1XoQ==
X-Received: by 2002:a05:600c:524d:b0:43c:f470:75df with SMTP id 5b1f17b1804b1-43cf470797emr136356095e9.3.1741856323654;
        Thu, 13 Mar 2025 01:58:43 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c2dasm12978845e9.33.2025.03.13.01.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:58:43 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 08:58:34 +0000
Subject: [PATCH OE-Core v2 2/4] scdoc: Upgrade 1.11.2 -> 1.11.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-upgrade-kmod-v2-2-2103ca9a26ad@gmail.com>
References: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
In-Reply-To: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212751

Drop "dont add -static to LDFLAGS" patch as this is now upstream.

Changes:
	Dimitry Andric (1):
	      Fix clang 15 -Wstrict-prototypes warnings

	Drew DeVault (3):
	      README.md: mention system packages
	      Update version to 1.11.3
	      Makefile: drop -static

	Eli Schwartz (2):
	      remove useless re-declarations of standard functions
	      get rid of some unused includes

	Humm (3):
	      use .PP for paragraph breaks
	      scdoc(1), scdoc(5): follow conventions more closely
	      simplify list output

	Kirill Chibisov (1):
	      Emit \(ti and \(ha instead of ~ and ^

	Max Schillinger (1):
	      fix formatting of escaped backticks

	Nico Wagner (1):
	      Makefile: remove unnecessary path separator

	Simon Branch (2):
	      scdoc.5: fix capitalization of subsection headers
	      scdoc.5: fix formatting in the preamble

	Simon Ser (1):
	      man: add section about SOURCE_DATE_EPOCH

	Viacheslav Kruglov (1):
	      Fix logical error in comparison with ULONG_MAX

	elij (1):
	      strip indentation after a hard line break `++`

	jturtle (1):
	      Emit '\e' instead of '\\'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-Makefile-dont-add-static-to-LDFLAGS.patch | 27 ----------------------
 .../scdoc/{scdoc_git.bb => scdoc_1.11.3.bb}        | 21 ++++++++---------
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
deleted file mode 100644
index b520e949c0b31c0908118cba4f6c2b6ea26f5a26..0000000000000000000000000000000000000000
--- a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2cac433806d9622dbc005fe5738f1ae8c33a98cb Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Thu, 13 Jul 2023 19:26:40 +0200
-Subject: [PATCH] Makefile: dont add -static to LDFLAGS
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Inappropriate [oe-specific]
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 60a80b8..49021fa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,7 +1,6 @@
- VERSION=1.11.2
- CFLAGS?=-g
- MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
--LDFLAGS+=-static
- INCLUDE+=-Iinclude
- PREFIX?=/usr/local
- BINDIR?=$(PREFIX)/bin
--- 
-2.39.3
-
diff --git a/meta/recipes-extended/scdoc/scdoc_git.bb b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
similarity index 54%
rename from meta/recipes-extended/scdoc/scdoc_git.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.3.bb
index 224e5417342e9db820456ec54476a1e3cac0e4e4..330d4e426f6e552e37214fffea244659eb8e4dcf 100644
--- a/meta/recipes-extended/scdoc/scdoc_git.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
@@ -5,21 +5,18 @@ SECTION = "base/doc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 
-SRC_URI = " \
-	git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
-	file://0001-Makefile-dont-add-static-to-LDFLAGS.patch \
-"
-
 DEPENDS = "scdoc-native"
 
-S = "${WORKDIR}/git"
-PV = "1.11.2"
-SRCREV = "afeda241f3f9b2c27e461f32d9c2a704ab82ef61"
+PV .= "+git"
 
-EXTRA_OEMAKE:class-native = "PREFIX=${prefix}"
-EXTRA_OEMAKE:class-target = "PREFIX=${prefix} HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
+SRCREV = "29306d8dde650f5ac2bcc067f3c1d3bcfcac7a1d"
+
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-	
-BBCLASSEXTEND = "native"
 
+EXTRA_OEMAKE = "PREFIX=${prefix}"
+EXTRA_OEMAKE:append:class-target = " HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+
+BBCLASSEXTEND = "native"

-- 
2.25.1


