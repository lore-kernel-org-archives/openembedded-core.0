Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SDVjP-0004zq-NT
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 08:54:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2U6jcjh027123
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 23:45:38 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 29 Mar 2012 23:45:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 14:44:31 +0800
Message-ID: <10d37bf8cd661af8034b36de95ffbc5fb27c9982.1333089569.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333089569.git.liezhi.yang@windriver.com>
References: <cover.1333089569.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate-cache-management.sh: fixes and enhancement
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
X-List-Received-Date: Fri, 30 Mar 2012 06:54:44 -0000
Content-Type: text/plain

Fix a few problems and enhance its functions, it shoud be more useful
than before.

* Search in meta and meta-* for archs, and grep AVAILTUNES for archs,
  (only search meta, and grep DEFAULTTUNE before), add the host arch.
  and also can search in extra layers with --extra-layer.

* Reduce the analyzing time when remove duplicated files. It would cost
  more than 10 minutes to analyze 11,000 files before, now only needs
  about 50 seconds.

* Check the access time rather than create time.

* Need the user's confirm before really remove the file, or use --yes to
  assume yes.

* Add --stamps-dir to keep sstate files which are used by the build
  directory, and remove others this can make the sstate cache dir clean,
  it is faster and should be useful than the --remove-duplicated.

* Add --verbose to explain what is being done.

* Add "-d" which is short for --remove-duplicated

