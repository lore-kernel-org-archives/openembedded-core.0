Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 90D906F4C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:52:03 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so2018651ead.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PNWqluZP11t7GRdE8TxHfF58JUxAxOWrRTF4Gb44dRk=;
	b=tlb72n68eP/s1eMhcSi9R3sU1A6ImtBZ7gjk5ffDea3UOIcVpYAL+UMhmZIFAmATfN
	xwVjc7eE06AE0Ty6jGK1Wb+k0XDi1HDN3S87zAItQiM9yTyxF/mhIdJ3S4rl4ZOqBdg/
	J51c7ceG+ql6OtePv8R4c17b1bYgQVzF550bsQ2unpqc1d0Q45eHqlZoO3tQ1rCNNZM7
	0XVIT5P4utjAD6ytYsaft2SvBPF/aOGI47BFq6FKUvQfQN/aXgNUfFdwKJa1v9bGioZZ
	hH+FfTdL3JR1opm+krqWhB/zJPshHCRaMtaYsWkMah7h44ahHgK6pdlMNjQhhTG5Cx1u
	/xAg==
X-Received: by 10.14.214.2 with SMTP id b2mr9772049eep.20.1393707124695;
	Sat, 01 Mar 2014 12:52:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k41sm27922604een.19.2014.03.01.12.52.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 12:52:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Mar 2014 21:52:01 +0100
Message-Id: <1393707122-695-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393707122-695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393707122-695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] sstate-cache-management.sh: Allow to remove old .siginfo and .done files for all tasks
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

* this allows to remove them even for tasks without sstate archives (e.g. rm_work, multilib_install, ..)
  whole list of tasks found in one of my sstate-cache directories:
  sstate:xxx_boostconfig.tgz ... 6
  sstate:xxx_bundle_initramfs.tgz ... 31
  sstate:xxx_compile.tgz ... 47894
  sstate:xxx_compile_kernelmodules.tgz ... 31
  sstate:xxx_compile_ptest_base.tgz ... 68
  sstate:xxx_configure.tgz ... 48247
  sstate:xxx_configure_ptest_base.tgz ... 68
  sstate:xxx_deploy.tgz ... 8
  sstate:xxx_evacuate_scripts.tgz ... 58
  sstate:xxx_fetch.tgz ... 7045
  sstate:xxx_generate.tgz ... 812
  sstate:xxx_generate_qt_config_file.tgz ... 576
  sstate:xxx_generate_toolchain_file.tgz ... 219
  sstate:xxx_install.tgz ... 48273
  sstate:xxx_install_locale.tgz ... 58
  sstate:xxx_install_ptest_base.tgz ... 68
  sstate:xxx_kernel_checkout.tgz ... 14
  sstate:xxx_kernel_configcheck.tgz ... 34
  sstate:xxx_kernel_configme.tgz ... 17
  sstate:xxx_kernel_link_vmlinux.tgz ... 30
  sstate:xxx_make_scripts.tgz ... 42
  sstate:xxx_multilib_install.tgz ... 29
  sstate:xxx_package.tgz ... 13848
  sstate:xxx_package_write_ipk.tgz ... 4615
  sstate:xxx_packagedata.tgz ... 4613
  sstate:xxx_pam_sanity.tgz ... 3
  sstate:xxx_patch.tgz ... 7883
  sstate:xxx_populate_adt.tgz ... 28
  sstate:xxx_populate_ide_support.tgz ... 33
  sstate:xxx_populate_lic.tgz ... 1718
  sstate:xxx_populate_sysroot.tgz ... 5094
  sstate:xxx_prepare_qmake_symlink.tgz ... 6
  sstate:xxx_prepsources.tgz ... 168
  sstate:xxx_rm_work.tgz ... 107630
  sstate:xxx_rm_work_all.tgz ... 52563
  sstate:xxx_rootfs.tgz ... 13
  sstate:xxx_sanitize_sources.tgz ... 8
  sstate:xxx_sizecheck.tgz ... 31
  sstate:xxx_strip.tgz ... 31
  sstate:xxx_uboot_mkimage.tgz ... 31
  sstate:xxx_unpack.tgz ... 7857
  sstate:xxx_unpack_extra.tgz ... 6
  sstate:xxx_validate_branches.tgz ... 14

