Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnI-0006S1-D0
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:20 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179714bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3MK5kWQ0ZcZGnbkwR5UfzPEr/3joIfNtlKaAx6azhuw=;
	b=hIJoZH2rlib+XEI4+w5EwlQGx5CX+e+AfKt7SviVhoDW4exaDefSuJJ7kdvwrC3zn3
	WMX30a3pei0Awkl3W3d1EuUQSA648u8Mb9iYdHTSWkswrpeemO/pCNyxvMehQ9mS/3BW
	6AvcLK2fBZ95jpjHQqF0vQIP+jbFyu0yj84Ak=
Received: by 10.204.135.145 with SMTP id n17mr2737331bkt.39.1316807221571;
	Fri, 23 Sep 2011 12:47:01 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.46.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:46:59 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:37 +0400
Message-Id: <1316807201-22623-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 06/10] icecc-create-env-native: provide the script right in the tree
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:21 -0000

There is no point in downloading a tarball with no clear upstream (other than
icecc itself) and then patching it. Rather put new script in the source tree.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../icecc-create-env-native/icecc-create-env       |  192 ++++++++++++++++++++
 .../icecc-create-env-native/icecc-lto-update.patch |  103 -----------
 .../icecc-create-env-native_0.1.bb                 |    8 +-
 3 files changed, 194 insertions(+), 109 deletions(-)
 create mode 100755 meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
 delete mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
