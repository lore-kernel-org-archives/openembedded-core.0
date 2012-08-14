Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1Hml-0005on-67
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 16:07:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7EDtx1W001809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 06:55:59 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 14 Aug 2012 06:55:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 22:01:33 +0800
Message-ID: <1e1e6217e4ae66ecb586951edcc2987eaf492063.1344948890.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1344948890.git.liezhi.yang@windriver.com>
References: <cover.1344948890.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] sstate-cache-management.sh: update it for the new layout
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
X-List-Received-Date: Tue, 14 Aug 2012 14:07:55 -0000
Content-Type: text/plain

Update it for the new layout of sstate-cache.

Note: It doesn't handle the old sstate-cache/sstate-xxx.tgz (or
siginfo), the user should remove it manually (rm -fr
sstate-cache/sstate-* would be OK).

[YOCTO #2897]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/sstate-cache-management.sh | 39 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index be185bb..c3791d2 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -132,13 +132,12 @@ remove_duplicated () {
 
   sstate_suffixes="deploy-rpm deploy-ipk deploy-deb deploy package populate-lic populate-sysroot"
 
-  cd $cache_dir || exit 1
   # Save all the sstate files in a file
   sstate_list=`mktemp` || exit 1
-  ls sstate-*.tgz >$sstate_list
+  find $cache_dir -path '*/??/sstate-*.tgz' >$sstate_list
   echo -n "Figuring out the archs in the sstate cache dir ... "
   for arch in $all_archs; do
-      grep -q -w $arch $sstate_list
+      grep -q "\-$arch-" $sstate_list
       [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
   done
   echo "Done"
@@ -151,24 +150,24 @@ remove_duplicated () {
 
   for suffix in $sstate_suffixes; do
       # Save the file list to a file, some suffix's file may not exist
-      ls *_$suffix.tgz >$list_suffix 2>/dev/null
+      grep "sstate-.*_$suffix.tgz" $sstate_list >$list_suffix 2>/dev/null
       local deleted=0
       echo -n "Figuring out the sstate-xxx_$suffix.tgz ... "
       # There are at list 6 dashes (-) after arch, use this to avoid the
       # greedy match of sed.
       file_names=`for arch in $ava_archs; do
-          sed -ne 's/^\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*/\1/p' $list_suffix
+          sed -ne 's#.*/../\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*#\1#p' $list_suffix
       done | sort -u`
 
       fn_tmp=`mktemp` || exit 1
       for fn in $file_names; do
           [ -z "$verbose" ] || echo "Analyzing $fn-xxx_$suffix.tgz"
           for arch in $ava_archs; do
-              grep -h "^$fn-$arch-" $list_suffix >>$fn_tmp
+              grep -h "/../$fn-$arch-" $list_suffix >>$fn_tmp
           done
           # Use the access time, also delete the .siginfo file
           to_del=$(ls -u $(cat $fn_tmp) | sed -n '1!p' | sed -e 'p' -e 's/$/.siginfo/')
-          echo $to_del >>$remove_listdir/sstate-xxx_$suffix
+          [ "$to_del" = "" ] || echo $to_del >>$remove_listdir/sstate-xxx_$suffix
           let deleted=$deleted+`echo $to_del | wc -w`
           rm -f $fn_tmp
       done
@@ -181,7 +180,10 @@ remove_duplicated () {
       if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
           for list in `ls $remove_listdir/`; do
               echo -n "Removing $list.tgz (`cat $remove_listdir/$list | wc -w` files) ... "
-              rm -f $verbose `cat $remove_listdir/$list`
+              # Remove them one by one to avoid the argument list too long error
+              for i in `cat $remove_listdir/$list`; do
+                  rm -f $verbose $i
+              done
               echo "Done"
           done
           echo "$total_deleted files have been removed!"
@@ -200,7 +202,7 @@ rm_by_stamps (){
 
   local cache_list=`mktemp` || exit 1
   local keep_list=`mktemp` || exit 1
-  local mv_to_dir=`mktemp -d -p $cache_dir` || exit 1
+  local rm_list=`mktemp` || exit 1
   local suffixes
   local sums
   local all_sums
@@ -218,7 +220,7 @@ rm_by_stamps (){
   echo "Done"
 
   # Save all the state file list to a file
-  ls $cache_dir/sstate-*.tgz >$cache_list
+  find $cache_dir -path '*/??/sstate-*.tgz' | sort -u -o $cache_list
 
   echo -n "Figuring out the files which will be removed ... "
   for i in $all_sums; do
@@ -227,21 +229,18 @@ rm_by_stamps (){
   echo "Done"
 
   if [ -s $keep_list ]; then
-      let total_deleted=(`cat $cache_list | wc -w` - `cat $keep_list | wc -l`)*2
+      sort -u $keep_list -o $keep_list
+      comm -1 -3 $keep_list $cache_list > $rm_list
+      let total_deleted=(`cat $rm_list | wc -w`)*2
 
       if [ $total_deleted -gt 0 ]; then
           read_confirm
           if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
               echo "Removing sstate cache files ... ($total_deleted files)"
-              # Save the file which needs to be kept, remove the others,
-              # then move it back
-              for i in `cat $keep_list`; do
-                  mv $i $mv_to_dir
-                  mv $i.siginfo $mv_to_dir || true
+              # Remove them one by one to avoid the argument list too long error
+              for i in `cat $rm_list`; do
+                  rm -f $verbose $i $i.siginfo
               done
-              rm -f $verbose $cache_dir/sstate-*.tgz
-              rm -f $verbose $cache_dir/sstate-*.tgz.siginfo
-              mv $mv_to_dir/* $cache_dir/
               echo "$total_deleted files have been removed"
           else
               do_nothing
@@ -255,7 +254,7 @@ rm_by_stamps (){
 
   rm -f $cache_list
   rm -f $keep_list
-  rmdir $mv_to_dir
+  rm -f $rm_list
 }
 
 # Parse arguments
-- 
1.7.11.2



