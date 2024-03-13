Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34640C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2086.1710351225644240257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gfRSmBbj;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-413eee75912so737415e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351224; x=1710956024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gV7x00QVXe6syCxmLZUoF0YPhJ7GlcG+nbzxn77yilM=;
        b=gfRSmBbjUcut5cWbfV9tPUeguAoq/lC9bm4V7uQDrvWO26XzjGdjtjH5rs2vILRxmF
         cIMjqCfFuGt2bxxhostT70cLEhiDlu/bT7Kts9kH11xOmSmAwP/H3XyIZkvnGEb5jBPN
         /ujKBVcQxPDp2xgsbeliQAlabhRDvx/lManfU/+GOhhb64+30D47div8JF3SxCR6AO0o
         MdmIN/g88fzq9rLBFkcDw+B89X3oL6U7nx4Zmdmait79Ddmyhq8WN6CFWho7SdDJRuM/
         lAceHHPqWhTkIMgImiMTK7BsM5XlToUjimYm/RqpWIkMe/u1pQ5kKXqv2cHIBA9cnYp3
         ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351224; x=1710956024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gV7x00QVXe6syCxmLZUoF0YPhJ7GlcG+nbzxn77yilM=;
        b=ELYdqH60J8iuuncf0OnZwsBVNBGeoij7tNTLq9HnDqRXg4bQTUYopoEIluH9wpBrPc
         KjHFAN1ZMUzjC9YDh9c3NyHfTfA21d16G3PB+B1UFnEs1/eV6AA6u3tRO01U4KyWWvwd
         jDppXSxHH/KcZvw6aNLvbW/TeQIGcfNE/rDv9HXLxSfg/sbg6mw13jg8EgBjArAUK+MS
         pI9MrNOrBR0KKOmvz+oIcIdbqz3/GKyAXt9yqhMO29s2SomvGaACTyvBv8i5W4oDGxRW
         TLdzyVMadL8kikq69KHzg+amtIm931f/slZLXDg2crkFUA4iuXscNUY+JSnbKTHFElA9
         qOLQ==
X-Gm-Message-State: AOJu0YwwQ/TCRCNnUIcB+96WBhGTR3QaO5DkX/axoWniX1rAMvNEMDkG
	wKBCpnQaFdWVYmGXLsrIhgL0WItaaJ2wVoUebiE1eLPHDY8GclqQKjXx3V24
X-Google-Smtp-Source: AGHT+IE+HvyWs8jWnjr+3mzt+c++Eo2MlMxo8wO68RK527IkGamX1l0sLsbC8VpQrg33eQdEuOV8PA==
X-Received: by 2002:a05:600c:1553:b0:412:b41a:53a2 with SMTP id f19-20020a05600c155300b00412b41a53a2mr501369wmg.2.1710351223943;
        Wed, 13 Mar 2024 10:33:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/21] icu: update 74-1 -> 74-2
Date: Wed, 13 Mar 2024 18:33:22 +0100
Message-Id: <20240313173336.3900178-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197059

Note that upstream has re-spun the release tarball (the initial tarball had a broken symlink
for LICENSE file), so there can be yocto premirror checksum mismatches:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6671/steps/13/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch | 11 ++++-------
 .../icu/icu/0001-icu-Added-armeb-support.patch        |  9 ++++-----
 meta/recipes-support/icu/icu/fix-install-manx.patch   |  7 +++----
 meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} |  4 ++--
 4 files changed, 13 insertions(+), 18 deletions(-)
 rename meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} (96%)

diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
index 2968d571bb3..c0e9e2806b4 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
+From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
@@ -7,14 +7,14 @@ Upstream-Status: Inappropriate [ OE Configuration ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- source/config/mh-linux |    2 +-
+ config/mh-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config/mh-linux b/config/mh-linux
-index 366f0cc..2689aab 100644
+index 53d6780..b622513 100644
 --- a/config/mh-linux
 +++ b/config/mh-linux
-@@ -21,7 +21,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
+@@ -23,7 +23,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
  LD_RPATH_PRE = -Wl,-rpath,
  
  ## These are the library specific LDFLAGS
@@ -23,6 +23,3 @@ index 366f0cc..2689aab 100644
  
  ## Compiler switch to embed a library name
  # The initial tab in the next line is to prevent icu-config from reading it.
--- 
-1.7.10.4
-
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 578517b57fb..a25285fb541 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From e3c25af4b40d64f098e7b8ae5a91fdc3c90163c4 Mon Sep 17 00:00:00 2001
+From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
@@ -8,16 +8,15 @@ Make icu support arm32 BE.
 Upstream-Status: Pending
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-
 ---
  i18n/double-conversion-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
-index 7f23e0a..7f89094 100644
+diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+index 303668f..7d859dc 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
-@@ -115,7 +115,7 @@ int main(int argc, char** argv) {
+@@ -146,7 +146,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "correct" section.
  #if defined(_M_X64) || defined(__x86_64__) || \
diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 925b064ebd5..7526bde3702 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -1,4 +1,4 @@
-From a6ddabc8cadb76bfe2d2e374a6702442cfe51cce Mon Sep 17 00:00:00 2001
+From 2d544cac238eccbfc32cafc9502ddf6e00994211 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 9 Oct 2015 17:50:41 +0100
 Subject: [PATCH] icu: fix install race
@@ -13,13 +13,12 @@ in the install command.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
- source/Makefile.in | 8 ++++----
+ Makefile.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index be9435b..ada20d7 100644
+index 8366f01..79b91c9 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -77,7 +77,7 @@ EXTRA_DATA =
diff --git a/meta/recipes-support/icu/icu_74-1.bb b/meta/recipes-support/icu/icu_74-2.bb
similarity index 96%
rename from meta/recipes-support/icu/icu_74-1.bb
rename to meta/recipes-support/icu/icu_74-2.bb
index 88ded166b52..8352bf2a5b4 100644
--- a/meta/recipes-support/icu/icu_74-1.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -111,8 +111,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "86ce8e60681972e60e4dcb2490c697463fcec60dd400a5f9bffba26d0b52b8d0"
-SRC_URI[data.sha256sum] = "67d5ab39c5187e1dd0fed60a3fe52794dce9784b4c045cb85e19f5d317fd783f"
+SRC_URI[code.sha256sum] = "68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c"
+SRC_URI[data.sha256sum] = "c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.39.2


