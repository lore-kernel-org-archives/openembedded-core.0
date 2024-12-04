Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5CBE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8192.1733295000288898850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OAwWa1oI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a1fe2b43so57762575e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294999; x=1733899799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWhqtYRHCZ+/Ba27OVSsBW1+fCxmavYxxBkHE7R5vwY=;
        b=OAwWa1oIDzM+38HzEN7Yh62Uk5LCk/TcfGCgRQbLggEFXSzq+Cs/ERszScevcYsadD
         uEfoHjM4FTorG6o1ykrn+yuuMe0QnSSH+xr7kRvRmBbezy2/iS6jJ92ZhKKw6g22UwIR
         ZrhwIOrXXkJQwRTBs4ra1w20J0yYsxpfPyxrYdtTCCF5dq/k0GcQyCzrTE0WE1iAIDh/
         lmumC7Xq+cnIXdFghhLJunBvKh34QkvezHtDGxojquyx1TFbAcaxSXjLwgeNdwnL8gbe
         2h9VJ2h2Yj+Bs710Metef98tMdYVC3fitwst5a8Sh59w2GfdA2zKV7mbDSkWL+WdbOfq
         Nx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294999; x=1733899799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWhqtYRHCZ+/Ba27OVSsBW1+fCxmavYxxBkHE7R5vwY=;
        b=HG4RvX3LYcl5eKaaoXUEVO/eJ0trpubiT7L8Di574J112g1iIIyf8gX67gJAMWnELj
         Be9Eag/xdkKnMh91Bq5tdg9hxVbjjEZy7YRoAW2cAkm8RdB+CqTHCt2r8mblo73NyY1i
         G6R6C7KLIGtk8yevNMz6Bh0K9FGRA7jj4nIqfT+CGA6RM+2boif16nDMOzbhedre3VMU
         Ayzhi9NCgr7uRyvnfKAzmfkZ9LWcQzzAbj92bkAl+xVfExB8AXaGzOD4BXnMjmhqnUez
         XscV7WUM9vEjkmJw4HzVbzts4u3rsW1CCsCJPkPA5+0LvSC1I/sSn+O+xu2rQuiMHArn
         Jfeg==
X-Gm-Message-State: AOJu0YzVetgKFyfWDhRK9+S4UnQ5E9dWhzPNuSsL0JacojwxXHfkw4P1
	36XbR0VihpxThoIeT9mcyn4lnLB3zBl5SXByMWC9hyQRy0Tzn1QC5wRoHg==
X-Gm-Gg: ASbGnctZbELk/pVvDGTgi2LE7xxhm/RWj+JUHcW/DOyqAZhA73xLHG+OjKoWtbT5G7E
	7IP+AQB72bc07qz679qxlWfqg9q35v7StJ7XPpiOL8QPg16MgQlVjfno3bMnIKCzLzuomPN/zte
	eg8a23A8hhV4oAg8LwpCQmNOg0UVMPpJR7XN1clSpqExb/ezashtV209zrGcmk5ZLjGkGoKc7T9
	0yrxuIRlvpEMQZs+1VvX8B30DblBMjZrItTzFj2ZAQWVebM91UQJRy4V3Lln8245dCxqSmYBgBx
	D3v6DRDksLE=
X-Google-Smtp-Source: AGHT+IEWarlgzdPJn5bDi9XSriMrZ/U2W+ZsbweYbNp7vwZOODgPBh7xFpSP+25kRW4WMa+Wt6hkPA==
X-Received: by 2002:a05:600c:3550:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-434d0a0ece4mr36182985e9.28.1733294998543;
        Tue, 03 Dec 2024 22:49:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/37] texinfo: update 7.1 -> 7.1.1
Date: Wed,  4 Dec 2024 07:49:12 +0100
Message-Id: <20241204064920.817016-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208258

From: Alexander Kanavin <alex@linutronix.de>

Rather than try to patch out specific manpages needing help2man,
simply don't build them: this is less prone to tricky rebase
conflicts.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Makefile.am-do-not-build-manpages.patch | 29 ++++++++
 ...changes-to-build-without-zlib-and-nc.patch | 12 ++--
 .../0002-dont-depend-on-help2man.patch        | 68 -------------------
 .../texinfo/0003-texinfo-Update-to-5.1.patch  | 11 ++-
 .../{texinfo_7.1.bb => texinfo_7.1.1.bb}      |  4 +-
 5 files changed, 39 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch
 rename meta/recipes-extended/texinfo/{texinfo_7.1.bb => texinfo_7.1.1.bb} (95%)

diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch b/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
new file mode 100644
index 00000000000..e3e8f30b5e7
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
@@ -0,0 +1,29 @@
+From f7572109b64db9ea5aa44078eaad25ad2a2283f8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 28 Nov 2024 13:16:15 +0100
+Subject: [PATCH] Makefile.am: do not build manpages
+
+This requires help2man.
+
+Upstream-Status: Inappropriate [oe-core doesn't provide help2man]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f733797..1013fcf 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -66,7 +66,7 @@ if HOST_IS_WINDOWS
+ endif
+ endif
+   SUBDIRS += install-info po po_document tp Pod-Simple-Texinfo texindex util \
+-             doc man
++             doc
+   SUBDIRS += js
+ endif
+ 
+-- 
+2.39.5
+
diff --git a/meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch b/meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch
index b43a115b235..8ddf50261d1 100644
--- a/meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch
@@ -1,8 +1,7 @@
-From ee9d23373b488c4a499c561d71e6b6ba7ca1bd31 Mon Sep 17 00:00:00 2001
+From db2c41668d62c234fa69c71db18c162500dd403f Mon Sep 17 00:00:00 2001
 From: Joshua Lock <josh@linux.intel.com>
 Date: Fri, 16 Sep 2011 15:35:48 -0700
-Subject: [PATCH 1/3] texinfo: several changes to build without zlib and
- ncurses
+Subject: [PATCH] texinfo: several changes to build without zlib and ncurses
 
 We already DEPEND on the native texinfo being present before building so
 there isn't any need to try and build the required native texinfo binaries
@@ -16,10 +15,10 @@ Signed-off-by: Joshua Lock <josh@linux.intel.com>
  1 file changed, 1 insertion(+), 23 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8094498..5b72fc1 100644
+index 00626a3..5b725fe 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -247,29 +247,7 @@ AC_CANONICAL_BUILD
+@@ -267,29 +267,7 @@ AC_CANONICAL_BUILD
  # $native_tools is also added to SUBDIRS in the main Makefile.am,
  # so that make compiles the native tools first.
  #
@@ -50,6 +49,3 @@ index 8094498..5b72fc1 100644
  AC_SUBST(native_tools)
  AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])
  
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch
deleted file mode 100644
index f3b6827d582..00000000000
--- a/meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e02be81fa68ddc7f939abd99de4e42759a0d5d8c Mon Sep 17 00:00:00 2001
-From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
-Date: Tue, 29 Nov 2016 13:43:24 -0600
-Subject: [PATCH 2/3] dont-depend-on-help2man
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
----
- doc/Makefile.am |  2 +-
- man/Makefile.am | 12 ++++++------
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index e9e6298..f1b9895 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -63,7 +63,7 @@ refcard/txirefcard.pdf refcard/txirefcard-a4.pdf: refcard/txirefcard.tex
- # Include our texinfo.tex, not Automake's.
- EXTRA_DIST = epsf.tex texinfo.tex \
-              fdl.texi \
--	     $(man_MANS) $(TXI_XLATE) \
-+	     $(TXI_XLATE) \
-              $(refcard_files) \
- 	     texinfo-tex-test.texi texinfo-tex-test.WIDOWs \
-              texinfo-ja.tex short-sample-ja.texi \
-diff --git a/man/Makefile.am b/man/Makefile.am
-index f2c703f..61caeeb 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -11,27 +11,27 @@
- # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- 
- # These are generated using help2man.
--man_MANS = install-info.1 makeinfo.1 texindex.1 texi2dvi.1
-+#man_MANS = install-info.1 makeinfo.1 texindex.1 texi2dvi.1
- 
- # These require the build in info/, thus can't do if we failed to find a
- # terminal library.
- if HAVE_TERMLIBS
--man_MANS += info.1
-+#man_MANS += info.1
- endif
- 
- # These are hand-written.
--man_MANS += info.5 texinfo.5
-+#man_MANS += info.5 texinfo.5
- 
--man_MANS += pod2texi.1
-+#man_MANS += pod2texi.1
- 
- pod2texi.1: $(top_srcdir)/Pod-Simple-Texinfo/pod2texi.pl
- 	$(POD2MAN) $(top_srcdir)/Pod-Simple-Texinfo/pod2texi.pl >"$@"
- 
- 
- # These are just .so's to the common program.
--man_MANS += texi2any.1 texi2pdf.1 pdftexi2dvi.1
-+#man_MANS += texi2any.1 texi2pdf.1 pdftexi2dvi.1
- 
--EXTRA_DIST = $(man_MANS) ginfo.h2m
-+EXTRA_DIST = ginfo.h2m
- 
- # Maintainers should be able to regenerate.
- MAINTAINERCLEANFILES = $(man_MANS)
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch b/meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch
index f99f8b87d5c..4985d305039 100644
--- a/meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch
@@ -1,7 +1,7 @@
-From 33b85a3928895b812b37dc759c6de711802db45f Mon Sep 17 00:00:00 2001
+From 0131013100bf0baabfc0f9a44341e0d9d7cca794 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Mon, 29 Jul 2013 15:02:34 -0700
-Subject: [PATCH 3/3] texinfo: Update to 5.1
+Subject: [PATCH] texinfo: Update to 5.1
 
 Upstream-Status: Inappropriate [cross build specific]
 
@@ -11,10 +11,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/info/Makefile.am b/info/Makefile.am
-index f57b341..a019aa7 100644
+index 660d7f5..bed840a 100644
 --- a/info/Makefile.am
 +++ b/info/Makefile.am
-@@ -77,7 +77,7 @@ cmd_sources = $(srcdir)/session.c $(srcdir)/echo-area.c $(srcdir)/infodoc.c \
+@@ -81,7 +81,7 @@ cmd_sources = $(srcdir)/session.c $(srcdir)/echo-area.c $(srcdir)/infodoc.c \
  # more than once.
  funs.h: makedoc$(EXEEXT) $(cmd_sources)
  	rm -f $(generated_sources)
@@ -23,6 +23,3 @@ index f57b341..a019aa7 100644
  
  # The following hack is necessary to hint make before the automatic
  # dependencies are built.
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/texinfo/texinfo_7.1.bb b/meta/recipes-extended/texinfo/texinfo_7.1.1.bb
similarity index 95%
rename from meta/recipes-extended/texinfo/texinfo_7.1.bb
rename to meta/recipes-extended/texinfo/texinfo_7.1.1.bb
index 65d8252fb97..cc8683f085b 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.1.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.1.1.bb
@@ -30,11 +30,11 @@ TARGET_PATCH:class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch \
-           file://0002-dont-depend-on-help2man.patch \
+           file://0001-Makefile.am-do-not-build-manpages.patch \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "dd5710b3a53ac002644677a06145748e260592a35be182dc830ebebb79c5d5a0"
+SRC_URI[sha256sum] = "a46b46b54fd79641a8af5be4ad525788956ccf9798d3113396abeafa9020ef63"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.39.5


