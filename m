Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4656A71951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 22:59:46 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so9174713pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 15:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uMoU1pp18gu3L7lsF70VyIjrnFX3r8FzV9FyqNbRlh0=;
	b=NF1ZOGZkBZINNOWfK4lrUo1/eymaAhhXHsfpJ7Jz+orN4qJdmPn6734LbxL6vj1DST
	kvoaDcZ+1iGWyOtvyoRDBXh4W9DD+98+bpCBWMlzDk7xee4Z22syXbjkUdqVxVGEibIX
	wC1Z/fGEOncqRdvBmr6+Vk7xhR1Fasl4B6S2GrsABwh4jbrTbtTi+/XhWNXMHIKSoLr/
	GEbPlCWa4wdpNSlz0v04eE8s2YFdshzPGX/68vvXazfiOol32CYhMJKuKJoOafhp4uq3
	rhy+Ken/rDqakZJv+IKfeOt646i92tOQsEbgIucwcFG7CdTXkww5/lEuwv6VAOABqd51
	kL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uMoU1pp18gu3L7lsF70VyIjrnFX3r8FzV9FyqNbRlh0=;
	b=QcQWv7YRImLo0ayYoXaTMOB9zJfsnuqbWd1qsAjBLZEn2nuY608PlvAOqQu8xIeQk3
	CYzNlm9cB/UA1qiwEFtyDoHeETz2BoUumiZbOM1f5+8qbqQFbarbQQhcduK6FClBU00L
	cb8kpAfj9mxBmvqgZJR/zJoOb/5hq5qMcyNVM8n5p0ChdOvJqQu6x1TqZucr6SBqdLjO
	nOpu5mNikDyfcXZ2aRZKhyTphFfuJat/ISP59h1NlMrVKfVEn9e+R17b5RM1hIPjXZCn
	BPXp0Lol5EB/J2V8jhrQsgzXfWT6GwPTXkKJsscLm0vEHfcYuoAD4NK0XT6SCTuWknEX
	bCgg==
X-Gm-Message-State: AOPr4FV46+Wcuq512S2oyYz7vH8cFUR1sDIzk77F5UKe8DMV7FZ2Ypk0jti02EA4dqihvQ==
X-Received: by 10.98.78.132 with SMTP id c126mr24210083pfb.129.1462489187466; 
	Thu, 05 May 2016 15:59:47 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	k78sm16016023pfk.70.2016.05.05.15.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 May 2016 15:59:45 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2016 15:59:42 -0700
