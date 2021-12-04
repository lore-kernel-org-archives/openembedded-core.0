Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DABCC433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.22665.1638602010549255395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mshvgJXT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so3886468wme.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwS8z4u24qfNT85INYDVLpyAUJqjorIdiDWgchsAPOw=;
        b=mshvgJXToTaPQZF28DXcOqf00IvfpzoVRqIBmTiYvrnRLg8yb3BU3W7Ie34/Ev8M1E
         XZKxA8+un8mzRbLBShw9UND8doCBH9tKVHxBYZB4sGVXlLVAHIm2xebfjRWcwsVl26GV
         LAk7V7uf2fsGB6fEPogqMeMun+U/58DW2U893na0iR2i6Fsm1OYwPJAMmLqVNkBusyuG
         W1UrRcbK03ZakDD4bKFH+fWtP5bSLAzuT3O1v2pmcYbe2sQtgB7/KP9ivhT4xSWG3soR
         Ts5heBDvVmw6XVXaARxndMXjCxUchY8xsB531gO2aHbFBg3YT4tb0rlJIrJD5WQJjoNm
         nFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwS8z4u24qfNT85INYDVLpyAUJqjorIdiDWgchsAPOw=;
        b=to9y3twsBgqmfeXFA85Xdtxttj3q7u04J20JoxH/+1O6WPiw/E6bciNj/anWdB9a3X
         RbbvHYDnZhiDSIXLT86QoTV1GTiBDCSwsWaugga17LEuEfJMWTGsb7ktVgVulj1iPTmn
         vrIbMlAxxe81pRab+pJDpBId2ea1T5D2oDQW1Dnf/MnRWBhrNsS5Ph6hVgUpqRsjjcDc
         xg6STEMcD29Q2849UvJEZHdlesRW3yWs8/bA+BI/O6Z1MniIoMSOWvIzV7QThNF/vGVq
         JdXnzQEJjcgWcxK+7IRWSSNVbIjX9SuMxWbaKoZNiabj0GEpC1L75p4ujwOIbMsnaxZO
         9Otw==
X-Gm-Message-State: AOAM5319DnBzB9wQLl+iBAb7xosSbzmXPgLPtAu+ORmDx6qoZgCATrUX
	Rq1G3RWIJmyde7C8Z6F9u47XPn1ffG6Q1A==
X-Google-Smtp-Source: 
 ABdhPJx11epaEYHXhPsoNEOrvi06hydrLoGEYoDfM2lSp2EDXR2hDt+yskbHu9MBFRQDlVXLkxSERQ==
X-Received: by 2002:a1c:1f94:: with SMTP id
 f142mr21770681wmf.192.1638602009128;
        Fri, 03 Dec 2021 23:13:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/26] perl: replace a patch with a config option
Date: Sat,  4 Dec 2021 08:12:59 +0100
Message-Id: <20211204071323.2480163-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159149

Instead of patching in LDFLAGS into makefiles, simply
append them to 'lddlflags' (perl's keyword for 'linker flags').

See here for upstream discussions:
https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/406
https://github.com/arsv/perl-cross/pull/124

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...er-add-LDFLAGS-when-linking-binary-m.patch | 26 -------------------
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  4 ++-
 2 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch

diff --git a/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch b/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
deleted file mode 100644
index 1acf3ddfaa..0000000000
--- a/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2f74a899474f428a4a5368a94accf801c5f97ae4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 4 Jun 2018 18:33:50 +0300
-Subject: [PATCH] ExtUtils-MakeMaker: add $(LDFLAGS) when linking binary
- modules
-
-Upstream-Status: Submitted [https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/405]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index fe53be1..249c048 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1050,7 +1050,7 @@ sub xs_make_dynamic_lib {
-     }
- 
-     push @m, sprintf <<'MAKE', $ld_run_path_shell, $ldrun, $dlsyms_arg, $ldfrom, $self->xs_obj_opt('$@'), $libs, $exportlist;
--	%s$(LD) %s $(LDDLFLAGS) %s %s $(OTHERLDFLAGS) %s $(MYEXTLIB) \
-+	%s$(LD) %s $(LDDLFLAGS) %s %s $(LDFLAGS) $(OTHERLDFLAGS) %s $(MYEXTLIB) \
- 	  $(PERL_ARCHIVE) %s $(PERL_ARCHIVE_AFTER) %s \
- 	  $(INST_DYNAMIC_FIX)
- 	$(CHMOD) $(PERM_RWX) $@
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 16d45ccff3..a6ae80f07e 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://perl-rdepends.txt \
-           file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
            file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
            file://errno_ver.diff \
            file://native-perlinc.patch \
@@ -59,6 +58,7 @@ do_configure:class-target() {
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
     -Dlibpth='${libdir} ${base_libdir}' \
     -Dglibpth='${libdir} ${base_libdir}' \
+    -Alddlflags=' ${LDFLAGS}' \
     ${PACKAGECONFIG_CONFARGS}
 
     #perl.c uses an ARCHLIB_EXP define to generate compile-time code that
@@ -83,6 +83,7 @@ do_configure:class-nativesdk() {
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
+    -Alddlflags=' ${LDFLAGS}' \
     ${PACKAGECONFIG_CONFARGS}
 
     # See the comment above
@@ -96,6 +97,7 @@ do_configure:class-native() {
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Ui_xlocale \
+    -Alddlflags=' ${LDFLAGS}' \
     ${PACKAGECONFIG_CONFARGS}
 }
 
-- 
2.20.1


