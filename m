Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87298C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 07:10:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8347.1717657810747751570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 00:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DiYXIyDb;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f4a5344ec7so4441605ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 00:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717657810; x=1718262610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/a3lteYEjd92jd2CnYbUkDeLNyuiY0Q7Ak27auQygY=;
        b=DiYXIyDbGyas64ljVqvdFdUGLwNh6cGDkFfMWZatEzSj6Ol78ALAUeiJdiEXnQkoyr
         2SeziCZMh2dKJ1Ig2PTD6G7dzvz+GA42AnIPbf39jOqE+LtOL/k6UqHx+0Z9iBRtDY4t
         rYkzdewEX9O7+cVwq2HG6jJRB+M/I7FO0nXjck5uXzZcN/O4CnGEHW24ZuTvVOlyb/XS
         MuPLoV79mTRCz+J5m0oBowind057O9fVdUFC24BWcaA9StyDhR33L0Vy0NeyvYwanduC
         8rRXqf06kY086ZaOjxHFFokt8RU5ZX5P4F2xbNcr5aZ1/5UgopWRf3iv3d7P8nz5W+j8
         pKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717657810; x=1718262610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/a3lteYEjd92jd2CnYbUkDeLNyuiY0Q7Ak27auQygY=;
        b=cStYDKbEJZ17ws9dVxWvdtCRtyQlI4bDlEgC6A4lJeqVxyA7tLNy3yTu0g+VlrhtCM
         WxF3Ts5BV6nqC8fy7GZHD0H7rXo8y1CQa1d5BM2BgcwI/Opv3RPYuMoTRH48ij9MhzTX
         /lZbW8adTO2lQmU4qrMObPlqF4fbSty0DCflYvMbBcoDtvtSD7P+jmUe+tga/dOqCvYa
         6G6JqmTrECwQhhdN8tnevxUf7Ed1rEghR0kLeLQ00gnidNjTbesuc3l7B9K42rWjTlUI
         UKjHnIv9WG3SYzQrhLyP0s9xKe0gq7jGvBh+C7eb8jktaoKTKT3mEzu7SmqYlRqxhVLr
         uX4w==
X-Gm-Message-State: AOJu0YzRI4FI0RsmqXoWGKRanFF2Sm2sa1WdflzzgjTsEkNfBXEgJDvq
	MH0kajpI0PdYfC9VVOKt6IOBo24n7wOrjjg83pYuHyOBjx1fiJubJc4z2OAV
X-Google-Smtp-Source: AGHT+IF20aCm3e/uh5g9yah3Aw1ZSK5wVyZ9g2ElWdDpxdkqYEzPwGG+qUQoFLbeNbs7GAVX5jGamA==
X-Received: by 2002:a17:902:b714:b0:1f4:8a01:285c with SMTP id d9443c01a7336-1f6b8f07596mr17750535ad.24.1717657809394;
        Thu, 06 Jun 2024 00:10:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7cce9dsm7178745ad.129.2024.06.06.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:10:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Fix wrong order of gcc include paths on musl systems
Date: Thu,  6 Jun 2024 00:10:05 -0700
Message-ID: <20240606071005.884909-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200383

musl does not use gcc private system headers, however, the path gets
prepended since gcc driver passes -iprefix option to cc1 based on its
installation location. This starts to prefer these headers instead of
musl provided equivalent system headers which is not as per musl's
design. This patch switches prepend to append for musl systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-14.1.inc        |  1 +
 ...te-include-paths-on-musl-instead-of-.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtools/gcc/gcc-14.1.inc
index b057e570f3b..c4bc4c72664 100644
--- a/meta/recipes-devtools/gcc/gcc-14.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.1.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
new file mode 100644
index 00000000000..1bcff39aa7c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
@@ -0,0 +1,35 @@
+From 30f1229a8b663ee4dc35d389acf60241a4536fb8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jun 2024 22:56:12 -0700
+Subject: [PATCH] Append GCC private include paths on musl instead of
+ prepending
+
+Musl does not need gcc private compiler headers, therefore use them
+after standard system header search paths.
+
+This fixes packages like python builds to detect the musl systems
+correclty, as it looks for musl specific stuff in stdarg.h system
+header, which is wrongly picked from gcc private headers in OE
+
+Upstream-Status: Submitted [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115368]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gcc.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index 01968001c44..d0d5c35cf83 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -6589,7 +6589,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 
+ 	      if (gcc_exec_prefix)
+ 		{
++#if DEFAULT_LIBC == LIBC_MUSL
++		  do_spec_1 ("-idirafter", 1, NULL);
++#else
+ 		  do_spec_1 ("-iprefix", 1, NULL);
++#endif
+ 		  /* Make this a separate argument.  */
+ 		  do_spec_1 (" ", 0, NULL);
+ 		  do_spec_1 (gcc_exec_prefix, 1, NULL);

