Return-Path: <shen.joon.tan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B286977D11
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 22:56:18 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 15:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,349,1498546800"; d="scan'208";a="137709392"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2017 15:56:18 -0700
From: Tan Shen Joon <shen.joon.tan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2017 06:57:01 +0800
Message-Id: <1502319421-24545-1-git-send-email-shen.joon.tan@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] distrodata: add a utility script to compare list of recipes
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
X-List-Received-Date: Wed, 09 Aug 2017 22:56:18 -0000

distrocompare.sh is added to compare the added list of recipes
between two releases. The output of the script will share the
information of the licenses required and other distributions
that are using the package.

If a single input is provided, it will compare the current
branch with the provided branch/commit-ish package list.

To run : distrocompare.sh <older hash> <newer hash>
E.g. distrocompare.sh morty 92aa0e7
E.g. distrocompare.sh morty pyro
E.g. distrocompare.sh morty

output : The script will produce a file ending with
new_recipe_list.txt preceeded by the branch name from input

Signed-off-by: Tan Shen Joon <shen.joon.tan@intel.com>
---
 scripts/distro/build-recipe-list.py | 117 ++++++++++++++++++++++++++++++++++
 scripts/distro/distrocompare.sh     | 123 ++++++++++++++++++++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100755 scripts/distro/build-recipe-list.py
 create mode 100755 scripts/distro/distrocompare.sh

