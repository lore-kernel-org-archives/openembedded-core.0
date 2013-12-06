Return-Path: <iyadkq@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id AF8B36DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 18:09:34 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y10so1433905pdj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2013 10:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3YJ4x1JSmJ46qCfjzm4X0ScqT6blK9a/Q+35S61Gi1A=;
	b=LnFohtDWap5UxOg5zdW1vojsFtF8pb+QlkvCVaMYP65Zry7GhAuE2ERjRZ6trAAtPn
	WgOsllCYndRk4llcSBchP1S5Uhh2IJwzLfMkpI7DjfX1F2RjawEw4qXH2uTEuzeswJ8z
	cqBCCVSh/5bP81i6nHxSqQjOrDcflQrKGYuGLYUEIo7H74xW8m3uPTd5phvp8iRJAEjx
	V/xGzojVD4hppmwVndj8bSzy5j2KFPUJB1b8UddjR1R7e7t6T4UQ5XUNHr1vlifeEDyP
	JnNEGl6So3vFF5OjP2/7qt5ETzSorAzSzF09qbbAxd2S/50Mx5pkh1d+FoBwSGIdcVPp
	A5ew==
X-Received: by 10.66.65.108 with SMTP id w12mr5763583pas.84.1386353374025;
	Fri, 06 Dec 2013 10:09:34 -0800 (PST)
Received: from linux-jvv9.site ([204.119.232.48])
	by mx.google.com with ESMTPSA id
	og5sm111468671pbb.10.2013.12.06.10.09.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 10:09:33 -0800 (PST)
From: Iyad Qumei <iyadkq@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 10:17:45 -0800
Message-Id: <1386353865-4076-1-git-send-email-iyadkq@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <y>
References: <y>
Subject: [PATCH v3] icecc-create-env: Upgrade script
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
X-List-Received-Date: Fri, 06 Dec 2013 18:09:37 -0000

The original icecc script does not handle toolchain content
properly, resulting in build failures, such as

   gxx: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found

This patch brings in the latest script form the icecream source, and
modifies it for use in the OE build environment.  The change was tested
with OE-Core built toolchain, and external toolchain.

Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
---
 .../icecc-create-env-native_0.1.bb                 |   35 ---
 .../icecc-create-env-native_1.0.1.bb               |   35 +++
 .../icecc-create-env/icecc-create-env              |  266 +++++++++++++++-----
 3 files changed, 242 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
 create mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env-native_1.0.1.bb
 mode change 100755 => 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
deleted file mode 100644
index c05a76d..0000000
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "This is a modified version of the icecc-create-env script in order to\
-make it work with OE."
-SECTION = "base"
-# source file has just a "GPL" word, but upstream is GPLv2+.
-# most probably just GPL would be a mistake
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
-
-PR = "r2"
-
-DEPENDS = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-inherit native
-
-# This is needed, because otherwise there is dependency loop from quilt-native
-# Dependency loop #1 found:
-#  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_install) (dependent Tasks ['quilt-native, do_compile'])
-#  Task 10908 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_populate_sysroot) (dependent Tasks ['quilt-native, do_install'])
-#  Task 10997 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_patch) (dependent Tasks ['icecc-create-env-native, do_unpack', 'quilt-native, do_populate_sysroot'])
-#  Task 11001 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_configure) (dependent Tasks ['icecc-create-env-native, do_patch'])
-#  Task 11002 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_compile) (dependent Tasks ['icecc-create-env-native, do_configure'])
-#  Task 10998 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_install) (dependent Tasks ['icecc-create-env-native, do_compile'])
-#  Task 10999 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_populate_sysroot) (dependent Tasks ['icecc-create-env-native, do_install'])
-#  Task 10910 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_configure) (dependent Tasks ['quilt-native, do_patch', 'icecc-create-env-native, do_populate_sysroot'])
-#  Task 10911 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_compile) (dependent Tasks ['quilt-native, do_configure'])
-PATCHTOOL = "patch"
-SRC_URI = "file://icecc-create-env"
-
-S = "${WORKDIR}"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
-}
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_1.0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_1.0.1.bb
new file mode 100644
index 0000000..c05a76d
--- /dev/null
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_1.0.1.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "This is a modified version of the icecc-create-env script in order to\
+make it work with OE."
+SECTION = "base"
+# source file has just a "GPL" word, but upstream is GPLv2+.
+# most probably just GPL would be a mistake
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
+
+PR = "r2"
+
+DEPENDS = ""
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit native
+
+# This is needed, because otherwise there is dependency loop from quilt-native
+# Dependency loop #1 found:
+#  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_install) (dependent Tasks ['quilt-native, do_compile'])
+#  Task 10908 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_populate_sysroot) (dependent Tasks ['quilt-native, do_install'])
+#  Task 10997 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_patch) (dependent Tasks ['icecc-create-env-native, do_unpack', 'quilt-native, do_populate_sysroot'])
+#  Task 11001 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_configure) (dependent Tasks ['icecc-create-env-native, do_patch'])
+#  Task 11002 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_compile) (dependent Tasks ['icecc-create-env-native, do_configure'])
+#  Task 10998 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_install) (dependent Tasks ['icecc-create-env-native, do_compile'])
+#  Task 10999 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_populate_sysroot) (dependent Tasks ['icecc-create-env-native, do_install'])
+#  Task 10910 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_configure) (dependent Tasks ['quilt-native, do_patch', 'icecc-create-env-native, do_populate_sysroot'])
+#  Task 10911 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_compile) (dependent Tasks ['quilt-native, do_configure'])
+PATCHTOOL = "patch"
+SRC_URI = "file://icecc-create-env"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
+}
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
old mode 100755
new mode 100644
index 7e4dbc4..6d2e3c6
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -29,33 +29,95 @@ add_file ()
   toadd="$name=$path"
   is_contained "$toadd" && return
   if test -z "$silent"; then