* with this patches most of these files are removed as well
  Figuring out the sstate:xxx_compile ... (0 from 0 .tgz files for
  compile suffix will be removed or 42310 from 47795 when counting also
  .siginfo and .done files)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 91 +++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 45 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index a4f6611..e55eb23 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -224,59 +224,60 @@ remove_duplicated () {
 
   # Save the file list which needs to be removed
   local remove_listdir=`mktemp -d` || exit 1
-
   for suffix in $sstate_suffixes; do
       # Total number of files including .siginfo and .done files
-      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.*" $sstate_files_list | wc -l 2>/dev/null`
-      total_tgz_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.*.tgz$" $sstate_files_list | wc -l 2>/dev/null`
+      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list | wc -l 2>/dev/null`
+      total_tgz_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$" $sstate_files_list | wc -l 2>/dev/null`
       # Save the file list to a file, some suffix's file may not exist
-      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.tgz$" $sstate_files_list >$list_suffix 2>/dev/null
+      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list >$list_suffix 2>/dev/null
       local deleted_tgz=0
       local deleted_files=0
-      echo -n "Figuring out the sstate:xxx_$suffix.tgz ... "
-      # Uniq BPNs
-      file_names=`for arch in $ava_archs ""; do
-          sed -ne "s%.*/sstate:\([^:]*\):[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$%\1%p" $list_suffix
-      done | sort -u`
-
-      fn_tmp=`mktemp` || exit 1
-      rm_list="$remove_listdir/sstate:xxx_$suffix"
-      for fn in $file_names; do
-          [ -z "$verbose" ] || echo "Analyzing sstate:$fn-xxx_$suffix.tgz"
-          for arch in $ava_archs ""; do
-              grep -h ".*/sstate:$fn:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $list_suffix >$fn_tmp
-              if [ -s $fn_tmp ] ; then
-                  [ $debug -gt 1 ] && echo "Available files for $fn-$arch- with suffix $suffix:" && cat $fn_tmp
-                  # Use the modification time
-                  to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
-                  [ $debug -gt 2 ] && echo "Considering to delete: $to_del"
-                  # The sstate file which is downloaded from the SSTATE_MIRROR is
-                  # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
-                  # it, so filter it out from the remove list if it should not be
-                  # removed.
-                  to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
-                  [ $debug -gt 2 ] && echo "Considering to keep: $to_keep"
-                  for k in $to_keep; do
-                      if [ -L "$k" ]; then
-                          # The symlink's destination
-                          k_dest="`readlink -e $k`"
-                          # Maybe it is the one in cache_dir
-                          k_maybe="$cache_dir/${k##/*/}"
-                          # Remove it from the remove list if they are the same.
-                          if [ "$k_dest" = "$k_maybe" ]; then
-                              to_del="`echo $to_del | sed 's#'\"$k_maybe\"'##g'`"
+      for ext in tgz tgz.siginfo tgz.done; do
+          echo "Figuring out the sstate:xxx_$suffix.$ext ... "
+          # Uniq BPNs
+          file_names=`for arch in $ava_archs ""; do
+              sed -ne "s%.*/sstate:\([^:]*\):[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.${ext}$%\1%p" $list_suffix
+          done | sort -u`
+
+          fn_tmp=`mktemp` || exit 1
+          rm_list="$remove_listdir/sstate:xxx_$suffix"
+          for fn in $file_names; do
+              [ -z "$verbose" ] || echo "Analyzing sstate:$fn-xxx_$suffix.${ext}"
+              for arch in $ava_archs ""; do
+                  grep -h ".*/sstate:$fn:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.${ext}$" $list_suffix >$fn_tmp
+                  if [ -s $fn_tmp ] ; then
+                      [ $debug -gt 1 ] && echo "Available files for $fn-$arch- with suffix $suffix.${ext}:" && cat $fn_tmp
+                      # Use the modification time
+                      to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
+                      [ $debug -gt 2 ] && echo "Considering to delete: $to_del"
+                      # The sstate file which is downloaded from the SSTATE_MIRROR is
+                      # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
+                      # it, so filter it out from the remove list if it should not be
+                      # removed.
+                      to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
+                      [ $debug -gt 2 ] && echo "Considering to keep: $to_keep"
+                      for k in $to_keep; do
+                          if [ -L "$k" ]; then
+                              # The symlink's destination
+                              k_dest="`readlink -e $k`"
+                              # Maybe it is the one in cache_dir
+                              k_maybe="$cache_dir/${k##/*/}"
+                              # Remove it from the remove list if they are the same.
+                              if [ "$k_dest" = "$k_maybe" ]; then
+                                  to_del="`echo $to_del | sed 's#'\"$k_maybe\"'##g'`"
+                              fi
                           fi
-                      fi
-                  done
-                  rm -f $fn_tmp
-                  [ $debug -gt 2 ] && echo "Decided to delete: $to_del"
-                  gen_rmlist $rm_list "$to_del"
-              fi
+                      done
+                      rm -f $fn_tmp
+                      [ $debug -gt 2 ] && echo "Decided to delete: $to_del"
+                      gen_rmlist $rm_list.$ext "$to_del"
+                  fi
+              done
           done
       done
-      [ -s "$rm_list" ] && deleted_tgz=`cat $rm_list | grep ".tgz$" | wc -l`
-      [ -s "$rm_list" ] && deleted_files=`cat $rm_list | wc -l`
-      [ -s "$rm_list" -a $debug -gt 0 ] && cat $rm_list
+      deleted_tgz=`cat $rm_list.* 2>/dev/null | grep ".tgz$" | wc -l`
+      deleted_files=`cat $rm_list.* 2>/dev/null | wc -l`
+      [ "$deleted_files" -gt 0 -a $debug -gt 0 ] && cat $rm_list.*
       echo "($deleted_tgz from $total_tgz_suffix .tgz files for $suffix suffix will be removed or $deleted_files from $total_files_suffix when counting also .siginfo and .done files)"
       let total_deleted=$total_deleted+$deleted_files
   done
-- 
1.9.0


