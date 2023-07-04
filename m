Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CF5EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.61476.1688484600334088706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=K0ZzRKmT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b82616c4ecso26070105ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484599; x=1691076599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXQmPeCz6aa+GIKYV0YkOBe3WEjITb+XpcQvLwHkDcY=;
        b=K0ZzRKmTSyYD3V5nzZIA97qySSonu/tm5u11Lomhl+YpwmfMqjKb5Yfpi08CUIw5qn
         ZYmvsqhP96fH/uX0LpWgwDxuvkE2Wb/ndTANZ1BiugwnkhbAS1HdmEQl++YHaczMbiZg
         tJANTag5p0Fthn29vSQNlX42T40PVNvOV6zf4f6d4Bmp/sA2XNXuh+dgRa8886JZOkmH
         Ci+o1JdBJLXGzmy3VE9ARhXcCt6IHUnHTWz40VumgiVcQGvglyMuvqcqYkvSxIdyTe1e
         EyIT8vX93qS1Cz9nYC+lqg8MzziZkQ6vZIITwcHh0dnAzi5biR4dcKVucuaibt5A806K
         E/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484599; x=1691076599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXQmPeCz6aa+GIKYV0YkOBe3WEjITb+XpcQvLwHkDcY=;
        b=FAraKsW8lxKO9VdZRRHeMaypBkePxCvcViXPa+cAhS0cRKxAnp7/kqJIQCPTmRQGGy
         Z3TdnDIs9LhNob8TbVpg0AYI4FZR8oxAQsYzBPCpMIBeYP7Az4TVcEIlMXqXs8rf1JcS
         1cn5bDAH8ZHoO8k6nKzy196nykdYquZ9v1DEOxdS8sklqzYeXHe8Fxz6wszYptuOPfKg
         CpE52XscPoLLAUfBrS6CD9ItoSkLVjgtbdv8vsR6tAnlKTgn2XvSvM0/5yxuuV4lRL1U
         zcjspT8p2xAAQJkZzhKDpfCnD+f7AELur6CWzu6vUTaO7bapMnksfceWSzO/gwXPl8Fr
         jq0g==
X-Gm-Message-State: ABy/qLYtasuYw5LooC5SwB5Avs5OJyRMMVRyZ/ivglLvMsIAjIFcMBXc
	bZM8aCnozaAQ49CnzVLLhtp50d73OsXf8y6KuaQT4A==
X-Google-Smtp-Source: APBJJlE2XCfQo6W99NA0SJUsiTYBtOP6Bd7Nfm5Xw3RRQohfYDmRgXM68V51eYIQ3L1bwNd7M8nr8w==
X-Received: by 2002:a17:902:da92:b0:1b8:1c1b:125a with SMTP id j18-20020a170902da9200b001b81c1b125amr11690115plx.2.1688484599398;
        Tue, 04 Jul 2023 08:29:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/30] rpcsvc-proto: Upgrade to 1.4.4
Date: Tue,  4 Jul 2023 05:29:12 -1000
Message-Id: <f3ce18bcc993c636c7f7ac898cd5cb2de92df8ea.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183845

From: Khem Raj <raj.khem@gmail.com>

Drop already upstreamed patch in 1.4.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1dddd4bf9bdb26069a1a0d4fcb8aeefd5761c620)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rpcsvc-proto/rpcsvc-proto.bb              |  5 +-
 ...FILE-macro-to-control-largefile-supp.patch | 80 -------------------
 .../0001-Use-cross-compiled-rpcgen.patch      | 11 +--
 3 files changed, 6 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 00919a3d70..20933153a3 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,13 +15,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.4.3"
+PV = "1.4.4"
 
-SRCREV = "71e0a12c04d130a78674ac6309eefffa6ecee612"
+SRCREV = "c65926005e50da02a4da3e26abc42eded36cd19d"
 
 SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
-           file://0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
deleted file mode 100644
index f07866d55a..0000000000
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 6820c53c3952f78185beb59f767c372fc745dcf3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 11 Dec 2022 21:42:59 -0800
-Subject: [PATCH] Use AC_SYS_LARGEFILE macro to control largefile support
-
-The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=64
-where necessary to ensure that off_t and all interfaces using off_t
-are 64bit, even on 32bit systems.
-
-replace stat64 by equivalent stat struct/func
-
-Upstream-Status: Accepted [https://github.com/thkukuk/rpcsvc-proto/pull/15]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac      |  1 +
- rpcgen/rpc_main.c | 16 +++++-----------
- 2 files changed, 6 insertions(+), 11 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bacc2fb..a9fc730 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -8,6 +8,7 @@ AC_PREFIX_DEFAULT(/usr)
- AC_SUBST(PACKAGE)
- AC_SUBST(VERSION)
- 
-+AC_SYS_LARGEFILE
- AC_PROG_CC
- AC_GNU_SOURCE
- AM_PROG_CC_C_O
-diff --git a/rpcgen/rpc_main.c b/rpcgen/rpc_main.c
-index 277adc6..fd7dea9 100644
---- a/rpcgen/rpc_main.c
-+++ b/rpcgen/rpc_main.c
-@@ -62,12 +62,6 @@
- #define EXTEND	1		/* alias for TRUE */
- #define DONT_EXTEND	0	/* alias for FALSE */
- 
--#ifdef __APPLE__
--# if __DARWIN_ONLY_64_BIT_INO_T
--#  define stat64 stat
--# endif
--#endif
--
- struct commandline
-   {
-     int cflag;			/* xdr C routines */
-@@ -337,9 +331,9 @@ clear_args (void)
- static void
- find_cpp (void)
- {
--  struct stat64 buf;
-+  struct stat buf;
- 
--  if (stat64 (CPP, &buf) == 0)
-+  if (stat (CPP, &buf) == 0)
-     return;
- 
-   if (cppDefined) /* user specified cpp but it does not exist */
-@@ -1125,17 +1119,17 @@ putarg (int whereto, const char *cp)
- static void
- checkfiles (const char *infile, const char *outfile)
- {
--  struct stat64 buf;
-+  struct stat buf;
- 
-   if (infile)			/* infile ! = NULL */
--    if (stat64 (infile, &buf) < 0)
-+    if (stat (infile, &buf) < 0)
-       {
- 	perror (infile);
- 	crash ();
-       }
-   if (outfile)
-     {
--      if (stat64 (outfile, &buf) < 0)
-+      if (stat (outfile, &buf) < 0)
- 	return;			/* file does not exist */
-       else
- 	{
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
index 208974004b..8e459b5634 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
@@ -10,14 +10,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  rpcsvc/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: git/rpcsvc/Makefile.am
-===================================================================
---- git.orig/rpcsvc/Makefile.am
-+++ git/rpcsvc/Makefile.am
-@@ -12,5 +12,5 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_p
+--- a/rpcsvc/Makefile.am
++++ b/rpcsvc/Makefile.am
+@@ -12,4 +12,4 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_p
  	nfs_prot.h rquota.h sm_inter.h
  
- %.h: %.x
+ .x.h:
 -	$(top_builddir)/rpcgen/rpcgen -h -o $@ $<
 +	rpcgen -h -o $@ $<
- 
-- 
2.34.1