-  echo "adding file $toadd"
+    echo "adding file $toadd"
   fi
   target_files="$target_files $toadd"
   if test -x "$path"; then
     # Only call ldd when it makes sense
     if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
-	if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
-	   # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
-		# this regexp parse the outputs like:
-		# ldd /usr/bin/gcc
-		#         linux-gate.so.1 =>  (0xffffe000)
-		#         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
-		#         /lib/ld-linux.so.2 (0xb7fe8000)
-		# covering both situations ( with => and without )
-          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
-	    test -f "$lib" || continue
-	    # Check wether the same library also exists in the parent directory,
-	    # and prefer that on the assumption that it is a more generic one.
-	    local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
-	    test -f "$baselib" && lib=$baselib
-	  add_file "$lib"
-        done
+      if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
+           # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
+           # this regexp parse the outputs like:
+           # ldd /usr/bin/gcc
+           #         linux-gate.so.1 =>  (0xffffe000)
+           #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
+           #         /lib/ld-linux.so.2 (0xb7fe8000)
+           # covering both situations ( with => and without )
+           for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
+             test -f "$lib" || continue
+             # Check wether the same library also exists in the parent directory,
+             # and prefer that on the assumption that it is a more generic one.
+             local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
+             test -f "$baselib" && lib=$baselib
+             add_file "$lib"
+           done
       fi
     fi
   fi
 }
 
