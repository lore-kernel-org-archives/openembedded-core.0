Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9EEC41513
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.11100.1715858819253337612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCWWElPG;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59b81d087aso268733366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858818; x=1716463618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1oA3iariMK4JfLWR6dP+yY5YqbzWQVAKZD+0tDRFqA=;
        b=lCWWElPGEHrNNwHHQBt7Ykn71tZg9caxX8ouqc9wrcvEL6ZJpdnKWEeT43RVruAexk
         wNK5JYheV2GJ6FIompq8DdPZLuYBxZNoP09AqpW2NwEPqZ/mH6aSPzbf9cAP5E2XcxAG
         8r0tcbRjekp97EUJRo7VV7vMszSRCNRX1sr9IKTBjWATog/QVyrCvhOVVgkxaE5KpQLu
         9w368ebkSsScBa4q+sJhKbfPw1HYL6TbbZZP9qcN+Cdj/G7Yip/jhZHHNTqmi6QSdxkR
         3qGILSaH/4kNB5bZ2vYYIxlazhnkbl6HfMGc10IBjdVIO5TFN5pfNIAnkzlSlW2EaEVr
         KWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858818; x=1716463618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1oA3iariMK4JfLWR6dP+yY5YqbzWQVAKZD+0tDRFqA=;
        b=b7IlyZw/ntc/mlOxFP6EJ2ZkAm1vkImA0XzgKHVS+KQeNisLOkfZGsLILBHKcDmEmU
         aGEE/xzwOAAMN18Ll3Bo6e5BTY+Z+0IYV0M6LNhs8BEFnRtfcs/WVurz8nAmvX74VZbJ
         rEyTkcOLDK7NM7xuossllfpCQeM2pe+CHQ25ESC0d89H/kn90nNGi4YOuRe0opJ2c1rk
         vl7iwIReJYV2Dy21BWlmBmMDtA7RymfmqELiCBxFZFr7dXz6Ysqa8M4561RrA5yb/IZC
         Dv0ng5Ps9za6JuICA1ebfIjLlETDUBrvfKsDE6Ylu8gkXxqb3KtSAAtdZcv2euQ7L3O/
         AucA==
X-Gm-Message-State: AOJu0YzsmlrRSjBijT1a8Y4F80bC4tati6scno13nfQ1cwyG9hlCUjsc
	7g1fxMBuXKqgzNRslzDpXE0PPtVMnQGZPS32qLduQFYefyrJZYeGvpX4EA==
X-Google-Smtp-Source: AGHT+IHqRM+RozIXBAcxpNAK7/juMqmpfHRjAnLLjCYcx7fjCz+8MpRFj3XL2AtJpVfJW95JMOrNnw==
X-Received: by 2002:a17:906:741:b0:a5b:f7b2:485a with SMTP id a640c23a62f3a-a5bf7b248e2mr486797966b.30.1715858817627;
        Thu, 16 May 2024 04:26:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/13] iptables: submit 0001-configure-Add-option-to-enable-disable-libnfnetlink.patch upstream
Date: Thu, 16 May 2024 13:26:36 +0200
Message-Id: <20240516112640.2145789-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199476

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ption-to-enable-disable-libnfnetlink.patch | 44 +++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
index 8824bf2af7e..0fe22615119 100644
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
@@ -1,22 +1,24 @@
-From 0096c854d5015918ed154dccb3ad472fd06c1010 Mon Sep 17 00:00:00 2001
+From 653db8b938166db7833135f615b90c38a3f27a30 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 21 Feb 2017 11:16:31 +0200
+Date: Thu, 25 Apr 2024 10:51:02 +0200
 Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
 
-This changes the configure behaviour from autodetecting
-for libnfnetlink to having an option to disable it explicitly
-
-Upstream-Status: Pending
+Default behavior (autodetecting) does not change, but specifying
+either option would explicitly disable or enable libnfnetlink support,
+and if the library is not found in the latter case, ./configure will error
+out.
 
+Upstream-Status: Backport [https://git.netfilter.org/iptables/commit/?id=653db8b938166db7833135f615b90c38a3f27a30]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Phil Sutter <phil@nwl.cc>
 ---
- configure.ac | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
+ configure.ac | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d99fa3b..d607772 100644
+index d99fa3b9..2293702b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -63,6 +63,9 @@ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
@@ -25,21 +27,27 @@ index d99fa3b..d607772 100644
  	[enable_nftables="$enableval"], [enable_nftables="yes"])
 +AC_ARG_ENABLE([libnfnetlink],
 +    AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
-+    [enable_libnfnetlink="$enableval"], [enable_libnfnetlink="yes"])
++    [enable_libnfnetlink="$enableval"], [enable_libnfnetlink="auto"])
  AC_ARG_ENABLE([connlabel],
  	AS_HELP_STRING([--disable-connlabel],
  	[Do not build libnetfilter_conntrack]),
-@@ -113,9 +116,10 @@ AM_CONDITIONAL([ENABLE_SYNCONF], [test "$enable_nfsynproxy" = "yes"])
+@@ -113,8 +116,14 @@ AM_CONDITIONAL([ENABLE_SYNCONF], [test "$enable_nfsynproxy" = "yes"])
  AM_CONDITIONAL([ENABLE_NFTABLES], [test "$enable_nftables" = "yes"])
  AM_CONDITIONAL([ENABLE_CONNLABEL], [test "$enable_connlabel" = "yes"])
  
 -PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
 -	[nfnetlink=1], [nfnetlink=0])
--AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "$nfnetlink" = 1])
-+AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
-+    PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0])
-+    ])
-+AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "x$enable_libnfnetlink" = "xyes"])
++# If specified explicitly on the command line, error out when library was not found
++# Otherwise, disable and continue
++AS_IF([test "x$enable_libnfnetlink" = "xyes"],
++	[PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
++			   [nfnetlink=1])],
++      [test "x$enable_libnfnetlink" = "xauto"],
++	[PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
++			   [nfnetlink=1], [nfnetlink=0])])
+ AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "$nfnetlink" = 1])
  
  if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
- 	PKG_CHECK_MODULES([libpcap], [libpcap], [], [
+-- 
+2.39.2
+
-- 
2.39.2


