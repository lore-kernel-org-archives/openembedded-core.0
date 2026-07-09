Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0FBC44513
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5896.1783591637633991338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mmnT81b9;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso6352315e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591636; x=1784196436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t6REyVUFqq3ti33XFhlR6bYoJYZxmwB2dQUi4WnXh7Q=;
        b=mmnT81b9J2x825LTpfUXHKKN7knrX2z+8AAnzqi3ULT1B7MvtuQmaUi9m9xO44Md6H
         bsp8lK1NVFcgE1XCbgIUTIjZ6I5MEPtXSSycHKwYFxgxZChz+CApDiBpEpoSgXlF2KEu
         kwZUcfBD84+E1kAKdgPb1qsOENePslxdIK/jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591636; x=1784196436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t6REyVUFqq3ti33XFhlR6bYoJYZxmwB2dQUi4WnXh7Q=;
        b=PE+LAV2qqHB8AqrSkRPd9b1qjnirpUWkObahTNHkddkkKbRzI9CzahrGPG6bYUX0tp
         Qg9hBqVvB27/m5aRXlMOZIqU7zLTdu+b9IJmLtjyqc1XwE+McdfUezcosDSy8y/KbyUw
         vXPBkTUR+TrHdnKKk5BZ+D08DAAUpu64fbxRhofmQP4a1P63PBB/p9ft/ZZlmbZfxMny
         YdOEDVSQtfXNsftuwtDXW5duYrmZfNR6Arzq6U/z1K0gtUWuZKw+J5ZM2TuZaGOudAB1
         zrruq/Ch4Eu3FTrMiIGpKx3UHsutoqWeaSOdiQeK8ANXrnevuErlNDS4DeyrNvQ1jLd9
         bG0A==
X-Gm-Message-State: AOJu0Yx88DCJdyxlRDtKx/9e94hXhETy/KzVtCO8Jw0Zu+e48p/n1FFO
	G3I+qXtBZ2eyJ9IZx1XUE8XzBDf6GndT/4ifn/LUPI841wnYSHwJo+6GTlCd12hatSSTGVqOuqO
	sd9rj/vs=
X-Gm-Gg: AfdE7ckK4n0JNVKGUmRAWhJQ+5CmKwAxrHD4/WEgkaMN/mdmpn6qq7LZvcIeMYgvcE1
	WgmL26lopn08YwaHLXhn8LYNd60REz3PS6lLHeOOfO8VFMEq1sYdSF4ACQKVfx4sK/gGlmzmBYS
	hSV6zJDUjhc1aALER0Ko1du7yaLhccfcU8Z4RrH9uJBaTbs9hJi1RLLCtVo7DksV15dy/Z7wm+a
	v6MyDC1DL4BqXl+8y6KGfnR5OKVaZDggsq89ZI9pZnvZ77uIrmAOxuBKivH7pn8EwBmI4mQQlNh
	M2Ur5t7vM9w0ow++E3hhBn7MHTqGT48oFTTgqRKo4Rbz1GTadQjUjt4fqV+1xuGoUinZ2HRb6zj
	A9/EPV123c2loMUlTVKgNE5QChCJ+h98d5zZlJW7LYjfS8IyhR75gLtDPHAJfDtG3yWISAECPG+
	B+IRnmnNteNozzdZkiOmrfhk/xWdK812hs8X5rpGgIKNPJMQc/sMuX32D0fD1gQXUPgMGX8hZVM
	Ek7sIC1aESLHzyvsA==
X-Received: by 2002:a05:600c:a44:b0:493:c35c:b4d1 with SMTP id 5b1f17b1804b1-493e6898b47mr65970265e9.7.1783591635774;
        Thu, 09 Jul 2026 03:07:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/25] libgcrypt: upgrade 1.10.3 -> 1.10.4
Date: Thu,  9 Jul 2026 12:06:40 +0200
Message-ID: <e2f9d6db6a0aa3b807afcba2f713ee6f08947437.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240571

From: Jakub Szczudlo <jakubszczudlo40@gmail.com>

Release notes are here:
https://dev.gnupg.org/T8233.html
Update contains fix for CVE-2026-41989 and because of building error patch need to be
updated to fix compile flags in new version.

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
[YC: upgrades contains
"mpi/ec-inline: refactor i386 assembly to reduce register usage" which
looks like optimisation but it is actually a fix for a build failure.
See: https://dev.gnupg.org/T6892.html]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
 ...r-handle-substitution-in-sed-command.patch | 49 ++++++++++++++
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  4 +-
 3 files changed, 51 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index dee4969f35e..00000000000
--- a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
-From: "simit.ghane" <simit.ghane@lge.com>
-Date: Tue, 7 May 2024 14:09:03 +0530
-Subject: [PATCH] Fix building error with '-O2' in sysroot path
-
-* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
-* random/Makefile.am (o_flag_munging): Ditto.
---
-
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
-respectively when compiling cipher and random in the filesystem
-paths as well if they happen to contain '-O2' or '-Ofast
-
-If we are cross compiling libgcrypt and sysroot contains such
-characters, we would
-get compile errors because the sysroot path has been modified.
-
-Fix this by adding blank spaces and tabs before the original matching
-pattern in the sed command.
-
-Signed-off-by: simit.ghane <simit.ghane@lge.com>
-
-ChangeLog entries added by wk
-
-Note that there is also the configure option --disable-O-flag-munging;
-see the README.
-
-Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123cc18454c74]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- cipher/Makefile.am | 2 +-
- random/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index 2c39586e..a914ed2b 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
- else
- o_flag_munging = cat
- endif
-diff --git a/random/Makefile.am b/random/Makefile.am
-index 0c935a05..340df38a 100644
---- a/random/Makefile.am
-+++ b/random/Makefile.am
-@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
- 
- # The rndjent module needs to be compiled without optimization.  */
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
- else
- o_flag_munging = cat
- endif
--- 
-2.44.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch b/meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch
new file mode 100644
index 00000000000..35c7527e835
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch
@@ -0,0 +1,49 @@
+From e96df0c82e086bf348753d2d0fa37fa6191b4b14 Mon Sep 17 00:00:00 2001
+From: "simit.ghane" <simit.ghane@lge.com>
+Date: Tue, 11 Jun 2024 07:22:28 +0530
+Subject: [PATCH] random:cipher: handle substitution in sed command
+
+Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/e96df0c82e086bf348753d2d0fa37fa6191b4b14]
+
+* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
+expression.
+* random/Makefile.am (o_flag_munging): Likewise.
+--
+
+It was there earlier and accidentally removed from
+Makefile.am of cipher and random
+
+Signed-off-by: simit.ghane <simit.ghane@lge.com>
+[jk: add changelog to commit message]
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+---
+ cipher/Makefile.am | 2 +-
+ random/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/Makefile.am b/cipher/Makefile.am
+index ea9014cc98..149c9f2101 100644
+--- a/cipher/Makefile.am
++++ b/cipher/Makefile.am
+@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
+ 
+ 
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
+ else
+ o_flag_munging = cat
+ endif
+diff --git a/random/Makefile.am b/random/Makefile.am
+index c7100ef8b8..a42e430649 100644
+--- a/random/Makefile.am
++++ b/random/Makefile.am
+@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
+ 
+ # The rndjent module needs to be compiled without optimization.  */
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
+ else
+ o_flag_munging = cat
+ endif
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
index 3d49d586bb7..96e3a692b6f 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
@@ -25,9 +25,9 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
+           file://0002-random-cipher-handle-substitution-in-sed-command.patch \
            "
-SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
+SRC_URI[sha256sum] = "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268a6557e12908a90a0"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 

