Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9A5A732A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1BAAXSx024292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 02:10:33 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Feb 2015 02:10:32 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Feb 2015 18:06:46 +0800
Message-ID: <b77fc1c9d7bd2292af7e4e287369493b47ea27e6.1423648457.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423648455.git.wenzong.fan@windriver.com>
References: <cover.1423648455.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl / PathTools: don't filter out blib from @INC
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
X-List-Received-Date: Wed, 11 Feb 2015 10:10:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If $TOPDIR includes the string "blib", filter it out from @INC may empty
the @INC and cause build errors like:

  Can't locate ExtUtils/MakeMaker.pm in @INC \
  (you may need to install the ExtUtils::MakeMaker module) \
  (@INC contains: .) at Makefile.PL

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.20.0.bb   |  4 ++-
 meta/recipes-devtools/perl/perl_5.20.0.bb          |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch
new file mode 100644
index 0000000..7dd9041
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch
@@ -0,0 +1,33 @@
+From 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 11 Feb 2015 15:14:40 +0800
+Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
+
+If $TOPDIR includes the string "blib", filter it out from @INC may empty
+the @INC and cause build errors like:
+
+  Can't locate ExtUtils/MakeMaker.pm in @INC \
+  (you may need to install the ExtUtils::MakeMaker module) \
+  (@INC contains: .) at Makefile.PL
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ dist/PathTools/Makefile.PL | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
+index 1b21de4..f562cb2 100644
+--- a/dist/PathTools/Makefile.PL
++++ b/dist/PathTools/Makefile.PL
+@@ -1,6 +1,3 @@
+-
+-BEGIN { @INC = grep {!/blib/} @INC }
+-
+ require 5.005;
+ use ExtUtils::MakeMaker;
+ WriteMakefile
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/perl/perl-native_5.20.0.bb b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
index 586a347..c8cdad7 100644
--- a/meta/recipes-devtools/perl/perl-native_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
@@ -17,7 +17,9 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-5.14.3-fix-CVE-2010-4777.patch "
+           file://perl-5.14.3-fix-CVE-2010-4777.patch \
+           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
+          "
 
 SRC_URI[md5sum] = "406ec049ebe3afcc80d9c76ec78ca4f8"
 SRC_URI[sha256sum] = "4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a36ca45f8bbcd02"
diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index db65202..a99b3c8 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -76,6 +76,7 @@ SRC_URI += " \
         file://perl-5.14.3-fix-CVE-2010-4777.patch \
         file://0001-Makefile.SH-fix-do_install-failed.patch \
         file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch \
+        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
 "
 
 # Fix test case issues
-- 
1.9.1


