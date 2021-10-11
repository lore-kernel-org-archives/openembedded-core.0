Return-Path: <henry.kleynhans@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED589C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 17:12:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.1415.1633972352041112540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QC0DCWFH;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: henry.kleynhans@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id u18so58582055wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/t4DSBnXsDTJhkxM+DiBkDN+z+t7eYErrJqikk8Hts=;
        b=QC0DCWFHGFHJoO/D9o7nNb+Xtn5cMdj1z4VrLM9l8lmnE7bt5LPz5L/Ww3n6z81yuX
         uxj9Jd8gCMO7uOGKO5QrSL8xCY5/RQNxswegNcgOd6f5j6xU841PukVKb6y1xDJ8QgcL
         UHrrpTJRH4ZUxxOkVoeOEBKOGyDkvPKABrg2FQlingyMXmod8QziT9nZqIgNO1qje+iT
         KvOQAPpQ1wSSWE2lZYcdQWNn22YKl/AxCRFAhnrZpxViHljfAzrAxdp+uVQFob3ySFKT
         0hMh1VT0X2wH0ZlSPpW5MarNPKdoQU2d/Ag3iG3EDxXwR5ntF8nj+u4BeipklLXO1zL+
         bKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/t4DSBnXsDTJhkxM+DiBkDN+z+t7eYErrJqikk8Hts=;
        b=ewbrHHIPqWOyGVqN46l5tJt9VHJHpMGK1gv0NjfedP8XAzN5yGpnRL6wzgSQkpxyEt
         LZm20fCx9jSWkBHT/AaTuDHr/08QpFLHgLWERtxB2CKdHDc4VuhaSqitbsBcWBtHmRjv
         1LVVn8lZxeou5IYE7no2LYr+nCKmdbXWuNiymJ2Eliy0A0wav6e100q941dpUdxR8KGY
         PEh48ZUf/3ORp2c8Ag7yTgnFLANIopuFv+LV2JRMOwLL7WB6Ae6Ic/Z9piwVu7QV0e6l
         7Ya/XgOyAvQJ/ojmbAGFmkgQstk/JbbZqIjYKmcl6y7HRgWujPHJB+FSkIQ0W4AIcDxx
         8U8Q==
X-Gm-Message-State: AOAM530QOSuYvsFRndUkxfquDKelIso61vi1+IPwIix5vObgxZiF+XXl
	x8WtkKgiG6oVQ1hDvvjHWb2/NJoKNiJzmwqm
X-Google-Smtp-Source: 
 ABdhPJybRuxpl9vV+pojCh2m9YXgNp3BT8i51EMcCHO0tjgctqYh6HTRAAKxjI+S9dVpGtSbSJxpwg==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr25730611wrc.53.1633972350221;
        Mon, 11 Oct 2021 10:12:30 -0700 (PDT)
Received: from localhost ([2620:10d:c092:400::4:f758])
        by smtp.gmail.com with ESMTPSA id z5sm114935wmp.26.2021.10.11.10.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:12:29 -0700 (PDT)
From: henry.kleynhans@gmail.com
X-Google-Original-From: hkleynhans@fb.com
To: openembedded-core@lists.openembedded.org,
	poky@lists.yoctoproject.org
Cc: hkleynhans@fb.com,
	rmikey@fb.com
Subject: [PATCH] sstate: Switch to ZStandard compressor support
Date: Mon, 11 Oct 2021 18:12:08 +0100
Message-Id: <20211011171208.3632459-2-hkleynhans@fb.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211011171208.3632459-1-hkleynhans@fb.com>
References: <20211011171208.3632459-1-hkleynhans@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 17:12:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156845

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
 meta/classes/sstate.bbclass                 | 29 +++++++++------
 meta/lib/oeqa/selftest/cases/signing.py     |  8 ++---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 24 ++++++-------
 scripts/sstate-cache-management.sh          | 40 ++++++++++-----------
 4 files changed, 55 insertions(+), 46 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7f4b1f6804..3a5195267a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,17 +1,19 @@
 SSTATE_VERSION = "5"
 
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
@@ -832,23 +834,24 @@ sstate_create_package () {
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
@@ -887,7 +890,13 @@ python sstate_report_unihash() {
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
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index af7a0b8b45..6f3d4aeae9 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -159,13 +159,13 @@ class Signing(OESelftestTestCase):
             bitbake('-c clean %s' % test_recipe)
             bitbake('-c populate_lic %s' % test_recipe)
 
-            recipe_sig = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tgz.sig')
-            recipe_tgz = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tgz')
+            recipe_sig = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tar.zst.sig')
+            recipe_archive = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tar.zst')
 
             self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
-            self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
+            self.assertEqual(len(recipe_archive), 1, 'Failed to find .tar.zst file.')
 
-            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
+            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_archive[0]))
             # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
             # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
             self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 874f439282..3dab607eeb 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -68,7 +68,7 @@ class SStateTests(SStateBase):
         results = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
         if distro_nonspecific:
             for r in results:
-                if r.endswith(("_populate_lic.tgz", "_populate_lic.tgz.siginfo", "_fetch.tgz.siginfo", "_unpack.tgz.siginfo", "_patch.tgz.siginfo")):
+                if r.endswith(("_populate_lic.tar.zst", "_populate_lic.tar.zst.siginfo", "_fetch.tar.zst.siginfo", "_unpack.tar.zst.siginfo", "_patch.tar.zst.siginfo")):
                     continue
                 file_tracker.append(r)
         else:
@@ -98,15 +98,15 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        tgz_created = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
-        self.assertTrue(tgz_created, msg="Could not find sstate .tgz files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_created)))
+        archives_created = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific, distro_nonspecific)
+        self.assertTrue(archives_created, msg="Could not find sstate .tar.zst files for: %s (%s)" % (', '.join(map(str, targets)), str(archives_created)))
 
         siginfo_created = self.search_sstate('|'.join(map(str, [s + r'.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(siginfo_created, msg="Could not find sstate .siginfo files for: %s (%s)" % (', '.join(map(str, targets)), str(siginfo_created)))
 
         bitbake(['-ccleansstate'] + targets)
-        tgz_removed = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
-        self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_removed)))
+        archives_removed = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific, distro_nonspecific)
+        self.assertTrue(not archives_removed, msg="do_cleansstate didn't remove .tar.zst sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(archives_removed)))
 
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
@@ -129,14 +129,14 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        results = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True)
+        results = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific=False, distro_nonspecific=True)
         filtered_results = []
         for r in results:
-            if r.endswith(("_populate_lic.tgz", "_populate_lic.tgz.siginfo")):
+            if r.endswith(("_populate_lic.tar.zst", "_populate_lic.tar.zst.siginfo")):
                 continue
             filtered_results.append(r)
         self.assertTrue(filtered_results == [], msg="Found distro non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)), str(filtered_results)))
-        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
+        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific=True, distro_nonspecific=False)
         self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
 
         self.track_for_cleanup(self.distro_specific_sstate + "_old")
@@ -145,7 +145,7 @@ class SStateTests(SStateBase):
 
         bitbake(['-cclean'] + targets)
         bitbake(targets)
-        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
+        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific=True, distro_nonspecific=False)
         self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
 
         not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
@@ -188,18 +188,18 @@ class SStateTests(SStateBase):
             if not sstate_arch in sstate_archs_list:
                 sstate_archs_list.append(sstate_arch)
             if target_config[idx] == target_config[-1]:
-                target_sstate_before_build = self.search_sstate(target + r'.*?\.tgz$')
+                target_sstate_before_build = self.search_sstate(target + r'.*?\.tar.zst$')
             bitbake("-cclean %s" % target)
             result = bitbake(target, ignore_status=True)
             if target_config[idx] == target_config[-1]:
-                target_sstate_after_build = self.search_sstate(target + r'.*?\.tgz$')
+                target_sstate_after_build = self.search_sstate(target + r'.*?\.tar.zst$')
                 expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build if not any(pattern in x for pattern in ignore_patterns)]
             self.remove_config(global_config[idx])
             self.remove_recipeinc(target, target_config[idx])
             self.assertEqual(result.status, 0, msg = "build of %s failed with %s" % (target, result.output))
 
         runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
-        actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
+        actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tar.zst$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
         self.assertFalse(actual_not_expected, msg="Files should have been removed but were not: %s" % ', '.join(map(str, actual_not_expected)))
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
2.31.1


