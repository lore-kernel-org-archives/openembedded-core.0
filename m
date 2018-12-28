Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C00A6BE3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:02:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBS92MBv012413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 01:02:32 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Dec 2018 01:02:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 01:01:49 -0800
Message-ID: <6d9b2cd317e178c70af2610ad3de9d05c6eaf4a3.1545987662.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545987662.git.liezhi.yang@windriver.com>
References: <cover.1545987662.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] perl: Fix race issue for cpan/Pod-Simple
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
X-List-Received-Date: Fri, 28 Dec 2018 09:02:41 -0000
Content-Type: text/plain

Fixed:
Running pm_to_blib for cpan/Pod-Simple directly
[snip]
/path/to/cpan/podlators/../../miniperl "-I../../lib" "-I../../lib" -MExtUtils::MY -e 'MY->fixin(shift)' -- blib/script/pod2man
Can't locate Getopt/Long.pm in @INC [snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.4.bb   |  1 +
 ...kefile.SH-Pod-Simple-requires-Getopt-Long.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.4.bb          |  1 +
 3 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.4.bb b/meta/recipes-devtools/perl/perl-native_5.24.4.bb
index 81d3fd4..fe44d9b 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.4.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
            file://0001-Configure-Remove-fstack-protector-strong-for-native-.patch \
            file://perl-5.26.1-guard_old_libcrypt_fix.patch \
            file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
+           file://0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch \
           "
 
 SRC_URI[md5sum] = "04622bc4d3941dc7eb571c52b7c02993"
diff --git a/meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch b/meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
new file mode 100644
index 0000000..aad46f3
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
@@ -0,0 +1,34 @@
+From 58c69d65b19b5f9a35e1f5ce08d2ea47884233d3 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 27 Dec 2018 00:18:51 -0800
+Subject: [PATCH] Makefile.SH: Pod-Simple requires Getopt-Long
+
+Fixed a race issue when parallel build:
+
+Running pm_to_blib for cpan/Pod-Simple directly
+[snip]
+/path/to/cpan/podlators/../../miniperl "-I../../lib" "-I../../lib" -MExtUtils::MY -e 'MY->fixin(shift)' -- blib/script/pod2man
+Can't locate Getopt/Long.pm in @INC [snip]
+
+Upstream-Status: Submitted[https://www.nntp.perl.org/group/perl.perl5.porters/2018/12/msg253236.html]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.SH | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.SH b/Makefile.SH
+index 9848d55..7a164e7 100755
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -189,6 +189,7 @@ dynamic_list=' '
+ dynamic_ext_re="lib/auto/re/re.$dlext"
+ extra_dep='
+ ext/Pod-Functions/pm_to_blib: cpan/Pod-Simple/pm_to_blib cpan/Pod-Escapes/pm_to_blib pod/perlfunc.pod
++cpan/Pod-Simple/pm_to_blib: cpan/Getopt-Long/pm_to_blib
+ '
+ for f in $dynamic_ext; do
+     : the dependency named here will never exist
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-devtools/perl/perl_5.24.4.bb
index a644970..7b1ae7f 100644
--- a/meta/recipes-devtools/perl/perl_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.4.bb
@@ -65,6 +65,7 @@ SRC_URI += " \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
         file://CVE-2018-12015.patch \
         file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
+        file://0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch \
 "
 
 # Fix test case issues
-- 
2.10.2


