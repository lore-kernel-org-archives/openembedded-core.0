Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 229B260167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 10:02:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sADA2hSP010192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Nov 2014 02:02:43 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 13 Nov 2014 02:02:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>
Date: Thu, 13 Nov 2014 18:02:39 +0800
Message-ID: <1415872959-30451-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gcc-4.9: fix the compile failure of 'defaults.h' not found
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
X-List-Received-Date: Thu, 13 Nov 2014 10:02:53 -0000
Content-Type: text/plain

While compiling gcc-crosssdk-initial-x86_64 on some host, there is
occasionally failure that test the existance of default.h doesn't
work.
...
| tmp/work-shared/gcc-4.9.1-r0/gcc-4.9.1/gcc/calls.c:1240:
error: 'STACK_CHECK_MAX_VAR_SIZE' was not declared in this scope
...

The reason is tm_include_list='** defaults.h' rather than
tm_include_list='** ./defaults.h'

So we add the test condition for this situation.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch | 30 ++++++++++++++--------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 9e4435c..fddfe9e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 46d52439052f0876a92dcf8a0ab9c60d75c8030b Mon Sep 17 00:00:00 2001
+From f7d49ca445e60faa1b5256c6b4f96c1ee5c0e353 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH 23/35] Use the defaults.h in ${B} instead of ${S}, and t-oe
@@ -11,6 +11,14 @@ gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
+
+While compiling gcc-crosssdk-initial-x86_64 on some host, there is
+occasionally failure that test the existance of default.h doesn't
+work, the reason is tm_include_list='** defaults.h' rather than
+tm_include_list='** ./defaults.h'
+
+So we add the test condition for this situation.
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  gcc/Makefile.in  |    2 +-
  gcc/configure    |    4 ++--
@@ -19,10 +27,10 @@ Upstream-Status: Pending
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 90a2bba..2320497 100644
+index d1ab22f..15fe4b6 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -469,7 +469,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+@@ -483,7 +483,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
  TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
  
  xmake_file=@xmake_file@
@@ -32,10 +40,10 @@ index 90a2bba..2320497 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index bdab45a..d587993 100755
+index 5399b2b..60a04bd 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -11539,8 +11539,8 @@ for f in $tm_file; do
+@@ -11631,8 +11631,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -47,10 +55,10 @@ index bdab45a..d587993 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 5f5c909..5e5e84f 100644
+index f87c3b6..460e0d9 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1720,8 +1720,8 @@ for f in $tm_file; do
+@@ -1740,8 +1740,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -62,7 +70,7 @@ index 5f5c909..5e5e84f 100644
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index 29fdfc7..e048dce 100644
+index c7146ed..b153f45 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
@@ -70,11 +78,11 @@ index 29fdfc7..e048dce 100644
  	echo '#ifdef IN_GCC' >> ${output}T
  	for file in "$@"; do
 -	    if test x"$file" = x"defaults.h"; then
-+	    if test x"$file" = x"./defaults.h"; then
++	    if test x"$file" = x"./defaults.h" -o x"$file" = x"defaults.h"; then
  		postpone_defaults_h="yes"
  	    else
  		echo "# include \"$file\"" >> ${output}T
-@@ -103,7 +103,7 @@ esac
+@@ -106,7 +106,7 @@ esac
  
  # If we postponed including defaults.h, add the #include now.
  if test x"$postpone_defaults_h" = x"yes"; then
@@ -84,5 +92,5 @@ index 29fdfc7..e048dce 100644
  
  # Add multiple inclusion protection guard, part two.
 -- 
-1.7.10.4
+1.9.1
 
-- 
1.9.1


