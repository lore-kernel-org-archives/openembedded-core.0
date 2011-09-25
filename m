Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R7rDp-0002oW-TC
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:06:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3SPE016337 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:28 +0100
X-Quarantine-ID: <oGsUIKxCajWU>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oGsUIKxCajWU
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:28 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3PCb016312
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:27 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R7r4g-0005X3-R3
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 16:57:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 16:56:58 +0100
Message-Id: <002ad30dae74393120d2391602371116af1bb11d.1316963134.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
References: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/9] libtool: Fix an issue where unnecessary rpaths were being injected
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
X-List-Received-Date: Sun, 25 Sep 2011 16:06:30 -0000

libtool was being to aggressive in adding rpath to binaries. This
change stops it adding them if that path the default search path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-cross_2.4.bb |    2 +-
 .../recipes-devtools/libtool/libtool-native_2.4.bb |    2 +-
 .../libtool/libtool-nativesdk_2.4.bb               |    2 +-
 meta/recipes-devtools/libtool/libtool.inc          |    3 +-
 meta/recipes-devtools/libtool/libtool/1            |   55 +++++++++++++++++
 .../libtool/libtool/fix-rpath.patch                |   63 ++++++++++++++++++++
 meta/recipes-devtools/libtool/libtool_2.4.bb       |    2 +-
 7 files changed, 124 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/1
 create mode 100644 meta/recipes-devtools/libtool/libtool/fix-rpath.patch

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
index 25ac580..6d512b1 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r2"
+PR = "r4"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
 
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
index 423622f..3d0998e 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
@@ -2,7 +2,7 @@ require libtool-${PV}.inc
 
 DEPENDS = ""
 
-PR = "r2"
+PR = "r4"
 SRC_URI += "file://prefix.patch"
 
 inherit native
diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
index 4f67fed..a96d1d1 100644
--- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r2"
+PR = "r4"
 SRC_URI += "file://prefix.patch"
 
 inherit nativesdk
diff --git a/meta/recipes-devtools/libtool/libtool.inc b/meta/recipes-devtools/libtool/libtool.inc
index d423e49..ef9095b 100644
--- a/meta/recipes-devtools/libtool/libtool.inc
+++ b/meta/recipes-devtools/libtool/libtool.inc
@@ -15,7 +15,8 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://resolve-sysroot.patch \
            file://use-sysroot-in-libpath.patch \
            file://fix-final-rpath.patch \
-           file://avoid_absolute_paths_for_general_utils.patch "
+           file://avoid_absolute_paths_for_general_utils.patch \
+           file://fix-rpath.patch "
 
 do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
diff --git a/meta/recipes-devtools/libtool/libtool/1 b/meta/recipes-devtools/libtool/libtool/1
new file mode 100644
index 0000000..b3ee955
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/1
@@ -0,0 +1,55 @@
+Index: libtool-2.4/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-09-23 08:38:06.365043626 +0100
++++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-09-23 09:57:05.235003068 +0100
+@@ -7264,8 +7264,14 @@
+ 		  esac
+ 		fi
+ 	      else
+-		eval flag=\"$hardcode_libdir_flag_spec\"
+-		func_append dep_rpath " $flag"
++                # We only want to hardcode in an rpath if it isn't in the
++                # default dlsearch path.
++	        case " $sys_lib_dlsearch_path " in
++	        *" $libdir "*) ;;
++	        *) eval flag=\"$hardcode_libdir_flag_spec\"
++                   func_append dep_rpath " $flag"
++                   ;;
++	        esac
+ 	      fi
+ 	    elif test -n "$runpath_var"; then
+ 	      case "$perm_rpath " in
+@@ -8001,8 +8007,14 @@
+ 	      esac
+ 	    fi
+ 	  else
+-	    eval flag=\"$hardcode_libdir_flag_spec\"
+-	    func_append rpath " $flag"
++            # We only want to hardcode in an rpath if it isn't in the
++            # default dlsearch path.
++	    case " $sys_lib_dlsearch_path " in
++	    *" $libdir "*) ;;
++	    *) eval flag=\"$hardcode_libdir_flag_spec\"
++               rpath+=" $flag"
++               ;;
++	    esac
+ 	  fi
+ 	elif test -n "$runpath_var"; then
+ 	  case "$perm_rpath " in
+@@ -8052,8 +8064,14 @@
+ 	      esac
+ 	    fi
+ 	  else
+-	    eval flag=\"$hardcode_libdir_flag_spec\"
+-	    func_append rpath " $flag"
++            # We only want to hardcode in an rpath if it isn't in the
++            # default dlsearch path.
++	    case " $sys_lib_dlsearch_path " in
++	    *" $libdir "*) ;;
++	    *) eval flag=\"$hardcode_libdir_flag_spec\"
++               func_append rpath " $flag"
++               ;;
++	    esac    
+ 	  fi
+ 	elif test -n "$runpath_var"; then
+ 	  case "$finalize_perm_rpath " in
diff --git a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
new file mode 100644
index 0000000..3cdeaec
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
@@ -0,0 +1,63 @@
+We don't want to add RPATHS which match default linker
+search paths, they're a waste of space. This patch
+filters libtools list and removes the ones we don't need.
+
+RP 23/9/2011
+
+Upstream-status: Pending
+
+Index: libtool-2.4/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-09-23 08:38:06.365043626 +0100
++++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-09-23 09:57:05.235003068 +0100
+@@ -7264,8 +7264,14 @@
+ 		  esac
+ 		fi
+ 	      else
+-		eval flag=\"$hardcode_libdir_flag_spec\"
+-		func_append dep_rpath " $flag"
++                # We only want to hardcode in an rpath if it isn't in the
++                # default dlsearch path.
++	        case " $sys_lib_dlsearch_path " in
++	        *" $libdir "*) ;;
++	        *) eval flag=\"$hardcode_libdir_flag_spec\"
++                   func_append dep_rpath " $flag"
++                   ;;
++	        esac
+ 	      fi
+ 	    elif test -n "$runpath_var"; then
+ 	      case "$perm_rpath " in
+@@ -8001,8 +8007,14 @@
+ 	      esac
+ 	    fi
+ 	  else
+-	    eval flag=\"$hardcode_libdir_flag_spec\"
+-	    func_append rpath " $flag"
++            # We only want to hardcode in an rpath if it isn't in the
++            # default dlsearch path.
++	    case " $sys_lib_dlsearch_path " in
++	    *" $libdir "*) ;;
++	    *) eval flag=\"$hardcode_libdir_flag_spec\"
++               rpath+=" $flag"
++               ;;
++	    esac
+ 	  fi
+ 	elif test -n "$runpath_var"; then
+ 	  case "$perm_rpath " in
+@@ -8052,8 +8064,14 @@
+ 	      esac
+ 	    fi
+ 	  else
+-	    eval flag=\"$hardcode_libdir_flag_spec\"
+-	    func_append rpath " $flag"
++            # We only want to hardcode in an rpath if it isn't in the
++            # default dlsearch path.
++	    case " $sys_lib_dlsearch_path " in
++	    *" $libdir "*) ;;
++	    *) eval flag=\"$hardcode_libdir_flag_spec\"
++               func_append rpath " $flag"
++               ;;
++	    esac    
+ 	  fi
+ 	elif test -n "$runpath_var"; then
+ 	  case "$finalize_perm_rpath " in
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.bb b/meta/recipes-devtools/libtool/libtool_2.4.bb
index e1a9a10..3002215 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "r2"
+PR = "r4"
 
 #
 # We want the results of libtool-cross preserved - don't stage anything ourselves.
-- 
1.7.5.4



