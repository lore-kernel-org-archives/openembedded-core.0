Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412B5C35FF1
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 10:24:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.7150.1742034284389332996
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 03:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2xwTaGK;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so2668225e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 03:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742034283; x=1742639083; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5htScLa71ypGe8w0grKuCOeDdk0zWky/U4v9up9V8SU=;
        b=V2xwTaGKv6RybOigRXCefrzI3tmI57R7E7f7h7Vt/ICTRRfr+H+I0jEsSW96e778VX
         3OHgNYpshuaZdOAZOSiafpwSP7hCjZUOd7Ibg1K9BMhDYzq15pyo0l6VxCHz1x+EfFVC
         eY8ivXtR8FgA2crzGnFjZ2AS+AB5z8dzb2KWoSMyO+Tki/g1xGGKwH9gkeEkWvLRo9/I
         lLMf6/Z9qH0B0BnGmnCyygRdi+UunRlo8JE6csdO/Wb2c8T+xAlEvTNEP7re01O/rcms
         G/GXJcPP5yWEGoOpuKTk1abDcPZbUtcspA0xZmG2XkldB57/HZcfs11/XUIZp8ZwmXXF
         y39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742034283; x=1742639083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5htScLa71ypGe8w0grKuCOeDdk0zWky/U4v9up9V8SU=;
        b=AJ1NAWSYwk2tvOGIunyFzq5GGjYfBgoZAbkqBY7CBYij996UpR4D7XFxWm0ReaU0Ht
         KrM5c8v4uPx1393rGb72Os+4dsL541RlnIIvmibTFLAwaLLNt0goDKY+UiL+kq1DYq2k
         lS+5kHaLCoM2Kbr3adzuRJlbcNdvafsOMxh8OXVVZfq8e5Y1NO/WHyInMjkIUjm91o/0
         A51YyYfd5e8wOuZ8Zts/FOZbXUy3KQ0ZAH3Ve8z6DlLg/MEITWH3jciJ+jSbFv9/Y+kL
         48AmKkjYBEh5pPLR7axsyEs/74bZN68BzqcEOCnJYdm2XZz3/v8DDZFyEN2HPSuU+3m6
         4+sQ==
X-Gm-Message-State: AOJu0Yw5tsrg/kWWV+0EI4cnfcSJ8glpS43vMpUjDiO8KoANLNqDSbPT
	vMEuMGnqnjN1CNiI7xc+OzOxcFUhzZ/4V5jPeECYhiptoKh2GKPoM4550Z3t
X-Gm-Gg: ASbGncsgOLVpWsNkNFjbfXzWPj2puifvOYz8Pi34FZYMooTia6v8xSSKTeoOY7I869i
	x3AQD7hq1aRemePc5dVPtj4XcSkU16s3AQhF34aEHese+pQ5B+lSkov8wxKvvNqEZAEP7zCIZD9
	F5JG85BpPa6/R3vXqoKMRBg1vM4T1vRizkTGKNrKDmiLJ+N+3B8alvaCvooCyYy2ozGuFvg8zVW
	2zCn5lBJWbA9FPztcendNwwfsmZrjCS/zmZIRO4HzMwfC9ErLW8N47o+dipKAh6IbObftrF8C1Z
	lgcdG9VoL3p8wKdKg/OtCMZZvg0RZtPKEwe8JKP0K9n95ieFHW1lSR1dRp4YtyWEd13kfOIubGX
	35EhWFtQrRLo=
X-Google-Smtp-Source: AGHT+IHvlkXC9M0zWjb3m1QRdycvp3dWWX5lWX8PL8ghHmiqu8KzvUlZWcNeQcuePvOpS8KxjfzViA==
X-Received: by 2002:a05:600c:3c9e:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43d1f1f3fccmr75632745e9.7.1742034282337;
        Sat, 15 Mar 2025 03:24:42 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm45186145e9.9.2025.03.15.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:24:40 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 15 Mar 2025 10:24:39 +0000
Subject: [PATCH OE-Core v4 2/5] scdoc: Upgrade 1.11.2 -> 1.11.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-kmod-v4-2-946682cc4090@gmail.com>
References: <20250315-kmod-v4-0-946682cc4090@gmail.com>
In-Reply-To: <20250315-kmod-v4-0-946682cc4090@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212871

