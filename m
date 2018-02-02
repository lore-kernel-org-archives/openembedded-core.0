Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97F3B7874D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 09:06:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1296HOw014020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 2 Feb 2018 01:06:17 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 2 Feb 2018 01:06:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 04:06:11 -0500
Message-ID: <1517562371-140308-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com>
References: <CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] apr: 1.6.2 -> 1.6.3
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
X-List-Received-Date: Fri, 02 Feb 2018 09:06:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1. Improve inappropriate patches:
- Drop inappropriate configure_fixes.patch
  Use setting variable ac_cv_file__dev_zero and
  ac_cv_sizeof_struct_iovec to replace

- Drop cleanup.patch
  Aassign variable libtool at ./buildconf executing and
  use 0001-build-buildcheck.sh-improve-libtool-detection.patch
  to replace. Submitted it to upstream.

- Rename configfix.patch to
  0002-apr-Remove-workdir-path-references-from-installed-ap.patch
  Add its original comments and author, explain why it is inappropriate

- Drop upgrade-and-fix-1.5.1.patch
  Use 0003-Makefile.in-configure.in-support-cross-compiling.patch
  to replace. And submitted it to upstream.

2. Fix build path issue to improve reproducibility

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...d-buildcheck.sh-improve-libtool-detection.patch | 32 ++++++++++
 ...orkdir-path-references-from-installed-ap.patch} | 33 +++++++++--
 ....in-configure.in-support-cross-compiling.patch} | 52 +++++++++++------
 ...> 0004-Fix-packet-discards-HTTP-redirect.patch} | 15 +++--
 ...-fix-LTFLAGS-to-make-it-work-with-ccache.patch} | 12 ++--
 ...t-size-doesn-t-match-in-glibc-when-cross.patch} | 16 ++---
 ...ink-libapr-against-phtread-to-make-gold-.patch} | 12 ++--
 meta/recipes-support/apr/apr/cleanup.patch         | 43 --------------
 meta/recipes-support/apr/apr/configure_fixes.patch | 68 ----------------------
 .../apr/{apr_1.6.2.bb => apr_1.6.3.bb}             | 27 +++++----
 10 files changed, 140 insertions(+), 170 deletions(-)
 create mode 100644 meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
 rename meta/recipes-support/apr/apr/{configfix.patch => 0002-apr-Remove-workdir-path-references-from-installed-ap.patch} (67%)
 rename meta/recipes-support/apr/apr/{upgrade-and-fix-1.5.1.patch => 0003-Makefile.in-configure.in-support-cross-compiling.patch} (40%)
 rename meta/recipes-support/apr/apr/{Fix-packet-discards-HTTP-redirect.patch => 0004-Fix-packet-discards-HTTP-redirect.patch} (71%)
 rename meta/recipes-support/apr/apr/{configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch => 0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch} (78%)
 rename meta/recipes-support/apr/apr/{0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch => 0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch} (85%)
 rename meta/recipes-support/apr/apr/{0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch => 0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch} (90%)
 delete mode 100644 meta/recipes-support/apr/apr/cleanup.patch
 delete mode 100644 meta/recipes-support/apr/apr/configure_fixes.patch
 rename meta/recipes-support/apr/{apr_1.6.2.bb => apr_1.6.3.bb} (77%)

diff --git a/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch b/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
new file mode 100644
index 0000000..097c195
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
@@ -0,0 +1,32 @@
+From 4efdc06fb17b8a00a9eca923caa176be741d1e04 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Feb 2018 14:56:13 +0800
+Subject: [PATCH 1/7] build/buildcheck.sh: improve libtool detection
+
+Support customize libtool by variable assigning, it is helpful
+for cross compileing (such as libtool=aarch64-linux-libtool)
+
+Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/buildcheck.sh | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build/buildcheck.sh b/build/buildcheck.sh
+index ab5df44..f191a41 100755
+--- a/build/buildcheck.sh
++++ b/build/buildcheck.sh
+@@ -40,7 +40,9 @@ fi
+ # output is multiline from 1.5 onwards
+ 
+ # Require libtool 1.4 or newer
+-libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
++if test -z "$libtool"; then
++  libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
++fi
+ lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
+ if test -z "$lt_pversion"; then
+   echo "buildconf: libtool not found."
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/apr/apr/configfix.patch b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
similarity index 67%
rename from meta/recipes-support/apr/apr/configfix.patch
rename to meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
index 605c4f6..72e706f 100644
--- a/meta/recipes-support/apr/apr/configfix.patch
+++ b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
@@ -1,10 +1,28 @@
+From 5925b20da8bbc34d9bf5a5dca123ef38864d43c6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 09:39:06 +0800
+Subject: [PATCH 2/7] apr: Remove workdir path references from installed apr
+ files
+
 Upstream-Status: Inappropriate [configuration]
 
