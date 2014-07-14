Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 04D9E7026A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:11:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E8Bw0X022484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 01:11:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Jul 2014 01:11:58 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 16:10:05 +0800
Message-ID: <fcb571da8443a4e87181488e755769edecadeac7.1405322662.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1405322662.git.Chong.Lu@windriver.com>
References: <cover.1405322662.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libtool: fix different files in sysroot of sdk
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
X-List-Received-Date: Mon, 14 Jul 2014 08:12:02 -0000
Content-Type: text/plain

The libtool.m4 and ltmain.m4sh are different in target sysroot between sdk and build
environment. The reason is that we have two patches (fixinstall.patch and prefix.patch)
for libtool-cross. They change libtool.m4 and ltmain.m4sh and generate files to sysroot
dir. But we don't need them for libtool target. In sdk environment, We get libtool.m4
and ltmain.sh that don't apply on two patches.

This patch splits prefix.patch to prefix.patch and rename-libtool.patch. Then, improves
fixinstall.patch and rename-libtool.patch to apply on conditionally. Apply on both libtool
target and libtool-cross to fix different issue in sysroot between sdk and build environment.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../libtool/libtool-cross_2.4.2.bb                 |   1 +
 .../libtool/libtool-native_2.4.2.bb                |   1 +
 .../libtool/libtool/fixinstall.patch               | 139 +++++++++++++--------
 meta/recipes-devtools/libtool/libtool/prefix.patch |  23 ----
 .../libtool/libtool/rename-libtool.patch           |  40 ++++++
 meta/recipes-devtools/libtool/libtool_2.4.2.bb     |   3 +
 .../libtool/nativesdk-libtool_2.4.2.bb             |   1 +
 7 files changed, 131 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/rename-libtool.patch

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
index 72fad37..b189413 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
@@ -3,6 +3,7 @@ require libtool-${PV}.inc
 PR = "${INC_PR}.1"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
+SRC_URI += "file://rename-libtool.patch"
 SRC_URI += "file://fixinstall.patch"
 
 datadir = "${STAGING_DIR_TARGET}${target_datadir}"
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
index f1051d8..d060cb8 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
@@ -4,6 +4,7 @@ DEPENDS = ""
 
 PR = "${INC_PR}.1"
 SRC_URI += "file://prefix.patch"
+SRC_URI += "file://rename-libtool.patch"
 
 inherit native
 
diff --git a/meta/recipes-devtools/libtool/libtool/fixinstall.patch b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
index 279c07b..1bfd292 100644
--- a/meta/recipes-devtools/libtool/libtool/fixinstall.patch
+++ b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
@@ -14,88 +14,119 @@ which is totally bogus in the sysroot case.
 
 Upstream-Status: Inappropriate [upstream are unlikely to take a patch like this]
 
-RP 2011/11/16
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ libltdl/config/ltmain.m4sh | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 44 insertions(+)
 
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-11-16 14:50:01.070383779 +0000
-+++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-11-16 15:27:13.582310413 +0000
-@@ -2163,7 +2163,7 @@
+diff --git a/libltdl/config/ltmain.m4sh b/libltdl/config/ltmain.m4sh
+index eebb56e..9480cb8 100644
+--- a/libltdl/config/ltmain.m4sh
++++ b/libltdl/config/ltmain.m4sh
+@@ -2166,6 +2166,7 @@ func_mode_install ()
  	dir="$func_dirname_result"
  	func_append dir "$objdir"
  
--	if test -n "$relink_command"; then
-+	if test "$fast_install" = no && test -n "$relink_command"; then
++      if test "$buildtarget" == yes; then
+ 	if test -n "$relink_command"; then
        # Strip any trailing slash from the destination.
        func_stripname '' '/' "$libdir"
