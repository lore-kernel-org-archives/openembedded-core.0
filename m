Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFA67197B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:50:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L9p1dV000622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:51:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 21 Sep 2016 02:51:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2016 17:47:32 +0800
Message-ID: <1474451252-24097-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1474451252-24097-1-git-send-email-mingli.yu@windriver.com>
References: <1474451252-24097-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [openembedded-core][PATCH 2/2] perl: fix CVE-2015-8607
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
X-List-Received-Date: Wed, 21 Sep 2016 09:51:00 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Backport patch to fix CVE-2015-8607 from perl upstream:
http://perl5.git.perl.org/perl.git/commitdiff/0b6f93036de171c12ba95d415e264d9cf7f4e1fd

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2015-8607.patch         | 74 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch
new file mode 100644
index 0000000..7b4a001
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch
@@ -0,0 +1,74 @@
+From 652c8d4852a69f1bb4d387946f9b76350a1f0d0e Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 15 Dec 2015 10:56:54 +1100
+Subject: [PATCH] perl: fix CVE-2015-8607
+
+ensure File::Spec::canonpath() preserves taint
+
+Previously the unix specific XS implementation of canonpath() would
+return an untainted path when supplied a tainted path.
+
+For the empty string case, newSVpvs() already sets taint as needed on
+its result.
+
+This issue was assigned CVE-2015-8607.  [perl #126862]
+
+Backport patch from http://perl5.git.perl.org/perl.git/commitdiff/0b6f93036de171c12ba95d415e264d9cf7f4e1fd
+
+Upstream-Status: Backport
+CVE: CVE-2015-8607
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ dist/PathTools/Cwd.xs    |  1 +
+ dist/PathTools/t/taint.t | 19 ++++++++++++++++++-
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/dist/PathTools/Cwd.xs b/dist/PathTools/Cwd.xs
+index 9d4dcf0..3d018dc 100644
+--- a/dist/PathTools/Cwd.xs
++++ b/dist/PathTools/Cwd.xs
+@@ -535,6 +535,7 @@ THX_unix_canonpath(pTHX_ SV *path)
+     *o = 0;
+     SvPOK_on(retval);
+     SvCUR_set(retval, o - SvPVX(retval));
++    SvTAINT(retval);
+     return retval;
+ }
+ 
+diff --git a/dist/PathTools/t/taint.t b/dist/PathTools/t/taint.t
+index 309b3e5..48f8c5b 100644
+--- a/dist/PathTools/t/taint.t
++++ b/dist/PathTools/t/taint.t
+@@ -12,7 +12,7 @@ use Test::More;
+ BEGIN {
+     plan(
+         ${^TAINT}
+-        ? (tests => 17)
++        ? (tests => 21)
+         : (skip_all => "A perl without taint support")
+     );
+ }
+@@ -34,3 +34,20 @@ foreach my $func (@Functions) {
+ 
+ # Previous versions of Cwd tainted $^O
+ is !tainted($^O), 1, "\$^O should not be tainted";
++
++{
++    # [perl #126862] canonpath() loses taint
++    my $tainted = substr($ENV{PATH}, 0, 0);
++    # yes, getcwd()'s result should be tainted, and is tested above
++    # but be sure
++    ok tainted(File::Spec->canonpath($tainted . Cwd::getcwd)),
++        "canonpath() keeps taint on non-empty string";
++    ok tainted(File::Spec->canonpath($tainted)),
++        "canonpath() keeps taint on empty string";
++
++    (Cwd::getcwd() =~ /^(.*)/);
++    my $untainted = $1;
++    ok !tainted($untainted), "make sure our untainted value is untainted";
++    ok !tainted(File::Spec->canonpath($untainted)),
++        "canonpath() doesn't add taint to untainted string";
++}
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index 33cad9e..b904674 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -67,6 +67,7 @@ SRC_URI += " \
         file://perl-test-customized.patch \
         file://perl-fix-CVE-2016-2381.patch \
         file://perl-fix-CVE-2016-6185.patch \
+        file://perl-fix-CVE-2015-8607.patch \
 "
 
 # Fix test case issues
-- 
2.8.1


