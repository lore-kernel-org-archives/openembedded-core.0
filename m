Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9B56A6F45F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:52:02 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3468738eae.37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JPMX5/ALYRMleW+WJPqjdGgU4akuwpvZc8bnmIvA0/M=;
	b=zrYJWG7LZUiiQ3Zfyw7wDMQqU3iXAdwIuQbYznR+BjJnvu4KDxgCP9SPGyD9LPU4Mc
	JYm/aHUWEhwJHkaPq++ZZYw3htbpIRVFyG/zPkw07sdaXy3CRqdK7rtmG6t0rv6giclI
	MHRuQ7q/7+P1yYYsYmpiYm1UpGEoBfzC0psLmmk0rMC1OTjXXulJUJHq52Uy9NqilZN3
	AdKjVmRBMsuMFfySPEGcm1oOSXf1LBgxmlNfe+4mCpRkPwMq8xH3v+94h0yyk15dfr82
	FqD8pEIMSVI5Ti17gND8TXHM3q2bLzIqzqiBGQVWEM2yXo0tp3meQHrcFiU3p0U747UE
	0aAA==
X-Received: by 10.15.21.136 with SMTP id d8mr1469583eeu.91.1393707122655;
	Sat, 01 Mar 2014 12:52:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j42sm27925005eep.21.2014.03.01.12.52.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 12:52:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Mar 2014 21:52:00 +0100
Message-Id: <1393707122-695-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 1/3] sstate-cache-management: improve shown numbers of removed files
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
X-List-Received-Date: Sat, 01 Mar 2014 20:52:07 -0000

* deleted files were counting .siginfo and .done files, but total_files were counting only .tgz archives
  so it could show confusing output like:
  Figuring out the sstate:xxx_packagedata.tgz ... (21098 from 15162 files for packagedata suffix will be removed)