+# returns abs path to filedir
+abs_path()
+{
+    local path=$1
+    if test -f "$path"; then
+        pushd $(dirname $path) > /dev/null 2>&1
+        dir_path=`pwd -P`
+        path=$dir_path/$(basename $path)
+        popd > /dev/null 2>&1
+    elif test -d "$path"; then
+        pushd $path > /dev/null 2>&1
+        path=`pwd -P`
+        popd > /dev/null 2>&1
+    fi
+    echo $path
+}
+
+# Search and add file to the tarball file.
+search_addfile()
+{
+    local compiler=$1
+    local file_name=$2
+    local file_installdir=$3
+    local file=""
+
+    file=$($compiler -print-prog-name=$file_name)
+
+    if test -z "$file" || test "$file" = "$file_name" || ! test -e "$file"; then
+        file=`$compiler -print-file-name=$file_name`
+    fi
+
+    if ! test -e "$file"; then
+        return 1
+    fi
+
+    if test -z "$file_installdir"; then
+        # The file is going to be added to the tarball
+        # in the same path where the compiler found it.
+
+        file_installdir=$(dirname $file)
+        abs_installdir=$(abs_path $file_installdir)
+
+        if test "$file_installdir" != "$abs_installdir"; then
+            # The path where the compiler found the file is relative!
+            # If the path where the compiler found the file is relative
+            # to compiler's path, we must change it to be relative to
+            # /usr/bin path where the compiler is going to be installed
+            # in the tarball file.
+            # Replacing relative path by abs path because the tar command
+            # used to create the tarball file doesn't work well with
+            # relative path as installdir.
+
+            compiler_basedir=$(abs_path ${compiler%/*/*})
+            file_installdir=${abs_installdir/$compiler_basedir/"/usr"}
+        fi
+    fi
+
+    add_file "$file" "$file_installdir/$file_name"
+
+    return 0
+}
+
 # backward compat
 if test "$1" = "--respect-path"; then
   shift
@@ -67,62 +129,148 @@ if test "$1" = "--silent"; then
  shift
 fi
 
-
-added_gcc=$1
-shift
-added_gxx=$1
-shift
-added_as=$1
-shift
-archive_name=$1
-
-if test -z "$added_gcc" || test -z "$added_gxx" ; then
-	echo "usage: $0 <gcc_path> <g++_path>"
-	exit 1
+if test "$1" != "--gcc" -a "$1" != "--clang"; then
+    # backward compat
+    added_gcc=$1
+    shift
+    added_gxx=$1
+    shift
+    added_as=$1
+    shift
+    archive_name=$1
+    shift
+    gcc=1
+else
+    if test "$1" = "--gcc"; then
+        shift
+        added_gcc=$1
+        shift
+        added_gxx=$1
+        shift
+        added_as=$1
+        shift
+        archive_name=$1
+        shift
+        gcc=1
+    elif test "$1" = "--clang"; then
+        shift
+        added_clang=$1
+        shift
+        added_compilerwrapper=$1
+        shift
+        clang=1
+    else
+        usage
+        exit 1
+    fi
 fi
 
-if ! test -x "$added_gcc" ; then
-  echo "'$added_gcc' is no executable."
-  exit 1
+if test -n "$gcc"; then
+    if test -z "$added_gcc" || test -z "$added_gxx"; then
+        usage
+        exit 1
+    fi
+    if ! test -x "$added_gcc" ; then
+        echo "'$added_gcc' is no executable."
+        exit 1
+    fi
+    if ! test -x "$added_gxx" ; then
+        echo "'$added_gxx' is no executable."
+        exit 1
+    fi
+    if test -z "$added_as" ; then
+      add_file /usr/bin/as /usr/bin/as
+    else
+      if ! test -x "$added_as" ; then
+        echo "'$added_as' is no executable."
+        exit 1
+      fi
+      add_file $added_as  /usr/bin/as
+    fi
 fi
 
-if ! test -x "$added_gxx" ; then
-  echo "'$added_gcc' is no executable."
-  exit 1
+if test -n "$clang"; then
+    if ! test -x "$added_clang" ; then
+        echo "'$added_clang' is no executable."
+        exit 1
+    fi
+    if ! test -x "$added_compilerwrapper" ; then
+        echo "'$added_compilerwrapper' is no executable."
+        exit 1
+    fi
 fi
 
+extrafiles=
+while test "x$1" = "x--addfile"; do
+    shift
+    extrafiles="$extrafiles $1"
+    shift
+done
 
+tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
 
-add_file $added_gcc /usr/bin/gcc
-add_file $added_gxx /usr/bin/g++
+# for testing the environment is usable at all
+add_file /bin/true
 
-if test -z "$added_as" ; then
- add_file /usr/bin/as /usr/bin/as
-else
- if ! test -x "$added_as" ; then
-  echo "'$added_as' is no executable."
-  exit 1
- fi
+if test -n "$gcc"; then
+    # getting compilers abs path
+    added_gcc=$(abs_path $added_gcc)
+    added_gxx=$(abs_path $added_gxx)
 
- add_file $added_as  /usr/bin/as
-fi
+    if test -z "$clang"; then
+        add_file $added_gcc /usr/bin/gcc
+        add_file $added_gxx /usr/bin/g++
+    else
+        # HACK: The clang case below will add a wrapper in place of gcc, so add the real
+        # gcc under a different name that the wrapper will call.
+        add_file $added_gcc /usr/bin/gcc.bin
+        add_file $added_gxx /usr/bin/g++.bin
+    fi
+    add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
+    add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
+
+    gcc_as=$($added_gcc -print-prog-name=as)
+    if test "$gcc_as" = "as"; then
+      add_file /usr/bin/as
+    else
+      add_file "$gcc_as" /usr/bin/as
+    fi
 
-add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
-add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
-specfile=`$added_gcc -print-file-name=specs`
-if test -n "$specfile" && test -e "$specfile"; then
-  add_file "$specfile"
+    search_addfile $added_gcc specs
+    search_addfile $added_gcc liblto_plugin.so
 fi
 
-ltofile=`$added_gcc -print-prog-name=lto1`
-pluginfile="${ltofile%lto1}liblto_plugin.so"
-if test -r "$pluginfile"
-then
-  add_file $pluginfile  ${pluginfile#*usr}
-  add_file $pluginfile  /usr${pluginfile#*usr}
+if test -n "$clang"; then
+    add_file $added_clang /usr/bin/clang
+    # HACK: Older icecream remotes have /usr/bin/{gcc|g++} hardcoded and wouldn't
+    # call /usr/bin/clang at all. So include a wrapper binary that will call gcc or clang
+    # depending on an extra argument added by icecream.
+    add_file $added_compilerwrapper /usr/bin/gcc
+    add_file $added_compilerwrapper /usr/bin/g++
+
+    add_file $($added_clang -print-prog-name=as) /usr/bin/as
+
+    # clang always uses its internal .h files
+    clangincludes=$(dirname $($added_clang -print-file-name=include/limits.h))
+    clangprefix=$(dirname $(dirname $added_clang))
+    for file in $(find $clangincludes -type f); do
+      # get path without ..
+      destfile=$(readlink -e $file)
+      # and convert from <prefix> to /usr if needed
+      destfile=$(echo $destfile | sed "s#$clangprefix#/usr#" )
+      add_file "$file" "$destfile"
+    done
 fi
 
-tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
+for extrafile in $extrafiles; do
+    add_file $extrafile
+done
+
+# special case for weird multilib setups
+for dir in /lib /lib64 /usr/lib /usr/lib64; do
+    test -L $dir && cp -p $dir $tempdir$dir
+done
+
 new_target_files=
 for i in $target_files; do
  case $i in
@@ -151,7 +299,7 @@ target_files=`for i in $new_target_files; do echo $i; done | sort`
 #if not use the md5 of all files as the archive name
 if test -z "$archive_name"; then
   md5sum=NONE
-  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
+  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5 /sbin/md5; do
     if test -x $file; then
       md5sum=$file
       break
-- 
1.7.10.4


