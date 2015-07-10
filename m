Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2287C6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 08:55:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A8ttnU008494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 01:55:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Jul 2015 01:55:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 16:54:55 +0800
Message-ID: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Fri, 10 Jul 2015 08:55:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If build dir includes the string "blib", filter it out from @INC may empty
the @INC and cause build errors like:

  Can't locate ExtUtils/MakeMaker.pm in @INC \
  (you may need to install the ExtUtils::MakeMaker module) \
  (@INC contains: .) at Makefile.PL

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.22.0.bb   |  1 +
 ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
 3 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
index dbcf2a6..a9a1cab 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "\
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
+           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
           "
 
 SRC_URI[md5sum] = "ff0f09b17de426eff323426cb140ee79"
diff --git a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
new file mode 100644
index 0000000..7dd9041
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
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
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 050a98c..7f78998 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -61,6 +61,7 @@ SRC_URI += " \
         file://t-run-switches.t-perl5-perl.patch \
         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
         file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
+        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
 "
 
 # Fix test case issues
-- 
1.9.1