new file mode 100755
index 0000000..7e4dbc4
--- /dev/null
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
@@ -0,0 +1,192 @@
+#! /usr/bin/env bash
+# icecc -- A simple distributed compiler system
+#
+# Copyright (C) 2004 by the Icecream Authors
+# GPL
+
+target_files=
+
+is_contained ()
+{
+  case " $target_files " in
+    *" $1 "* ) return 0 ;;
+    *"=$1 "* ) return 0;;
+    * ) return 1 ;;
+  esac
+}
+
+add_file ()
+{
+  local name="$1"
+  local path="$1";
+  if test -n "$2"; then
+    name="$2"
+  fi
+  test -z "$name" && return
+  # ls -H isn't really the same as readlink, but
+  # readlink is not portable enough.
+  path=`ls -H $path`
+  toadd="$name=$path"
+  is_contained "$toadd" && return
+  if test -z "$silent"; then
+  echo "adding file $toadd"
+  fi
+  target_files="$target_files $toadd"
+  if test -x "$path"; then
+    # Only call ldd when it makes sense
+    if file -L "$path" | grep 'ELF' > /dev/null 2>&1; then
+	if ! file -L "$path" | grep 'static' > /dev/null 2>&1; then
+	   # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl based glibc
+		# this regexp parse the outputs like:
+		# ldd /usr/bin/gcc
+		#         linux-gate.so.1 =>  (0xffffe000)
+		#         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
+		#         /lib/ld-linux.so.2 (0xb7fe8000)
+		# covering both situations ( with => and without )
+          for lib in `ldd "$path" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`; do
+	    test -f "$lib" || continue
+	    # Check wether the same library also exists in the parent directory,
+	    # and prefer that on the assumption that it is a more generic one.
+	    local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
+	    test -f "$baselib" && lib=$baselib
+	  add_file "$lib"
+        done
+      fi
+    fi
+  fi
+}
+
+# backward compat
+if test "$1" = "--respect-path"; then
+  shift
+fi
+
+#add a --silent switch to avoid "broken pipe" errors when calling this scipt from within OE
+if test "$1" = "--silent"; then
+ silent=1
+ shift
+fi
+
+
+added_gcc=$1
+shift
+added_gxx=$1
+shift
+added_as=$1
+shift
+archive_name=$1
+
+if test -z "$added_gcc" || test -z "$added_gxx" ; then
+	echo "usage: $0 <gcc_path> <g++_path>"
+	exit 1
+fi
+
+if ! test -x "$added_gcc" ; then
+  echo "'$added_gcc' is no executable."
+  exit 1
+fi
+
+if ! test -x "$added_gxx" ; then
+  echo "'$added_gcc' is no executable."
+  exit 1
+fi
+
+
+
+add_file $added_gcc /usr/bin/gcc
+add_file $added_gxx /usr/bin/g++
+
+if test -z "$added_as" ; then
+ add_file /usr/bin/as /usr/bin/as
+else
+ if ! test -x "$added_as" ; then
+  echo "'$added_as' is no executable."
+  exit 1
+ fi
+
+ add_file $added_as  /usr/bin/as
+fi
+
+add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
+add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
+specfile=`$added_gcc -print-file-name=specs`
+if test -n "$specfile" && test -e "$specfile"; then
+  add_file "$specfile"
+fi
+
+ltofile=`$added_gcc -print-prog-name=lto1`
+pluginfile="${ltofile%lto1}liblto_plugin.so"
+if test -r "$pluginfile"
+then
+  add_file $pluginfile  ${pluginfile#*usr}
+  add_file $pluginfile  /usr${pluginfile#*usr}
+fi
+
+tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
+new_target_files=
+for i in $target_files; do
+ case $i in
+   *=/*)
+    target=`echo $i | cut -d= -f1`
+    path=`echo $i | cut -d= -f2`
+    ;;
+   *)
+    path=$i
+    target=$i
+    ;;
+  esac
+  mkdir -p $tempdir/`dirname $target`
+  cp -p $path $tempdir/$target
+  if test -f $tempdir/$target -a -x $tempdir/$target; then
+    strip -s $tempdir/$target 2>/dev/null
+  fi
+  target=`echo $target | cut -b2-`
+  new_target_files="$new_target_files $target"
+done
+
+#sort the files
+target_files=`for i in $new_target_files; do echo $i; done | sort`
+
+#test if an archive name was supplied
+#if not use the md5 of all files as the archive name
+if test -z "$archive_name"; then
+  md5sum=NONE
+  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
+    if test -x $file; then
+      md5sum=$file
+      break
+    fi
+  done
+
+  #calculate md5 and use it as the archive name
+  archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
+    if test -z "$silent"; then
+     echo "Couldn't compute MD5 sum."
+    fi
+    exit 2
+  }
+  mydir=`pwd`
+else
+  mydir="`dirname "$archive_name"`"
+
+  #check if we have a full path or only a filename
+  if test "$mydir" = "." ; then
+    mydir=`pwd`
+  else
+    mydir=""
+  fi
+fi
+
+if test -z "$silent"; then
+echo "creating $archive_name"
+fi
+
+cd $tempdir
+tar -czhf "$mydir/$archive_name" $target_files || {
+ if test -z "$silent"; then
+  echo "Couldn't create archive"
+ fi
+  exit 3
+}
+cd ..
+rm -rf $tempdir
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch
deleted file mode 100644
index a7af2e3..0000000
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch
+++ /dev/null
@@ -1,103 +0,0 @@
---- a/icecc-create-env	2006-12-14 09:50:46.000000000 +0300
-+++ b/icecc-create-env	2011-08-31 17:52:45.000000000 +0400
-@@ -27,9 +27,6 @@
-   # readlink is not portable enough.
-   path=`ls -H $path`
-   toadd="$name=$path"
--  if test "$name" = "$path"; then
--    toadd=$path
--  fi
-   is_contained "$toadd" && return
-   if test -z "$silent"; then
-   echo "adding file $toadd"
-@@ -117,6 +114,14 @@
-   add_file "$specfile"
- fi
-
-+ltofile=`$added_gcc -print-prog-name=lto1`
-+pluginfile="${ltofile%lto1}liblto_plugin.so"
-+if test -r "$pluginfile"
-+then
-+  add_file $pluginfile  ${pluginfile#*usr}
-+  add_file $pluginfile  /usr${pluginfile#*usr}
-+fi
-+
- tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
- new_target_files=
- for i in $target_files; do
-@@ -140,49 +147,44 @@
- done
-
- #sort the files
-- target_files=`for i in $new_target_files; do echo $i; done | sort`
-+target_files=`for i in $new_target_files; do echo $i; done | sort`
-
- #test if an archive name was supplied
- #if not use the md5 of all files as the archive name
- if test -z "$archive_name"; then
--md5sum=NONE
--for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
--   if test -x $file; then
--	md5sum=$file
--        break
--   fi
--done
-+  md5sum=NONE
-+  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
-+    if test -x $file; then
-+      md5sum=$file
-+      break
-+    fi
-+  done
-
--#calculate md5 and use it as the archive name
--archive_name=`for i in $target_files; do $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'` || {
--  if test -z "$silent"; then
--   echo "Couldn't compute MD5 sum."
-+  #calculate md5 and use it as the archive name
-+  archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
-+    if test -z "$silent"; then
-+     echo "Couldn't compute MD5 sum."
-+    fi
-+    exit 2
-+  }
-+  mydir=`pwd`
-+else
-+  mydir="`dirname "$archive_name"`"
-+
-+  #check if we have a full path or only a filename
-+  if test "$mydir" = "." ; then
-+    mydir=`pwd`
-+  else
-+    mydir=""
-   fi
--  exit 2
--}
--
- fi
-
- if test -z "$silent"; then
--echo "creating $archive_name.tar.gz"
-+echo "creating $archive_name"
- fi
-
--if test -z "$archive_name"; then
-- mydir=`pwd`
--else
--# mydir=dirname ${archive_name}
--  mydir=${archive_name%/*}
--
--#check if we have a full path or only a filename
-- if test -z "$mydir"; then
--  mydir=`pwd`
-- else
--  mydir=""
-- fi
--
--fi
- cd $tempdir
--tar -czhf "$mydir/$archive_name".tar.gz $target_files || {
-+tar -czhf "$mydir/$archive_name" $target_files || {
-  if test -z "$silent"; then
-   echo "Couldn't create archive"
-  fi
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
index 9a440ba..6213843 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
@@ -7,7 +7,7 @@ PRIORITY = "optional"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = ""
 INHIBIT_DEFAULT_DEPS = "1"
@@ -15,8 +15,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 inherit native
 
 PATCHTOOL = "patch"
-SRC_URI = "http://www.digital-opsis.com/openembedded/icecc-create-env-${PV}.tar.gz \
-	   file://icecc-lto-update.patch "
+SRC_URI = "file://icecc-create-env"
 
 S = "${WORKDIR}"
 
@@ -24,6 +23,3 @@ do_install() {
     install -d ${D}/${bindir}
     install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
 }
-
-SRC_URI[md5sum] = "641ec45fe377529c7fd914f77b11b44f"
-SRC_URI[sha256sum] = "9ff8360375432a7a5c476cc6d55b3fdea9d6f3edc080d295a60421d8f47b1834"
-- 
1.7.2.5



