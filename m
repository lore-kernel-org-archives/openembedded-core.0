Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84333E64AA3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.19393.1733233073217804286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3XyYKnOs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215b13e9ccbso14733715ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233072; x=1733837872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sc+6J8dtxcssvs9qglvuanq1v0hscFAqytw3JPRcvqg=;
        b=3XyYKnOsZemoYzWcPNzBvcyfCXz2LdcnUtJj3CemC1LznjGOC8n1PY3L5sz4boNc48
         GsbN5nqitDiCXJiMNfoVSFxpJwAIT/VWDRMBPQStX6OrXGrKGxOyhL9T+4fVjJRA6mXY
         B71a4o0cVvuF/FK5ano9F8Mmuc8lVdFWeepg769B9CsZp0JHzPALTcnIxe2AClt9TTFJ
         aV8OeFxTYGZsIu3QvPdHLmcb3cgi/mTrMFjQKlKenR5hY1AsldgT4pJdLG8QV8aXhqcS
         F8w/a4UCTHtt9xa+7HSgTZPyTgfxpAqb3sI6P2adZN7YAcuc8pJZ+PSYI1AH68uGpctU
         8fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233072; x=1733837872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sc+6J8dtxcssvs9qglvuanq1v0hscFAqytw3JPRcvqg=;
        b=IB6lgUgShz2coLtsP5Ckygd3mBZ+EwOrpQb9B1aDRzbhG2bVb+M6wGhD41EjEKAhhq
         lFfXYehxU3HO3skGhz6du9WAWqe3U9rRKEiRsbuxcC9HThaNd4u0n/5hisaHpwjqVscT
         TM5mEMBrp/v/s9w/UaVbjBVFOquf8i13YK9q02hu5c7AcwyVyer9lDhT/r1gtluB/GKD
         +M1rMmUpgl7rkmxBotcSeN2KhCBFdskOyeGhyzfMtTOSnoP6juZKaROJcUh3maJIUzSm
         +Z0/nS/0l/YsPwjcRNbrNLuKIGqwHgisDsnb/0boAFrmkIUNdTVf07JSOgRAWjUZL0zB
         e8aQ==
X-Gm-Message-State: AOJu0Yz2pYUySKergqAKgtsdxp7D7+8eWjFG8Rf3nflO7kOhC8kMyBSD
	/f2IKK7WoKfa71K1BUdAcIoakdGQgjAOgUqUwLGeU2M3utZdiYlL0YWhgJ3jYJp9cqMox6TZh08
	E
X-Gm-Gg: ASbGncsDrgsUWcCVbMl6WsOsmkTPjzGg0CUMXAKQJtJ/u3vjZwz4xP1AKrvm3dPGcEk
	+jhthWAazq71LkAPchd8VIO4tmPVQzhJpSvE2d9IhltC9r27QQwCY9IcWNemfsoxuK9crtc+wua
	WG6QAcLmjGmiS743J+QSpaPFmIQsGSYUdgv29Jd/rlI63ATrrJGgaWd88G2OfFiN2PcgpYc4HUB
	rHU2Mo48d94K/1plnqx6KWt91p+ankZQwIw/10=
X-Google-Smtp-Source: AGHT+IHBBPcBCMHbSAwNKfqjeY+/WcY3Ct3iBWv0b2jH88GMzsd1/dSlp+Nym7HG9qNVeiWmGng8LA==
X-Received: by 2002:a17:902:dad1:b0:215:5d8c:7e4d with SMTP id d9443c01a7336-215bd181de7mr31460255ad.54.1733233072455;
        Tue, 03 Dec 2024 05:37:52 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/16] libgcrypt: Fix building error with '-O2' in sysroot path
Date: Tue,  3 Dec 2024 05:37:18 -0800
Message-Id: <c091ae2c6d45a95f0707b649bbe556275420e5e9.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208203

From: Robert Yang <liezhi.yang@windriver.com>

* Backport a patch to fix:
$ . oe-init-build-env build-O2
$ bitbake libgcrypt
random/rndjent.c:40:10: fatal error: stdio.h: No such file or directory

* Remove 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch which
  is fixed by the backported patch.

Note, master branch's libgcrypt_1.11.0.bb has already fixed this problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ilding-error-with-O2-in-sysroot-path.patch | 64 +++++++++++++++++++
 ...ilding-error-with-O2-in-sysroot-path.patch | 39 -----------
 .../libgcrypt/libgcrypt_1.10.3.bb             |  2 +-
 3 files changed, 65 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
new file mode 100644
index 0000000000..dee4969f35
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
@@ -0,0 +1,64 @@
+From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
+From: "simit.ghane" <simit.ghane@lge.com>
+Date: Tue, 7 May 2024 14:09:03 +0530
+Subject: [PATCH] Fix building error with '-O2' in sysroot path
+
+* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
+* random/Makefile.am (o_flag_munging): Ditto.
+--
+
+Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
+respectively when compiling cipher and random in the filesystem
+paths as well if they happen to contain '-O2' or '-Ofast
+
+If we are cross compiling libgcrypt and sysroot contains such
+characters, we would
+get compile errors because the sysroot path has been modified.
+
+Fix this by adding blank spaces and tabs before the original matching
+pattern in the sed command.
+
+Signed-off-by: simit.ghane <simit.ghane@lge.com>
+
+ChangeLog entries added by wk
+
+Note that there is also the configure option --disable-O-flag-munging;
+see the README.
+
+Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123cc18454c74]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ cipher/Makefile.am | 2 +-
+ random/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/Makefile.am b/cipher/Makefile.am
+index 2c39586e..a914ed2b 100644
+--- a/cipher/Makefile.am
++++ b/cipher/Makefile.am
+@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
+ 
+ 
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
+ else
+ o_flag_munging = cat
+ endif
+diff --git a/random/Makefile.am b/random/Makefile.am
+index 0c935a05..340df38a 100644
+--- a/random/Makefile.am
++++ b/random/Makefile.am
+@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
+ 
+ # The rndjent module needs to be compiled without optimization.  */
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
+ else
+ o_flag_munging = cat
+ endif
+-- 
+2.44.1
+
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index cf9ebfb3e6..0000000000
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 16 Aug 2017 10:44:41 +0800
-Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot path
-
-Upstream-Status: Pending
-
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
-compiling cipher.
-If we are cross compiling libgcrypt and sysroot contains such
-characters, we would
-get compile errors because the sysroot path has been modified.
-
-Fix this by adding blank spaces before and after the original matching
-pattern in the
-sed command.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Rebase to 1.8.0
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- cipher/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index c3d642b..88c883a 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
- else
- o_flag_munging = cat
- endif
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 5a76201ab5..3d49d586bb 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -21,11 +21,11 @@ DEPENDS = "libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
-           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
+           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
            "
 SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
 
-- 
2.34.1


