Return-Path: <henry.kleynhans@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A86AC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 13:39:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.9422.1633354746124254317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iSTjxHil;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: henry.kleynhans@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 b136-20020a1c808e000000b0030d60716239so5941108wmd.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aKMnmacNhUKN6B/NUrpfz0zwb33UNvwkYF/zm479jLc=;
        b=iSTjxHilHUNWVv2Kovg/100hferr/XCh6bOV5DIa+fAo+9OJksqJNps0/xR99eajXj
         QAaV487ll7FDj1NEoOyotZ0sAOHwzx3gDuukcZWGITQy4Kv6uW9iUlie4l/AIdpKdSVq
         z72zjKbbVwQayozH/pqpRZ/r7mPAtknpIapeVUzT/RaJuL6R/ZYpphhMymSSCJf2O51T
         yqU8AZfGEdtWViRI9DLDv1v8oUevJBLXwlARFx4qtXtrorCs26lpF2AaGl1bc2GAJx1C
         VAN/14CKcWb6PWVOd+rSmpSrCnHv9K1TXwHZeWFEi8bsy+Mwx4NOGN0FWonokK3gOA69
         TUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aKMnmacNhUKN6B/NUrpfz0zwb33UNvwkYF/zm479jLc=;
        b=XMrPHYQsovHW2E+U84wM1msiqlJyZOLWOOtmrY7Hf35EXjI0OajNua+dncIPENyjvB
         fMwGHlvsdgFODI4nJ6gcl8b8njgO1j/xb9mOy9WY+F5VL8mNLzIeHpL/F4G/BDCelYoJ
         F3bWi6k5lZwrCMy3gGXnyrDVd3PHQLO8N9zN7Fyj/jAwkb+2SuvwFg7mNSwHqbzCGfnK
         5SW5L2sP+oSzg5RRHBb3TfOutZiBB/IqigXcQkNgFfW10/+r36F2pcB0RnuB+agh1Hbx
         0sx5S1Fz1/w8Ch3jhBsuSNv/eoB6K1mE4k8ZHDjrXe/z0kiqqMcmSI+CpMiqsiYFztx3
         BcZw==
X-Gm-Message-State: AOAM532/DYX6eW0/ZeySTVFBt/gos/6HdsL0ZS8nITXn++B2VcX7BvqC
	igvj2veeF7lLMLzdUcUwPS6//Q64gYf0hYCJ5xY=
X-Google-Smtp-Source: 
 ABdhPJw9XYb9ymuLgjBoGPs1n7h6JvB0tr9vW0ZAaSVq/sUQ6GQKdwDxVuBRD0WMA+ViKFREGVvKIw==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr1874245wmc.59.1633354744113;
        Mon, 04 Oct 2021 06:39:04 -0700 (PDT)
Received: from localhost ([2620:10d:c092:400::5:240a])
        by smtp.gmail.com with ESMTPSA id
 b15sm17343651wru.9.2021.10.04.06.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:39:03 -0700 (PDT)
From: Henry Kleynhans <henry.kleynhans@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: hkleynhans@fb.com,
	rmikey@fb.com
Subject: [PATCH] sstate: Switch to ZStandard compressor support
Date: Mon,  4 Oct 2021 14:38:58 +0100
Message-Id: <20211004133858.159289-1-henry.kleynhans@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 13:39:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156590

From: Henry Kleynhans <hkleynhans@fb.com>

This patch switches the compressor from Gzip to ZStandard for ssate cache
files.

Zstandard compression provides a significant improvement in
decompression speed as well as improvement in compression speed and disk
usage over the 'tgz' format in use.  Furthermore, its configurable
compression level offers a trade-off between time spent compressing
sstate cache files and disk space used by those files.  The reduced disk
usage also contributes to saving network traffic for those sharing their
sstate cache with others.

Zstandard should therefore be a good choice when:
* disk space is at a premium
* network speed / resources are limited
* the CI server can sstate packages can be created at high compression
* less CPU on the build server should be used for sstate decompression

Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
---
 meta/classes/sstate.bbclass        | 29 ++++++++++++++--------
 scripts/sstate-cache-management.sh | 40 +++++++++++++++---------------
 2 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 92a73114bb..3a67aaba19 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,17 +1,19 @@
 SSTATE_VERSION = "3"
 
