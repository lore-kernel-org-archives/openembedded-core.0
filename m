Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6AFC43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 17:35:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.110728.1783162603539396281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 03:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KS5KWtRK;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b27c7451so22516395e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783162602; x=1783767402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u4T2HJ1Abz04e9I+RY7bgLSGHPJ8fZARsiZK5luVbgQ=;
        b=KS5KWtRK6VQ3ZPq/awOdARRx0Gd9tdcRCNPh1RiRc9PDsSY5Hq4IiPU0MzMfsOgvod
         dxYdrWTeUL+3F9TGI9j9e0v0BNRAY5i3Zvr4tS1q5AuR4PEWKM8MkuObh1t8IyMvnlll
         1Lf11fnIq4DIPgF98p64UVExZDKDf9fImRTx37HKnO3c+IvvCyrBXvhBLkFFvJ+PrgtM
         mz2v9yCfpUbmvtkjDNbR1c9PumRbyhbMr6Urhg4PnSJKnC07hKkUQxqU0Qeo1Us9a4cV
         jACwgd1XCnonEk19K5OpPzGR3m7bRUXxg5/91rYDPrYu1h+C1jId9uRKB9nIroKzWp2o
         sOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783162602; x=1783767402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4T2HJ1Abz04e9I+RY7bgLSGHPJ8fZARsiZK5luVbgQ=;
        b=ZrA8hxlFnAOugEUIIBrb4gbRnEpSWSywyfgVtVaaNe4on4bnqTdTJ8jNGhwWkiRJh5
         Qm1rd6ZyKHjeiz0trvnZGmZwCrUiYG5oC+0bOuSgZiIkoI9FEg5TmnB121TcNxx4F3XZ
         I5KSfAtTedzdM/VvkxqWeD87olQK0y17Uu/aMuI36oPULR2PmzjvTUGYQw2Q3CAfFXQV
         BgJhFR4DmRleYkBKOfoo89vSkWpWEAvKO25zmkCTb5N1h3Ui2wJotY9CG+OtxG0fwowT
         8sjulzx7aD8jdwkv905hpqFsfFAcCozluBf9ajwuDIFFSXfZEDUV6k+BlhSV55Jy0JYN
         FSwg==
X-Gm-Message-State: AOJu0YyUJ2gSfpFrtvQvS/wbU7tzuiE7guVh+mu6oD+BbTsJWjdys5gG
	XnNl3IInvkE/x0wI3eRwPlAD/ZlUH2hU2/PR5RpwW3Hl95MZbTjeAf1khJKE8g==
X-Gm-Gg: AfdE7clgs3oU95QMMdfbb7wGZvw3KxGyaq+eBU+ljXCk0vcmFdddkH89Kse4/2J8K7A
	Sx8UhMbvKrL1ex5y5Y4bjVxQUBoNmQZEpkNnCz5G7JWXnL6yq0+yStRzsuN/AxOFZq0sisHxEi9
	1BFanGXDSBagDrqa4+aljj0bucdt5r0BEfuWB38KoLkTFwnLmAzRgjMDNRV+nWX7Y42BjuvTgtC
	p2I+3j+ghyY3z67P22liKZnsUYWbwQWxMVG7YxhsLv8LNnqapTlrBOKpc1dEJlF6L9BS6MNNuZr
	wYPDl9a/cTUWabD5CXFVOJbK6KmOvQkk2+ObWPrKBLpka/ahk6rV7R2XeIM6eUCa3unvDoeM+18
	N5chCJuZzHkNhkiq/wspc/tGqAIgHKDDklsH1nn8xU0MrkXC4RRKIrumWqMVa5xlvheybB6ebew
	buVkzLZCE43H4kBYRb73Z4HjpI9ABAcoGbLS7722Je3FExGX/LL6s/PUPjJOS/Vq3Ci8c=
X-Received: by 2002:a05:600c:4744:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493d15942f3mr25900785e9.15.1783162601509;
        Sat, 04 Jul 2026 03:56:41 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl (bge41.neoplus.adsl.tpnet.pl. [83.28.68.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ec8asm171319765e9.1.2026.07.04.03.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 03:56:41 -0700 (PDT)
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 -> 1.10.4
Date: Sat,  4 Jul 2026 12:55:23 +0200
Message-ID: <20260704105523.3264-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 17:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240132

Release notes are here:
https://dev.gnupg.org/T8233.html
Version cointains fix for CVE-2026-41989

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
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
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
index 3d49d586bb..a3b5bd06cc 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
@@ -25,9 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
            "
-SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
+SRC_URI[sha256sum] = "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268a6557e12908a90a0"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.3


