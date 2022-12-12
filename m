Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE43C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 21:03:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.56062.1670878987154918742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 13:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ovFpQzD/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d3so13379470plr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 13:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpEqw6BzS8EOgriTbOHpcnFRcgWq1QGEU3nBR6YMuQQ=;
        b=ovFpQzD/AU5uuIQeLGlufrZ0JhJJpIeYjxpBM827j/lquJhRCPo7oPGquz+JEkaMNa
         uaEUbO3RZeJgME8QSpRASRiz5Ufl2JapTVdZDzoN0gM4SUeJXG5q5W8xLJ/31ZOJtdsb
         Pza9wf0FZDL58w7XtjHDnUbfvbgV6pP8Kudl5xyfniyotU7ol9r1x7OZbDCT3CAjENGG
         IwO02d62lA8lT2nUQuSXdz8o9DEk/1HFdolPMWvYfgWhT6PWOqzO17dl/niYm0Pdx+NN
         5u27W4zVx4XbtB+kSL5z3DCX0s02SvmcmdRJPkAIbOBKTewHJFGizErVGpV7aNCY6Xwy
         9VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpEqw6BzS8EOgriTbOHpcnFRcgWq1QGEU3nBR6YMuQQ=;
        b=I/HeTvuuoTjlDZrD7/n8B6h3TtvAd3I91qHTmsfMA2gSgt5Kg2/y0xPgYGRCGU/mgE
         6OGj/iCXzFX0CZjrntsJ1sFEOD9GoNqlSowUGfikReb36e9yEkEvSbWA8mpoGBiv/xXX
         bmTXmcsioDLCufsEgqeltC5qcxI4CsDruggsCwNLx0uZ8vWW8qoc1TTNQZJXX56GoJh2
         kXehuNXp3CuuJCS+T/scDyJL+iGgK++qq6ON8jqZtv3TlidWzzFAfX/Cl4+IG2MDXWQp
         Nmrxv51EXTocz937F9YMMiEqf4jPyY+0134XIzkubBRzKiqbsL39UJdP6BzRcxuZnaTu
         w7wQ==
X-Gm-Message-State: ANoB5pmLM4w0WlKxxKBWxY0VN+9X2QKdpD1QMmbZMzzSeno17ssQ4PMQ
	Bzvmi/dmASDuvVfF4cKys7dAgAx6zKY=
X-Google-Smtp-Source: AA0mqf5P4I8mRR6ysISP/Hybwvu7RCHGM8MjsgCZxuZk99j3IDYBNoKFoWxK75DSH4ZK4qa6OwG9AA==
X-Received: by 2002:a17:903:2446:b0:189:a50d:2a40 with SMTP id l6-20020a170903244600b00189a50d2a40mr23244883pls.45.1670878985972;
        Mon, 12 Dec 2022 13:03:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b00186c54188b4sm6842987pla.240.2022.12.12.13.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 13:03:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] rpcsvc-proto: Use autoconf knob to enable largefile support
Date: Mon, 12 Dec 2022 13:03:02 -0800
Message-Id: <20221212210303.3756051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 21:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174502

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpcsvc-proto/rpcsvc-proto.bb              |  3 +-
 ...FILE-macro-to-control-largefile-supp.patch | 80 +++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index dd7bd2b1be..00919a3d70 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -21,7 +21,8 @@ SRCREV = "71e0a12c04d130a78674ac6309eefffa6ecee612"
 
 SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
-          "
+           file://0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch \
+           "
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
new file mode 100644
index 0000000000..f07866d55a
--- /dev/null
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
@@ -0,0 +1,80 @@
+From 6820c53c3952f78185beb59f767c372fc745dcf3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Dec 2022 21:42:59 -0800
+Subject: [PATCH] Use AC_SYS_LARGEFILE macro to control largefile support
+
+The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=64
+where necessary to ensure that off_t and all interfaces using off_t
+are 64bit, even on 32bit systems.
+
+replace stat64 by equivalent stat struct/func
+
+Upstream-Status: Accepted [https://github.com/thkukuk/rpcsvc-proto/pull/15]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac      |  1 +
+ rpcgen/rpc_main.c | 16 +++++-----------
+ 2 files changed, 6 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bacc2fb..a9fc730 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -8,6 +8,7 @@ AC_PREFIX_DEFAULT(/usr)
+ AC_SUBST(PACKAGE)
+ AC_SUBST(VERSION)
+ 
++AC_SYS_LARGEFILE
+ AC_PROG_CC
+ AC_GNU_SOURCE
+ AM_PROG_CC_C_O
+diff --git a/rpcgen/rpc_main.c b/rpcgen/rpc_main.c
+index 277adc6..fd7dea9 100644
+--- a/rpcgen/rpc_main.c
++++ b/rpcgen/rpc_main.c
+@@ -62,12 +62,6 @@
+ #define EXTEND	1		/* alias for TRUE */
+ #define DONT_EXTEND	0	/* alias for FALSE */
+ 
+-#ifdef __APPLE__
+-# if __DARWIN_ONLY_64_BIT_INO_T
+-#  define stat64 stat
+-# endif
+-#endif
+-
+ struct commandline
+   {
+     int cflag;			/* xdr C routines */
+@@ -337,9 +331,9 @@ clear_args (void)
+ static void
+ find_cpp (void)
+ {
+-  struct stat64 buf;
++  struct stat buf;
+ 
+-  if (stat64 (CPP, &buf) == 0)
++  if (stat (CPP, &buf) == 0)
+     return;
+ 
+   if (cppDefined) /* user specified cpp but it does not exist */
+@@ -1125,17 +1119,17 @@ putarg (int whereto, const char *cp)
+ static void
+ checkfiles (const char *infile, const char *outfile)
+ {
+-  struct stat64 buf;
++  struct stat buf;
+ 
+   if (infile)			/* infile ! = NULL */
+-    if (stat64 (infile, &buf) < 0)
++    if (stat (infile, &buf) < 0)
+       {
+ 	perror (infile);
+ 	crash ();
+       }
+   if (outfile)
+     {
+-      if (stat64 (outfile, &buf) < 0)
++      if (stat (outfile, &buf) < 0)
+ 	return;			/* file does not exist */
+       else
+ 	{
-- 
2.39.0