-Index: apr-1.3.3/apr-config.in
-===================================================================
---- apr-1.3.3.orig/apr-config.in	2009-01-12 15:16:31.000000000 +0000
-+++ apr-1.3.3/apr-config.in	2009-01-12 15:19:25.000000000 +0000
-@@ -152,14 +152,7 @@
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+The generated `apr-1-config' is used by other recipes at build time or
+packages at target run time, the workdir path caused confusion.
+
+Rebase to 1.6.3
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ apr-config.in | 26 ++------------------------
+ 1 file changed, 2 insertions(+), 24 deletions(-)
+
+diff --git a/apr-config.in b/apr-config.in
+index 84b4073..bbbf651 100644
+--- a/apr-config.in
++++ b/apr-config.in
+@@ -152,14 +152,7 @@ while test $# -gt 0; do
      flags="$flags $LDFLAGS"
      ;;
      --includes)
@@ -19,7 +37,7 @@ Index: apr-1.3.3/apr-config.in
      ;;
      --srcdir)
      echo $APR_SOURCE_DIR
-@@ -181,29 +167,14 @@
+@@ -181,29 +174,14 @@ while test $# -gt 0; do
      exit 0
      ;;
      --link-ld)
@@ -51,3 +69,6 @@ Index: apr-1.3.3/apr-config.in
      ;;
      --shlib-path-var)
      echo "$SHLIBPATH_VAR"
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch b/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
similarity index 40%
rename from meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
rename to meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
index 16499f5..4dd53bd 100644
--- a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
+++ b/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
@@ -1,45 +1,63 @@
-Makefile.in: fix cross compiling failed
+From d5028c10f156c224475b340cfb1ba025d6797243 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 2 Feb 2018 15:51:42 +0800
+Subject: [PATCH 3/7] Makefile.in/configure.in: support cross compiling
 
-The tools/gen_test_char was invoked at build time,
-and it didn't work for the cross compiling, so we
-compile it with $BUILD_CC.
+While cross compiling, the tools/gen_test_char could not
+be executed at build time, use AX_PROG_CC_FOR_BUILD to
+build native tools/gen_test_char
 
-Remove the 'tools' dir creation, it always existed.
-And it caused gen_test_char unexpected rebuilt at
-do_install time.
-
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile.in | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
+ Makefile.in  | 10 +++-------
+ configure.in |  3 +++
+ 2 files changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a2a5194..5fe028f 100644
+index 5fb760e..8675f90 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -46,7 +46,6 @@ LT_VERSION = @LT_VERSION@
+@@ -46,7 +46,7 @@ LT_VERSION = @LT_VERSION@
  
  CLEAN_TARGETS = apr-config.out apr.exp exports.c export_vars.c .make.dirs \
  	build/apr_rules.out tools/gen_test_char@EXEEXT@ \
 -	tools/gen_test_char.o tools/gen_test_char.lo \
++	tools/gen_test_char.o \
  	include/private/apr_escape_test_char.h
  DISTCLEAN_TARGETS = config.cache config.log config.status \
  	include/apr.h include/arch/unix/apr_private.h \
-@@ -129,13 +128,8 @@ check: $(TARGET_LIB)
+@@ -131,13 +131,9 @@ check: $(TARGET_LIB)
  etags:
  	etags `find . -name '*.[ch]'`
  
 -OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
 -tools/gen_test_char.lo: tools/gen_test_char.c
--	$(APR_MKDIR) tools
++tools/gen_test_char@EXEEXT@: tools/gen_test_char.c
+ 	$(APR_MKDIR) tools
 -	$(LT_COMPILE)
 -
 -tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)
 -	$(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
-+tools/gen_test_char@EXEEXT@: tools/gen_test_char.c
-+	$(BUILD_CC) $(CFLAGS_FOR_BUILD) $< -o $@
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
  
  include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
  	$(APR_MKDIR) include/private
+diff --git a/configure.in b/configure.in
+index 719f331..361120f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -183,6 +183,9 @@ dnl can only be used once within a configure script, so this prevents a
+ dnl preload section from invoking the macro to get compiler info.
+ AC_PROG_CC
+ 
++dnl Check build CC for gen_test_char compiling which is executed at build time.
++AX_PROG_CC_FOR_BUILD
++
+ dnl AC_PROG_SED is only avaliable in recent autoconf versions.
+ dnl Use AC_CHECK_PROG instead if AC_PROG_SED is not present.
+ ifdef([AC_PROG_SED],
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch
similarity index 71%
rename from meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
rename to meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch
index 6805b8b..30fc07d 100644
--- a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
+++ b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch
@@ -1,4 +1,7 @@
-Fix packet discards HTTP redirect.
+From 7925eb1766a00ccee05c6e80b1d34f163a04b7b1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 09:43:34 +0800
+Subject: [PATCH 4/7] Fix packet discards HTTP redirect.
 
 Disconnect the connection by poll() timeout.
 If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
@@ -8,12 +11,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
 Signed-off-by: Li Wang <li.wang@windriver.com>
+
+Rebase to 1.6.3
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- network_io/unix/sendrecv.c |    4 ++++
+ network_io/unix/sendrecv.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
-index c133a26..e8faf15 100644
+index 4c0e0a6..1bdafba 100644
 --- a/network_io/unix/sendrecv.c
 +++ b/network_io/unix/sendrecv.c
 @@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, char *buf, apr_size_t *len)
@@ -28,5 +35,5 @@ index c133a26..e8faf15 100644
              *len = 0;
              return arv;
 -- 
-1.7.9.5
+1.8.3.1
 
diff --git a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
similarity index 78%
rename from meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
rename to meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
index 7521eeb..02634e6 100644
--- a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
+++ b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
@@ -1,7 +1,7 @@
-From d439093aa07a486f559206ac9e5808a6a18218cd Mon Sep 17 00:00:00 2001
+From 2e66cece0c3adff92733332111204ddc1d730a07 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 19 Nov 2015 18:25:38 -0800
-Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
+Subject: [PATCH 5/7] configure.in: fix LTFLAGS to make it work with ccache
 
 When ccache is enabled, libtool requires --tag=CC when use ccache,
 otherwise when building apr-util with ccache enabled:
@@ -15,14 +15,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- configure.in |    2 +-
+ configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 5a4a988..9d57ae6 100644
+index 361120f..3b10422 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -246,7 +246,7 @@ case $host in
+@@ -249,7 +249,7 @@ case $host in
      ;;
  *)
      if test "x$LTFLAGS" = "x"; then
@@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644
      if test "$experimental_libtool" = "yes"; then
          # Use a custom-made libtool replacement
 -- 
-1.7.9.5
+1.8.3.1
 
diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
similarity index 85%
rename from meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
rename to meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
index c5e92ac..5f5e7ea 100644
--- a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
+++ b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
@@ -1,7 +1,7 @@
-From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00 2001
+From f4d6e45ed5d2ccffd1af4c2ccdf7099ba0dce137 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Wed, 14 Dec 2016 18:13:08 +0800
-Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
+Subject: [PATCH 6/7] apr: fix off_t size doesn't match in glibc when cross
  compiling
 
 In configure.in, it contains the following:
@@ -34,10 +34,10 @@ Upstream-Status: Pending
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 9d57ae6..5b19940 100644
+index 3b10422..a227e72 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -1681,7 +1681,7 @@ else
+@@ -1769,7 +1769,7 @@ else
      socklen_t_value="int"
  fi
  
@@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644
  
  if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
      pid_t_fmt='#define APR_PID_T_FMT "hd"'
-@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize_t_fmt="ld"])
+@@ -1838,7 +1838,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize_t_fmt="ld"])
  APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt="u"])
  APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt="lu"])
  
@@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644
  
  AC_MSG_CHECKING([which format to use for apr_ssize_t])
  if test -n "$ssize_t_fmt"; then
-@@ -1767,7 +1767,7 @@ fi
+@@ -1855,7 +1855,7 @@ fi
  
  ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
  
@@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644
  
  AC_MSG_CHECKING([which format to use for apr_size_t])
  if test -n "$size_t_fmt"; then
-@@ -1784,7 +1784,7 @@ fi
+@@ -1872,7 +1872,7 @@ fi
  
  size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
  
@@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644
  if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
      # Enable LFS
 -- 
-2.7.4
+1.8.3.1
 
diff --git a/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
similarity index 90%
rename from meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
rename to meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
index 7d0dddc..8760b01 100644
--- a/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
+++ b/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
@@ -1,8 +1,8 @@
-From 94d1ca0266a0f9c0446f1299b54f752e87b8a695 Mon Sep 17 00:00:00 2001
+From c6afc4a4a766478cb6aa6b43a50051881b6318d7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 3 Mar 2017 22:24:17 +0100
-Subject: [PATCH] explicitly link libapr against phtread to make gold happy on
- test
+Subject: [PATCH 7/7] explicitly link libapr against phtread to make gold happy
+ on test
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -34,10 +34,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.in b/configure.in
-index 5b19940..cdf4d58 100644
+index a227e72..cbc0f90 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -766,6 +766,7 @@ else
+@@ -784,6 +784,7 @@ else
            APR_PTHREADS_CHECK_RESTORE ] )
      fi
      if test "$pthreadh" = "1"; then
@@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644
          APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
          APR_CHECK_PTHREAD_RECURSIVE_MUTEX
 -- 
-2.9.3
+1.8.3.1
 
diff --git a/meta/recipes-support/apr/apr/cleanup.patch b/meta/recipes-support/apr/apr/cleanup.patch
deleted file mode 100644
index b6784e0..0000000
--- a/meta/recipes-support/apr/apr/cleanup.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: apr-1.4.2/build/buildcheck.sh
-===================================================================
---- apr-1.4.2.orig/build/buildcheck.sh	2009-11-13 08:27:16.000000000 +0800
-+++ apr-1.4.2/build/buildcheck.sh	2010-11-26 15:44:00.000000000 +0800
-@@ -32,35 +32,4 @@
- echo "buildconf: autoconf version $ac_version (ok)"
- fi
- 
--# Sample libtool --version outputs:
--# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
--# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
--# output is multiline from 1.5 onwards
--
--# Require libtool 1.4 or newer
--libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
--lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
--if test -z "$lt_pversion"; then
--echo "buildconf: libtool not found."
--echo "           You need libtool version 1.4 or newer installed"
--echo "           to build APR from SVN."
--exit 1
--fi
--lt_version=`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
--IFS=.; set $lt_version; IFS=' '
--lt_status="good"
--if test "$1" = "1"; then
--   if test "$2" -lt "4"; then
--      lt_status="bad"
--   fi
--fi
--if test $lt_status = "good"; then
--   echo "buildconf: libtool version $lt_pversion (ok)"
--   exit 0
--fi
--
--echo "buildconf: libtool version $lt_pversion found."
--echo "           You need libtool version 1.4 or newer installed"
--echo "           to build APR from SVN."
--
--exit 1
-+exit 0
diff --git a/meta/recipes-support/apr/apr/configure_fixes.patch b/meta/recipes-support/apr/apr/configure_fixes.patch
deleted file mode 100644
index 0514000..0000000
--- a/meta/recipes-support/apr/apr/configure_fixes.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: apr-1.3.3/configure.in
-===================================================================
---- apr-1.3.3.orig/configure.in
-+++ apr-1.3.3/configure.in
-@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm
-                 create_area])
- 
- APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
--AC_CHECK_FILE(/dev/zero)
--
--# Not all systems can mmap /dev/zero (such as HP-UX).  Check for that.
--if test "$ac_cv_func_mmap" = "yes" &&
--   test "$ac_cv_file__dev_zero" = "yes"; then
--    AC_MSG_CHECKING(for mmap that can map /dev/zero)
--    AC_TRY_RUN([
--#include <sys/types.h>
--#include <sys/stat.h>
--#include <fcntl.h>
--#ifdef HAVE_SYS_MMAN_H
--#include <sys/mman.h>
--#endif
--    int main()
--    {
--        int fd;
--        void *m;
--        fd = open("/dev/zero", O_RDWR);
--        if (fd < 0) {
--            return 1;
--        }
--        m = mmap(0, sizeof(void*), PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
--        if (m == (void *)-1) {  /* aka MAP_FAILED */
--            return 2;
--        }
--        if (munmap(m, sizeof(void*)) < 0) {
--            return 3;
--        }
--        return 0;
--    }], [], [ac_cv_file__dev_zero=no], [ac_cv_file__dev_zero=no])
--
--    AC_MSG_RESULT($ac_cv_file__dev_zero)
--fi
- 
- # Now we determine which one is our anonymous shmem preference.
- haveshmgetanon="0"
-@@ -1518,13 +1485,14 @@ else
-     bigendian=0
- fi
- 
--APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>
--#include <sys/uio.h>],struct iovec,0)
--if test "$ac_cv_sizeof_struct_iovec" = "0"; then
--    have_iovec=0
--else
--    have_iovec=1
--fi
-+#APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>
-+##include <sys/uio.h>],struct iovec,0)
-+#if test "$ac_cv_sizeof_struct_iovec" = "0"; then
-+#    have_iovec=0
-+#else
-+#    have_iovec=1
-+#fi
-+have_iovec=1
- 
- AC_SUBST(voidp_size)
- AC_SUBST(short_value)
diff --git a/meta/recipes-support/apr/apr_1.6.2.bb b/meta/recipes-support/apr/apr_1.6.3.bb
similarity index 77%
rename from meta/recipes-support/apr/apr_1.6.2.bb
rename to meta/recipes-support/apr/apr_1.6.3.bb
index e2eed53..87b8787 100644
--- a/meta/recipes-support/apr/apr_1.6.2.bb
+++ b/meta/recipes-support/apr/apr_1.6.3.bb
@@ -10,19 +10,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
-           file://configure_fixes.patch \
-           file://cleanup.patch \
-           file://configfix.patch \
            file://run-ptest \
-           file://upgrade-and-fix-1.5.1.patch \
-           file://Fix-packet-discards-HTTP-redirect.patch \
-           file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
-           file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
-           file://0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
+           file://0001-build-buildcheck.sh-improve-libtool-detection.patch \
+           file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch \
+           file://0003-Makefile.in-configure.in-support-cross-compiling.patch \
+           file://0004-Fix-packet-discards-HTTP-redirect.patch \
+           file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
+           file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
+           file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
 "
 
-SRC_URI[md5sum] = "e81a851967c79b5ce9bfbc909e4bf735"
-SRC_URI[sha256sum] = "09109cea377bab0028bba19a92b5b0e89603df9eab05c0f7dbd4dd83d48dcebd"
+SRC_URI[md5sum] = "12f2a349483ad6f12db49ba01fbfdbfa"
+SRC_URI[sha256sum] = "131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
@@ -35,6 +34,9 @@ CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
 #
 CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sctp_uio_h=no"
 
+CACHED_CONFIGUREVARS += "ac_cv_sizeof_struct_iovec=yes"
+CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
+
 # Otherwise libtool fails to compile apr-utils
 # x86_64-linux-libtool: compile: unable to infer tagged configuration
 # x86_64-linux-libtool:   error: specify a tag with '--tag'
@@ -50,7 +52,7 @@ do_configure_prepend() {
 	export GREP="grep"
 
 	cd ${S}
-	./buildconf
+	libtool='${HOST_SYS}-libtool' ./buildconf
 }
 
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
@@ -69,7 +71,8 @@ do_install_append() {
 }
 
 do_install_append_class-target() {
-	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_rules.mk
+	sed -i -e 's,${DEBUG_PREFIX_MAP},,g' \
+	       -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_rules.mk
 	sed -i -e 's,${STAGING_DIR_HOST},,g' \
 	       -e 's,APR_SOURCE_DIR=.*,APR_SOURCE_DIR=,g' \
 	       -e 's,APR_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apr-1-config
-- 
2.8.1


