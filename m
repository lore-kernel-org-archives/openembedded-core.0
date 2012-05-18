Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAd-0000XG-Rw
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583553"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:14 +0300
Message-Id: <f523af0bffb74b55ec38323094cc9f4d2907f5e4.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 4/9] test-reexec: Add script to address issues when task re-execution
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
X-List-Received-Date: Fri, 18 May 2012 14:28:44 -0000

From: Jiajun Xu <jiajun.xu@intel.com>

The script is used to address build issues when tasks of different
recipes are re-executed. The script goes through all available recipes
and their tasks. The test results are saved in ./reexeclogs. Force build
logs are saved with prefix "force". Build failure logs are saved with
prefix "failed".

[YOCTO #2123]

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 scripts/test-reexec |  123 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 123 insertions(+), 0 deletions(-)
 create mode 100755 scripts/test-reexec

diff --git a/scripts/test-reexec b/scripts/test-reexec
new file mode 100755
index 0000000..9eaa96e
--- /dev/null
+++ b/scripts/test-reexec
@@ -0,0 +1,123 @@
+#!/bin/bash
+
+# Test Script for task re-execution
+# 
+# Copyright 2012 Intel Corporation
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+#
+# DESCRIPTION
+# This script is intended to address issues for re-execution of 
+# tasks. The test results are saved in ./reexeclogs. Force build
+# logs are saved with prefix "force". Build failure logs are saved with
+# prefix "failed". Log files with prefix "initial" are used to save
+# initial build logs for each recipe. Log files with prefix "clean" are
+# used to save logs of clean task after testing for a recipe is finished.
+#
+
+targets=`bitbake -s | cut -d " " -f 1`
+
+LOGS=./reexeclogs
+
+mkdir -p $LOGS
+
+# Clear sstate files for specified recipe
+function clearsstate {
+	target=$1
+
+	sstate_dir=`bitbake $target -e | grep "^SSTATE_DIR" | cut -d "\"" -f 2`
+	sstate_pkgspec=`bitbake $target -e | grep "^SSTATE_PKGSPEC" | cut -d "\"" -f 2`
+	sstasks=`bitbake $target -e | grep "^SSTATETASKS" | cut -d "\"" -f 2`
+
+	for sstask in $sstasks
+	do
+		sstask=${sstask:3}
+		case $sstask in
+			populate_sysroot) sstask="populate-sysroot"
+			;;
+			populate_lic) sstask="populate-lic"
+			;;
+			package_write_ipk) sstask="deploy-ipk"
+			;;
+			package_write_deb) sstask="deploy-deb"
+			;;
+			package_write_rpm) sstask="deploy-rpm"
+			;;
+			package) sstask="package"
+			;;
+			deploy) sstask="deploy"
+			;;
+			*)
+			;;
+		esac
+
+		echo "Removing ${sstate_dir}/${sstate_pkgspec}*_${sstask}.tgz* for $target"
+		rm -rf ${sstate_dir}/${sstate_pkgspec}*_${sstask}.tgz*
+	done
+}
+
+# Function to re-execute specified task of recipe
+function testit {
+	target=$1
+	task=$2
+
+	task=`echo $task | sed 's/_setscene//'`
+
+	if [ -f $LOGS/force.$target.$task ]; then
+		return
+	fi
+
+	case $task in
+		clean|build|cleansstate|cleanall|package|cleansstate2|package_write|package_write_ipk|package_write_rpm|package_write_deb|fetch|populate_lic) return;;
+		fetchall|devshell|buildall|listtasks|checkuri|checkuriall) return;;
+	esac
+
+	echo "Attempting target $target, task $task"
+	echo "Initial build"
+	bitbake $target -c cleansstate > $LOGS/initial.$target.$task
+	bitbake $target >> $LOGS/initial.$target.$task
+	clearsstate $target >> $LOGS/initial.$target.$task
+	echo "Re-execution build"
+	bitbake $target -c $task -f  > $LOGS/force.$target.$task
+	if [ "$?" != 0 ]; then
+		echo "FAILURE for $target $task"
+		cp $LOGS/force.$target.$task $LOGS/failed.$target.$task
+		bitbake $target -c clean > $LOGS/clean.$target.$task
+	else
+		bitbake $target >> $LOGS/force.$target.$task
+		if [ "$?" != 0 ]; then
+			echo "FAILURE2 for $target $task"
+			cp $LOGS/force.$target.$task $LOGS/failed.$target.$task
+			bitbake $target -c clean > $LOGS/clean.$target.$task
+		fi
+	fi
+	echo "Done"
+}
+
+# Go through the recipe list and these recipes' task list
+# Then re-execute them
+for target in $targets; do
+	# Remove log messages from bitbake output
+	case $target in
+		Summary*|WARNING*|Loading*|Loaded*|Package*|=====*) continue;;
+	esac
+	tasks=`bitbake $target -c listtasks | grep ^do_ | sed s/do_//`
+	for task in $tasks; do
+		testit $target $task
+	done
+done
+
+
-- 
1.7.7.6



