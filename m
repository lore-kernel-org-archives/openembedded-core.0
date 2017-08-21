Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45F1F78327
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 09:49:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L9nVa6010664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Aug 2017 02:49:31 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 02:49:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 21 Aug 2017 05:49:29 -0400
Message-ID: <1503308969-28105-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2] gnupg: 2.1.20 -> 2.1.23
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
X-List-Received-Date: Mon, 21 Aug 2017 09:49:34 -0000
Content-Type: text/plain

1. COPYING.LIB: Rename to COPYING.LGPL3.
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=3419a339d9c4e800bf30e9021e05982d8c1021c1

2. Rebase patches:
- pkgconfig.patch -> 0001
- use-pkgconfig-instead-of-npth-config.patch -> 0002
- dirmngr-uses-libgpg-error.patch -> 0003
- autogen.sh-fix-find-version-for-beta-checking.patch -> 0004

3. Fix gpg2 not found
...
dnf -vy makecache

|Cannot download 'http://192.168.7.1:33541': repomd.xml GPG signature
verification error: gpgme_engine_check_version() error: Invalid crypto
engine.
...

The upstream install gpg by default and no gpg2
...
commit a69464b0b6dac88b360a13d3faf19dd7f2a0e02b
Author: Werner Koch <wk@gnupg.org>
Date:   Sat Aug 5 14:39:32 2017 +0200

    gpg: Install gpg by default under the name gpg.
