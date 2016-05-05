Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id C83BB731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 19:31:03 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id x35so10529302ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Q9q8T1exLN9CmBQAfrkdez584uR8VvwU7q4/tw6yCq8=;
	b=OPGKpBdrxavy3Y9EjnmzVuyvTPOpgGIghpHda8ALRptlU7D3E0TzzF+voX07qO6HAG
	g1lDKDcDu7xF9QSgaZfTgeYHKyGyTncCDQa++GwwulNo4xDNHu/H5OrUQytbkWojhLBH
	2aD002IL7BTrtP/AmjzbuTEE5kGSVp4BuD+G11ANK9MazUur8q6BRd2Ecq76MZVMcXdU
	uFlk1ehRgdyNxcFas4CrPOwo3QZXmuUHOdhwJkQVi/lGOgkjWz9rQekcrtsozW/QrRV7
	aqC8SgJJGGwVTd6nhSggNz2Zwy7UJrd+WsIoHq3Q5v2QXvzW0+DanXpHw0aRrF0gX51T
	yuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Q9q8T1exLN9CmBQAfrkdez584uR8VvwU7q4/tw6yCq8=;
	b=ahBXeD6r5JGPyVBujB17khBNFQU3/mp+k7ZQjJwEyZmV5HokEq8IeSsFBWh5KGdISj
	XKo4zVdkR+2beZcZJBHGkwvZBo7pBDPPNx4CKy9xY6Yvaz6Hsh7xCd9PhWcHnEAZdckR
	i6bV8vBX04EimAOVSO8PqAuKsQo7GExUtiQ8vWxARDA9R0E0N6hLCoGxjyaDfQK4UqHY
	12zX007nVUGW9dxjp1BS2ryX0qiU8j+jmtq0v8gpiv+PlD8BYFDjR12sgXZmjUGY37E/
	9a1Y1XphBSLqlvGSjTiEQV3fLPW+cPwZ73tLKBmkcfobRegxUMyb/mbInBBQyQLR5EG5
	pCJA==
X-Gm-Message-State: AOPr4FU7w7AY6TGphxFMO+/j7ZVB2+VJ0rSS2X2Ljwxo00cIDdCq0MzusSsCM4uyhFboVg==
X-Received: by 10.107.141.201 with SMTP id p192mr20598587iod.173.1462476664028;
	Thu, 05 May 2016 12:31:04 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	g186sm4660680iof.27.2016.05.05.12.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 May 2016 12:31:02 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2016 12:30:55 -0700
Message-Id: <289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
References: <e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
In-Reply-To: <cover.1462476586.git.chris_larson@mentor.com>
References: <cover.1462476586.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [master][PATCH 2/3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Thu, 05 May 2016 19:31:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

We weren't consistent in the HOST_ (aka BUILD_) and non-HOST_ flags, so we
were using BUILD_CPPFLAGS to compile target stuff, for example. Sort that out,
and make sure we obey LDFLAGS.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ...HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch | 73 ++++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  5 +-
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch b/meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch
new file mode 100644
index 0000000..8139edc
--- /dev/null
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch
@@ -0,0 +1,73 @@
+Upstream-Status: Pending
+
+From ef21bb404cb5dbfbaa95b693c9705da2fd7e7472 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Thu, 5 May 2016 11:49:24 -0700
+Subject: Sort out HOST_ vs non-HOST_ flags, and obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ Makefile.conf.in | 3 +++
+ configure.ac     | 6 +++++-
+ main/Makefile    | 4 ++--
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.conf.in b/Makefile.conf.in
+index 4645e44..dcb6cf2 100644
+--- a/Makefile.conf.in
++++ b/Makefile.conf.in
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
+diff --git a/configure.ac b/configure.ac
+index d8bd7aa..2962a4a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -175,7 +175,8 @@ fi
+ 
+ dnl ---Output variables...
+ 
+-HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
++CFLAGS="${CFLAGS:--O2} -Wall \$(CPPFLAGS)"
++HOST_CFLAGS="${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS)"
+ 
+ dnl TODO: figure out how to set these appropriately for compilers other than gcc
+ I386_CFLAGS="$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format \$(I386_CPPFLAGS)"
+@@ -189,6 +190,9 @@ IA64_LDFLAGS='-static --warn-multiple-gp --warn-common'
+ 
+ AC_SUBST([HOST_CC])
+ AC_SUBST([HOST_CFLAGS])
++AC_SUBST([CC])
++AC_SUBST([CFLAGS])
++AC_SUBST([LDFLAGS])
+ 
+ AC_SUBST([I386_CC])
+ AC_SUBST([I386_LD])
+diff --git a/main/Makefile b/main/Makefile
+index d9fb1d8..cd53613 100644
+--- a/main/Makefile
++++ b/main/Makefile
+@@ -4,11 +4,11 @@ MKELF_OBJS=$(OBJDIR)/main/mkelfImage.o \
+ 
+ $(OBJDIR)/sbin/mkelfImage: $(MKELF_OBJS) $(DEPS)
+ 	$(MKDIR) -p $(@D)
+-	$(CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
+ 
+ $(OBJDIR)/main/mkelfImage.o: main/mkelfImage.c include/mkelfImage.h $(DEPS)
+ 	$(MKDIR) -p $(@D)
+-	$(CC) $(HOST_CFLAGS) -c $< -o $@
++	$(CC) $(CFLAGS) -c $< -o $@
+ 
+ $(OBJDIR)/man/man8/mkelfImage.8: main/mkelfImage.man
+ 	$(MKDIR) -p $(@D)
+-- 
+2.8.0
+
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 92435cd..9fcccb4 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -13,8 +13,9 @@ http://review.coreboot.org/gitweb?p=coreboot.git;a=commit;h=34fc4ab80b507739e258
 DEPENDS += "zlib"
 
 SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
-           file://cross-compile.patch   \
-          "
+           file://cross-compile.patch \
+           file://0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch \
+           "
 SRC_URI_append_class-native = " \
            file://fix-makefile-to-find-libz.patch   \
 "
-- 
2.8.0


