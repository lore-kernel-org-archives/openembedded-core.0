Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79070C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3366.1685672549591207499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UxY/pqDS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-652328c18d5so686181b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672555; x=1688264555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGtF5MFiAEoUXKPKWewvqkDeeqgn9RQCtTxCBeAb6yY=;
        b=UxY/pqDSbI3XCqmgdZLdFaugg4wDxZ3Euap8BlVq+YeDlPzC39N1DAC7AoXdFTXPp6
         vxon5uejlKdtYJoqGbr5NwwqJv41gS8oDKwxEnjSzeu7VtPCe//z48Mx6qmJh1fjvHYp
         bcQXxZ54rmXi2uT0Z7/AO5Q0RXyVbGNjhy1n5W5r5vGgBAActTwntLCktwSSAanwgEiB
         qQvOZyM3SWZW5QbkBKWibyWM53rwA9oJGTLrXFHYjpsnjpIGPlsRO3B5wDjs+Ur0F1Be
         YttM+MZH+x7WJl8QqElW/UP0YdWSKZeIhg04xz821epsvrdppSsMaRjAFH3gHcoKeVAW
         e5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672555; x=1688264555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGtF5MFiAEoUXKPKWewvqkDeeqgn9RQCtTxCBeAb6yY=;
        b=kll5N3qUDcAFJ7Hu/vFNaRnrVNjfufK0cw1dc443+bCOiQWeTVX2tPNMo7jtoSZYOP
         ukZh2qUNZaHTMAi84nO45PKpE0GpdcFMSe6p+Exc3h+AOUdYthvrDI6Yb3pH5b9uvXAF
         AJfO8dWjQ+/ZM377G4GuLgl3IM23tAE75SPZKEj5yVof4pj2BMfQERPZVjl4pAHScQEo
         /APtkdKwKipmV3P/WFrHWYWECIn77k6T+os+sgY/CFzKFc3DzE6wdGMHzjPpjpiDLKRb
         Kabm4cQImLFlGiaiP2feRfMlBfz9xIbdpyNJJBA9DLY4J51cfHLMxqeefgD2PB29mRHH
         J+hw==
X-Gm-Message-State: AC+VfDxOb2o+S1cph9zWudIdluf22hzaQAaFb9baAIvv3sJ2B9tmjqG2
	6E49a6a5RJcMVZMmwriyuDo1N52LH9eA4aTUEdQ=
X-Google-Smtp-Source: ACHHUZ4Mmh0KJiWq8+jZnsjqQVWZM0wzGW7tPjILy2qGryM+ITgf3lOZpPo2RnHmNNJiIqI2jEn5Lg==
X-Received: by 2002:a05:6a00:1816:b0:63b:8423:9e31 with SMTP id y22-20020a056a00181600b0063b84239e31mr9462458pfa.11.1685672554953;
        Thu, 01 Jun 2023 19:22:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/13] libgcrypt: update 1.10.1 -> 1.10.2
Date: Thu,  1 Jun 2023 16:22:06 -1000
Message-Id: <cc8e721bf14dffef240687819a907ee22f44a9c2.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182130

From: Alexander Kanavin <alex.kanavin@gmail.com>

Latest stable branch update

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fc7a39d1a16b424ab80f7463c2e1258e6ea3ab38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0001-libgcrypt-fix-m4-file-for-oe-core.patch |  6 +++---
 ...pt-fix-building-error-with-O2-in-sysroot-path.patch | 10 +++++-----
 .../{libgcrypt_1.10.1.bb => libgcrypt_1.10.2.bb}       |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.1.bb => libgcrypt_1.10.2.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index c873e24ed5..cbfa30f0ad 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 839f38e5ecc22b7f1b837284bbbffac8cb32ab1e Mon Sep 17 00:00:00 2001
+From bcfd89abdb5110b93314297120412d4c7f2da313 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
@@ -17,7 +17,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index 19d514f..21125c7 100644
+index cd4249e..e53a36f 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
 @@ -29,41 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
@@ -35,7 +35,7 @@ index 19d514f..21125c7 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"${LIBGCRYPT_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libgcrypt --exists; then
 -      LIBGCRYPT_CONFIG="$GPGRT_CONFIG libgcrypt"
 -      AC_MSG_NOTICE([Use gpgrt-config as libgcrypt-config])
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
index f9c362431c..cf9ebfb3e6 100644
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -1,4 +1,4 @@
-From 3c6c10eae0993c8ca60879494c6650f7b8f54ebe Mon Sep 17 00:00:00 2001
+From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 16 Aug 2017 10:44:41 +0800
 Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot path
@@ -25,15 +25,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index d644005..1cf5072 100644
+index c3d642b..88c883a 100644
 --- a/cipher/Makefile.am
 +++ b/cipher/Makefile.am
-@@ -147,7 +147,7 @@ gost-s-box: gost-s-box.c
+@@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
  
  
  if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sg][2-9sg]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/ -O\([2-9sg][2-9sg]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
+-o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
++o_flag_munging = sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
  else
  o_flag_munging = cat
  endif
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
index bf9d7cbd10..58f07a116d 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de"
+SRC_URI[sha256sum] = "3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_IGNORE += "CVE-2018-12433 CVE-2018-12438"
-- 
2.34.1


