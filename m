Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC8-0004t7-Vd
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652377"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:26 -0800
Message-Id: <f07365dd711757d9790f5e8a6d6a0b48adb47a7c.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/25] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Thu, 23 Feb 2012 16:07:03 -0000

From: Robert Yang <liezhi.yang@windriver.com>

There would be many obsolete cache files in the SSTATE_DIR after several
builds, this script can remove the obsolete one for a pkg, only leave
the up to date one.

Here is the help text:

sstate-cache-management.sh <OPTION>

Options:
  --help, -h
        Display this help and exit.

  --cache-dir=<sstate cache dir>
        Specify sstate cache directory, will use the environment
        variable SSTATE_CACHE_DIR if it is not specified.

  --remove-duplicated
        Remove the duplicated sstate cache files of one package, only
        the newest one would be kept.

[YOCTO #1682]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/sstate-cache-management.sh |  135 ++++++++++++++++++++++++++++++++++++
 1 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100755 scripts/sstate-cache-management.sh

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
new file mode 100755
index 0000000..d0e3abc
--- /dev/null
+++ b/scripts/sstate-cache-management.sh
@@ -0,0 +1,135 @@
+#!/bin/bash
+
+#  Copyright (c) 2012 Wind River Systems, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+
+usage () {
+  cat << EOF
+Welcome to sstate cache management utilities.
+sstate-cache-management.sh <OPTION>
+
+Options:
+  --help, -h
+        Display this help and exit.
+
+  --cache-dir=<sstate cache dir>
+        Specify sstate cache directory, will use the environment
+        variable SSTATE_CACHE_DIR if it is not specified.
+
+  --remove-duplicated
+        Remove the duplicated sstate cache files of one package, only
+        the newest one would be kept.
+
+EOF
+}
+
+if [ $# -lt 1 ]; then
+  usage
+  exit 0
+fi
+
+# Print error information and exit.
+echo_error () {
+  echo "ERROR: $1" >&2
+  exit 1
+}
+
+# Remove the duplicated cache files for the pkg, keep the newest one
+remove_duplicated () {
+  local all_suffixes="$1"
+  local ava_archs="$2"
+  local total_deleted=0
+  for suffix in $all_suffixes; do
+      local deleted=0
+      echo -n "Removing the sstate-xxx_$suffix.tgz ... "
+      # sed twice to avoid the greedy match
+      file_names=`for arch in $ava_archs; do
+          ls sstate-*-$arch-*_$suffix.tgz 2>/dev/null | \
+              sed -e 's/\(.*\)-'"$arch"'-.*/\1/' \
+              -e 's/\(.*\)-'"$arch"'-.*/\1/'
+      done | sort -u`
+
+      for fn in $file_names; do
+          for arch in $ava_archs; do
+              ls $fn-$arch-*_$suffix.tgz 2>/dev/null >>/tmp/$fn
+          done
+          # Also delete the .siginfo file
+          to_del=$(ls -t $(cat /tmp/$fn) | sed -n '1!p' | sed -e 'p' -e 's/$/.siginfo/')
+          rm -f $to_del
+          let deleted=$deleted+`echo $to_del | wc -w`
+          rm -f /tmp/$fn
+      done
+      echo "($deleted files)"
+      let total_deleted=$total_deleted+$deleted
+  done
+  echo "$total_deleted files have been removed"
+}
+
+# Parse arguments
+while [ -n "$1" ]; do
+  case $1 in
+    --cache-dir=*)
+      cache_dir=`echo $1 | sed -e 's#^--cache-dir=##' -e 's#/*$##' | xargs readlink -f`
+      [ -d "$cache_dir" ] || echo_error "Invalid argument to --cache-dir"
+      shift
+        ;;
+    --remove-duplicated)
+      rm_duplicated="yes"
+      shift
+        ;;
+    --help|-h)
+      usage
+      exit 0
+        ;;
+    *)
+        echo "Invalid arguments $*"
+        echo_error "Try 'sstate-cache-management.sh -h' for more information."
+        ;;
+  esac
+done
+
+# sstate cache directory, use environment variable SSTATE_CACHE_DIR
+# if it was not specified, otherwise, error.
+[ -n "$cache_dir" ] || cache_dir=$SSTATE_CACHE_DIR
+[ -d "$cache_dir" ] || echo_error "Invalid cache directory \"$cache_dir\""
+
+cache_dir=`readlink -f $cache_dir`
+
+topdir=$(dirname $(dirname $(readlink -f $0)))
+tunedir=$topdir/meta/conf/machine/include
+[ -d $tunedir ] || echo_error "Can't find the tune directory"
+
+# Use the "_" to substitute "-", e.g., x86-64 to x86_64
+all_archs=`grep -r DEFAULTTUNE $tunedir | \
+    sed -e 's/.*\"\(.*\)\"/\1/' -e 's/-/_/g' | sort -u`
+# Add the qemu archs
+all_archs="$all_archs qemuarm qemux86 qemumips qemuppc"
+
+all_suffixes="deploy-rpm deploy-ipk deploy-deb deploy package populate-lic populate-sysroot"
+
+cd $cache_dir
+
+echo "Figuring out the archs in the sstate cache dir ..."
+for arch in $all_archs; do
+    ls | grep -q -w $arch
+    [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
+done
+echo "The following archs have been found in the sstate cache dir:"
+echo $ava_archs
+
+if [ "$rm_duplicated" == "yes" -a -n "$ava_archs" ]; then
+    remove_duplicated "$all_suffixes" "$ava_archs"
+fi
-- 
1.7.6.5