-       destlibdir=$func_stripname_result
-@@ -2202,7 +2202,7 @@
+@@ -2197,6 +2198,39 @@ func_mode_install ()
+ 	  func_show_eval "$relink_command" \
+ 	    'func_fatal_error "error: relink \`$file'\'' with the above command before installing it"'
+ 	fi
++      else
++	if test "$fast_install" = no && test -n "$relink_command"; then
++      # Strip any trailing slash from the destination.
++      func_stripname '' '/' "$libdir"
++      destlibdir=$func_stripname_result
++
++      func_stripname '' '/' "$destdir"
++      s_destdir=$func_stripname_result
++
++	  # Determine the prefix the user has applied to our future dir.
++	  inst_prefix_dir=`$ECHO "X$s_destdir" | $Xsed -e "s%$destlibdir\$%%"`
++
++	  # Don't allow the user to place us outside of our expected
++	  # location b/c this prevents finding dependent libraries that
++	  # are installed to the same prefix.
++	  # At present, this check doesn't affect windows .dll's that
++	  # are installed into $libdir/../bin (currently, that works fine)
++	  # but it's something to keep an eye on.
++	  test "$inst_prefix_dir" = "$destdir" && \
++	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
++
++	  if test -n "$inst_prefix_dir"; then
++	    # Stick the inst_prefix_dir data into the link command.
++	    relink_command=`$ECHO "$relink_command" | $SED "s%@inst_prefix_dir@%-inst-prefix-dir $inst_prefix_dir%"`
++	  else
++	    relink_command=`$ECHO "$relink_command" | $SED "s%@inst_prefix_dir@%%"`
++	  fi
++
++	  func_warning "relinking \`$file'"
++	  func_show_eval "$relink_command" \
++	    'func_fatal_error "error: relink \`$file'\'' with the above command before installing it"'
++	fi
++      fi
+ 
+ 	# See the names of the shared library.
+ 	set dummy $library_names; shift
+@@ -2205,7 +2239,11 @@ func_mode_install ()
  	  shift
  
  	  srcname="$realname"
--	  test -n "$relink_command" && srcname="$realname"T
++        if test "$buildtarget" == yes; then
+ 	  test -n "$relink_command" && srcname="$realname"T
++        else
 +	  test "$fast_install" = no && test -n "$relink_command" && srcname="$realname"T
++        fi
  
  	  # Install the shared library and build the symlinks.
  	  func_show_eval "$install_shared_prog $dir/$srcname $destdir/$realname" \
-@@ -5856,15 +5856,15 @@
+@@ -5873,6 +5911,7 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
--	    case " $sys_lib_dlsearch_path " in
--	    *" $absdir "*) ;;
--	    *)
--	      case "$compile_rpath " in
--	      *" $absdir "*) ;;
--	      *) func_append compile_rpath " $absdir" ;;
--	      esac
--	      ;;
--	    esac
-+	    #case " $sys_lib_dlsearch_path " in
-+	    #*" $absdir "*) ;;
-+	    #*)
-+	    #  case "$compile_rpath " in
-+	    #  *" $absdir "*) ;;
-+	    #  *) func_append compile_rpath " $absdir" ;;
-+	    #  esac
-+	    #  ;;
-+	    #esac
++          if test "$buildtarget" == yes; then
+ 	    case " $sys_lib_dlsearch_path " in
+ 	    *" $absdir "*) ;;
+ 	    *)
+@@ -5882,6 +5921,7 @@ func_mode_link ()
+ 	      esac
+ 	      ;;
+ 	    esac
++          fi
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -5930,15 +5930,15 @@
+@@ -5947,6 +5987,7 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
--	    case " $sys_lib_dlsearch_path " in
--	    *" $absdir "*) ;;
--	    *)
--	      case "$compile_rpath " in
--	      *" $absdir "*) ;;
--	      *) func_append compile_rpath " $absdir" ;;
--	      esac
--	      ;;
--	    esac
-+	    #case " $sys_lib_dlsearch_path " in
-+	    #*" $absdir "*) ;;
-+	    #*)
-+	    #  case "$compile_rpath " in
-+	    #  *" $absdir "*) ;;
-+	    #  *) func_append compile_rpath " $absdir" ;;
-+	    #  esac
-+	    #  ;;
-+	    #esac
++          if test "$buildtarget" == yes; then
+ 	    case " $sys_lib_dlsearch_path " in
+ 	    *" $absdir "*) ;;
+ 	    *)
+@@ -5956,6 +5997,7 @@ func_mode_link ()
+ 	      esac
+ 	      ;;
+ 	    esac
++          fi
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -6284,8 +6284,8 @@
+@@ -6301,8 +6343,10 @@ func_mode_link ()
  		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
  		  test -z "$libdir" && \
  		    func_fatal_error "\`$deplib' is not a valid libtool archive"