* split the counts and show both
* fix .sigdata sometimes used instead of .siginfo
* this will also show new "suffixes" which have only .siginfo files but
  no .tgz, e.g.:
  Figuring out the sstate:xxx_rm_work.tgz ... (0 from 0 .tgz files for
  rm_work suffix will be removed or 0 from 107630 when counting also
  .siginfo and .done files)
  because now we're storing siginfo files from all intermediate tasks,
  but they are not being removed by this script

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 48 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 34483d0..a4f6611 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -172,7 +172,7 @@ remove_duplicated () {
   local ava_archs
   local arch
   local file_names
-  local sstate_list
+  local sstate_files_list
   local fn_tmp
   local list_suffix=`mktemp` || exit 1
 
@@ -195,14 +195,14 @@ remove_duplicated () {
           | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u) $extra_archs"
   echo "Done"
 
-  # Total number of files including sstate-, sigdata and .done files
+  # Total number of files including sstate-, .siginfo and .done files
   total_files=`find $cache_dir -name 'sstate*' | wc -l`
   # Save all the sstate files in a file
-  sstate_list=`mktemp` || exit 1
-  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz' >$sstate_list
+  sstate_files_list=`mktemp` || exit 1
+  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz*' >$sstate_files_list
 
   echo -n "Figuring out the suffixes in the sstate cache dir ... "
-  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz$%\1%g' $sstate_list | sort -u`"
+  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $sstate_files_list | sort -u`"
   echo "Done"
   echo "The following suffixes have been found in the cache dir:"
   echo $sstate_suffixes
@@ -211,10 +211,10 @@ remove_duplicated () {
   # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
   # SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
   for arch in $all_archs; do
-      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $sstate_list
+      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $sstate_files_list
       [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
       # ${builder_arch}_$arch used by toolchain sstate
-      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz$" $sstate_list
+      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz$" $sstate_files_list
       [ $? -eq 0 ] && ava_archs="$ava_archs ${builder_arch}_$arch"
   done
   echo "Done"
@@ -226,11 +226,13 @@ remove_duplicated () {
   local remove_listdir=`mktemp -d` || exit 1
 
   for suffix in $sstate_suffixes; do
-      # Total number of files including sigdata and .done files
-      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.*" $sstate_list | wc -l 2>/dev/null`
+      # Total number of files including .siginfo and .done files
+      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.*" $sstate_files_list | wc -l 2>/dev/null`
+      total_tgz_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.*.tgz$" $sstate_files_list | wc -l 2>/dev/null`
       # Save the file list to a file, some suffix's file may not exist
-      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.tgz" $sstate_list >$list_suffix 2>/dev/null
-      local deleted=0
+      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.tgz$" $sstate_files_list >$list_suffix 2>/dev/null
+      local deleted_tgz=0
+      local deleted_files=0
       echo -n "Figuring out the sstate:xxx_$suffix.tgz ... "
       # Uniq BPNs
       file_names=`for arch in $ava_archs ""; do
@@ -272,21 +274,23 @@ remove_duplicated () {
               fi
           done
       done
-      [ ! -s "$rm_list" ] || deleted=`cat $rm_list | wc -l`
+      [ -s "$rm_list" ] && deleted_tgz=`cat $rm_list | grep ".tgz$" | wc -l`
+      [ -s "$rm_list" ] && deleted_files=`cat $rm_list | wc -l`
       [ -s "$rm_list" -a $debug -gt 0 ] && cat $rm_list
-      echo "($deleted from $total_files_suffix files for $suffix suffix will be removed)"
-      let total_deleted=$total_deleted+$deleted
+      echo "($deleted_tgz from $total_tgz_suffix .tgz files for $suffix suffix will be removed or $deleted_files from $total_files_suffix when counting also .siginfo and .done files)"
+      let total_deleted=$total_deleted+$deleted_files
   done
-  deleted=0
+  deleted_tgz=0
   rm_old_list=$remove_listdir/sstate-old-filenames
   find $cache_dir -name 'sstate-*.tgz' >$rm_old_list
-  [ ! -s "$rm_old_list" ] || deleted=`cat $rm_old_list | wc -l`
+  [ -s "$rm_old_list" ] && deleted_tgz=`cat $rm_old_list | grep ".tgz$" | wc -l`
+  [ -s "$rm_old_list" ] && deleted_files=`cat $rm_old_list | wc -l`
   [ -s "$rm_old_list" -a $debug -gt 0 ] && cat $rm_old_list
-  echo "($deleted files with old sstate-* filenames will be removed)"
-  let total_deleted=$total_deleted+$deleted
+  echo "($deleted_tgz .tgz files with old sstate-* filenames will be removed or $deleted_files when counting also .siginfo and .done files)"
+  let total_deleted=$total_deleted+$deleted_files
 
   rm -f $list_suffix
-  rm -f $sstate_list
+  rm -f $sstate_files_list
   if [ $total_deleted -gt 0 ]; then
       read_confirm
       if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
@@ -325,17 +329,17 @@ rm_by_stamps (){
   # Figure out all the md5sums in the stamps dir.
   echo -n "Figuring out all the md5sums in stamps dir ... "
   for i in $suffixes; do
-      # There is no "\.sigdata" but "_setcene" when it is mirrored
+      # There is no "\.siginfo" but "_setcene" when it is mirrored
       # from the SSTATE_MIRRORS, use them to figure out the sum.
       sums=`find $stamps -maxdepth 3 -name "*.do_$i.*" \
         -o -name "*.do_${i}_setscene.*" | \
-        sed -ne 's#.*_setscene\.##p' -e 's#.*\.sigdata\.##p' | \
+        sed -ne 's#.*_setscene\.##p' -e 's#.*\.siginfo\.##p' | \
         sed -e 's#\..*##' | sort -u`
       all_sums="$all_sums $sums"
   done
   echo "Done"
 
-  # Total number of files including sstate-, sigdata and .done files
+  # Total number of files including sstate-, .siginfo and .done files
   total_files=`find $cache_dir -name 'sstate*' | wc -l`
   # Save all the state file list to a file
   find $cache_dir -name 'sstate*.tgz' | sort -u -o $cache_list
-- 
1.9.0


