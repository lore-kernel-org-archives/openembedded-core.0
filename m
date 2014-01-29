Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 31D7B6BAD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 21:03:39 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so1219133eaj.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6BXRNz7S420jj8aywikUxTKg3Stol+QHGeFUvdQPEwQ=;
	b=lS9J3mq9+4ywB1LLRAd4mk4wMzH5qykyl+pMwlk5XTPXJRug9dncPeUUnAj9B+WoPn
	IeJrjK1tbevWlk2BKd4IFF40YMTtdjbxiljOK1jDpk67pO+bw0ugIcOdtFMlzDjV1SZl
	1n6/PcbZrcwR3y7wg1uJnX5wPz0DYm0FGFQTeBGR+ISL4Pn/hhvdt8+3z1lpsC3FFOAz
	1GMHilVSSKpA6Il9Vl3RfYAp0Ol997cuL6z44aWDdYWe3tr5hnKVYDmOleFg3mWK7zAB
	558Q2ZxsEQ6DM256YBtaBWE0s8NqJaPQlCuG1RS0izIk3MsxwAjhtbiqclV2gjRaj2/a
	0g5g==
X-Received: by 10.14.29.6 with SMTP id h6mr157396eea.84.1391029419733;
	Wed, 29 Jan 2014 13:03:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m9sm357857eeh.3.2014.01.29.13.03.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:03:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 22:03:39 +0100
Message-Id: <baa39254e61c4fa5ea24cfac77ea4062746ad965.1391027849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] sstate-cache-management.sh: Fix remove_duplicated() to work after SSTATE_SWSPEC change
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
X-List-Received-Date: Wed, 29 Jan 2014 21:03:39 -0000

* format of filenames for sstate archives was changed in:
  commit 6f823a23c5f1d0ffa0a27db1c1bc1907de788505
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Fri Dec 20 12:06:02 2013 +0000
  Subject: sstate: Convert to use ':' as a filename sperator and use SSTATE_SWSPEC globally
* remove_duplicated() wasn't able to find available architectures and
  duplicate files since this change
* add extra step to remove old sstate archives starting with sstate-
  (instead of sstate:)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index e2baf17..21ca470 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -181,23 +181,26 @@ remove_duplicated () {
   # Add the qemu and native archs
   # Use the "_" to substitute "-", e.g., x86-64 to x86_64
   # Sort to remove the duplicated ones
-  all_archs=$(echo $all_archs $all_machines $(uname -m) \
+  # Add allarch
+  all_archs=$(echo allarch $all_archs $all_machines $(uname -m) \
           | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u)
   echo "Done"
 
   # Save all the sstate files in a file
   sstate_list=`mktemp` || exit 1
-  find $cache_dir -name 'sstate-*.tgz' >$sstate_list
+  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz' >$sstate_list
 
   echo -n "Figuring out the suffixes in the sstate cache dir ... "
-  sstate_suffixes="`sed 's/.*_\([^_]*\)\.tgz$/\1/g' $sstate_list | sort -u`"
+  sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz$%\1%g' $sstate_list | sort -u`"
   echo "Done"
   echo "The following suffixes have been found in the cache dir:"
   echo $sstate_suffixes
 
   echo -n "Figuring out the archs in the sstate cache dir ... "
+  # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
+  # SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
   for arch in $all_archs; do
-      grep -q "\-$arch-" $sstate_list
+      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $sstate_list
       [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
   done
   echo "Done"
@@ -210,21 +213,20 @@ remove_duplicated () {
 
   for suffix in $sstate_suffixes; do
       # Save the file list to a file, some suffix's file may not exist
-      grep "sstate-.*_$suffix.tgz" $sstate_list >$list_suffix 2>/dev/null
+      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.tgz" $sstate_list >$list_suffix 2>/dev/null
       local deleted=0
-      echo -n "Figuring out the sstate-xxx_$suffix.tgz ... "
-      # There are at list 6 dashes (-) after arch, use this to avoid the
-      # greedy match of sed.
-      file_names=`for arch in $ava_archs; do
-          sed -ne 's#.*/\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*#\1#p' $list_suffix
+      echo -n "Figuring out the sstate:xxx_$suffix.tgz ... "
+      # Uniq BPNs
+      file_names=`for arch in $ava_archs ""; do
+          sed -ne "s%.*/sstate:\([^:]*\):[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$%\1%p" $list_suffix
       done | sort -u`
 
       fn_tmp=`mktemp` || exit 1
-      rm_list="$remove_listdir/sstate-xxx_$suffix"
+      rm_list="$remove_listdir/sstate:xxx_$suffix"
       for fn in $file_names; do
-          [ -z "$verbose" ] || echo "Analyzing $fn-xxx_$suffix.tgz"
+          [ -z "$verbose" ] || echo "Analyzing sstate:$fn-xxx_$suffix.tgz"
           for arch in $ava_archs; do
-              grep -h "/$fn-$arch-" $list_suffix >$fn_tmp
+              grep -h ".*/sstate:$fn:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $list_suffix >$fn_tmp
               if [ -s $fn_tmp ] ; then
                   [ $debug -gt 1 ] && echo "Available files for $fn-$arch- with suffix $suffix:" && cat $fn_tmp
                   # Use the modification time
@@ -259,6 +261,14 @@ remove_duplicated () {
       echo "($deleted files will be removed)"
       let total_deleted=$total_deleted+$deleted
   done
+  deleted=0
+  rm_old_list=$remove_listdir/sstate-old-filenames
+  find $cache_dir -name 'sstate-*.tgz' >$rm_old_list
+  [ ! -s "$rm_old_list" ] || deleted=`cat $rm_old_list | wc -l`
+  [ -s "$rm_old_list" -a $debug -gt 0 ] && cat $rm_old_list
+  echo "($deleted files with old sstate-* filenames will be removed)"
+  let total_deleted=$total_deleted+$deleted
+
   rm -f $list_suffix
   rm -f $sstate_list
   if [ $total_deleted -gt 0 ]; then
-- 
1.8.5.3


