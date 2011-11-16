Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQj9K-0004FV-6K for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 18:19:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAGHDQBR005996
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 17:13:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05699-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 17:13:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAGHDIlq005990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 17:13:19 GMT
Message-ID: <1321463602.7756.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2011 17:13:22 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libtool: Avoid relinking when cross compiling, its pointless
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
X-List-Received-Date: Wed, 16 Nov 2011 17:19:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no point in having "executable" binaries in the .libs
directory linked with different rpaths to the target which
could concivably be run on the build system when cross compiling.

This patch removes the extra rpaths ($compile_rpath) so that the
output from the "link" stage can be used on the target. We can then
avoid having to "relink" during the install stage.

This saves some build time (do_install is over 2 minutes faster for
pulseaudio).

This patch also removes an annoying "seems to be moved" warning
which is totally bogus in the sysroot case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
index 6d512b1..596528a 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
@@ -1,8 +1,9 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "r5"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
+SRC_URI += "file://fixinstall.patch"
 
 do_configure_prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
index 3d0998e..f405497 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
@@ -2,8 +2,9 @@ require libtool-${PV}.inc
 
 DEPENDS = ""
 
-PR = "r4"
+PR = "r5"
 SRC_URI += "file://prefix.patch"
+SRC_URI += "file://fixinstall.patch"
 
 inherit native
 
diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
index a96d1d1..bf1928d 100644
--- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
@@ -1,7 +1,8 @@
 require libtool-${PV}.inc
 
-PR = "r4"
+PR = "r5"
 SRC_URI += "file://prefix.patch"
+SRC_URI += "file://fixinstall.patch"
 
 inherit nativesdk
 
diff --git a/meta/recipes-devtools/libtool/libtool/fixinstall.patch b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
new file mode 100644
index 0000000..4db1686
--- a/dev/null
+++ b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
@@ -0,0 +1,110 @@
+There is no point in having "executable" binaries in the .libs
+directory linked with different rpaths to the target which 
+could concivably be run on the build system when cross compiling.
+
+This patch removes the extra rpaths ($compile_rpath) so that the
+output from the "link" stage can be used on the target. We can then
+avoid having to "relink" during the install stage.
+
+This saves some build time (do_install is over 2 minutes faster for
+pulseaudio).
+
+This patch also removes an annoying "seems to be moved" warning
+which is totally bogus in the sysroot case.
+
+Upstream-Status: Inappropriate [upstream are unlikely to take a patch like this]
+
+RP 2011/11/16
+
+Index: libtool-2.4/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-11-16 14:50:01.070383779 +0000
++++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-11-16 15:27:13.582310413 +0000
+@@ -2163,7 +2163,7 @@
+ 	dir="$func_dirname_result"
+ 	func_append dir "$objdir"
+ 
+-	if test -n "$relink_command"; then
++        if test "$fast_install" = no && test -n "$relink_command"; then
+       # Strip any trailing slash from the destination.
+       func_stripname '' '/' "$libdir"
+       destlibdir=$func_stripname_result
+@@ -2202,7 +2202,7 @@
+ 	  shift
+ 
+ 	  srcname="$realname"
+-	  test -n "$relink_command" && srcname="$realname"T
++	  test "$fast_install" = no && test -n "$relink_command" && srcname="$realname"T
+ 
+ 	  # Install the shared library and build the symlinks.
+ 	  func_show_eval "$install_shared_prog $dir/$srcname $destdir/$realname" \
+@@ -5856,15 +5856,15 @@
+ 	    # Hardcode the library path.
+ 	    # Skip directories that are in the system default run-time
+ 	    # search path.
+-	    case " $sys_lib_dlsearch_path " in
+-	    *" $absdir "*) ;;
+-	    *)
+-	      case "$compile_rpath " in
+-	      *" $absdir "*) ;;
+-	      *) func_append compile_rpath " $absdir" ;;
+-	      esac
+-	      ;;
+-	    esac
++	    #case " $sys_lib_dlsearch_path " in
++	    #*" $absdir "*) ;;
++	    #*)
++	    #  case "$compile_rpath " in
++	    #  *" $absdir "*) ;;
++	    #  *) func_append compile_rpath " $absdir" ;;
++	    #  esac
++	    #  ;;
++	    #esac
+ 	    case " $sys_lib_dlsearch_path " in
+ 	    *" $libdir "*) ;;
+ 	    *)
+@@ -5930,15 +5930,15 @@
+ 	    # Hardcode the library path.
+ 	    # Skip directories that are in the system default run-time
+ 	    # search path.
+-	    case " $sys_lib_dlsearch_path " in
+-	    *" $absdir "*) ;;
+-	    *)
+-	      case "$compile_rpath " in
+-	      *" $absdir "*) ;;
+-	      *) func_append compile_rpath " $absdir" ;;
+-	      esac
+-	      ;;
+-	    esac
++	    #case " $sys_lib_dlsearch_path " in
++	    #*" $absdir "*) ;;
++	    #*)
++	    #  case "$compile_rpath " in
++	    #  *" $absdir "*) ;;
++	    #  *) func_append compile_rpath " $absdir" ;;
++	    #  esac
++	    #  ;;
++	    #esac
+ 	    case " $sys_lib_dlsearch_path " in
+ 	    *" $libdir "*) ;;
+ 	    *)
+@@ -6284,8 +6284,8 @@
+ 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+ 		  test -z "$libdir" && \
+ 		    func_fatal_error "\`$deplib' is not a valid libtool archive"
+-		  test "$absdir" != "$libdir" && \
+-		    func_warning "\`$deplib' seems to be moved"
++		  #test "$absdir" != "$libdir" && \
++		  #  func_warning "\`$deplib' seems to be moved"
+ 
+ 		  path="-L$absdir"
+ 		fi
+@@ -8191,7 +8191,7 @@
+       if test "$hardcode_action" = relink; then
+ 	# Fast installation is not supported
+ 	link_command="$compile_var$compile_command$compile_rpath"
+-	relink_command="$finalize_var$finalize_command$finalize_rpath"
++	relink_command="$finalize_var$finalize_command$finalize_c"
+ 
+ 	func_warning "this platform does not like uninstalled shared libraries"
+ 	func_warning "\`$output' will be relinked during installation"