Swap static link removal patch to a backport of upstream, remove autotools
usage (this is just a Makefile recipe), fix up metadata.

Changes:
	Dimitry Andric (1):
	      Fix clang 15 -Wstrict-prototypes warnings

	Drew DeVault (2):
	      README.md: mention system packages
	      Update version to 1.11.3

	Eli Schwartz (2):
	      remove useless re-declarations of standard functions
	      get rid of some unused includes

	Humm (3):
	      use .PP for paragraph breaks
	      scdoc(1), scdoc(5): follow conventions more closely
	      simplify list output

	Max Schillinger (1):
	      fix formatting of escaped backticks

	Simon Branch (2):
	      scdoc.5: fix capitalization of subsection headers
	      scdoc.5: fix formatting in the preamble

	Simon Ser (1):
	      man: add section about SOURCE_DATE_EPOCH

	jturtle (1):
	      Emit '\e' instead of '\\'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-Makefile-dont-add-static-to-LDFLAGS.patch | 27 ----------------------
 .../scdoc/scdoc/0001-Makefile-drop-static.patch    | 23 ++++++++++++++++++
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb        | 22 ++++++++++++++++++
 meta/recipes-extended/scdoc/scdoc_git.bb           | 25 --------------------
 4 files changed, 45 insertions(+), 52 deletions(-)

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
diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
new file mode 100644
index 0000000000000000000000000000000000000000..631d06375b9dba7710d5054bc666eb6c71ec393c
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
@@ -0,0 +1,23 @@
+From 3667cced504bc40b176d4570d99a83fe67599f3a Mon Sep 17 00:00:00 2001
+From: Drew DeVault <sir@cmpwn.com>
+Date: Wed, 4 Sep 2024 10:07:46 +0200
+Subject: [PATCH] Makefile: drop -static
+
+Upstream-Status: Backport [https://git.sr.ht/~sircmpwn/scdoc/commit/3667cced504bc40b176d4570d99a83fe67599f3a]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 96ad48cd04a6..49f076aadd39 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,6 @@
+ VERSION=1.11.3
+ CFLAGS?=-g
+ MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
+-LDFLAGS+=-static
+ INCLUDE+=-Iinclude
+ PREFIX?=/usr/local
+ BINDIR?=$(PREFIX)/bin
diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
new file mode 100644
index 0000000000000000000000000000000000000000..7bbedcb66da024206445fb4061b1fa29437a7eb2
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
@@ -0,0 +1,22 @@
+SUMMARY = "scdoc is a simple man page generator for POSIX systems written in C99."
+HOMEPAGE = "https://git.sr.ht/~sircmpwn/scdoc"
+SECTION = "base/doc"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
+
+DEPENDS = "scdoc-native"
+
+SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
+           file://0001-Makefile-drop-static.patch "
+SRCREV = "0528bcb993cac6c412acd3ae2e09539e994c0a59"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+EXTRA_OEMAKE = "PREFIX=${prefix}"
+EXTRA_OEMAKE:append:class-target = " HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/scdoc/scdoc_git.bb b/meta/recipes-extended/scdoc/scdoc_git.bb
deleted file mode 100644
index 224e5417342e9db820456ec54476a1e3cac0e4e4..0000000000000000000000000000000000000000
--- a/meta/recipes-extended/scdoc/scdoc_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "scdoc is a simple man page generator for POSIX systems written in C99."
-HOMEPAGE = "https://github.com/ddevault/scdoc"
-BUGTRACKER = "https://github.com/ddevault/scdoc/issues"
-SECTION = "base/doc"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
-
-SRC_URI = " \
-	git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
-	file://0001-Makefile-dont-add-static-to-LDFLAGS.patch \
-"
-
-DEPENDS = "scdoc-native"
-
-S = "${WORKDIR}/git"
-PV = "1.11.2"
-SRCREV = "afeda241f3f9b2c27e461f32d9c2a704ab82ef61"
-
-EXTRA_OEMAKE:class-native = "PREFIX=${prefix}"
-EXTRA_OEMAKE:class-target = "PREFIX=${prefix} HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
-
-inherit autotools-brokensep
-	
-BBCLASSEXTEND = "native"
-

-- 
2.25.1


