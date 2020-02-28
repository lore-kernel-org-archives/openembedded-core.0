Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 749736196C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:13 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272061"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:31 +0800
Message-Id: <df86f5d32dc18f25c5c4788b65cceae8905a6ef3.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 07/22] perl: update to 5.30.1
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:12 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop fix-setgroup.patch as the upstream has fixed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45edc6d23e20f7634c50db71e419c7e3bb7f393e)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/perl/files/fix-setgroup.patch | 49 ----------------------
 .../perl/{perl_5.30.0.bb => perl_5.30.1.bb}        | 11 +++--
 2 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/fix-setgroup.patch
 rename meta/recipes-devtools/perl/{perl_5.30.0.bb => perl_5.30.1.bb} (97%)

diff --git a/meta/recipes-devtools/perl/files/fix-setgroup.patch b/meta/recipes-devtools/perl/files/fix-setgroup.patch
deleted file mode 100644
index 2b490e6..0000000
--- a/meta/recipes-devtools/perl/files/fix-setgroup.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Test script to reproduce the problem:
-
-#!/usr/bin/env perl
-$) = "2 2";
-print $!;
-
-Result from perl 5.28 under strace:
-
-setgroups(1, [2])                       = 0
-setresgid(-1, 2, -1)                    = 0
-
-Result from perl 5.30 under strace:
-
-setgroups(1, [-1])                      = -1 EINVAL (Invalid argument)
-setresgid(-1, 2, -1)                    = 0
-
-Patch which broke this upstream:
-https://perl5.git.perl.org/perl.git/commitdiff/5d4a52b5c68a11bfc97c2e24806993b84a61eade
-
-Issue is that the new function changes the endptr to the end of the
-scanned number and needs to be reset to the end of the string for 
-each iteration of the loop.
-
-[YOCTO #13391]
-
-RP
-2019/6/14
-Upstream-Status: Pending
-
-Index: perl-5.30.0/mg.c
-===================================================================
---- perl-5.30.0.orig/mg.c
-+++ perl-5.30.0/mg.c
-@@ -3179,6 +3256,7 @@ Perl_magic_set(pTHX_ SV *sv, MAGIC *mg)
- 	    const char *p = SvPV_const(sv, len);
-             Groups_t *gary = NULL;
-             const char* endptr = p + len;
-+            const char* realend = p + len;
-             UV uv;
- #ifdef _SC_NGROUPS_MAX
-            int maxgrp = sysconf(_SC_NGROUPS_MAX);
-@@ -3209,6 +3287,7 @@ Perl_magic_set(pTHX_ SV *sv, MAGIC *mg)
-                     Newx(gary, i + 1, Groups_t);
-                 else
-                     Renew(gary, i + 1, Groups_t);
-+                endptr = realend;
-                 if (grok_atoUV(p, &uv, &endptr))
-                     gary[i] = (Groups_t)uv;
-                 else {
diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
similarity index 97%
rename from meta/recipes-devtools/perl/perl_5.30.0.bb
rename to meta/recipes-devtools/perl/perl_5.30.1.bb
index 838e52c..996f631 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.3/perl-cross-1.3.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.3.1/perl-cross-1.3.1.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -18,7 +18,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://perl-dynloader.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
-           file://fix-setgroup.patch \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch  \
@@ -27,10 +26,10 @@ SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
 "
 
-SRC_URI[perl.md5sum] = "9770584cdf9b5631c38097645ce33549"
-SRC_URI[perl.sha256sum] = "851213c754d98ccff042caa40ba7a796b2cee88c5325f121be5cbb61bbf975f2"
-SRC_URI[perl-cross.md5sum] = "4dda3daf9c4fe42b3d6a5dd052852a48"
-SRC_URI[perl-cross.sha256sum] = "49edea1ea2cd6c5c47386ca71beda8d150c748835781354dbe7f75b1df27e703"
+SRC_URI[perl.md5sum] = "6438eb7b8db9bbde28e01086de376a46"
+SRC_URI[perl.sha256sum] = "bf3d25571ff1ee94186177c2cdef87867fd6a14aa5a84f0b1fb7bf798f42f964"
+SRC_URI[perl-cross.md5sum] = "1e463b105cfa56d251a86979af23e3a7"
+SRC_URI[perl-cross.sha256sum] = "edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d1590551e40694f21200141d"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.7.4


