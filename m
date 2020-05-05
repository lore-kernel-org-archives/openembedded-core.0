Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.1508.1588648831479776616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I7csNQYl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id 18so215109pfx.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EqlXrX5TRYbpCPV9C3J4WMj4c6CObJNDKwze8ZTnIlA=;
        b=I7csNQYlL8sJqdEsxzCTRpLLzkiqjaa7gHfzQsWHfw8YG0kiJfwCFl1AOmSmO97y7o
         qe10+oFFybmJGoqtFdHlrNxOJhkd8rXZzt7+MOXWaIr1bUUDdBao+BP0k/igsRD/1D+E
         SnGLz1dhn2NWQHAqVvww+lpyJrJU++YW3Wr2QQOf5X0KS6+35mlZo1X3gc+Kp0T4BEsz
         UXLmPMpGU1UXJRqQHS0WHZhRLUdfgFQDN+z5wvvfH7XjAzq7qyzXlAOZZJqqLEZNlvnl
         /mBGJrsUZNQnHAFtSg2sxv8acMgxvfQfzGLWOCXGsLjyArJJNaMQSZFzwPvk4Sf8n/77
         MbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EqlXrX5TRYbpCPV9C3J4WMj4c6CObJNDKwze8ZTnIlA=;
        b=Sy/iGe2UTeHu6xh+q86XtTl6bw32eoFUYoSY7cH7h6h8z13n9sB2+cn5foDmyjp0Yn
         iszzxmuPgIczXL1NOaK98rVeIJX5xn286MtV8NjxRBLabsaxLG6jtFxNZAJ0tEGCADHb
         gXwjS32v6Y+MzlwLYQlmoVEYlUS4kgL5bCJLxhbkas7YSmyVjGlKcDp1PbN/cIjoy9Pa
         fm4Ij7PnwxrNX1Q+6QQbI2sm4Pes4A7y3+E1Rkpc/VjsWs+PQ2NfuQFU2v8b/LALH4d9
         OuMqkL6u81JKR8Of9Yxmjm9fgAMDMoVkt2VkuUiUWud1aF5wz79V7MqZ8yuIRhD1uxu8
         pM3g==
X-Gm-Message-State: AGi0PuZwWM1aU7917pApEJdLEm/CPUtAMJTqZW/59s4AjxZrjcRHVhHT
	yflk47txHdcJfDQz+vYqX8Lf6v/o4sSY7w==
X-Google-Smtp-Source: APiQypIVUfplpeBSmrcOJw9S6r1dIm0VRdCz76ogAqnxFSfN+BYf02IKkboBnAkdtyYyExF4h2qDpQ==
X-Received: by 2002:a63:e542:: with SMTP id z2mr1189554pgj.165.1588648830413;
        Mon, 04 May 2020 20:20:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/28] vim: do not adjust script paths building for target
Date: Mon,  4 May 2020 17:19:06 -1000
Message-Id: <9a96733e29daf84cca9212538f3fc5bd7bb144f4.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

When cross-compiling, do not change scripts to use host
versions of perl and gawk.

Also, use INSANE_SKIP to suppress QA complaints if perl
or gawk are not on the target.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/no-path-adjust.patch            | 27 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              | 12 ++++-----
 2 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
new file mode 100644
index 0000000000..05c2d803f6
--- /dev/null
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -0,0 +1,27 @@
+vim: do not adjust script pathnames
+
+When cross-compiling, we do not want to reference the host versions of
+things like perl and awk.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
+ 		 rm -rf $$cvs; \
+ 	      fi
+ 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
+-# replace the path in some tools
++
++# replace the path in some tools, but not when cross-compiling
++ifneq ($(CROSS_COMPILING),1)
+ 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
+ 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+ 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+ 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
++endif
+ 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
+ 
+ # install the language specific files for tools, if they were unpacked
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 78e3f9528d..9f3dc08027 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
+           file://no-path-adjust.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
@@ -82,12 +83,6 @@ EXTRA_OECONF = " \
 do_install() {
     autotools_do_install
 
-    # Work around file-rdeps picking up csh, awk, perl or python as a dep
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
@@ -110,7 +105,12 @@ FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
 FILES_${PN}-data = "${datadir}/${BPN}"
+
+# We do not want to complain if perl or gawk are not on the target.
+#
 FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
+INSANE_SKIP_${PN}-tools = "file-rdeps"
+
 FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
     ${datadir}/${BPN}/${VIMDIR}/autoload \
-- 
2.17.1

