Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDC1C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:04 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.39301.1683653038726499986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JFs9pn3u;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9659e9bbff5so1113592466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653037; x=1686245037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztZz4JM5QXgSlpXESpCuM/PQdaHMmttBuRZnJGjxyn8=;
        b=JFs9pn3uYP/hZ2wiaC+oU18BRBKGxMu5rZZGM/ov79I0sNBjR2O/WbqIq1IuZQ2NTh
         EfUqyBQGT8RYKDwjRlRKSnC0uwNbr9FvfYcL4ZXrRdl1XKO2H0V4lF1SpjLJmbtAjAn3
         optfboMIRsTjXfy5lvQbJFpnAChsQBTH6NJVnuScfb4Hts0UbJokiIUn+K23Xb3bUIET
         ullWjrP/9fnQl5WyLZpRau3ITgKpkQBLu1CYNmm1OXfz6C5ecIF5yVXe/IqtpCcof5Fi
         E1VD0mbEASazVIMQSsAtRF3I7q+o8h2+HNdzwh0YOujv18JcOKfB26D45eIRJrWgbRee
         t5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653037; x=1686245037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztZz4JM5QXgSlpXESpCuM/PQdaHMmttBuRZnJGjxyn8=;
        b=Qr+H9Ox8fFuzIurK5z6k9XdrO2hqZmhWfEnrDse45DzCdPw0d+wL9lGNANFhaFHUOE
         4ynkGQ6bhBwwAiAzWkBQs04fyksnip0S93W2mC5GGNV2isT26O9Cxjk4xU60v08Bq0Sa
         WkXYqKhsRSTcAc1AzEFSEzAmvW2OM9RS9boV36h4qlB2Q6PF3IJySX2+gbxsbIeOpG2g
         FSuntnG1ZQH5dv1ClZoC6X4zE3aESncRkyR2IYPo3vkUOXjRwK/R3EOPWVuk7l5tCXbj
         /ZdC5wxUB7rEVs4R3hop5gz8afsrh0Ko+lUARP3m4XYtsrrqeHagNM9OIfbuEXflMaam
         N4nQ==
X-Gm-Message-State: AC+VfDz/fo+B7/zhxk+fh+K/mKp/wg00tG4eSpOL7Y1iCGIU4zsF1fa3
	JKzmn+6HFhPbqJixU/8kfBvYrPF+iyM=
X-Google-Smtp-Source: ACHHUZ6wa4deH1lu6AmPcspqYot+AH2WicryKP5yui9ekNbr92jPGVk7w4Z3XONic3F623BPMeriRw==
X-Received: by 2002:a17:907:5c7:b0:961:be96:b0e6 with SMTP id wg7-20020a17090705c700b00961be96b0e6mr11438215ejb.68.1683653037033;
        Tue, 09 May 2023 10:23:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/27] rpm: update 4.18.0 -> 4.18.1
Date: Tue,  9 May 2023 19:23:31 +0200
Message-Id: <20230509172344.1516743-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181069

