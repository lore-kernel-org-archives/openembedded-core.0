Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D53DC3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.15300.1720960790782901396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dl8mQVbR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb0d88fd25so24227855ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960790; x=1721565590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=370Rb8j3cDRc2Uylsgp/Pn22qronU1odegfZRNildcE=;
        b=dl8mQVbR5oIgd5/INWyNO9yHtc9d/VDHob/7zW1ZP3Tkbo8P3zeRBw8665BAZEsX5s
         qnDbIyZ4eAx+Q43MOErmRNkXUU9QHmfrY4ZXUU6+c0CN85U2yT3kpCtcCsx0BDcjWvwM
         sqmeApZJfD6VSAOOnHq+/QT6NKjPx1eWSR3M24xr1nQ0CaqUnPgO7NxdrXx1iws1qgvr
         MjLh5g+5DysKlxZ+mM0gTBYVslQLxVFbJcSpzDxmmBbKyowOzC3ISyKRzPKkiXESZ6ci
         4FQe6X44P9V6cDaplmukufVqArkg3+wbT5UvLtslDH7tXpsv/fUHviUNfCltX68An8UC
         E6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960790; x=1721565590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=370Rb8j3cDRc2Uylsgp/Pn22qronU1odegfZRNildcE=;
        b=TrFH3xaW6fvboWRONrC7zpRIS6rFUWS/pXNpY3cCZmNM8Zo35fiyMo9VgyAACuKTTZ
         q3pAA5BIocqypga9h3xj0NjMnTaV634byAiNx0o+ee07vQKcKOqgoUvjYi24c/T/Km4w
         C1CPGLdnhtkoDpSZP23AkGH0ysXG7h/T/eXgiNtKPmanQDg1xkZ51Fhts/XsMvaYArxd
         A4MWYjeSBnN/PtD/Vu5VzitQomi5zTN3Z0kE9soWf0tnGe4/p2le8+7Xsau7fyf6EHM/
         S5oMiNSMCg8dngSHo9E8kLl4pJeW7fK8Gl17PK39YxYSWU2JmvnlhLHd6vEtCQBqCp5O
         3Sgg==
X-Gm-Message-State: AOJu0YzdoL9ggAYWaQcaWgC516yFxgas8ZHspWmO4Zo0Aoi4my/fICln
	fK4ba2g33sVbGKjfGV+Ty2yUpqMFERlH5jxNx/gd3rWkY4+oXvAIXRsyGQ2Tbgq7WpFos2d0FAe
	ebfw=
X-Google-Smtp-Source: AGHT+IF+NhYacgmG9EJFRCgQwOvLuNPZYWnRxOcEDUpby7zwPecKFAHmP4Hlzk/Km9z/16qdq0Bs8g==
X-Received: by 2002:a17:902:dac6:b0:1f9:ad91:f8d0 with SMTP id d9443c01a7336-1fbefb7b10fmr116077355ad.8.1720960789999;
        Sun, 14 Jul 2024 05:39:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/27] iptables: submit 0001-configure-Add-option-to-enable-disable-libnfnetlink.patch upstream
Date: Sun, 14 Jul 2024 05:38:53 -0700
Message-Id: <20276890b2e08512bb04206d6cc6be5867d5f8a4.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201883

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67f6c3534a18520f3b7c5eed27dc2744c5bf44c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ption-to-enable-disable-libnfnetlink.patch | 44 +++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
index 8824bf2af7..0fe2261511 100644
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
2.34.1


