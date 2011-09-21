Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6RnY-0001GH-FN
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:32 +0200
Received: by bke11 with SMTP id 11so2123662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gPCsTnpLCq0506zn2M9dYjAUHM3HsgH7vrAeC+T2hYU=;
	b=RjU0TAPGZrhd/fT8f1FhOxpQUCocY7kko8+21Pk7rF1wQWBYpX8JxRPpgHWDgLUVQZ
	fld+RnKekeGB/ihHhYqzwr6EwCMC28GKVwVMMURcXLsrXhGGIyHPvD9KKpE3bZug04RB
	GstfOf++PZ40OwbQdlbx0hjzpMJQITFHhyD1c=
Received: by 10.204.144.73 with SMTP id y9mr844749bku.381.1316630413819;
	Wed, 21 Sep 2011 11:40:13 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:12 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:48 +0400
Message-Id: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 01/17] icecc-create-env: rename to -native
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:32 -0000

icecc-create-env(-native) is a native package. But if it doesn't have
the -native suffix, some dependency tracking stuff in oe-core (in
nativesdk.bbclass) get's crazy about it, trying to generate dependencies
to icecc-create-env-native packages. To fix that simply add -native
suffix to this package.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/icecc.bbclass                         |    2 +-
 .../icecc-create-env-native/icecc-lto-update.patch |  103 ++++++++++++++++++++
 .../icecc-create-env-native_0.1.bb                 |   29 ++++++
 .../icecc-create-env/icecc-lto-update.patch        |  103 --------------------
 .../icecc-create-env/icecc-create-env_0.1.bb       |   29 ------
 5 files changed, 133 insertions(+), 133 deletions(-)
 create mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch
 create mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
 delete mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-lto-update.patch
 delete mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e20666b..710d798 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -33,7 +33,7 @@ def icecc_dep_prepend(d):
     # we need that built is the responsibility of the patch function / class, not
     # the application.
     if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
-        return "icecc-create-env"
+        return "icecc-create-env-native"
     return ""
 
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch
new file mode 100644
index 0000000..a7af2e3
--- /dev/null
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-lto-update.patch
@@ -0,0 +1,103 @@
+--- a/icecc-create-env	2006-12-14 09:50:46.000000000 +0300
++++ b/icecc-create-env	2011-08-31 17:52:45.000000000 +0400
+@@ -27,9 +27,6 @@
+   # readlink is not portable enough.
+   path=`ls -H $path`
+   toadd="$name=$path"
+-  if test "$name" = "$path"; then
+-    toadd=$path
+-  fi
+   is_contained "$toadd" && return
+   if test -z "$silent"; then
+   echo "adding file $toadd"
+@@ -117,6 +114,14 @@
+   add_file "$specfile"
+ fi
+
++ltofile=`$added_gcc -print-prog-name=lto1`
++pluginfile="${ltofile%lto1}liblto_plugin.so"
++if test -r "$pluginfile"
++then
++  add_file $pluginfile  ${pluginfile#*usr}
++  add_file $pluginfile  /usr${pluginfile#*usr}
++fi
++
+ tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
+ new_target_files=
+ for i in $target_files; do
+@@ -140,49 +147,44 @@
+ done
+
+ #sort the files
+- target_files=`for i in $new_target_files; do echo $i; done | sort`
++target_files=`for i in $new_target_files; do echo $i; done | sort`
+
+ #test if an archive name was supplied
+ #if not use the md5 of all files as the archive name
+ if test -z "$archive_name"; then
+-md5sum=NONE
+-for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
+-   if test -x $file; then
+-	md5sum=$file
+-        break
+-   fi
+-done
++  md5sum=NONE
++  for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
++    if test -x $file; then
++      md5sum=$file
++      break
++    fi
++  done
+
+-#calculate md5 and use it as the archive name
+-archive_name=`for i in $target_files; do $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'` || {
+-  if test -z "$silent"; then
+-   echo "Couldn't compute MD5 sum."
++  #calculate md5 and use it as the archive name
++  archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
++    if test -z "$silent"; then
++     echo "Couldn't compute MD5 sum."
++    fi
++    exit 2
++  }
++  mydir=`pwd`
++else
++  mydir="`dirname "$archive_name"`"
++
++  #check if we have a full path or only a filename
++  if test "$mydir" = "." ; then
++    mydir=`pwd`
++  else
++    mydir=""
+   fi
+-  exit 2
+-}
+-
+ fi
+
+ if test -z "$silent"; then
+-echo "creating $archive_name.tar.gz"
++echo "creating $archive_name"
+ fi
+
+-if test -z "$archive_name"; then
+- mydir=`pwd`
+-else
+-# mydir=dirname ${archive_name}
+-  mydir=${archive_name%/*}
+-
+-#check if we have a full path or only a filename
+- if test -z "$mydir"; then
+-  mydir=`pwd`
+- else
+-  mydir=""
+- fi
+-
+-fi
+ cd $tempdir
+-tar -czhf "$mydir/$archive_name".tar.gz $target_files || {
++tar -czhf "$mydir/$archive_name" $target_files || {
+  if test -z "$silent"; then
+   echo "Couldn't create archive"
+  fi
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
new file mode 100644
index 0000000..9a440ba
--- /dev/null
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "This is a modified version of the icecc-create-env script in order to\
+make it work with OE."
+SECTION = "base"
+PRIORITY = "optional"
+# source file has just a "GPL" word, but upstream is GPLv2+.
+# most probably just GPL would be a mistake
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
+
+PR = "r1"
+
+DEPENDS = ""
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit native
+
+PATCHTOOL = "patch"
+SRC_URI = "http://www.digital-opsis.com/openembedded/icecc-create-env-${PV}.tar.gz \
+	   file://icecc-lto-update.patch "
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
+}
+
+SRC_URI[md5sum] = "641ec45fe377529c7fd914f77b11b44f"
+SRC_URI[sha256sum] = "9ff8360375432a7a5c476cc6d55b3fdea9d6f3edc080d295a60421d8f47b1834"
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-lto-update.patch b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-lto-update.patch
deleted file mode 100644
index b396261..0000000
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-lto-update.patch
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
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
deleted file mode 100644
index 9a440ba..0000000
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "This is a modified version of the icecc-create-env script in order to\
-make it work with OE."
-SECTION = "base"
-PRIORITY = "optional"
-# source file has just a "GPL" word, but upstream is GPLv2+.
-# most probably just GPL would be a mistake
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
-
-PR = "r1"
-
-DEPENDS = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-inherit native
-
-PATCHTOOL = "patch"
-SRC_URI = "http://www.digital-opsis.com/openembedded/icecc-create-env-${PV}.tar.gz \
-	   file://icecc-lto-update.patch "
-
-S = "${WORKDIR}"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
-}
-
-SRC_URI[md5sum] = "641ec45fe377529c7fd914f77b11b44f"
-SRC_URI[sha256sum] = "9ff8360375432a7a5c476cc6d55b3fdea9d6f3edc080d295a60421d8f47b1834"
-- 
1.7.2.5



