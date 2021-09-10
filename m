Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.4030.1631241216154306807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 19:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18A2XZIL002073
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 19:33:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18A2XYh6000762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 19:33:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 19:33:34 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 19:33:33 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] perl: fix CVE-2021-36770
Date: Fri, 10 Sep 2021 10:33:30 +0800
Message-ID: <20210910023330.37149-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-36770.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* add tag 'CVE:' in patch body

 .../perl/files/CVE-2021-36770.patch           | 49 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2021-36770.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2021-36770.patch b/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
new file mode 100644
index 0000000000..28bc457b86
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
@@ -0,0 +1,49 @@
+Backport patch to fix CVE-2021-36770.
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/c1a937f]
+CVE: CVE-2021-36770
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From c1a937fef07c061600a0078f4cb53fe9c2136bb9 Mon Sep 17 00:00:00 2001
+From: Ricardo Signes <rjbs@semiotic.systems>
+Date: Mon, 9 Aug 2021 08:14:05 -0400
+Subject: [PATCH] Encode.pm: apply a local patch for CVE-2021-36770
+
+I expect Encode to see a new release today.
+
+Without this fix, Encode::ConfigLocal can be loaded from a path relative
+to the current directory, because the || operator will evaluate @INC in
+scalar context, putting an integer as the only value in @INC.
+---
+ cpan/Encode/Encode.pm | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/cpan/Encode/Encode.pm b/cpan/Encode/Encode.pm
+index a56a99947f..b96a850416 100644
+--- a/cpan/Encode/Encode.pm
++++ b/cpan/Encode/Encode.pm
+@@ -7,7 +7,8 @@ use warnings;
+ use constant DEBUG => !!$ENV{PERL_ENCODE_DEBUG};
+ our $VERSION;
+ BEGIN {
+-    $VERSION = sprintf "%d.%02d", q$Revision: 3.08 $ =~ /(\d+)/g;
++    $VERSION = "3.10_01";
++    $VERSION = eval $VERSION;
+     require XSLoader;
+     XSLoader::load( __PACKAGE__, $VERSION );
+ }
+@@ -65,8 +66,8 @@ require Encode::Config;
+ eval {
+     local $SIG{__DIE__};
+     local $SIG{__WARN__};
+-    local @INC = @INC || ();
+-    pop @INC if $INC[-1] eq '.';
++    local @INC = @INC;
++    pop @INC if @INC && $INC[-1] eq '.';
+     require Encode::ConfigLocal;
+ };
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index ab19a8d0be..0e0fe7f985 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://perl-dynloader.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
+           file://CVE-2021-36770.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.17.1

