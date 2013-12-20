Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 590066D014
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 09:37:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2013 01:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,519,1384329600"; d="scan'208";a="427723702"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.151])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2013 01:37:26 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 11:43:49 +0200
Message-Id: <7a79447c57e61c267a9c518b70c28c5a15dec86f.1387532399.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387532399.git.cristiana.voicu@intel.com>
References: <cover.1387532399.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1387532399.git.cristiana.voicu@intel.com>
References: <cover.1387532399.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/1] valgrind: upgrade to 3.9.0
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
X-List-Received-Date: Fri, 20 Dec 2013 09:37:26 -0000

Changed patches directory to "valgrind";
Removed 4 patches because they were merged upstream;
Updated 2 patches because now it has configure.ac instead of .in;
Changed license md5 for 2 files because of a small change for copyright
year

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../configure-with-newer-glibc.patch               |   41 --------------------
 .../valgrind/valgrind-3.8.1/eglibc-2.18.patch      |   27 -------------
 .../fix_issue_caused_by_ccache.patch               |   32 ---------------
 .../valgrind-3.8.1/fix_unsupporting_kernel_3.patch |   26 -------------
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |    0
 .../fixed-perl-path.patch                          |    0
 .../{valgrind-3.8.1 => valgrind}/sepbuildfix.patch |   26 ++++++-------
 .../{valgrind_3.8.1.bb => valgrind_3.9.0.bb}       |   12 ++----
 8 files changed, 17 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.8.1 => valgrind}/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.8.1 => valgrind}/fixed-perl-path.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.8.1 => valgrind}/sepbuildfix.patch (96%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.8.1.bb => valgrind_3.9.0.bb} (76%)

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
deleted file mode 100644
index d3cea23..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Add case for glibc 2.16 and correct error message to denote support until 2.16
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Signed-off-by: Radu Moisan <radu.moisan@intel.com>
-
-Upstream-Status: Pending
-Index: valgrind-3.8.1/configure.in
-===================================================================
---- valgrind-3.8.1.orig/configure.in
-+++ valgrind-3.8.1/configure.in
-@@ -910,6 +910,20 @@ case "${GLIBC_VERSION}" in
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.16)
-+	AC_MSG_RESULT(2.16 family)
-+	AC_DEFINE([GLIBC_2_16], 1, [Define to 1 if you're using glibc 2.16.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-+     2.17)
-+	AC_MSG_RESULT(2.17 family)
-+	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
-@@ -923,7 +937,7 @@ case "${GLIBC_VERSION}" in
- 
-      *)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
-+	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.17])
- 	AC_MSG_ERROR([or Darwin libc])
- 	;;
- esac
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
deleted file mode 100644
index 1fa8127..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-
-
-Found in the SVN valgrind code
-svn diff -c 13504 configure.in 
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: valgrind-3.8.1/configure.in
-===================================================================
---- valgrind-3.8.1.orig/configure.in
-+++ valgrind-3.8.1/configure.in
-@@ -924,6 +924,13 @@ case "${GLIBC_VERSION}" in
- 	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.18)
-+	AC_MSG_RESULT(2.18 family)
-+	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch
deleted file mode 100644
index 4658567..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-The script does not expect use of ccache, hence fix it to recognise it.
-
-2010/08/17
-Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: valgrind-3.5.0/coregrind/link_tool_exe_linux.in
-===================================================================
---- valgrind-3.5.0.orig/coregrind/link_tool_exe_linux.in
-+++ valgrind-3.5.0/coregrind/link_tool_exe_linux.in
-@@ -62,6 +62,11 @@ die "Bogus alt-load address"
- 
- # The cc invokation to do the final link
- my $cc = $ARGV[1];
-+my $next = 2;
-+if ("$cc" eq "ccache") {
-+    $cc = "$cc $ARGV[2]";
-+    $next = 3;
-+}
- 
- # and the 'restargs' are argv[2 ..]
- 
-@@ -71,7 +76,7 @@ my $cc = $ARGV[1];
- my $cmd="$cc -static -Wl,-Ttext=$ala";
- 
- # Add the rest of the parameters
--foreach my $n (2 .. $#ARGV) {
-+foreach my $n ($next .. $#ARGV) {
-    $cmd = "$cmd $ARGV[$n]";
- }
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch
deleted file mode 100644
index 346ffeb..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-valgrind: Add 3.x statements to "case" for supporting the kernel 3.x
-
-Signed-off-by: Lin Tong <tong.lin@intel.com>
-
-Upstream-Status: Pending
-
-diff --git a/configure.in b/configure.in
-index 3878619..1cb7dc7 100644
---- a/configure.in
-+++ b/configure.in
-@@ -229,10 +229,14 @@ case "${host_os}" in
-         	    AC_MSG_RESULT([2.4 family (${kernel})])
-         	    AC_DEFINE([KERNEL_2_4], 1, [Define to 1 if you're using Linux 2.4.x])
-         	    ;;
-+             3.*)
-+                    AC_MSG_RESULT([3 family (${kernel})])
-+                    AC_DEFINE([KERNEL_3], 1, [Define to 1 if you're using Linux 3.x])
-+                    ;;
- 
-              *) 
-         	    AC_MSG_RESULT([unsupported (${kernel})])
--        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
-+        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6, 3.x])
-         	    ;;
-         esac
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.8.1/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
rename to meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.8.1/fixed-perl-path.patch
rename to meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/sepbuildfix.patch b/meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
similarity index 96%
rename from meta/recipes-devtools/valgrind/valgrind-3.8.1/sepbuildfix.patch
rename to meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
index fe3f8da..5db0ef8 100644
--- a/meta/recipes-devtools/valgrind/valgrind-3.8.1/sepbuildfix.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
@@ -6,11 +6,11 @@ RP 2013/03/23
 
 Upstream-Status: Pending
 
-Index: valgrind-3.8.1/configure.in
+Index: valgrind-3.9.0/configure.ac
 ===================================================================
---- valgrind-3.8.1.orig/configure.in	2013-03-23 16:06:58.388793432 +0000
-+++ valgrind-3.8.1/configure.in	2013-03-23 16:46:15.088737377 +0000
-@@ -316,26 +316,26 @@
+--- valgrind-3.9.0.orig/configure.ac
++++ valgrind-3.9.0/configure.ac
+@@ -325,26 +325,26 @@ case "${host_os}" in
  	     9.*)
  		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
