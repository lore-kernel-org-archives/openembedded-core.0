Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QWjkW-00025J-22
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 08:38:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5F6ZLkC029084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 23:35:21 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 14 Jun 2011 23:35:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2011 14:33:46 +0800
Message-ID: <b3afba65e91c435cfd85ff51a7ebdf1238abe63d.1308108460.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308108460.git.liezhi.yang@windriver.com>
References: <cover.1308108460.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4 V2] gcc-4.6.0: share work directories
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
X-List-Received-Date: Wed, 15 Jun 2011 06:38:48 -0000
Content-Type: text/plain

Fix configure and Makefile to read the defaults.h and t-oe from ${B},
so that the ${S} can be shared.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    1 +
 .../gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch   |   80 ++++++++++++++++++++
 2 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
index cb9eb8e..ebfedd7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -54,6 +54,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
            file://volatile_access_backport.patch \
+           file://use-defaults.h-and-t-oe-in-B.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch
new file mode 100644
index 0000000..b4351ee
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch
@@ -0,0 +1,80 @@
+Upstream-Status: Pending
+
+Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
+the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+---
+ gcc/Makefile.in  |    2 +-
+ gcc/configure    |    4 ++--
+ gcc/configure.ac |    4 ++--
+ gcc/mkconfig.sh  |    4 ++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 7790915..3a0c34a 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -463,7 +463,7 @@ LIMITS_H_TEST = [ -f $(SYSTEM_HEADER_DIR)/limits.h ]
+ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+diff --git a/gcc/configure b/gcc/configure
+index 82fa3e4..d4711b5 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -11227,8 +11227,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 844d8da..a960343 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1628,8 +1628,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
+index d56df8c..875d0f1 100644
+--- a/gcc/mkconfig.sh
++++ b/gcc/mkconfig.sh
+@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
+     if [ $# -ge 1 ]; then
+ 	echo '#ifdef IN_GCC' >> ${output}T
+ 	for file in "$@"; do
+-	    if test x"$file" = x"defaults.h"; then
++	    if test x"$file" = x"./defaults.h"; then
+ 		postpone_defaults_h="yes"
+ 	    else
+ 		echo "# include \"$file\"" >> ${output}T
+@@ -103,7 +103,7 @@ esac
+ 
+ # If we postponed including defaults.h, add the #include now.
+ if test x"$postpone_defaults_h" = x"yes"; then
+-    echo "# include \"defaults.h\"" >> ${output}T
++    echo "# include \"./defaults.h\"" >> ${output}T
+ fi
+ 
+ # Add multiple inclusion protection guard, part two.
+-- 
+1.7.1
+
-- 
1.7.1



