Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA720C352A8
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.1112.1649350858308931319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mus/ks3C;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n6so12088649ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P4udSBcdjtC5jQd+4XWN9Tsf3DQM5rnbkBGsQkiEv6s=;
        b=Mus/ks3CMfc3jR5WUyrM2+R9aXT1qq4mB8FRD3k6dKpcwZUMduMN/lZVjWhgz78sNu
         IXVtQ/HbHfLobsOZeYDs43deTFe+niDkMPHlIp3BbO0UFaVVffy00v3ZMOJt6csx6glE
         J0K94G5iBfxndjhjQT3HomngzmCZ7Dp+SGblo/KPAdQwzbuBSO5ijhopmO6WaPmjoDWP
         4ciOTWhf4lq7XcSL/c7tpa2tY6QiSvDtndh7elQ1eibkHy5FrKe7hQnbymbzVkwGwupV
         UWPH1eDNAr6GZyuM1ZK7mb9YfOZhrPFnMtIR+PkdHluClIgsRlOe7JKAR5vpXgulltFy
         9IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P4udSBcdjtC5jQd+4XWN9Tsf3DQM5rnbkBGsQkiEv6s=;
        b=MzFFswm3NL7KHznQgy2QcYN+3dKkmpiAO9SzS+QjZ0f9FsaKavMjiLrq7PZW6cDD8K
         s3Y9MUQIkr9sdXY8HFr0dtg1MVfq5zXc23G6vkAsk2/3l5xWV7+8hKaBQBXJZQTmevAG
         oHC20ziXE7CVp82HA7bcaeyg5mzYwvmnVDeZOL5SWAiDRNxcaf7uApeQ9ZzhTYZl9bg4
         i+/Tn1ycNqUY3Gy7hVj0R+wGoSa3Q2zLbz13k+fegsWxA7gyagw0u1prBE3yTPe7u7t5
         Kkwr34TtdwYMe7CISfch1M7nGHZc5+PuspSR8DYyMKnYe2sLCTGFHzqA24o6CxbFXizA
         4H9Q==
X-Gm-Message-State: AOAM530XARHqMsLHXmRfa9uDWELCDn2pZBPd5HplOCXzNz/Xn0uuB56X
	CnlZ+AAEzMbaoha2JkakayD7dAFCa+c=
X-Google-Smtp-Source: 
 ABdhPJxsg9lxffJo3IRKRYeAbDQTQq0rxx5K0uUvrWeLe3gfwwNAIGugSEFnOWRii7ixczBfMHxSkw==
X-Received: by 2002:a17:907:6296:b0:6da:745b:7b40 with SMTP id
 nd22-20020a170907629600b006da745b7b40mr14610494ejc.750.1649350856792;
        Thu, 07 Apr 2022 10:00:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/17] libgcrypt: upgrade 1.9.4 -> 1.10.1
Date: Thu,  7 Apr 2022 19:00:27 +0200
Message-Id: <20220407170029.3500874-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164131

License-Update: formatting

Add another chunk to pthread fixing patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile.am-add-a-missing-space.patch | 41 -------------------
 ...m-fix-undefined-reference-to-pthread.patch | 19 ++++++---
 ...libgcrypt_1.9.4.bb => libgcrypt_1.10.1.bb} |  5 +--
 3 files changed, 16 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.4.bb => libgcrypt_1.10.1.bb} (90%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch b/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
deleted file mode 100644
index 62b7484e45..0000000000
--- a/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b8192ff67ed46ea2cc4282fa1856ce2868223737 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 24 Feb 2021 19:43:07 +0000
-Subject: [PATCH] Makefile.am: add a missing space
-
-Upstream-Status: Submitted [by email to gniibe@fsij.org,gcrypt-devel@gnupg.org]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- cipher/Makefile.am | 2 +-
- doc/Makefile.am    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index 1cf5072..b3ca225 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -143,7 +143,7 @@ gost-sb.h: gost-s-box
- 
- gost-s-box: gost-s-box.c
- 	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) \
--	    $(CPPFLAGS_FOR_BUILD)-o $@ $(srcdir)/gost-s-box.c
-+	    $(CPPFLAGS_FOR_BUILD) -o $@ $(srcdir)/gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index fd7aac2..1703bd9 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -43,7 +43,7 @@ man_MANS = $(myman_pages)
- 
- yat2m: yat2m.c
- 	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) \
--	    $(CPPFLAGS_FOR_BUILD)-o $@ $(srcdir)/yat2m.c
-+	    $(CPPFLAGS_FOR_BUILD) -o $@ $(srcdir)/yat2m.c
- 
- .fig.png:
- 	fig2dev -L png `test -f '$<' || echo '$(srcdir)/'`$< $@
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 5bf0c7f8a3..4233fa7877 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From cb06d218ee36e303a64f27c690f30040d5d87960 Mon Sep 17 00:00:00 2001
+From 9182bc2dc676858a823c477d8f45a578b8c4f69f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 12 Jun 2016 04:44:29 -0400
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -11,14 +11,14 @@ Upstream-Status: Pending
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 ---
- tests/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ tests/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ab201f0..1cf82d0 100644
+index e6953fd..f47e1d3 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -75,7 +75,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -76,7 +76,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -27,3 +27,12 @@ index ab201f0..1cf82d0 100644
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
+@@ -95,7 +95,7 @@ else
+ xtestsuite_libs = ../src/.libs/libgcrypt.so*
+ xtestsuite_driver = testdrv
+ t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
+-t_kdf_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
++t_kdf_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
+ endif
+ 
+ # xcheck uses our new testdrv instead of the automake test runner.
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
similarity index 90%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
index 866f3932f6..251e0d0348 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -14,7 +14,7 @@ LICENSE:dumpsexp-dev = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://LICENSES;md5=42fa35a25e138166cc40588387f9159d \
+                    file://LICENSES;md5=ef545b6cc717747072616519a1256d69 \
                     "
 
 DEPENDS = "libgpg-error"
@@ -25,9 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
-           file://0001-Makefile.am-add-a-missing-space.patch \
            "
-SRC_URI[sha256sum] = "ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7"
+SRC_URI[sha256sum] = "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_IGNORE += "CVE-2018-12433 CVE-2018-12438"
-- 
2.30.2