Message-Id: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
References: <289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
In-Reply-To: <cover.1462489051.git.chris_larson@mentor.com>
References: <cover.1462489051.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [master][PATCHv2 2/3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 22:59:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

We weren't consistent in the HOST_ (aka BUILD_) and non-HOST_ flags, so we
were using BUILD_CPPFLAGS to compile target stuff, for example. Sort that out,
and make sure we obey LDFLAGS.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../mkelfimage/mkelfimage/cross-compile.patch      | 86 +++++++++++++++-------
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  4 +-
 2 files changed, 63 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
index 7692709..2ae4b61 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
@@ -1,13 +1,43 @@
-make the tool to be cross compilable.
+From dc2712119d6832e24a9b7bed9ed4ce5ae03ce0a3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jul 2012 14:14:07 -0700
+Subject: [PATCH] mkelfimage: Fix cross build
+
+Make the tool to be cross compilable, by separating the variables for build
+tools from those for the target. Also modified to obey LDFLAGS.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
 Upstream-Status: Pending
 
-Index: mkelfImage/configure.ac
-===================================================================
---- mkelfImage.orig/configure.ac	2012-07-14 14:04:48.964898667 -0700
-+++ mkelfImage/configure.ac	2012-07-14 14:10:47.800916083 -0700
-@@ -70,6 +70,9 @@
+---
+ util/mkelfImage/Makefile.conf.in    | 3 +++
+ util/mkelfImage/configure.ac        | 7 +++++--
+ util/mkelfImage/linux-i386/Makefile | 2 +-
+ util/mkelfImage/linux-ia64/Makefile | 2 +-
+ util/mkelfImage/main/Makefile       | 4 ++--
+ 5 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/util/mkelfImage/Makefile.conf.in b/util/mkelfImage/Makefile.conf.in
+index 4645e44..dcb6cf2 100644
+--- a/util/mkelfImage/Makefile.conf.in
++++ b/util/mkelfImage/Makefile.conf.in
+@@ -17,6 +17,9 @@ DEFS=@DEFS@
+ LIBS=@LIBS@
+ HOST_CC=@HOST_CC@
+ HOST_CFLAGS=@HOST_CFLAGS@  $(DEFS)
++CC=@CC@
++CFLAGS=@CFLAGS@ $(DEFS)
++LDFLAGS=@LDFLAGS@
+ 
+ I386_CC     =@I386_CC@
+ I386_LD     =@I386_LD@
+diff --git a/util/mkelfImage/configure.ac b/util/mkelfImage/configure.ac
+index 652b952..0f2ac72 100644
+--- a/util/mkelfImage/configure.ac
++++ b/util/mkelfImage/configure.ac
+@@ -70,6 +70,9 @@ if test "with_default" != no ; then
  		AC_MSG_ERROR([cc not found])
  	fi
  	eval "${with_default}_CC='$CC'"
@@ -17,19 +47,22 @@ Index: mkelfImage/configure.ac
  	AC_PROG_CPP
  	if test "$CPP" = no; then
  		AC_MSG_ERROR([cpp not found])
-@@ -172,7 +175,6 @@
+@@ -172,8 +175,8 @@ fi
  
  dnl ---Output variables...
  
 -HOST_CC=$CC
- HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
+-HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
++CFLAGS="${CFLAGS:--O2} -Wall \$(CPPFLAGS)"
++HOST_CFLAGS="${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS)"
  
  dnl TODO: figure out how to set these appropriately for compilers other than gcc
-Index: mkelfImage/linux-i386/Makefile
-===================================================================
---- mkelfImage.orig/linux-i386/Makefile	2012-07-14 14:04:48.964898667 -0700
-+++ mkelfImage/linux-i386/Makefile	2012-07-14 14:04:49.032898671 -0700
-@@ -4,7 +4,7 @@
+ I386_CFLAGS="$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format \$(I386_CPPFLAGS)"
+diff --git a/util/mkelfImage/linux-i386/Makefile b/util/mkelfImage/linux-i386/Makefile
+index 51531d6..7e8aa3c 100644
+--- a/util/mkelfImage/linux-i386/Makefile
++++ b/util/mkelfImage/linux-i386/Makefile
+@@ -4,7 +4,7 @@ LI386_DEP=Makefile Makefile.conf $(LI386_DIR)/Makefile
  
  $(LI386_OBJ)/mkelf-linux-i386.o: $(LI386_DIR)/mkelf-linux-i386.c $(LI386_DIR)/convert.bin.c $(LI386_DEP)
  	$(MKDIR) -p $(@D)
@@ -38,11 +71,11 @@ Index: mkelfImage/linux-i386/Makefile
  
  
  ifdef I386_CC
-Index: mkelfImage/linux-ia64/Makefile
-===================================================================
---- mkelfImage.orig/linux-ia64/Makefile	2012-07-14 14:04:48.964898667 -0700
-+++ mkelfImage/linux-ia64/Makefile	2012-07-14 14:04:49.032898671 -0700
-@@ -4,7 +4,7 @@
+diff --git a/util/mkelfImage/linux-ia64/Makefile b/util/mkelfImage/linux-ia64/Makefile
+index 38f5d8c..5df8870 100644
+--- a/util/mkelfImage/linux-ia64/Makefile
++++ b/util/mkelfImage/linux-ia64/Makefile
+@@ -4,7 +4,7 @@ LIA64_DEP=Makefile Makefile.conf $(LIA64_DIR)/Makefile
  
  $(LIA64_OBJ)/mkelf-linux-ia64.o: $(LIA64_DIR)/mkelf-linux-ia64.c $(LIA64_DIR)/convert.bin.c $(LIA64_DEP)
  	$(MKDIR) -p $(@D)
@@ -51,21 +84,24 @@ Index: mkelfImage/linux-ia64/Makefile
  
  ifdef IA64_CC
  
-Index: mkelfImage/main/Makefile
-===================================================================
---- mkelfImage.orig/main/Makefile	2012-07-14 14:04:48.964898667 -0700
-+++ mkelfImage/main/Makefile	2012-07-14 14:04:49.032898671 -0700
-@@ -4,11 +4,11 @@
+diff --git a/util/mkelfImage/main/Makefile b/util/mkelfImage/main/Makefile
+index 403b0a4..cd53613 100644
+--- a/util/mkelfImage/main/Makefile
++++ b/util/mkelfImage/main/Makefile
+@@ -4,11 +4,11 @@ MKELF_OBJS=$(OBJDIR)/main/mkelfImage.o \
  
  $(OBJDIR)/sbin/mkelfImage: $(MKELF_OBJS) $(DEPS)
  	$(MKDIR) -p $(@D)
 -	$(HOST_CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
-+	$(CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
  
  $(OBJDIR)/main/mkelfImage.o: main/mkelfImage.c include/mkelfImage.h $(DEPS)
  	$(MKDIR) -p $(@D)
 -	$(HOST_CC) $(HOST_CFLAGS) -c $< -o $@
-+	$(CC) $(HOST_CFLAGS) -c $< -o $@
++	$(CC) $(CFLAGS) -c $< -o $@
  
  $(OBJDIR)/man/man8/mkelfImage.8: main/mkelfImage.man
  	$(MKDIR) -p $(@D)
+-- 
+2.8.0
+
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 92435cd..d7a4429 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -13,8 +13,8 @@ http://review.coreboot.org/gitweb?p=coreboot.git;a=commit;h=34fc4ab80b507739e258
 DEPENDS += "zlib"
 
 SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
-           file://cross-compile.patch   \
-          "
+           file://cross-compile.patch \
+           "
 SRC_URI_append_class-native = " \
            file://fix-makefile-to-find-libz.patch   \
 "
-- 
2.8.0


