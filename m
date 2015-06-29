Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 288EB60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 06:56:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T6uYdL019933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 23:56:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 28 Jun 2015 23:56:33 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 14:56:20 +0800
Message-ID: <1435560980-22326-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Mon, 29 Jun 2015 06:56:36 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If build dir includes the string "blib", filter it out from @INC may empty
the @INC and cause build errors like:

  Can't locate ExtUtils/MakeMaker.pm in @INC \
  (you may need to install the ExtUtils::MakeMaker module) \
  (@INC contains: .) at Makefile.PL

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...-PathTools-don-t-filter-out-blib-from-INC.patch | 30 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.20.0.bb   |  4 ++-
 meta/recipes-devtools/perl/perl_5.20.0.bb          |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch
new file mode 100644
index 0000000..e72cc0b
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch
@@ -0,0 +1,30 @@
+[PATCH] perl / PathTools: don't filter out blib from @INC
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
index 586a347..44dd43c 100644
--- a/meta/recipes-devtools/perl/perl-native_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
@@ -17,7 +17,9 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-5.14.3-fix-CVE-2010-4777.patch "
+           file://perl-5.14.3-fix-CVE-2010-4777.patch \
+           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
+"
 
 SRC_URI[md5sum] = "406ec049ebe3afcc80d9c76ec78ca4f8"
 SRC_URI[sha256sum] = "4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a36ca45f8bbcd02"
diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index d100ff9..8c1b53f 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -47,6 +47,7 @@ SRC_URI += " \
 	file://debian/cpan-missing-site-dirs.diff \
 	file://debian/fixes/memoize_storable_nstore.diff \
 	file://debian/regen-skip.diff \
+        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
 "
 
 SRC_URI += " \
-- 
1.9.1