...
Add --enable-gpg-is-gpg2 to revert it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-config-to-find-pth-instead-of-pth-config.patch | 105 +++++++++++++++++++++
 ...0002-use-pkgconfig-instead-of-npth-config.patch |  85 +++++++++++++++++
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch     |  32 +++++++
 ...gen.sh-fix-find-version-for-beta-checking.patch |  34 +++++++
 ...gen.sh-fix-find-version-for-beta-checking.patch |  31 ------
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    |  16 ----
 meta/recipes-support/gnupg/gnupg/pkgconfig.patch   |  90 ------------------
 .../use-pkgconfig-instead-of-npth-config.patch     |  72 --------------
 meta/recipes-support/gnupg/gnupg_2.1.20.bb         |  45 ---------
 meta/recipes-support/gnupg/gnupg_2.1.23.bb         |  46 +++++++++
 10 files changed, 302 insertions(+), 254 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/pkgconfig.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg_2.1.20.bb
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.1.23.bb

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch b/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
new file mode 100644
index 0000000..5c9c022
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
@@ -0,0 +1,105 @@
+From 59a3c76d4016ffc615f1c45184f4c6820061d69c Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 16 Aug 2017 11:14:12 +0800
+Subject: [PATCH 1/4] Use pkg-config to find pth instead of pth-config.
+
+Upstream-Status: Denied
+[not submitted but they've been clear they don't want a pkg-config
+dependency]
+
+RP 2014/5/22
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Rebase to 2.1.23
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/gnupg-pth.m4 | 53 ++++++++---------------------------------------------
+ 1 file changed, 8 insertions(+), 45 deletions(-)
+
+diff --git a/m4/gnupg-pth.m4 b/m4/gnupg-pth.m4
+index 6dc9e0e..5892531 100644
+--- a/m4/gnupg-pth.m4
++++ b/m4/gnupg-pth.m4
+@@ -17,33 +17,9 @@ dnl implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ # Taken and modified from the m4 macros which come with Pth.
+ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
+   [
+-    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]3}'`
+     _req_version="ifelse([$1],,1.2.0,$1)"
++    PKG_CHECK_MODULES(PTH, [pth >= $_req_version], [have_pth=yes], [have_pth=no])
+ 
+-    AC_MSG_CHECKING(for PTH - version >= $_req_version)
+-    for _var in _pth_version _req_version; do
+-        eval "_val=\"\$${_var}\""
+-        _major=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\1/'`
+-        _minor=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\2/'`
+-        _rtype=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\3/'`
+-        _micro=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\4/'`
+-        case $_rtype in
+-            "a" ) _rtype=0 ;;
+-            "b" ) _rtype=1 ;;
+-            "." ) _rtype=2 ;;
+-        esac
+-        _hex=`echo dummy | awk '{ printf("%d%02d%1d%02d", major, minor, rtype, micro); }' \
+-              "major=$_major" "minor=$_minor" "rtype=$_rtype" "micro=$_micro"`
+-        eval "${_var}_hex=\"\$_hex\""
+-    done
+-    have_pth=no
+-    if test ".$_pth_version_hex" != .; then
+-        if test ".$_req_version_hex" != .; then
+-            if test $_pth_version_hex -ge $_req_version_hex; then
+-                have_pth=yes
+-            fi
+-        fi
+-    fi
+     if test $have_pth = yes; then
+        AC_MSG_RESULT(yes)
+        AC_MSG_CHECKING([whether PTH installation is sane])
+@@ -51,9 +27,9 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
+          _gnupg_pth_save_cflags=$CFLAGS
+          _gnupg_pth_save_ldflags=$LDFLAGS
+          _gnupg_pth_save_libs=$LIBS
+-         CFLAGS="$CFLAGS `$PTH_CONFIG --cflags`"
+-         LDFLAGS="$LDFLAGS `$PTH_CONFIG --ldflags`"
+-         LIBS="$LIBS `$PTH_CONFIG --libs --all`"
++         CFLAGS="$CFLAGS $PTH_CFLAGS"
++         LDFLAGS="$LDFLAGS $PTH_LDFLAGS"
++         LIBS="$LIBS $PTH_LIBS"
+          AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pth.h>
+                                          ],
+                                          [[ pth_init ();]])],
+@@ -80,26 +56,13 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
+ # PTH_CLFAGS and PTH_LIBS are AS_SUBST.
+ #
+ AC_DEFUN([GNUPG_PATH_PTH],
+-[ AC_ARG_WITH(pth-prefix,
+-             AC_HELP_STRING([--with-pth-prefix=PFX],
+-                           [prefix where GNU Pth is installed (optional)]),
+-     pth_config_prefix="$withval", pth_config_prefix="")
+-  if test x$pth_config_prefix != x ; then
+-     PTH_CONFIG="$pth_config_prefix/bin/pth-config"
+-  fi
+-  AC_PATH_PROG(PTH_CONFIG, pth-config, no)
++[
+   tmp=ifelse([$1], ,1.3.7,$1)
+-  if test "$PTH_CONFIG" != "no"; then
+-    GNUPG_PTH_VERSION_CHECK($tmp)
+-    if test $have_pth = yes; then      
+-       PTH_CFLAGS=`$PTH_CONFIG --cflags`
+-       PTH_LIBS=`$PTH_CONFIG --ldflags`
+-       PTH_LIBS="$PTH_LIBS `$PTH_CONFIG --libs --all`"
+-       AC_DEFINE(HAVE_PTH, 1,
++  GNUPG_PTH_VERSION_CHECK($tmp)
++  if test $have_pth = yes; then
++      AC_DEFINE(HAVE_PTH, 1,
+                 [Defined if the GNU Pth is available])
+-    fi
+   fi
+   AC_SUBST(PTH_CFLAGS)
+   AC_SUBST(PTH_LIBS)
+ ])
+-
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
new file mode 100644
index 0000000..6d86e5c
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -0,0 +1,85 @@
+From 53c2aec2e13f4e2d09be7148869c862f07dfdd4d Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Wed, 16 Aug 2017 11:16:30 +0800
+Subject: [PATCH 2/4] use pkgconfig instead of npth config
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Rebase to 2.1.23
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/npth.m4 | 34 ++++++++--------------------------
+ 1 file changed, 8 insertions(+), 26 deletions(-)
+
+diff --git a/m4/npth.m4 b/m4/npth.m4
+index 17c2644..15a931b 100644
+--- a/m4/npth.m4
++++ b/m4/npth.m4
+@@ -17,10 +17,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
+   if test "x$npth_config_prefix" != x ; then
+       NPTH_CONFIG="$npth_config_prefix/bin/npth-config"
+   fi
+-  AC_PATH_PROG(NPTH_CONFIG, npth-config, no)
++  AC_PATH_PROG(PKGCONFIG, pkg-config, no)
+ 
+-  if test "$NPTH_CONFIG" != "no" ; then
+-    npth_version=`$NPTH_CONFIG --version`
++  if test "$PKGCONFIG" != "no" ; then
++    npth_version=`$PKGCONFIG --modversion npth`
+   fi
+   npth_version_major=`echo $npth_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+@@ -45,7 +45,7 @@ AC_DEFUN([AM_PATH_NPTH],
+ 
+   AC_MSG_CHECKING(for NPTH - version >= $min_npth_version)
+   ok=no
+-  if test "$NPTH_CONFIG" != "no" ; then
++  if test "$PKGCONFIG" != "no" ; then
+     req_major=`echo $min_npth_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+     req_minor=`echo $min_npth_version | \
+@@ -66,28 +66,9 @@ AC_DEFUN([AM_PATH_NPTH],
+   fi
+   if test $ok = yes; then
+     AC_MSG_RESULT([yes ($npth_version)])
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
+-  if test $ok = yes; then
+-     # If we have a recent NPTH, we should also check that the
+-     # API is compatible.
+-     if test "$req_npth_api" -gt 0 ; then
+-        tmp=`$NPTH_CONFIG --api-version 2>/dev/null || echo 0`
+-        if test "$tmp" -gt 0 ; then
+-           AC_MSG_CHECKING([NPTH API version])
+-           if test "$req_npth_api" -eq "$tmp" ; then
+-             AC_MSG_RESULT([okay])
+-           else
+-             ok=no
+-             AC_MSG_RESULT([does not match. want=$req_npth_api got=$tmp])
+-           fi
+-        fi
+-     fi
+-  fi
+-  if test $ok = yes; then
+-    NPTH_CFLAGS=`$NPTH_CONFIG --cflags`
+-    NPTH_LIBS=`$NPTH_CONFIG --libs`
++    NPTH_CFLAGS=`$PKGCONFIG --cflags npth`
++    NPTH_LIBS=`$PKGCONFIG --libs npth`
++    AC_MSG_WARN([[GOT HERE - $NPTH_LIBS ]])
+     ifelse([$2], , :, [$2])
+     npth_config_host=`$NPTH_CONFIG --host 2>/dev/null || echo none`
+     if test x"$npth_config_host" != xnone ; then
+@@ -103,6 +84,7 @@ AC_DEFUN([AM_PATH_NPTH],
+       fi
+     fi
+   else
++    AC_MSG_RESULT(no)
+     NPTH_CFLAGS=""
+     NPTH_LIBS=""
+     ifelse([$3], , :, [$3])
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
new file mode 100644
index 0000000..3e798ef
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
@@ -0,0 +1,32 @@
+From 9c3858ffda6246bf9e1e6aeeb920532a56b19408 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Wed, 16 Aug 2017 11:18:01 +0800
+Subject: [PATCH 3/4] dirmngr uses libgpg error
+
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Rebase to 2.1.23
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ dirmngr/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
+index b404165..d3f916e 100644
+--- a/dirmngr/Makefile.am
++++ b/dirmngr/Makefile.am
+@@ -82,7 +82,8 @@ endif
+ dirmngr_LDADD = $(libcommonpth) \
+         $(DNSLIBS) $(LIBASSUAN_LIBS) \
+ 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
+-	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
++	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
++	$(GPG_ERROR_LIBS)
+ if USE_LDAP
+ dirmngr_LDADD += $(ldaplibs)
+ endif
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
new file mode 100644
index 0000000..dcd8582
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -0,0 +1,34 @@
+From 914ae4a3f7529fb069467bf0ded57dd24ee2e763 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 16 Aug 2017 11:23:22 +0800
+Subject: [PATCH 4/4] autogen.sh: fix find-version for beta checking
+
+find-version always assumes that gnupg is beta if autogen.sh is run
+out of git-repo. This doesn't work for users whom just take release
+tarball and re-run autoconf in their local build dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+Rebase to 2.1.23
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ autogen.sh | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index e5ba5bf..05e0e11 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -245,7 +245,6 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+       tmp="-unknown"
+       rev="0000000"
+       rvd="0"
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
deleted file mode 100644
index 4241bc3..0000000
--- a/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 717f994be2466d378e6611a4739c606db6d0dc46 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Sun, 25 Oct 2015 22:44:47 -0400
-Subject: [PATCH] autogen.sh: fix find-version for beta checking
-
-find-version always assumes that gnupg is beta if autogen.sh is run
-out of git-repo. This doesn't work for users whom just take release
-tarball and re-run autoconf in their local build dir.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- autogen.sh | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/autogen.sh b/autogen.sh
-index 7effd56..d673432 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -228,7 +228,6 @@ if [ "$myhost" = "find-version" ]; then
-       rvd=$((0x$(echo ${rev} | head -c 4)))
-     else
-       ingit=no
--      beta=yes
-       tmp="-unknown"
-       rev="0000000"
-       rvd="0"
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
deleted file mode 100644
index 7af1955..0000000
--- a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: gnupg-2.1.0/dirmngr/Makefile.am
-===================================================================
---- gnupg-2.1.0.orig/dirmngr/Makefile.am
-+++ gnupg-2.1.0/dirmngr/Makefile.am
-@@ -78,7 +78,8 @@ endif
- dirmngr_LDADD = $(libcommontlsnpth) $(libcommonpth) \
-         $(DNSLIBS) $(LIBASSUAN_LIBS) \
- 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
--	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
-+	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
-+	$(GPG_ERROR_LIBS)
- if USE_LDAP
- dirmngr_LDADD += $(ldaplibs)
- endif
diff --git a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
deleted file mode 100644
index f958603..0000000
--- a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Use pkg-config to find pth instead of pth-config.
-
-Upstream-Status: Denied
-[not submitted but they've been clear they don't want a pkg-config dependency]
-
-RP 2014/5/22
-
-Index: gnupg-2.1.0/m4/gnupg-pth.m4
-===================================================================
---- gnupg-2.1.0.orig/m4/gnupg-pth.m4
-+++ gnupg-2.1.0/m4/gnupg-pth.m4
-@@ -17,33 +17,9 @@ dnl implied warranty of MERCHANTABILITY
- # Taken and modified from the m4 macros which come with Pth.
- AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
-   [
--    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]3}'`
-     _req_version="ifelse([$1],,1.2.0,$1)"
-+    PKG_CHECK_MODULES(PTH, [pth >= $_req_version], [have_pth=yes], [have_pth=no])
- 
--    AC_MSG_CHECKING(for PTH - version >= $_req_version)
--    for _var in _pth_version _req_version; do
--        eval "_val=\"\$${_var}\""
--        _major=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\1/'`
--        _minor=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\2/'`
--        _rtype=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\3/'`
--        _micro=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\4/'`
--        case $_rtype in
--            "a" ) _rtype=0 ;;
--            "b" ) _rtype=1 ;;
--            "." ) _rtype=2 ;;
--        esac
--        _hex=`echo dummy | awk '{ printf("%d%02d%1d%02d", major, minor, rtype, micro); }' \
--              "major=$_major" "minor=$_minor" "rtype=$_rtype" "micro=$_micro"`
--        eval "${_var}_hex=\"\$_hex\""
--    done
--    have_pth=no
--    if test ".$_pth_version_hex" != .; then
--        if test ".$_req_version_hex" != .; then
--            if test $_pth_version_hex -ge $_req_version_hex; then
--                have_pth=yes
--            fi
--        fi
--    fi
-     if test $have_pth = yes; then
-        AC_MSG_RESULT(yes)
-        AC_MSG_CHECKING([whether PTH installation is sane])
-@@ -51,9 +27,9 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
-          _gnupg_pth_save_cflags=$CFLAGS
-          _gnupg_pth_save_ldflags=$LDFLAGS
-          _gnupg_pth_save_libs=$LIBS
--         CFLAGS="$CFLAGS `$PTH_CONFIG --cflags`"
--         LDFLAGS="$LDFLAGS `$PTH_CONFIG --ldflags`"
--         LIBS="$LIBS `$PTH_CONFIG --libs --all`"
-+         CFLAGS="$CFLAGS $PTH_CFLAGS"
-+         LDFLAGS="$LDFLAGS $PTH_LDFLAGS"
-+         LIBS="$LIBS $PTH_LIBS"
-          AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pth.h>
-                                          ],
-                                          [[ pth_init ();]])],
-@@ -80,26 +56,13 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
- # PTH_CLFAGS and PTH_LIBS are AS_SUBST.
- #
- AC_DEFUN([GNUPG_PATH_PTH],
--[ AC_ARG_WITH(pth-prefix,
--             AC_HELP_STRING([--with-pth-prefix=PFX],
--                           [prefix where GNU Pth is installed (optional)]),
--     pth_config_prefix="$withval", pth_config_prefix="")
--  if test x$pth_config_prefix != x ; then
--     PTH_CONFIG="$pth_config_prefix/bin/pth-config"
--  fi
--  AC_PATH_PROG(PTH_CONFIG, pth-config, no)
-+[
-   tmp=ifelse([$1], ,1.3.7,$1)
--  if test "$PTH_CONFIG" != "no"; then
--    GNUPG_PTH_VERSION_CHECK($tmp)
--    if test $have_pth = yes; then      
--       PTH_CFLAGS=`$PTH_CONFIG --cflags`
--       PTH_LIBS=`$PTH_CONFIG --ldflags`
--       PTH_LIBS="$PTH_LIBS `$PTH_CONFIG --libs --all`"
--       AC_DEFINE(HAVE_PTH, 1,
-+  GNUPG_PTH_VERSION_CHECK($tmp)
-+  if test $have_pth = yes; then
-+      AC_DEFINE(HAVE_PTH, 1,
-                 [Defined if the GNU Pth is available])
--    fi
-   fi
-   AC_SUBST(PTH_CFLAGS)
-   AC_SUBST(PTH_LIBS)
- ])
--
diff --git a/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
deleted file mode 100644
index c6dbf1b..0000000
--- a/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Inappropriate [openembedded specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-Index: gnupg-2.1.0/m4/npth.m4
-===================================================================
---- gnupg-2.1.0.orig/m4/npth.m4
-+++ gnupg-2.1.0/m4/npth.m4
-@@ -17,10 +17,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
-   if test "x$npth_config_prefix" != x ; then
-       NPTH_CONFIG="$npth_config_prefix/bin/npth-config"
-   fi
--  AC_PATH_PROG(NPTH_CONFIG, npth-config, no)
-+  AC_PATH_PROG(PKGCONFIG, pkg-config, no)
- 
--  if test "$NPTH_CONFIG" != "no" ; then
--    npth_version=`$NPTH_CONFIG --version`
-+  if test "$PKGCONFIG" != "no" ; then
-+    npth_version=`$PKGCONFIG --modversion npth`
-   fi
-   npth_version_major=`echo $npth_version | \
-                sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
-@@ -45,7 +45,7 @@ AC_DEFUN([AM_PATH_NPTH],
- 
-   AC_MSG_CHECKING(for NPTH - version >= $min_npth_version)
-   ok=no
--  if test "$NPTH_CONFIG" != "no" ; then
-+  if test "$PKGCONFIG" != "no" ; then
-     req_major=`echo $min_npth_version | \
-                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
-     req_minor=`echo $min_npth_version | \
-@@ -66,28 +66,9 @@ AC_DEFUN([AM_PATH_NPTH],
-   fi
-   if test $ok = yes; then
-     AC_MSG_RESULT([yes ($npth_version)])
--  else
--    AC_MSG_RESULT(no)
--  fi
--  if test $ok = yes; then
--     # If we have a recent NPTH, we should also check that the
--     # API is compatible.
--     if test "$req_npth_api" -gt 0 ; then
--        tmp=`$NPTH_CONFIG --api-version 2>/dev/null || echo 0`
--        if test "$tmp" -gt 0 ; then
--           AC_MSG_CHECKING([NPTH API version])
--           if test "$req_npth_api" -eq "$tmp" ; then
--             AC_MSG_RESULT([okay])
--           else
--             ok=no
--             AC_MSG_RESULT([does not match. want=$req_npth_api got=$tmp])
--           fi
--        fi
--     fi
--  fi
--  if test $ok = yes; then
--    NPTH_CFLAGS=`$NPTH_CONFIG --cflags`
--    NPTH_LIBS=`$NPTH_CONFIG --libs`
-+    NPTH_CFLAGS=`$PKGCONFIG --cflags npth`
-+    NPTH_LIBS=`$PKGCONFIG --libs npth`
-+    AC_MSG_WARN([[GOT HERE - $NPTH_LIBS ]])
-     ifelse([$2], , :, [$2])
-     npth_config_host=`$NPTH_CONFIG --host 2>/dev/null || echo none`
-     if test x"$npth_config_host" != xnone ; then
-@@ -103,6 +84,7 @@ AC_DEFUN([AM_PATH_NPTH],
-       fi
-     fi
-   else
-+    AC_MSG_RESULT(no)
-     NPTH_CFLAGS=""
-     NPTH_LIBS=""
-     ifelse([$3], , :, [$3])
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.20.bb b/meta/recipes-support/gnupg/gnupg_2.1.20.bb
deleted file mode 100644
index e56421f..0000000
--- a/meta/recipes-support/gnupg/gnupg_2.1.20.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "GNU Privacy Guard - encryption and signing tools (2.x)"
-HOMEPAGE = "http://www.gnupg.org/"
-LICENSE = "GPLv3 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
-                    file://COPYING.LIB;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
-
-DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
-
-inherit autotools gettext texinfo pkgconfig
-
-UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://pkgconfig.patch \
-           file://use-pkgconfig-instead-of-npth-config.patch \
-           file://dirmngr-uses-libgpg-error.patch \
-           file://autogen.sh-fix-find-version-for-beta-checking.patch \
-          "
-
-SRC_URI[md5sum] = "f6bc7e0b82893dfafe09109d86ff6e9b"
-SRC_URI[sha256sum] = "24cf9a69369be64a9f6f8cc11a1be33ab7780ad77a6a1b93719438f49f69960d"
-
-EXTRA_OECONF = "--disable-ldap \
-		--disable-ccid-driver \
-		--with-zlib=${STAGING_LIBDIR}/.. \
-		--with-bzip2=${STAGING_LIBDIR}/.. \
-                --with-readline=${STAGING_LIBDIR}/.. \
-               "
-RRECOMMENDS_${PN} = "pinentry"
-
-do_configure_prepend () {
-	# Else these could be used in prefernce to those in aclocal-copy
-	rm -f ${S}/m4/gpg-error.m4
-	rm -f ${S}/m4/libassuan.m4
-	rm -f ${S}/m4/ksba.m4
-	rm -f ${S}/m4/libgcrypt.m4
-}
-
-do_install_append() {
-	ln -sf gpg2 ${D}${bindir}/gpg
-	ln -sf gpgv2 ${D}${bindir}/gpgv
-}
-
-PACKAGECONFIG ??= "gnutls"
-PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
-PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.23.bb b/meta/recipes-support/gnupg/gnupg_2.1.23.bb
new file mode 100644
index 0000000..8cbe5e1
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg_2.1.23.bb
@@ -0,0 +1,46 @@
+SUMMARY = "GNU Privacy Guard - encryption and signing tools (2.x)"
+HOMEPAGE = "http://www.gnupg.org/"
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
+                    file://COPYING.LGPL3;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
+
+DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
+
+inherit autotools gettext texinfo pkgconfig
+
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch \
+           file://0002-use-pkgconfig-instead-of-npth-config.patch \
+           file://0003-dirmngr-uses-libgpg-error.patch \
+           file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
+          "
+
+SRC_URI[md5sum] = "86c2304ead54b74a422e76c3f1bc7a91"
+SRC_URI[sha256sum] = "a94476391595e9351f219188767a9d6ea128e83be5ed3226a7890f49aa2d0d77"
+
+EXTRA_OECONF = "--disable-ldap \
+		--disable-ccid-driver \
+		--with-zlib=${STAGING_LIBDIR}/.. \
+		--with-bzip2=${STAGING_LIBDIR}/.. \
+		--with-readline=${STAGING_LIBDIR}/.. \
+		--enable-gpg-is-gpg2 \
+               "
+RRECOMMENDS_${PN} = "pinentry"
+
+do_configure_prepend () {
+	# Else these could be used in prefernce to those in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
+	rm -f ${S}/m4/libassuan.m4
+	rm -f ${S}/m4/ksba.m4
+	rm -f ${S}/m4/libgcrypt.m4
+}
+
+do_install_append() {
+	ln -sf gpg2 ${D}${bindir}/gpg
+	ln -sf gpgv2 ${D}${bindir}/gpgv
+}
+
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
-- 
2.8.1


