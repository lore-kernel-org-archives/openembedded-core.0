Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzF8-0005Ui-Tq
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:33:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550746"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:30:07 -0700
Message-Id: <338a024d8c432035b086a533a4d178a1b34e0483.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 20:56:35 -0700
Date: Wed, 27 Apr 2011  0:30:06 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 45/52] perl_5.12.2.bb: Undefine features not found in uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 07:33:05 -0000

From: Khem Raj <raj.khem@gmail.com>

[sgw: cleaned whitespace issue, removed unneeded ;patch=1]
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../perl/perl-5.12.3/native-ssp.patch              |   16 ----------------
 meta/recipes-devtools/perl/perl_5.12.3.bb          |   14 +++++++-------
 2 files changed, 7 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/native-ssp.patch

diff --git a/meta/recipes-devtools/perl/perl-5.12.3/native-ssp.patch b/meta/recipes-devtools/perl/perl-5.12.3/native-ssp.patch
deleted file mode 100644
index e1e6f08..0000000
--- a/meta/recipes-devtools/perl/perl-5.12.3/native-ssp.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status:Inappropriate [embedded specific]
-
-Fix for compiling with ssp enabled gcc:
-See http://bugs.openembedded.net/show_bug.cgi?id=1980
-
-diff -Naur perl-5.8.7.orig/cflags.SH perl-5.8.7/cflags.SH
---- perl-5.8.7.orig/cflags.SH	2002-09-30 10:59:07.000000000 +0000
-+++ perl-5.8.7/cflags.SH	2005-10-02 04:08:39.000000000 +0000
-@@ -165,6 +165,8 @@
- esac
- 
-     : Can we perhaps use $ansi2knr here
-+    [[ $file == regcomp ]] && export ccflags="${ccflags} -fno-stack-protector"
-+    [[ $file == regexec ]] && export ccflags="${ccflags} -fno-stack-protector"
-     echo "$cc -c -DPERL_CORE $ccflags $optimize $warn"
-     eval "$also "'"$cc -DPERL_CORE -c $ccflags $optimize $warn"'
diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index 07b8eac..847ee59 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -58,13 +58,13 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
         file://parallel_build_fix_4.patch \
         file://parallel_build_fix_5.patch \
         file://parallel_build_fix_6.patch \
-        file://Makefile.SH.patch;patch=1 \
-        file://installperl.patch;patch=1 \
-        file://perl-dynloader.patch;patch=1 \
-        file://perl-moreconfig.patch;patch=1 \
-        file://letgcc-find-errno.patch;patch=1 \
-        file://generate-sh.patch;patch=1 \
-        file://09_fix_installperl.patch;patch=1 \
+        file://Makefile.SH.patch \
+        file://installperl.patch \
+        file://perl-dynloader.patch \
+        file://perl-moreconfig.patch \
+        file://letgcc-find-errno.patch \
+        file://generate-sh.patch \
+        file://09_fix_installperl.patch \
         file://native-perlinc.patch \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
-- 
1.7.1.1



