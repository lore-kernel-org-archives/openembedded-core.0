Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D34C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:31:57 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.168815.1783406609196890867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 23:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PIwjLuHq;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b1f588471so33914571fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783406607; x=1784011407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdwWPzt2er04OHTn3I77LZBMgy//KHOAlfed78VT3UY=;
        b=PIwjLuHqKq6Ee3JT7klXozFcMEj/VHG5kRImUM6P//2SZzmdL9JrXQ16884qlOSdNN
         INkpeWToXxtw9ZoA+xa0RTDhnA0E65JVuiSR23qC4mfcbEH8IO5NT47wyHiNAbWvNTzm
         goh47xovY/OgQBZNW5Ac6uG41nwOougRjY+j4INcQK+4rttr0cZ3NA2NDq0BmvTGdlAC
         Pu/acLN4LAeKIMxK3yBctFtGOF4IynXgMo0DoO5IPlaEfK8SuDr3SC3P5YHw0L21L5ZX
         y0NCfHitePVvoZhe34dbmdDJFgKAbrXGI3n0k06wU0lusos3AXttAaJ1DlRB+KzV7pAU
         O+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406607; x=1784011407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdwWPzt2er04OHTn3I77LZBMgy//KHOAlfed78VT3UY=;
        b=tCu9Trv5U4UZjM5i7/U5tC19fx+RmyTRsYihF+yN9fEuTWzW2/OPp+fTeTBI+7HmcG
         hRFYG/J6ELHeMKJ55TBlv5vP+z3bcWFgZDV1uLIvBc1hQqGkhKAaMJJZSC1tup1M9glg
         POLBNWwsr8bUGLlXMTCWiNOv402Llj6eAd0P/dpUfFIbuNzF9pjGX9nQ8xs5pGmPkb0L
         Yi/fU8c7mzX78dBBX7CkSY+PC7geFLoIuhS7GoLEw9E6g07a6aUYR5qGyxTLuOlC3DIv
         2jD/brvCbSbjWUaUmsnVS7TzBPHXvw/FgC3HcajGq3jzDWrKgZa9XPWcSwCFLqou1L15
         VXEw==
X-Gm-Message-State: AOJu0YxiQOTC+jeTZ4aQgdbUJTSq7bpdjlvMmy6dv46Jgs/5PLt77eC7
	rQDI3l2sHLYqlwtfYzaNKOZWRt0FwvCYeZY3U4Os6QVu/oDRyp9KaY7M3bvi2w==
X-Gm-Gg: AfdE7clfiI4WwEm7tKVdF9R9HTwnyo18Dx+gRyODxWU0Khs+pBfhONcutyK2XHsSmin
	JNTk4KJ/1Rjhyt8LpBHwit89UHc3d3UNZwVc73M8z4x2KVt/eD+pLrxGe2W/kSrw+IIZtMu82/O
	Tv6LdX+gXcql09/yVHQmyib66ovEh17aWJY60OLYW64woOgF+fkVPUm6Ez79QI929Oyi6NkT0Ar
	3EfLKGVLLCo0goxRcwXceFN8LWkqtbdQ2FxMf2wjHXIXHR93T/5FrabwxOtxKxjGj+JH1jxUKns
	ozCbw7CsvhGSMvLgK9Ku+8plrR5Kc0tL7umdspT7HDzceY6qLIDqX2NoR1+Su8A4UHfs+vfQDLd
	3HS5tqiCQovaBpBIfpsOSf07ud2TRT5NXurFOg4FuAmY/M9D5MJO6QhFCF7oIqCDuv6C9kkg4/p
	BaZ7tWxAR50QSvyhUmNEoEgD95i9Umh5Yq6zk7SCY=
X-Received: by 2002:a05:6512:39d1:b0:5ae:b5a9:6e86 with SMTP id 2adb3069b0e04-5b007c452e8mr821771e87.52.1783406606913;
        Mon, 06 Jul 2026 23:43:26 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8a85sm3445156e87.79.2026.07.06.23.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:43:25 -0700 (PDT)
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] libgcrypt: upgrade 1.10.3 -> 1.10.4
Date: Tue,  7 Jul 2026 08:43:01 +0200
Message-ID: <20260707064301.32102-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240363

Release notes are here:
https://dev.gnupg.org/T8233.html
Update contains fix for CVE-2026-41989 and because of building error patch need to be
updated to fix compile flags in new version.

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
v3:
 - Correct patch file name to be the same as patch title
v2:
 - Added new patch to fix building error with '-O2' in sysroot path for libgcrypt 1.10.4, patch
   was taken from wrynose and backported.

 ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
 ...r-handle-substitution-in-sed-command.patch | 49 ++++++++++++++
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  4 +-
 3 files changed, 51 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index dee4969f35..0000000000
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
index 0000000000..35c7527e83
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
index 3d49d586bb..96e3a692b6 100644
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
 
-- 
2.47.3


