Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE2FCD4F3E
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:30 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.62096.1725485601511822602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hKxhNUsv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d8f06c2459so33786a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485596; x=1726090396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMAiQIdBuxWRGKRRhqAwgLjTxkdFww86iMA0tjH6eZc=;
        b=hKxhNUsvyIjeKuUy4ef3cSAryAkCrKjja3DoHyvV4b3VGi6ebJ0jYaHCk9sgP78O8b
         uCzWJqfUMbG30Wf7KSlDX4/zNAZEzEiMKN5EcH7ok6HP7yg17aQgT/VAu05Vstz/HGH/
         fGVzBqaMhCdFQp4i2b0thle8WPYdbChk1zumFNEq4/xkjhLPoAaiRPp+/2ix6Scg7mL9
         AUQY0dGoK6OQobSNJnyWETYxhCdqMGMwLNt8Fe/KjDvaznOCQ8y1Y08rG9zifDzCUHv7
         OrlgbEHTyKgL9rFAkhJ0uTNDsyH5raNPlcF6ihsGwEXjzbHfUIJ18y2yDVlI0Jzpx4r/
         DePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485596; x=1726090396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMAiQIdBuxWRGKRRhqAwgLjTxkdFww86iMA0tjH6eZc=;
        b=ihYgmqXOuGHIcvFV5Xrn9ZlGwbzNoUijyLfX1C8lI7BlMzirE7zersi3YCoge9dkgL
         VS1F6TdFLdqjQZ02/xP02oijqLFUdFoSGbSUh29LfjMuTZ3rc+r80ilnyBf+30Vh642x
         VnFC+YgknzUNYS440ntRAelgzFFk7/0FCP+oZAD5zOCG+QuKc+wAAdpAE7zxj+JkIHnM
         D/aBQxV8nRaWNYYXr7TBh5tlWGZcz9m1J6Zp5awpubxZ1KG5pMwzy9S9khnD+0duq5np
         WQ7fRQkCDb95i8mjJcGlAMVpIZqph0IVyhz+iYJ+tstpuN956uQvpu8gvjrIE0hTxneM
         uLsQ==
X-Gm-Message-State: AOJu0YzHc6ndZ328INk+bFWTyitwKSsV3tDlMxJLFeShM2GOM4OMEC5H
	0D0GYQ6Oo7Z3E8e65atKe8I8WPmNC268x+wrIJ1y4jqkAXwCDbNlQWgjJee4mL2Y1pPJCWnbg7M
	FSZQ=
X-Google-Smtp-Source: AGHT+IGD7VveeYM+igS0QRGJ0Jk4HBNSWxqRj38OGCFAx22pui13o6QOf891BusyAXpq7BTUJWrtvQ==
X-Received: by 2002:a17:90a:c28a:b0:2d8:8ead:f013 with SMTP id 98e67ed59e1d1-2da55929d85mr8242526a91.7.1725485595879;
        Wed, 04 Sep 2024 14:33:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/14] cups: upgrade 2.4.9 -> 2.4.10
Date: Wed,  4 Sep 2024 14:32:48 -0700
Message-Id: <01039c35a89de4bbd1410b3ee08a99cf325adf2b.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204221

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed error handling when reading a mixed "1setOf" attribute.
- Fixed scheduler start if there is only domain socket to listen on

0001-use-echo-only-in-init.patch
0002-don-t-try-to-run-generated-binaries.patch
0004-cups-fix-multilib-install-file-conflicts.patch
refreshed for 2.4.10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd7a978d2d7feb11f6c265ba812c8ca29912ebc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cups/cups/0001-use-echo-only-in-init.patch   | 11 ++++-------
 ...002-don-t-try-to-run-generated-binaries.patch | 16 ++++++----------
 ...ups-fix-multilib-install-file-conflicts.patch | 12 ++++--------
 .../cups/{cups_2.4.9.bb => cups_2.4.10.bb}       |  2 +-
 4 files changed, 15 insertions(+), 26 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.9.bb => cups_2.4.10.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index 80bbad0a44..e6bd400779 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,7 +1,7 @@
-From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
-Subject: [PATCH 1/4] use echo only in init
+Subject: [PATCH] use echo only in init
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scheduler/cups.sh.in b/scheduler/cups.sh.in
-index 89ac36d..6618a0f 100644
+index 74cce18..c57f0db 100644
 --- a/scheduler/cups.sh.in
 +++ b/scheduler/cups.sh.in
-@@ -50,7 +50,7 @@ case "`uname`" in
+@@ -51,7 +51,7 @@ case "`uname`" in
  		ECHO_ERROR=:
  		;;
  
@@ -22,6 +22,3 @@ index 89ac36d..6618a0f 100644
  		IS_ON=/bin/true
  		if test -f /etc/init.d/functions; then
  			. /etc/init.d/functions
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 2bc26edbfc..75270cb0cb 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,21 +1,20 @@
-From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
+From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
-Subject: [PATCH 2/4] don't try to run generated binaries
+Subject: [PATCH] don't try to run generated binaries
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
 ---
- ppdc/Makefile | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
+ ppdc/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 32e2e0b..f1478d4 100644
+index e36ed11..3fe97e1 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -186,8 +186,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+@@ -187,8 +187,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
  	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a $(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
@@ -26,6 +25,3 @@ index 32e2e0b..f1478d4 100644
  
  
  #
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index bc9260307c..d49fb8f2c2 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,7 +1,7 @@
-From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
-Subject: [PATCH 4/4] cups: fix multilib install file conflicts
+Subject: [PATCH] cups: fix multilib install file conflicts
 
 @CUPS_SERVERBIN@ is ${libdir} related that causes multilib install file
 conflict. Remove @CUPS_SERVERBIN@ from the comment line of cups-files.conf to
@@ -10,16 +10,15 @@ avoid the conflict.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  conf/cups-files.conf.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 4a78ba6..03c6582 100644
+index 93584a1..65b7052 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
@@ -28,6 +27,3 @@ index 4a78ba6..03c6582 100644
  
  # SSL/TLS keychain for the scheduler...
  #ServerKeychain @CUPS_SERVERKEYCHAIN@
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups_2.4.9.bb b/meta/recipes-extended/cups/cups_2.4.10.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.9.bb
rename to meta/recipes-extended/cups/cups_2.4.10.bb
index e0a3522004..e16ad47cf5 100644
--- a/meta/recipes-extended/cups/cups_2.4.9.bb
+++ b/meta/recipes-extended/cups/cups_2.4.10.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "38fbf4535a10554113e013d54fedda03ee88007ea6a9761d626a04e1e4489e8c"
+SRC_URI[sha256sum] = "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
-- 
2.34.1