--		  test "$absdir" != "$libdir" && \
--		    func_warning "\`$deplib' seems to be moved"
-+		  #test "$absdir" != "$libdir" && \
-+		  #  func_warning "\`$deplib' seems to be moved"
++                if test "$buildtarget" == yes; then
+ 		  test "$absdir" != "$libdir" && \
+ 		    func_warning "\`$deplib' seems to be moved"
++                fi
  
  		  path="-L$absdir"
  		fi
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
index 5e46e68..a242019 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -18,29 +18,6 @@ the simplest fix is just to remove $SHELL.
 Updated: Date: 2011/11/09
 RP
 
-Index: libtool-2.4.2/libltdl/m4/libtool.m4
-===================================================================
---- libtool-2.4.2.orig/libltdl/m4/libtool.m4
-+++ libtool-2.4.2/libltdl/m4/libtool.m4
-@@ -94,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
- LIBTOOL_DEPS="$ltmain"
- 
- # Always use our own libtool.
--LIBTOOL='$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL='$(top_builddir)'
-+LIBTOOL="$LIBTOOL/${host_alias}-libtool"
- AC_SUBST(LIBTOOL)dnl
- 
- _LT_SETUP
-@@ -206,7 +207,7 @@ aix3*)
- esac
- 
- # Global variables:
--ofile=libtool
-+ofile=${host_alias}-libtool
- can_build_shared=yes
- 
- # All known linkers require a `.a' archive for static linking (except MSVC,
 Index: libtool-2.4.2/Makefile.am
 ===================================================================
 --- libtool-2.4.2.orig/Makefile.am
diff --git a/meta/recipes-devtools/libtool/libtool/rename-libtool.patch b/meta/recipes-devtools/libtool/libtool/rename-libtool.patch
new file mode 100644
index 0000000..9726e98
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/rename-libtool.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Renames "libtool" -> "${TARGET_PREFIX}libtool" which makes sure
+it can't be confused with the host libtool.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+diff --git a/libltdl/m4/libtool.m4 b/libltdl/m4/libtool.m4
+index 3866498..008675c 100644
+--- a/libltdl/m4/libtool.m4
++++ b/libltdl/m4/libtool.m4
+@@ -94,7 +94,12 @@ _LT_SET_OPTIONS([$0], [$1])
+ LIBTOOL_DEPS="$ltmain"
+ 
+ # Always use our own libtool.
++if test "$buildtarget" == yes; then
+ LIBTOOL='$(SHELL) $(top_builddir)/libtool'
++else
++LIBTOOL='$(top_builddir)'
++LIBTOOL="$LIBTOOL/${host_alias}-libtool"
++fi
+ AC_SUBST(LIBTOOL)dnl
+ 
+ _LT_SETUP
+@@ -206,7 +211,11 @@ aix3*)
+ esac
+ 
+ # Global variables:
++if test "$buildtarget" == yes; then
+ ofile=libtool
++else
++ofile=${host_alias}-libtool
++fi
+ can_build_shared=yes
+ 
+ # All known linkers require a `.a' archive for static linking (except MSVC,
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.2.bb b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
index a2eb4ea..14301ca 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
@@ -1,6 +1,8 @@
 require libtool-${PV}.inc
 
 PR = "${INC_PR}.0"
+SRC_URI += "file://rename-libtool.patch"
+SRC_URI += "file://fixinstall.patch"
 
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
@@ -13,3 +15,4 @@ libtool_sysroot_preprocess () {
 	rm -rf ${SYSROOT_DESTDIR}${datadir}/libtool/config/*
 }
 
+EXTRA_OECONF = "buildtarget=yes"
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
index fff15e9..993fe74 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
@@ -5,6 +5,7 @@ PR = "${INC_PR}.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
 
 SRC_URI += "file://prefix.patch"
+SRC_URI += "file://rename-libtool.patch"
 SRC_URI += "file://fixinstall.patch"
 
 inherit nativesdk
-- 
1.9.1