[YOCTO #2198]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/sstate-cache-management.sh |  289 ++++++++++++++++++++++++++++++------
 1 files changed, 240 insertions(+), 49 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index d0e3abc..be185bb 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -16,22 +16,54 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 #
 
+# Global vars
+cache_dir=
+confirm=
+total_deleted=0
+verbose=
+
 usage () {
   cat << EOF
 Welcome to sstate cache management utilities.
 sstate-cache-management.sh <OPTION>
 
 Options:
-  --help, -h
+  -h, --help
         Display this help and exit.
 
   --cache-dir=<sstate cache dir>
         Specify sstate cache directory, will use the environment
         variable SSTATE_CACHE_DIR if it is not specified.
 
-  --remove-duplicated
+  --extra-layer=<layer1>,<layer2>...<layern>
+        Specify the layer which will be used for searching the archs,
+        it will search the meta and meta-* layers in the top dir by
+        default, and will search meta, meta-*, <layer1>, <layer2>,
+        ...<layern> when specified. Use "," as the separator.
+
+        This is useless for --stamps-dir.
+
+  -d, --remove-duplicated
         Remove the duplicated sstate cache files of one package, only
-        the newest one would be kept.
+        the newest one will be kept.
+
+        Conflicts with --stamps-dir.
+
+  --stamps-dir=<dir1>,<dir2>...<dirn>
+        Specify the build directory's stamps directories, the sstate
+        cache file which IS USED by these build diretories will be KEPT,
+        other sstate cache files in cache-dir will be removed. Use ","
+        as the separator. For example:
+        --stamps-dir=build1/tmp/stamps,build2/tmp/stamps
+
+        Conflicts with --remove-duplicated.
+
+  -y, --yes
+        Automatic yes to prompts; assume "yes" as answer to all prompts
+        and run non-interactively.
+
+  -v, --verbose
+        explain what is being done
 
 EOF
 }
@@ -41,6 +73,31 @@ if [ $# -lt 1 ]; then
   exit 0
 fi
 
+# Echo no files to remove
+no_files () {
+    echo No files to remove
+}
+
+# Echo nothing to do
+do_nothing () {
+   echo Nothing to do
+}
+
+# Read the input "y"
+read_confirm () {
+  echo -n "$total_deleted files will be removed! "
+  if [ "$confirm" != "y" ]; then
+      echo -n "Do you want to continue (y/n)? "
+      while read confirm; do
+          [ "$confirm" = "Y" -o "$confirm" = "y" -o "$confirm" = "n" \
+            -o "$confirm" = "N" ] && break
+          echo -n "Invalid input \"$confirm\", please input 'y' or 'n': "
+      done
+  else
+      echo
+  fi
+}
+
 # Print error information and exit.
 echo_error () {
   echo "ERROR: $1" >&2
@@ -49,45 +106,197 @@ echo_error () {
 
 # Remove the duplicated cache files for the pkg, keep the newest one
 remove_duplicated () {
-  local all_suffixes="$1"
-  local ava_archs="$2"
-  local total_deleted=0
-  for suffix in $all_suffixes; do
+
+  local topdir
+  local tunedirs
+  local all_archs
+  local ava_archs
+  local arch
+  local file_names
+  local sstate_list
+  local fn_tmp
+  local list_suffix=`mktemp` || exit 1
+
+  # Find out the archs in all the layers
+  echo -n "Figuring out the archs in the layers ... "
+  topdir=$(dirname $(dirname $(readlink -e $0)))
+  tunedirs="`find $topdir/meta* $layers -path '*/meta*/conf/machine/include'`"
+  [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
+  all_archs=`grep -r -h "^AVAILTUNES " $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
+  # Add the qemu and native archs
+  # Use the "_" to substitute "-", e.g., x86-64 to x86_64
+  # Sort to remove the duplicated ones
+  all_archs=$(echo $all_archs qemuarm qemux86 qemumips qemuppc qemux86_64 $(uname -m) \
+          | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u)
+  echo "Done"
+
+  sstate_suffixes="deploy-rpm deploy-ipk deploy-deb deploy package populate-lic populate-sysroot"
+
+  cd $cache_dir || exit 1
+  # Save all the sstate files in a file
+  sstate_list=`mktemp` || exit 1
+  ls sstate-*.tgz >$sstate_list
+  echo -n "Figuring out the archs in the sstate cache dir ... "
+  for arch in $all_archs; do
+      grep -q -w $arch $sstate_list
+      [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
+  done
+  echo "Done"
+  echo "The following archs have been found in the cache dir:"
+  echo $ava_archs
+  echo ""
+
+  # Save the file list which needs to be removed
+  local remove_listdir=`mktemp -d` || exit 1
+
+  for suffix in $sstate_suffixes; do
+      # Save the file list to a file, some suffix's file may not exist
+      ls *_$suffix.tgz >$list_suffix 2>/dev/null
       local deleted=0
-      echo -n "Removing the sstate-xxx_$suffix.tgz ... "
-      # sed twice to avoid the greedy match
+      echo -n "Figuring out the sstate-xxx_$suffix.tgz ... "
+      # There are at list 6 dashes (-) after arch, use this to avoid the
+      # greedy match of sed.
       file_names=`for arch in $ava_archs; do
-          ls sstate-*-$arch-*_$suffix.tgz 2>/dev/null | \
-              sed -e 's/\(.*\)-'"$arch"'-.*/\1/' \
-              -e 's/\(.*\)-'"$arch"'-.*/\1/'
+          sed -ne 's/^\(sstate-.*\)-'"$arch"'-.*-.*-.*-.*-.*-.*/\1/p' $list_suffix
       done | sort -u`
 
+      fn_tmp=`mktemp` || exit 1
       for fn in $file_names; do
+          [ -z "$verbose" ] || echo "Analyzing $fn-xxx_$suffix.tgz"
           for arch in $ava_archs; do
-              ls $fn-$arch-*_$suffix.tgz 2>/dev/null >>/tmp/$fn
+              grep -h "^$fn-$arch-" $list_suffix >>$fn_tmp
           done
-          # Also delete the .siginfo file
-          to_del=$(ls -t $(cat /tmp/$fn) | sed -n '1!p' | sed -e 'p' -e 's/$/.siginfo/')
-          rm -f $to_del
+          # Use the access time, also delete the .siginfo file
+          to_del=$(ls -u $(cat $fn_tmp) | sed -n '1!p' | sed -e 'p' -e 's/$/.siginfo/')
+          echo $to_del >>$remove_listdir/sstate-xxx_$suffix
           let deleted=$deleted+`echo $to_del | wc -w`
-          rm -f /tmp/$fn
+          rm -f $fn_tmp
       done
-      echo "($deleted files)"
+      echo "($deleted files will be removed)"
       let total_deleted=$total_deleted+$deleted
   done
-  echo "$total_deleted files have been removed"
+  rm -f $list_suffix
+  if [ $total_deleted -gt 0 ]; then
+      read_confirm
+      if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
+          for list in `ls $remove_listdir/`; do
+              echo -n "Removing $list.tgz (`cat $remove_listdir/$list | wc -w` files) ... "
+              rm -f $verbose `cat $remove_listdir/$list`
+              echo "Done"
+          done
+          echo "$total_deleted files have been removed!"
+      else
+          do_nothing
+      fi
+  else
+       no_files
+  fi
+  [ -d $remove_listdir ] && rm -fr $remove_listdir
+}
+
+# Remove the sstate file by stamps dir, the file not used by the stamps dir
+# will be removed.
+rm_by_stamps (){
+
+  local cache_list=`mktemp` || exit 1
+  local keep_list=`mktemp` || exit 1
+  local mv_to_dir=`mktemp -d -p $cache_dir` || exit 1
+  local suffixes
+  local sums
+  local all_sums
+
+  suffixes="populate_sysroot populate_lic package_write_ipk \
+            package_write_rpm package_write_deb package deploy"
+
+  # Figure out all the md5sums in the stamps dir.
+  echo -n "Figuring out all the md5sums in stamps dir ... "
+  for i in $suffixes; do
+      sums=`find $stamps -maxdepth 2 -name "*\.do_$i\.sigdata.*" | \
+        sed 's#.*\.sigdata\.##' | sort -u`
+      all_sums="$all_sums $sums"
+  done
+  echo "Done"
+
+  # Save all the state file list to a file
+  ls $cache_dir/sstate-*.tgz >$cache_list
+
+  echo -n "Figuring out the files which will be removed ... "
+  for i in $all_sums; do
+      grep ".*-$i.*" $cache_list >>$keep_list
+  done
+  echo "Done"
+
+  if [ -s $keep_list ]; then
+      let total_deleted=(`cat $cache_list | wc -w` - `cat $keep_list | wc -l`)*2
+
+      if [ $total_deleted -gt 0 ]; then
+          read_confirm
+          if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
+              echo "Removing sstate cache files ... ($total_deleted files)"
+              # Save the file which needs to be kept, remove the others,
+              # then move it back
+              for i in `cat $keep_list`; do
+                  mv $i $mv_to_dir
+                  mv $i.siginfo $mv_to_dir || true
+              done
+              rm -f $verbose $cache_dir/sstate-*.tgz
+              rm -f $verbose $cache_dir/sstate-*.tgz.siginfo
+              mv $mv_to_dir/* $cache_dir/
+              echo "$total_deleted files have been removed"
+          else
+              do_nothing
+          fi
+      else
+          no_files
+      fi
+  else
+      echo_error "All files in cache dir will be removed! Abort!"
+  fi
+
+  rm -f $cache_list
+  rm -f $keep_list
+  rmdir $mv_to_dir
 }
 
 # Parse arguments
 while [ -n "$1" ]; do
   case $1 in
     --cache-dir=*)
-      cache_dir=`echo $1 | sed -e 's#^--cache-dir=##' -e 's#/*$##' | xargs readlink -f`
+      cache_dir=`echo $1 | sed -e 's#^--cache-dir=##' | xargs readlink -e`
       [ -d "$cache_dir" ] || echo_error "Invalid argument to --cache-dir"
       shift
         ;;
-    --remove-duplicated)
-      rm_duplicated="yes"
+    --remove-duplicated|-d)
+      rm_duplicated="y"
+      shift
+        ;;
+    --yes|-y)
+      confirm="y"
+      shift
+        ;;
+    --extra-layer=*)
+      extra_layers=`echo $1 | sed -e 's#^--extra-layer=##' -e 's#,# #g'`
+      [ -n "$extra_layers" ] || echo_error "Invalid extra layer $i"
+      for i in $extra_layers; do
+          l=`readlink -e $i`
+          if [ -d "$l" ]; then
+              layers="$layers $l"
+          else
+              echo_error "Can't find layer $i"
+          fi
+      done
+      shift
+        ;;
+    --stamps-dir=*)
+      stamps=`echo $1 | sed -e 's#^--stamps-dir=##' -e 's#,# #g'`
+      [ -n "$stamps" ] || echo_error "Invalid stamps dir $i"
+      for i in $stamps; do
+          [ -d "$i" ] || echo_error "Invalid stamps dir $i"
+      done
+      shift
+        ;;
+    --verbose|-v)
+      verbose="-v"
       shift
         ;;
     --help|-h)
@@ -95,8 +304,8 @@ while [ -n "$1" ]; do
       exit 0
         ;;
     *)
-        echo "Invalid arguments $*"
-        echo_error "Try 'sstate-cache-management.sh -h' for more information."
+      echo "Invalid arguments $*"
+      echo_error "Try 'sstate-cache-management.sh -h' for more information."
         ;;
   esac
 done
@@ -104,32 +313,14 @@ done
 # sstate cache directory, use environment variable SSTATE_CACHE_DIR
 # if it was not specified, otherwise, error.
 [ -n "$cache_dir" ] || cache_dir=$SSTATE_CACHE_DIR
+[ -n "$cache_dir" ] || echo_error "No cache dir found!"
 [ -d "$cache_dir" ] || echo_error "Invalid cache directory \"$cache_dir\""
 
-cache_dir=`readlink -f $cache_dir`
+[ -n "$rm_duplicated" -a -n "$stamps" ] && \
+    echo_error "Can not use both --remove-duplicated and --stamps-dir"
 
-topdir=$(dirname $(dirname $(readlink -f $0)))
-tunedir=$topdir/meta/conf/machine/include
-[ -d $tunedir ] || echo_error "Can't find the tune directory"
+[ "$rm_duplicated" = "y" ] && remove_duplicated
+[ -n "$stamps" ] && rm_by_stamps
+[ -z "$rm_duplicated" -a -z "$stamps" ] && \
+    echo "What do you want to do?"
 
-# Use the "_" to substitute "-", e.g., x86-64 to x86_64
-all_archs=`grep -r DEFAULTTUNE $tunedir | \
-    sed -e 's/.*\"\(.*\)\"/\1/' -e 's/-/_/g' | sort -u`
-# Add the qemu archs
-all_archs="$all_archs qemuarm qemux86 qemumips qemuppc"
-
-all_suffixes="deploy-rpm deploy-ipk deploy-deb deploy package populate-lic populate-sysroot"
-
-cd $cache_dir
-
-echo "Figuring out the archs in the sstate cache dir ..."
-for arch in $all_archs; do
-    ls | grep -q -w $arch
-    [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
-done
-echo "The following archs have been found in the sstate cache dir:"
-echo $ava_archs
-
-if [ "$rm_duplicated" == "yes" -a -n "$ava_archs" ]; then
-    remove_duplicated "$all_suffixes" "$ava_archs"
-fi
-- 
1.7.1