@@ -45,7 +45,7 @@ Index: valgrind-3.8.1/configure.in
  		  ;;
               *) 
  		  AC_MSG_RESULT([unsupported (${kernel})])
-@@ -805,124 +805,124 @@
+@@ -799,124 +799,124 @@ case "${GLIBC_VERSION}" in
       2.2)
  	AC_MSG_RESULT(2.2 family)
  	AC_DEFINE([GLIBC_2_2], 1, [Define to 1 if you're using glibc 2.2.x])
@@ -189,18 +189,18 @@ Index: valgrind-3.8.1/configure.in
 +	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 +	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
-      2.16)
- 	AC_MSG_RESULT(2.16 family)
- 	AC_DEFINE([GLIBC_2_16], 1, [Define to 1 if you're using glibc 2.16.x])
+      2.17)
+ 	AC_MSG_RESULT(2.17 family)
+ 	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
 +	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 +	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
-      2.17)
- 	AC_MSG_RESULT(2.17 family)
- 	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
+      2.18)
+ 	AC_MSG_RESULT(2.18 family)
+ 	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
@@ -209,7 +209,7 @@ Index: valgrind-3.8.1/configure.in
  	;;
       darwin)
  	AC_MSG_RESULT(Darwin)
-@@ -932,7 +932,7 @@
+@@ -926,7 +926,7 @@ case "${GLIBC_VERSION}" in
       bionic)
  	AC_MSG_RESULT(Bionic)
  	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
@@ -218,7 +218,7 @@ Index: valgrind-3.8.1/configure.in
  	;;
  
       *)
-@@ -949,11 +949,11 @@
+@@ -943,11 +943,11 @@ AC_SUBST(GLIBC_VERSION)
  # attempt to detect whether such libraries are installed on the
  # build machine (or even if any X facilities are present); just
  # add the suppressions antidisirregardless.
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
similarity index 76%
rename from meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index 9630960..80aac62 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=6b18ba0139d10678ce3a9969f68e4c6d \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=b6bb5ab625a759823e17197ec3e2ee83 \
+                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=e7071929a50d4b0fc27a3014b315b0f7 \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=92df8a1bde56fe2af70931ff55f6622f \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 
 X11DEPENDS = "virtual/libx11"
@@ -12,17 +12,13 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 PR = "r8"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
-	   file://fix_issue_caused_by_ccache.patch \
-           file://fix_unsupporting_kernel_3.patch \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
-           file://configure-with-newer-glibc.patch \
            file://sepbuildfix.patch \
-           file://eglibc-2.18.patch \
           "
 
-SRC_URI[md5sum] = "288758010b271119a0ffc0183f1d6e38"
-SRC_URI[sha256sum] = "473be00576bed311a662b277a2bfbe97d9cca4058e68619a0e420c9fc19958db"
+SRC_URI[md5sum] = "0947de8112f946b9ce64764af7be6df2"
+SRC_URI[sha256sum] = "e6af71a06bc2534541b07743e1d58dc3caf744f38205ca3e5b5a0bdf372ed6f0"
 
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
-- 
1.7.9.5


