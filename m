Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E27C282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:13:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.15812.1741875219218806278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ymn4xPza;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso6837525e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741875217; x=1742480017; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5htScLa71ypGe8w0grKuCOeDdk0zWky/U4v9up9V8SU=;
        b=Ymn4xPzacu3f+Y8826+NM8nje3Chz4WE8QcCeB0ONfTmnA6olEd5dl17hxQTg6SS0H
         Q007tJHOcZiM+KRKHgY1LZbfiCbvHcUvA2gC4qovLdrykts8ygh6t5PO16JsXVoq9uRL
         2373Q9og9wHN7WZyeozrt/p9xu6pRUmk5Gd0eCHsF8ycVXsQwtUSb3tD11TMJcKOATCh
         RufvCEeK2EJ9YFdkFzprV4Cd3xzSSNc9dO2ETAb+CTkaSv3MKtMl9iOAM//v/kmLWQ+l
         Q1Gx7cjOk+hmapgxIxmjL7N5j6nlfCzOXiwXcOjsr6Tts225AJXXVNzJ24jXW0J4h4Cu
         /MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875217; x=1742480017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5htScLa71ypGe8w0grKuCOeDdk0zWky/U4v9up9V8SU=;
        b=WwvdtVL1xoeEnnsvw3QUWPqil9ze3HJLfBDuQ18Rb7+dMVeHuQjx1xW+LuMtv01thu
         +l8RmtxTJTSh9s+xwHgBUwBUifZ2cgT76243UhUYKVYtTf12b4BTiusW2EDLt+zAFcQI
         da6kXXo5/K+RyWpHrFn6krCwZcdzyLN/aLXN9G3aEmG6E7+zWpQxBJcVuBQ7wAWI2sVC
         XVdfklF0UoizTXx1jCeFU3ToBe1ri68SVD0p6+okOL6/r5+pJpq1bG/zCrXPLVne+l9u
         mxF7S0UXX2pAZ0VnQ6cqYrdnJzR4KHvQREt4QyAeZSRfXaX1uHyaHvzreefMnPkVJ7RB
         /L+A==
X-Gm-Message-State: AOJu0Yy1/BZQxSS4Kh057dqrQXaQe1tZ30mlcGSaHR/kLSqH+oz/YgKF
	aYJ9FAV1O2zF2ufoxx9lc2kKKoI+CKtB3hE8gACGPHhJL1VBdsFqOTwsbaCE
X-Gm-Gg: ASbGncvGO4TghR81b4cwsteInJpUKWU/FgzoqJ+yjiD0p7NiFvYOeDvnX9gD/uDBdeF
	VriW/R1IWOOSEm+dF3olHfL274f6Cdk4pBnnOyuErcvVNFwxaSrfM8gQkkfxM9hgn2Fwx9jFhoR
	eiySvz6HCI2UjgrFITxhurIzCq/nojfYjGKHVxv/Z65s+URzYANEXMvgyB25LceX/mtXl4yxhAz
	fZRR/xGLUM7c7uV9Or/pVEk7XaCppDXAzwTwGF0ktcb+z+an+S/0QQwW9mQMOUksawpXgaqQm3Q
	x3pxHLXPmvCkGQSjWkiMxbOfRBRu5xrOeR7xnMMdCMug2DprsdGhpRcvP2bo9i8918+kL8DzLYN
	Et+HaA3VVx08=
X-Google-Smtp-Source: AGHT+IHCnoM/Z2jBbnxrfDyy242Ca9fkOeLb6GLA2z9bBRGJyleYuquW0Tv4mzPdrlpxeJFUKTSlrw==
X-Received: by 2002:a05:600c:4e88:b0:43c:f4b3:b08b with SMTP id 5b1f17b1804b1-43cf4b3b368mr146756375e9.3.1741875216901;
        Thu, 13 Mar 2025 07:13:36 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c613sm21845565e9.40.2025.03.13.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:13:36 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 14:13:22 +0000
Subject: [PATCH OE-Core v3 2/4] scdoc: Upgrade 1.11.2 -> 1.11.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-kmod-v3-2-a8b5d73c83a5@gmail.com>
References: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
In-Reply-To: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212773

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


