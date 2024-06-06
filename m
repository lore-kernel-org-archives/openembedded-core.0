Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C74C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:01:24 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.20029.1717693276512392196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GfnHP7iE;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-681ad081695so943884a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717693276; x=1718298076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=70zEQmNHHtoE2ZmOX1Lzpycqxi/fIokEfHLGW53IRFA=;
        b=GfnHP7iECtv/FEZHYP6ec/GRXw0rj4YlKLr1TzPATLp75YuklcxGHa0l3RQ+KF+imv
         QutPLXLlOvmITMGN4cqV5mJkRHqITrCvI8+fux5q9WgrS5AcV1tbj2ZpvKEu2WXkXXNO
         2zpOZD726a5j07iQi/L2m7o177TDknrmBITtHvedSntUNjzisXaN2y2Xu2lbUp6QHII1
         YLeAtMeUTGzF7zZ69Wdj9QckKpB6f6EHU+yx+hPOb9RMnGhd42uTt/A4kuViKG/cr6hn
         9TT2DEpSQB/RfGr5yGtiml/xWwc3NlnLN6bNSq7DKgrhuY4hQMnVlWiCJA1CCwHaIDRA
         5Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717693276; x=1718298076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70zEQmNHHtoE2ZmOX1Lzpycqxi/fIokEfHLGW53IRFA=;
        b=CUpVrI4ikTEyxNoYPpFMP9Lol746pPxWWxzhTaeVEluuPgjs/MN1Gj9xMwZwm0qz0i
         ELMYvLNlTXlAI60Y8ZTs4pwH1h2YOTuure8xBNJhiGvvCzLq17XKfL4cBd4oabhVn8nT
         uOpljFlX0qGWrftHsaBfQY3hO0Bu/AZxv392yDu6bGPZ340EWdoUlnHgN93T3/j2O21N
         wcBYKdf5R6fwjYBwKgHcmE1W4M+571LOVc1XqtWznzUTd7lpLYw7sX4LhDMWbmfd8LoZ
         dODE0negod5rRNiIdGVEhHe+uu/PuNj3HsJhWUETSBFsGloO3uXbVXKx5tw+R2jewuBQ
         jkGw==
X-Gm-Message-State: AOJu0YyAXD7WNNurfc+OfERf5C1AoARLVAWu//LpwDu5jX4uA4HthAhX
	Up1MrrHzyK/xalFbE5lrtiMw4HmMMla5pBqyaik4KMzCXowyJLocz5QRtq0P
X-Google-Smtp-Source: AGHT+IH8XDzHFh8L9EzxmbM9qFW4pid2Imsb04IyD6DAtqI1H259YQdhIfree0XxYerZPTahA79mGA==
X-Received: by 2002:a17:90a:8e82:b0:2bd:ebd5:8bf0 with SMTP id 98e67ed59e1d1-2c2bcc61966mr88063a91.42.1717693275342;
        Thu, 06 Jun 2024 10:01:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c280639a10sm3816363a91.12.2024.06.06.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 10:01:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc: Fix wrong order of gcc include paths on musl systems
Date: Thu,  6 Jun 2024 10:01:12 -0700
Message-ID: <20240606170112.1647957-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 17:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200406

musl does not use gcc private system headers, however, the path gets
prepended since gcc driver passes -iprefix option to cc1 based on its
installation location. This starts to prefer these headers instead of
musl provided equivalent system headers which is not as per musl's
design. This patch switches prepend to append for musl systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a runtime check instead of build time check

 meta/recipes-devtools/gcc/gcc-14.1.inc        |  1 +
 ...te-include-paths-on-musl-instead-of-.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
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
index 00000000000..cbf5083085a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
@@ -0,0 +1,36 @@
+From 636cb6e700856c3d0f8b86ab408032ceeb7e5d2a Mon Sep 17 00:00:00 2001
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
+ gcc/gcc.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index 01968001c44..f0fcaebc3ae 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -6589,7 +6589,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 
+ 	      if (gcc_exec_prefix)
+ 		{
+-		  do_spec_1 ("-iprefix", 1, NULL);
++      if (OPTION_MUSL)
++		    do_spec_1 ("-idirafter", 1, NULL);
++      else
++		    do_spec_1 ("-iprefix", 1, NULL);
++
+ 		  /* Make this a separate argument.  */
+ 		  do_spec_1 (" ", 0, NULL);
+ 		  do_spec_1 (gcc_exec_prefix, 1, NULL);

