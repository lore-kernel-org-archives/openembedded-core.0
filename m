Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id CBA6575F3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 22:43:14 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nJRrc398Cz3hjMg;
	Sun, 20 Sep 2015 00:43:12 +0200 (CEST)
X-Auth-Info: ess5V0lmdhNdG9fLMWRFex5KN3hg3Io6sXP8h6ub95c=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nJRrc1P1lzvdWt;
	Sun, 20 Sep 2015 00:43:12 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Sep 2015 00:43:15 +0200
Message-Id: <1442702597-5619-7-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442702597-5619-1-git-send-email-marex@denx.de>
References: <1442702597-5619-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 6/8] libtool: Fix nios2 support
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
X-List-Received-Date: Sat, 19 Sep 2015 22:43:15 -0000

Add patch to fix excessive greediness of OS/2 check in libtool.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc    |  1 +
 ...1-libtool-Fix-support-for-NIOS2-processor.patch | 68 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index a977c73..de06ccb 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://fix-resolve-lt-sysroot.patch \
            file://nohardcodepaths.patch \
            file://unwind-opt-parsing.patch \
+           file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch b/meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
new file mode 100644
index 0000000..bbd36d8
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
@@ -0,0 +1,68 @@
+From df2cd898e48208f26320d40c3ed6b19c75c27142 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 17 Sep 2015 00:43:15 +0200
+Subject: [PATCH] libtool: Fix support for NIOS2 processor
+
+The name of the system contains the string "nios2". This string
+is caught by the some of the greedy checks for OS/2 in libtool,
+in particular the *os2* branches of switch statements match for
+the nios2 string, which results in incorrect behavior of libtool.
+
+This patch adds an explicit check for *nios2* before the *os2*
+checks to prevent the OS/2 check incorrectly trapping the nios2
+as well.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Submitted
+---
+ build-aux/ltmain.in | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index d5cf07a..4164284 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -504,6 +504,12 @@ libtool_validate_options ()
+     test : = "$debug_cmd" || func_append preserve_args " --debug"
+ 
+     case $host in
++      # For NIOS2, we want to make sure that it's not caught by the
++      # more general OS/2 check below. Otherwise, NIOS2 is the same
++      # as the default option.
++      *nios2*)
++        opt_duplicate_compiler_generated_deps=$opt_preserve_dup_deps
++        ;;
+       # Solaris2 added to fix http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16452
+       # see also: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=59788
+       *cygwin* | *mingw* | *pw32* | *cegcc* | *solaris2* | *os2*)
+@@ -6220,6 +6226,15 @@ func_mode_link ()
+ 	if test -n "$library_names" &&
+ 	   { test no = "$use_static_libs" || test -z "$old_library"; }; then
+ 	  case $host in
++	  *nios2*)
++	    # For NIOS2, we want to make sure that it's not caught by the
++	    # more general OS/2 check below. Otherwise, NIOS2 is the same
++	    # as the default option.
++	    if test no = "$installed"; then
++	      func_append notinst_deplibs " $lib"
++	      need_relink=yes
++	    fi
++	    ;;
+ 	  *cygwin* | *mingw* | *cegcc* | *os2*)
+ 	      # No point in relinking DLLs because paths are not encoded
+ 	      func_append notinst_deplibs " $lib"
+@@ -6290,6 +6305,11 @@ func_mode_link ()
+ 	    elif test -n "$soname_spec"; then
+ 	      # bleh windows
+ 	      case $host in
++	      *nios2*)
++		# For NIOS2, we want to make sure that it's not caught by the
++		# more general OS/2 check below. Otherwise, NIOS2 is the same
++		# as the default option.
++		;;
+ 	      *cygwin* | mingw* | *cegcc* | *os2*)
+ 	        func_arith $current - $age
+ 		major=$func_arith_result
+-- 
+2.5.1
+
-- 
2.1.4