diff --git a/scripts/distro/build-recipe-list.py b/scripts/distro/build-recipe-list.py
new file mode 100755
index 0000000..407deba
--- /dev/null
+++ b/scripts/distro/build-recipe-list.py
@@ -0,0 +1,117 @@
+#!/usr/bin/env python3
+#
+# Copyright (c) 2017, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+
+import os
+import shutil
+import csv
+import sys
+import argparse
+
+__version__ = "0.1.0"
+
+recipenames = []
+allrecipes = []
+ 
+def gather_recipes(rows):
+    # store the data into the array
+    for row in rows:
+        if row[0] not in recipenames:
+            recipenames.append(row[0])
+            allrecipes.append(row)
+
+def generate_recipe_list():
+    # machine list
+    machine_list = ( "qemuarm64", "qemuarm", "qemumips64", "qemumips", "qemuppc", "qemux86-64", "qemux86" )
+    # set filename format
+    fnformat = 'distrodata.%s.csv'
+
+    # store all data files in distrodata
+    datadir = 'distrodata'
+
+    # create the directory if it does not exists
+    if not os.path.exists(datadir):
+        os.mkdir(datadir)
+
+    # doing bitbake distrodata
+    for machine in machine_list:
+        os.system('MACHINE='+ machine + ' bitbake world -c distrodata')
+        shutil.copy('tmp/log/distrodata.csv', 'distrodata/' + fnformat % machine)
+
+    for machine in machine_list:
+        with open('distrodata/' + fnformat % machine) as f:
+            reader = csv.reader(f)
+            rows = reader.__iter__()
+            gather_recipes(rows)
+
+    with open('recipe-list.txt', 'w') as f:
+        for recipe in sorted(recipenames):
+            f.write("%s\n" % recipe)
+    print("file : recipe-list.txt is created with %d entries." % len(recipenames))
+
+    with open('all-recipe-list.txt', 'w') as f:
+        for recipe in sorted(allrecipes):
+            f.write("%s\n" % ','.join([str(data) for data in recipe]))
+
+
+def diff_for_new_recipes(recipe1, recipe2):
+    prev_recipe_path = recipe1 + '/'
+    curr_recipe_path = recipe2 + '/'
+    if not os.path.isfile(prev_recipe_path + 'recipe-list.txt') or not os.path.isfile(curr_recipe_path + 'recipe-list.txt'):
+        print("recipe files do not exists. please verify that the file exists.")
+        exit(1)
+
+    import csv
+
+    prev = []
+    new = []
+
+    with open(prev_recipe_path + 'recipe-list.txt') as f:
+        prev = f.readlines()
+
+    with open(curr_recipe_path + 'recipe-list.txt') as f:
+        new = f.readlines()
+
+    updates = []
+    for pn in new:
+        if not pn in prev:
+            updates.append(pn.rstrip())
+
+    allrecipe = []
+    with open(recipe1 + '_' + recipe2 + '_new_recipe_list.txt','w') as dr:
+        with open(curr_recipe_path + 'all-recipe-list.txt') as f:
+            reader = csv.reader(f, delimiter=',')
+            for row in reader:
+                if row[0] in updates:
+                    dr.write("%s,%s,%s" % (row[0], row[3], row[5]))
+                    if len(row[9:]) > 0:
+                        dr.write(",%s" % ','.join(row[9:]))
+                    dr.write("\n")
+
+def main(argv):
+    if argv[0] == "generate_recipe_list":
+        generate_recipe_list()
+    elif argv[0] == "compare_recipe":
+        diff_for_new_recipes(argv[1], argv[2])
+    else:
+        print("no such option. choose either 'generate_recipe_list' or 'compare_recipe'")
+
+    exit(0)
+
+if __name__ == "__main__":
+    try:
+        sys.exit(main(sys.argv[1:]))
+    except Exception as e:
+        print("Exception :", e)
+        sys.exit(1)
+
diff --git a/scripts/distro/distrocompare.sh b/scripts/distro/distrocompare.sh
new file mode 100755
index 0000000..908760c
--- /dev/null
+++ b/scripts/distro/distrocompare.sh
@@ -0,0 +1,123 @@
+#!/usr/bin/env bash
+#
+# Copyright (c) 2017, Intel Corporation.
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
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# distrocompare.sh : provides capability to get a list of new packages
+#                    based on two distinct branches. This script takes
+#                    2 parameters; either a commit-ish or a branch name
+#
+#                    To run : distrocompare.sh <older hash> <newer hash>
+#                    E.g. distrocompare.sh morty 92aa0e7
+#                    E.g. distrocompare.sh morty pyro
+#
+
+# get input as version
+previous_version=$1
+current_version=$2
+
+# set previous and current version
+if [ -z "$2" ]; then
+    previous_version=$1
+    current_version="current"
+fi
+
+# get script location. That's where the source supposedly located as well.
+scriptdir="$( realpath $(dirname "${BASH_SOURCE[0]}" ))"
+sourcedir="$( realpath $scriptdir/../.. )"
+
+# create working directory
+workdir=$(mktemp -d)
+
+# prepare to rollback to the branch if not similar
+branch=`cd $sourcedir; git branch | grep \* | cut -d ' ' -f2`
+
+# set current workdir to store final result
+currentworkdir=`pwd`
+
+# persists the file after local repo change
+cp $scriptdir/build-recipe-list.py $workdir
+
+#==================================================================
+
+function bake_distrodata {
+    # get to source directory of the git
+    cd $sourcedir
+
+    # change the branch / commit. Do not change if input is current
+    if [ "$1" != "current" ]; then
+        output=$(git checkout $1 2>&1)
+
+        # exit if git fails
+        if [[ $output == *"error"* ]]; then
+            echo "git error : $output"
+            echo "exiting ... "
+            rm -rf $workdir
+            exit
+        fi
+    fi
+
+    # make tmp as workdir
+    cd $workdir
+
+    # source oe-init to generate a new build folder
+    source $sourcedir/oe-init-build-env $1
+
+    # if file already exists with distrodata, do not append
+    if ! grep -q "distrodata" "conf/local.conf"; then
+        # add inherit distrodata to local.conf to enable distrodata feature
+        echo 'INHERIT += "distrodata"' >> conf/local.conf
+    fi
+
+    # use from tmp
+    $workdir/build-recipe-list.py generate_recipe_list
+}
+
+bake_distrodata $previous_version
+bake_distrodata $current_version
+
+#==================================================================
+
+cd $workdir
+
+# compare the 2 generated recipe-list.txt
+$workdir/build-recipe-list.py compare_recipe $previous_version $current_version
+
+# copy final result to current working directory
+cp $workdir/*_new_recipe_list.txt $currentworkdir
+
+if [ $? -ne 0 ]; then
+    rm -rf $workdir/$previous_version
+    rm -rf $workdir/$current_version
+    rm $workdir/build-recipe-list.py
+    # preserve the result in /tmp/distrodata if fail to copy the result over
+    exit
+fi
+
+# cleanup
+rm -rf $workdir
+
+# perform rollback branch
+cd $sourcedir
+currentbranch=`git branch | grep \* | cut -d ' ' -f2`
+if [ "$currentbranch" != "$branch" ]; then
+    git checkout $branch
+fi
+
+cd $currentworkdir
+
+#==================================================================
-- 
2.7.4