Drop:
0001-docs-do-not-build-manpages-requires-pandoc.patch
(pandoc is now detected from $PATH)
fifofix.patch
(upstream fixed the issue)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...olor-setting-for-mips64_n32-binaries.patch | 26 ++++++-------
 ...lib-rpm-as-the-installation-path-for.patch | 30 +++++++-------
 ...o-not-build-manpages-requires-pandoc.patch | 23 -----------
 meta/recipes-devtools/rpm/files/fifofix.patch | 22 -----------
 .../rpm/files/fix-declaration.patch           | 39 +++++++++++++++++++
 .../rpm/{rpm_4.18.0.bb => rpm_4.18.1.bb}      |  7 ++--
 6 files changed, 70 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch
 create mode 100644 meta/recipes-devtools/rpm/files/fix-declaration.patch
 rename meta/recipes-devtools/rpm/{rpm_4.18.0.bb => rpm_4.18.1.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index 9f5dde07205..9fa486dfd3c 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -1,4 +1,4 @@
-From 5492ac3c716020a27a25253bbffe810db43202bf Mon Sep 17 00:00:00 2001
+From 93f219df68f3741ff63a294a16bcbe8deba1112f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Mar 2017 18:54:02 +0200
 Subject: [PATCH] Add a color setting for mips64_n32 binaries
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  rpmrc.in      | 2 ++
  2 files changed, 6 insertions(+)
 
-Index: git/build/rpmfc.c
-===================================================================
---- git.orig/build/rpmfc.c
-+++ git/build/rpmfc.c
-@@ -645,6 +645,7 @@ exit:
+diff --git a/build/rpmfc.c b/build/rpmfc.c
+index 26606378f..a16e3f4e9 100644
+--- a/build/rpmfc.c
++++ b/build/rpmfc.c
+@@ -646,6 +646,7 @@ exit:
  static const struct rpmfcTokens_s rpmfcTokens[] = {
    { "directory",		RPMFC_INCLUDE },
  
@@ -23,20 +23,20 @@ Index: git/build/rpmfc.c
    { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
    { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
  
-@@ -1150,6 +1151,9 @@ static uint32_t getElfColor(const char *
+@@ -1151,6 +1152,9 @@ static uint32_t getElfColor(const char *fn)
  		color = RPMFC_ELF32;
  		break;
  	    }
 +            if (ehdr.e_machine == EM_MIPS || ehdr.e_machine == EM_MIPS_RS3_LE)
 +                if (ehdr.e_flags & EF_MIPS_ABI2)
 +                    color = RPMFC_ELFMIPSN32;
- 	    elf_end(elf);
  	}
- 	close(fd);
-Index: git/rpmrc.in
-===================================================================
---- git.orig/rpmrc.in
-+++ git/rpmrc.in
+ 	if (elf)
+ 	    elf_end(elf);
+diff --git a/rpmrc.in b/rpmrc.in
+index 2975a3a0e..c7232b48b 100644
+--- a/rpmrc.in
++++ b/rpmrc.in
 @@ -139,6 +139,8 @@ archcolor: mipsr6el 1
  archcolor: mips64r6 2
  archcolor: mips64r6el 2
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 6f613d0a7d8..8fdc5edb10b 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 4ab6a4c5bbad65c3401016bb26b87214cdd0c59b Mon Sep 17 00:00:00 2001
+From 5fc560aaf1184d35d161f7d50dbb6323c90cc02d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  rpm.am       | 4 ++--
  3 files changed, 4 insertions(+), 4 deletions(-)
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
+diff --git a/configure.ac b/configure.ac
+index e6676c581..ec28db9b6 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -942,7 +942,7 @@ else
      usrprefix=$prefix
  fi
@@ -26,11 +26,11 @@ Index: git/configure.ac
  AC_SUBST(RPMCONFIGDIR)
  
  AC_SUBST(OBJDUMP)
-Index: git/macros.in
-===================================================================
---- git.orig/macros.in
-+++ git/macros.in
-@@ -911,7 +911,7 @@ package or when debugging this package.\
+diff --git a/macros.in b/macros.in
+index a2411d784..735b74d99 100644
+--- a/macros.in
++++ b/macros.in
+@@ -930,7 +930,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -39,10 +39,10 @@ Index: git/macros.in
  %_includedir		%{_prefix}/include
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
-Index: git/rpm.am
-===================================================================
---- git.orig/rpm.am
-+++ git/rpm.am
+diff --git a/rpm.am b/rpm.am
+index 55b5b3935..5a51f102b 100644
+--- a/rpm.am
++++ b/rpm.am
 @@ -1,10 +1,10 @@
  # Internal binaries
  ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
@@ -55,4 +55,4 @@ Index: git/rpm.am
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 12:0:3
+ rpm_version_info = 13:0:4
diff --git a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
deleted file mode 100644
index d7137f1d103..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 9bf1693092385eba9841614613313010221ca01f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 29 Jun 2021 20:11:26 +0200
-Subject: [PATCH] docs: do not build manpages (requires pandoc)
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- docs/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-Index: git/docs/Makefile.am
-===================================================================
---- git.orig/docs/Makefile.am
-+++ git/docs/Makefile.am
-@@ -1,7 +1,5 @@
- ## Process this file with automake to produce Makefile.in
- 
--SUBDIRS = man
--
- EXTRA_DIST =
- 
- EXTRA_DIST += \
diff --git a/meta/recipes-devtools/rpm/files/fifofix.patch b/meta/recipes-devtools/rpm/files/fifofix.patch
deleted file mode 100644
index 71703d7f0c6..00000000000
--- a/meta/recipes-devtools/rpm/files/fifofix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Calling openat() on a fifo causes a pseudo hang for us (e.g. the fifo in psplash).
-Avoid calling openat for fifos.
-
-Introduced upstream with:
-
-https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/issues/2195]
-
-Index: git/lib/fsm.c
-===================================================================
---- git.orig/lib/fsm.c
-+++ git/lib/fsm.c
-@@ -1010,7 +1010,7 @@ int rpmPackageFilesInstall(rpmts ts, rpm
-                     rc = RPMERR_UNKNOWN_FILETYPE;
-             }
- 
--	    if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode)) {
-+	    if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode) && !S_ISFIFO(fp->sb.st_mode)) {
- 		/* Only follow safe symlinks, and never on temporary files */
- 		fd = fsmOpenat(di.dirfd, fp->fpath,
- 				fp->suffix ? AT_SYMLINK_NOFOLLOW : 0, 0);
diff --git a/meta/recipes-devtools/rpm/files/fix-declaration.patch b/meta/recipes-devtools/rpm/files/fix-declaration.patch
new file mode 100644
index 00000000000..e5c84ebd498
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/fix-declaration.patch
@@ -0,0 +1,39 @@
+From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
+From: Florian Festi <ffesti@redhat.com>
+Date: Thu, 16 Mar 2023 19:05:04 +0100
+Subject: [PATCH] Fix compiler error on clang
+
+Turns out variable declarations are not allowed after a label, even in
+C99. And while some compilers don't seem to care others do.
+
+Moving the declaration of mayopen to the start of the function to avoid
+this problem.
+
+Resolves: #2435
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/b960c0b43a080287a7c13533eeb2d9f288db1414]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/fsm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 5671ac642d..183293edb0 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
+     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
+     int firstlinkfile = -1;
++    int mayopen = 0;
+     char *tid = NULL;
+     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
+     struct filedata_s *firstlink = NULL;
+@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 
+ setmeta:
+ 	    /* Special files require path-based ops */
+-	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
++	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
+ 	    if (!rc && fd == -1 && mayopen) {
+ 		int flags = O_RDONLY;
+ 		/* Only follow safe symlinks, and never on temporary files */
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_4.18.0.bb
rename to meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 7790db8b5a0..6da2edddf34 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -35,15 +35,14 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-perl-disable-auto-reqs.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
-           file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
-           file://fifofix.patch \
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
+           file://fix-declaration.patch \
            "
 
 PE = "1"
-SRCREV = "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
+SRCREV = "4588bc3f994338502d2770ad24cbfcdaa6c335ec"
 
 S = "${WORKDIR}/git"
 
@@ -187,7 +186,7 @@ FILES:${PN}-archive = "\
 
 PACKAGES += "python3-rpm"
 PROVIDES += "python3-rpm"
-FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
+FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/* ${PYTHON_SITEPACKAGES_DIR}/rpm-*.egg-info"
 
 RDEPENDS:${PN}-build = "bash perl python3-core debugedit"
 
-- 
2.30.2