+SSTATE_ZSTD_CLEVEL = "8"
+
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
 
 def generate_sstatefn(spec, hash, taskname, siginfo, d):
     if taskname is None:
        return ""
-    extension = ".tgz"
+    extension = ".tar.zst"
     # 8 chars reserved for siginfo
     limit = 254 - 8
     if siginfo:
         limit = 254
-        extension = ".tgz.siginfo"
+        extension = ".tar.zst.siginfo"
     if not hash:
         hash = "INVALID"
     fn = spec + hash + "_" + taskname + extension
@@ -37,7 +39,7 @@ SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
-SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tgz*"
+SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
 
 # explicitly make PV to depend on evaluated value of PV variable
 PV[vardepvalue] = "${PV}"
@@ -825,23 +827,24 @@ sstate_create_package () {
 	mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
-	# Use pigz if available
-	OPT="-czS"
-	if [ -x "$(command -v pigz)" ]; then
-		OPT="-I pigz -cS"
+	OPT="-cS"
+	ZSTD="zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
+	# Use pzstd if available
+	if [ -x "$(command -v pzstd)" ]; then
+		ZSTD="pzstd -${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}"
 	fi
 
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
 		set +e
-		tar $OPT -f $TFILE *
+		tar -I "$ZSTD" $OPT -f $TFILE *
 		ret=$?
 		if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
 			exit 1
 		fi
 		set -e
 	else
-		tar $OPT --file=$TFILE --files-from=/dev/null
+		tar -I "$ZSTD" $OPT --file=$TFILE --files-from=/dev/null
 	fi
 	chmod 0664 $TFILE
 	# Skip if it was already created by some other process
@@ -880,7 +883,13 @@ python sstate_report_unihash() {
 # Will be run from within SSTATE_INSTDIR.
 #
 sstate_unpack_package () {
-	tar -xvzf ${SSTATE_PKG}
+	ZSTD="zstd -T${ZSTD_THREADS}"
+	# Use pzstd if available
+	if [ -x "$(command -v pzstd)" ]; then
+		ZSTD="pzstd -p ${ZSTD_THREADS}"
+	fi
+
+	tar -I "$ZSTD" -xvf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror
 	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
 	# Use "! -w ||" to return true for read only files
diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index f1706a2229..d39671f7c6 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -114,7 +114,7 @@ echo_error () {
 # * Add .done/.siginfo to the remove list
 # * Add destination of symlink to the remove list
 #
-# $1: output file, others: sstate cache file (.tgz)
+# $1: output file, others: sstate cache file (.tar.zst)
 gen_rmlist (){
   local rmlist_file="$1"
   shift
@@ -131,13 +131,13 @@ gen_rmlist (){
               dest="`readlink -e $i`"
               if [ -n "$dest" ]; then
                   echo $dest >> $rmlist_file
-                  # Remove the .siginfo when .tgz is removed
+                  # Remove the .siginfo when .tar.zst is removed
                   if [ -f "$dest.siginfo" ]; then
                       echo $dest.siginfo >> $rmlist_file
                   fi
               fi
           fi
-          # Add the ".tgz.done" and ".siginfo.done" (may exist in the future)
+          # Add the ".tar.zst.done" and ".siginfo.done" (may exist in the future)
           base_fn="${i##/*/}"
           t_fn="$base_fn.done"
           s_fn="$base_fn.siginfo.done"
@@ -188,10 +188,10 @@ remove_duplicated () {
   total_files=`find $cache_dir -name 'sstate*' | wc -l`
   # Save all the sstate files in a file
   sstate_files_list=`mktemp` || exit 1
-  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz*' >$sstate_files_list
+  find $cache_dir -iname 'sstate:*:*:*:*:*:*:*.tar.zst*' >$sstate_files_list
 
   echo "Figuring out the suffixes in the sstate cache dir ... "
-  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $sstate_files_list | sort -u`"
+  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g' $sstate_files_list | sort -u`"
   echo "Done"
   echo "The following suffixes have been found in the cache dir:"
   echo $sstate_suffixes
@@ -200,10 +200,10 @@ remove_duplicated () {
   # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
   # SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
   for arch in $all_archs; do
-      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $sstate_files_list
+      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tar\.zst$" $sstate_files_list
       [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
       # ${builder_arch}_$arch used by toolchain sstate
-      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz$" $sstate_files_list
+      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tar\.zst$" $sstate_files_list
       [ $? -eq 0 ] && ava_archs="$ava_archs ${builder_arch}_$arch"
   done
   echo "Done"
@@ -219,13 +219,13 @@ remove_duplicated () {
           continue
       fi
       # Total number of files including .siginfo and .done files
-      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list | wc -l 2>/dev/null`
-      total_tgz_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$" $sstate_files_list | wc -l 2>/dev/null`
+      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*" $sstate_files_list | wc -l 2>/dev/null`
+      total_archive_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst$" $sstate_files_list | wc -l 2>/dev/null`
       # Save the file list to a file, some suffix's file may not exist
-      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list >$list_suffix 2>/dev/null
-      local deleted_tgz=0
+      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*" $sstate_files_list >$list_suffix 2>/dev/null
+      local deleted_archives=0
       local deleted_files=0
-      for ext in tgz tgz.siginfo tgz.done; do
+      for ext in tar.zst tar.zst.siginfo tar.zst.done; do
           echo "Figuring out the sstate:xxx_$suffix.$ext ... "
           # Uniq BPNs
           file_names=`for arch in $ava_archs ""; do
@@ -268,19 +268,19 @@ remove_duplicated () {
               done
           done
       done
-      deleted_tgz=`cat $rm_list.* 2>/dev/null | grep ".tgz$" | wc -l`
+      deleted_archives=`cat $rm_list.* 2>/dev/null | grep "\.tar\.zst$" | wc -l`
       deleted_files=`cat $rm_list.* 2>/dev/null | wc -l`
       [ "$deleted_files" -gt 0 -a $debug -gt 0 ] && cat $rm_list.*
-      echo "($deleted_tgz out of $total_tgz_suffix .tgz files for $suffix suffix will be removed or $deleted_files out of $total_files_suffix when counting also .siginfo and .done files)"
+      echo "($deleted_archives out of $total_archives_suffix .tar.zst files for $suffix suffix will be removed or $deleted_files out of $total_files_suffix when counting also .siginfo and .done files)"
       let total_deleted=$total_deleted+$deleted_files
   done
-  deleted_tgz=0
+  deleted_archives=0
   rm_old_list=$remove_listdir/sstate-old-filenames
-  find $cache_dir -name 'sstate-*.tgz' >$rm_old_list
-  [ -s "$rm_old_list" ] && deleted_tgz=`cat $rm_old_list | grep ".tgz$" | wc -l`
+  find $cache_dir -name 'sstate-*.tar.zst' >$rm_old_list
+  [ -s "$rm_old_list" ] && deleted_archives=`cat $rm_old_list | grep "\.tar\.zst$" | wc -l`
   [ -s "$rm_old_list" ] && deleted_files=`cat $rm_old_list | wc -l`
   [ -s "$rm_old_list" -a $debug -gt 0 ] && cat $rm_old_list
-  echo "($deleted_tgz .tgz files with old sstate-* filenames will be removed or $deleted_files when counting also .siginfo and .done files)"
+  echo "($deleted_archives or .tar.zst files with old sstate-* filenames will be removed or $deleted_files when counting also .siginfo and .done files)"
   let total_deleted=$total_deleted+$deleted_files
 
   rm -f $list_suffix
@@ -289,7 +289,7 @@ remove_duplicated () {
       read_confirm
       if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
           for list in `ls $remove_listdir/`; do
-              echo "Removing $list.tgz (`cat $remove_listdir/$list | wc -w` files) ... "
+              echo "Removing $list.tar.zst archive (`cat $remove_listdir/$list | wc -w` files) ... "
               # Remove them one by one to avoid the argument list too long error
               for i in `cat $remove_listdir/$list`; do
                   rm -f $verbose $i
@@ -322,7 +322,7 @@ rm_by_stamps (){
   find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
 
   echo "Figuring out the suffixes in the sstate cache dir ... "
-  local sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $cache_list | sort -u`"
+  local sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g' $cache_list | sort -u`"
   echo "Done"
   echo "The following suffixes have been found in the cache dir:"
   echo $sstate_suffixes
-- 
2.30.2


