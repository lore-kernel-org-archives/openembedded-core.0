Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A54B57C56B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 06:42:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x546gVSG018769
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jun 2019 23:42:32 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 3 Jun 2019 23:42:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jun 2019 14:42:30 +0800
Message-ID: <1559630550-1318-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] groff: improve reproducibility
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
X-List-Received-Date: Tue, 04 Jun 2019 06:42:31 -0000
Content-Type: text/plain

As said in ${S}/m4/groff.m4
...
1642 # gdiffmk will attempt to use bash (for option -ef of 'test'). If bash
1643 # is not available it will use /bin/sh.
...

So drop hardcode shebang replacement, and pass variable to configure,
it also remove build path in gdiffmk to improve reproducibility

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../groff/files/0001-fix-shebang-for-taget.patch   | 31 ----------------------
 meta/recipes-extended/groff/groff_1.22.4.bb        |  3 +--
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch

diff --git a/meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch b/meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch
deleted file mode 100644
index 1b94e8a..0000000
--- a/meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 54c795c8a3c7356294007b5a4eed1dd47ed6411d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 19:19:27 +0800
-Subject: [PATCH] fix shebang for target
-
-...
-|ERROR: groff-1.22.4-r0 do_package_qa: QA Issue: /usr/bin/gdiffmk contained in
-package groff requires tmp-glibc/hosttools/bash, but no providers found in
-RDEPENDS_groff? [file-rdeps]
-...
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- contrib/gdiffmk/gdiffmk.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/contrib/gdiffmk/gdiffmk.sh b/contrib/gdiffmk/gdiffmk.sh
-index 5ce931e..10f2300 100644
---- a/contrib/gdiffmk/gdiffmk.sh
-+++ b/contrib/gdiffmk/gdiffmk.sh
-@@ -1,4 +1,4 @@
--#!@BASH_PROG@
-+#!/bin/sh
- # Copyright (C) 2004-2018 Free Software Foundation, Inc.
- # Written by Mike Bianchi <MBianchi@Foveal.com <mailto:MBianchi@Foveal.com>>
- # Thanks to Peter Bray for debugging.
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index 37eee9a..a190230 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://0001-replace-perl-w-with-use-warnings.patch \
 	file://groff-not-search-fonts-on-build-host.patch \
-	file://0001-fix-shebang-for-taget.patch \
 	file://0001-support-musl.patch \
 "
 
@@ -27,7 +26,7 @@ MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bind
 EXTRA_OECONF = "--without-x --without-doc"
 PARALLEL_MAKE = ""
 
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no'"
 
 do_install_append() {
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-- 
2.7.4


