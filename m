Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB92C83005
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:16 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.155.1686329651872786519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=P7NAzDNm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-652a6cf1918so1714165b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329651; x=1688921651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUA1LSQH+0EFvNwxm4cyHHUOY6RcuwkHh3RJxbfVEw4=;
        b=P7NAzDNmjb8QEnsSH3a9Hu58tDwAlIUfF7ZCUbiW5tCioSYUZDQ1jrOx0ghfhgszEZ
         SFjeRa8fHJF6hsHec5cED8eD1X+J4T4Ci6SdrWR3yIH99sdQB/MAQYyG+DMySwD/yAA8
         Q0hJFOpCs/NyF6HWRXp+SpJt4SCV96DEnjYfjawVqzhg7m+eNdWuMVWqjmFedBCQW27T
         L5sjcnrjyD99UZddpQSsjY0sPEFDcDiwukf5yhDGvWkortIiOBi/R2qS1oGmHIbuzyyE
         MMxXk3QJ4yPbqgryoVb+WIlsI2Q70eivC7C9Fk018G9to9VjYA+UszPdTh15mTnPwmPd
         ll2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329651; x=1688921651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUA1LSQH+0EFvNwxm4cyHHUOY6RcuwkHh3RJxbfVEw4=;
        b=hWqOXIw6CbSqPgdLTI6g50dxZbSS2crJd1GT2neHAVsVq3tlAYzzD0NpJ5svV0pRDr
         fuIdINi4jtaKWKqYJqF8Qz581J0eMIzeKzKZsji+pycfUL/3mo8eIIu1DS64n8kyobGd
         +N47vX3vAVq4wf8H2x1x1cuszT2iUPPQYf3NNfk/0GaAzrd6cDymFBD3EpiWnMJwzOao
         +j5WpUkcwjb0NBA2LhWOwPd2umS/gpSkCzmalm7/wJORliDM1DkwYiXVQD+OukrE403G
         WykZJHnyxIZjnmw84feITA4qrylSqybz+9YWDtZakR43AgfHqqIPpa0FIMnYjNHbIQ0P
         aZrw==
X-Gm-Message-State: AC+VfDzPjlkoU6vcgOgRnqKIiplzO+2ieYw9LK+AtbZ3bwqEOJQv1bpP
	bwuDY5JDvkvYB1H4EM6n5azcNxur6m9dzYexRC8=
X-Google-Smtp-Source: ACHHUZ65KHMeJbwfH8MDlQeGZYCpgMS6qojaFmU5EuGSCufaAFrdBEKuAZkBKE6hLCm0lSZEHP7cbQ==
X-Received: by 2002:a05:6a00:ad6:b0:64c:c453:244f with SMTP id c22-20020a056a000ad600b0064cc453244fmr1974775pfl.15.1686329650660;
        Fri, 09 Jun 2023 09:54:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/30] rpm: update 4.18.0 -> 4.18.1
Date: Fri,  9 Jun 2023 06:53:31 -1000
Message-Id: <0206e2700e290f04cb4c4c2cf50c1e1f1f4ae6ee.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182570

From: Alexander Kanavin <alex.kanavin@gmail.com>

Summary of changes from RPM 4.18.0

General bugfixes and enhancements

Command line
Fix signature reserved space not restored on --delsign (#2382, regression in 4.15.0)
Copy original lead on signing instead of recreating (#1326, regression in 4.14.0)
Issue a warning when signing created an OpenPGP v3 signature (#2286)

Transactions
Fix install of block and character special files (#2195, #2275, regression in 4.18.0)
Handle downgrade within V-R when epoch goes away (RhBug:1845069)

Package building

Spec
Restore BuildRequires check in rpmbuild -bp (regression in 4.15.0)
Fix space handling in %setup (#2335, regression in 4.18.0)
Issue a deprecation warning on %patchN syntax

Macros
Don’t embed CPU count of build system in packages (#2343)
Make CPU and thread-related macros available on all platforms (#2265)
Fix macro scoping level on re-entry from %[] expression (#2354)
Split ___build_pre macro to make mocking rpm build environment easier

Buildroot policies
Fix xargs use in brp-remove-la-files on macOS (#2332, regression in 4.17.0)

Generators
Disable debuginfod server lookups in build and dependency generator scripts
Exclude kernel modules from ELF dependency generation (regression in 4.17.0)
Signatures and keys
Fix type confusion bugs in the internal OpenPGP implementation

Plugins
Make write() non-blocking in fapolicyd plugin (RhBug:2110787)
Add a handler for libselinux log messages (RhBug:2123719, RhBug:2050774)

API changes
N/A

Internal improvements and cleanups
Fix potential uninitialized variable use on public key import
Fix various leaks during package build and install
Fix getopt() usage to comply with POSIX

Build process
Generate Python egg-info from automake builds (#130, #2230)
Revise ISANAME for loongarch
Documentation
Document %_binary_payload and %_source_payload syntax in RPM package format manual
Various typo and grammar fixes in reference manuals
Minor CONTRIBUTING.md updates

Drop:
0001-docs-do-not-build-manpages-requires-pandoc.patch
(pandoc is now detected from $PATH)
fifofix.patch
(upstream fixed the issue)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d8d673b2dc86e04cc278dc111b36d52d60bc25f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 9f5dde0720..9fa486dfd3 100644
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
index 6f613d0a7d..8fdc5edb10 100644
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
index d7137f1d10..0000000000
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
index 71703d7f0c..0000000000
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
index 0000000000..e5c84ebd49
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
index 7790db8b5a..6da2edddf3 100644
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
2.34.1


