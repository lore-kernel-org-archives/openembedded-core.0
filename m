Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 504AB7BF29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:03:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m22so2527364wml.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2IYCZAGcGLp1Or/fQrNIpCO2cTPfAKIpzNFwmKcwtFk=;
	b=M5PbWmpmlMmiybWRyihdQ/g6emSjUAxKS1aG8SmGP8sJIQQ1xTFuordUtC5iCtJvcI
	G6FmvhNLahoxLSid/uaUCPFTWijbP4X64PhNwxlDqAlAztmF/9thz0CqshP0ni/+cE10
	vj3gJdRAAS4wk1QgMlNO7YNZ8OfdmReauk0g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2IYCZAGcGLp1Or/fQrNIpCO2cTPfAKIpzNFwmKcwtFk=;
	b=lLxDfdIe/9sMvldSmNFJLTZbfFDHd3e3ZRHMsiSIm6IAg+b7HOC6JFcFL9ExE3JEaj
	7vHgVTRmESlnS0xeXxOXBRAWrNqhS4gpwo5RkU3xC/X+EWmLVpRY//Y0vXGVgzfZVfcc
	8zbgO+1kBD9/KGEUmQHGewrxaLSVuNGtbMOlj+C+mGMJbyT9fpxTN6tlmxaQrYf+zOb/
	ooSjjgQmbDTbxCvh79HzsMSxwq/pSLf2he0gRORD6Ew2SKsCPWb9q8uhTq1a3RYVb7oS
	Gm1Zl85ujjdVJCMAAfz+eDb4ApiuJTeABTXNl+huVYMe3dBfF+rXT301IJ7T//0rEdd5
	EAPA==
X-Gm-Message-State: AA+aEWZ2p9A78ljvp5j+thNzsnuMRxV31torSmLm8WYy65y+k1/p1AuX
	R5rR3S/OEFyY4C+9kiMqCSfiuHyQJ63Tkg==
X-Google-Smtp-Source: AFSGD/UenYPrJD1TiRlWbSKPmBQH0l4DDxn8tFLGi/5NaYYyYzbqS1AbiF7OVcWHQrtiAVAOZlcgIw==
X-Received: by 2002:a1c:4301:: with SMTP id q1mr2941375wma.44.1545134622523;
	Tue, 18 Dec 2018 04:03:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm1684156wmy.40.2018.12.18.04.03.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:03:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:03:35 +0000
Message-Id: <20181218120337.25019-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
References: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/6] scripts/distro: Remove as using obsolete APIs and need re-implementing sanely
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
X-List-Received-Date: Tue, 18 Dec 2018 12:03:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/distro/build-recipe-list.py | 129 ----------------------------
 scripts/distro/distrocompare.sh     | 123 --------------------------
 2 files changed, 252 deletions(-)
 delete mode 100755 scripts/distro/build-recipe-list.py
 delete mode 100755 scripts/distro/distrocompare.sh

diff --git a/scripts/distro/build-recipe-list.py b/scripts/distro/build-recipe-list.py
deleted file mode 100755
index 21627648509..00000000000
--- a/scripts/distro/build-recipe-list.py
+++ /dev/null
@@ -1,129 +0,0 @@
-#!/usr/bin/env python3
-#
-# Copyright (c) 2017, Intel Corporation.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-
-import os
-import shutil
-import csv
-import sys
-import argparse
-
-__version__ = "0.1.0"
-
-# set of BPNs
-recipenames = set()
-# map of recipe -> data
-allrecipes = {}
-
-def make_bpn(recipe):
-    prefixes = ("nativesdk-",)
-    suffixes = ("-native", "-cross", "-initial", "-intermediate", "-crosssdk", "-cross-canadian")
-    for ix in prefixes + suffixes:
-        if ix in recipe:
-            recipe = recipe.replace(ix, "")
-    return recipe
-
-def gather_recipes(rows):
-    for row in rows:
-        recipe = row[0]
-        bpn = make_bpn(recipe)
-        if bpn not in recipenames:
-            recipenames.add(bpn)
-        if recipe not in allrecipes:
-            allrecipes[recipe] = row
-
-def generate_recipe_list():
-    # machine list
-    machine_list = ( "qemuarm64", "qemuarm", "qemumips64", "qemumips", "qemuppc", "qemux86-64", "qemux86" )
-    # set filename format
-    fnformat = 'distrodata.%s.csv'
-
-    # store all data files in distrodata
-    datadir = 'distrodata'
-
-    # create the directory if it does not exists
-    if not os.path.exists(datadir):
-        os.mkdir(datadir)
-
-    # doing bitbake distrodata
-    for machine in machine_list:
-        os.system('MACHINE='+ machine + ' bitbake -k universe -c distrodata')
-        shutil.copy('tmp/log/distrodata.csv', 'distrodata/' + fnformat % machine)
-
-    for machine in machine_list:
-        with open('distrodata/' + fnformat % machine) as f:
-            reader = csv.reader(f)
-            rows = reader.__iter__()
-            gather_recipes(rows)
-
-    with open('recipe-list.txt', 'w') as f:
-        for recipe in sorted(recipenames):
-            f.write("%s\n" % recipe)
-    print("file : recipe-list.txt is created with %d entries." % len(recipenames))
-
-    with open('all-recipe-list.txt', 'w') as f:
-        for recipe, row in sorted(allrecipes.items()):
-            f.write("%s\n" % ','.join(row))
-
-
-def diff_for_new_recipes(recipe1, recipe2):
-    prev_recipe_path = recipe1 + '/'
-    curr_recipe_path = recipe2 + '/'
-    if not os.path.isfile(prev_recipe_path + 'recipe-list.txt') or not os.path.isfile(curr_recipe_path + 'recipe-list.txt'):
-        print("recipe files do not exists. please verify that the file exists.")
-        exit(1)
-
-    import csv
-
-    prev = []
-    new = []
-
-    with open(prev_recipe_path + 'recipe-list.txt') as f:
-        prev = f.readlines()
-
-    with open(curr_recipe_path + 'recipe-list.txt') as f:
-        new = f.readlines()
-
-    updates = []
-    for pn in new:
-        if not pn in prev:
-            updates.append(pn.rstrip())
-
-    allrecipe = []
-    with open(recipe1 + '_' + recipe2 + '_new_recipe_list.txt','w') as dr:
-        with open(curr_recipe_path + 'all-recipe-list.txt') as f:
-            reader = csv.reader(f, delimiter=',')
-            for row in reader:
-                if row[0] in updates:
-                    dr.write("%s,%s,%s" % (row[0], row[3], row[5]))
-                    if len(row[9:]) > 0:
-                        dr.write(",%s" % ','.join(row[9:]))
-                    dr.write("\n")
-
-def main(argv):
-    if argv[0] == "generate_recipe_list":
-        generate_recipe_list()
-    elif argv[0] == "compare_recipe":
-        diff_for_new_recipes(argv[1], argv[2])
-    else:
-        print("no such option. choose either 'generate_recipe_list' or 'compare_recipe'")
-
-    exit(0)
-
-if __name__ == "__main__":
-    try:
-        sys.exit(main(sys.argv[1:]))
-    except Exception as e:
-        print("Exception :", e)
-        sys.exit(1)
-
diff --git a/scripts/distro/distrocompare.sh b/scripts/distro/distrocompare.sh
deleted file mode 100755
index 908760c2355..00000000000
--- a/scripts/distro/distrocompare.sh
+++ /dev/null
@@ -1,123 +0,0 @@
-#!/usr/bin/env bash
-#
-# Copyright (c) 2017, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-#
-# distrocompare.sh : provides capability to get a list of new packages
-#                    based on two distinct branches. This script takes
-#                    2 parameters; either a commit-ish or a branch name
-#
-#                    To run : distrocompare.sh <older hash> <newer hash>
-#                    E.g. distrocompare.sh morty 92aa0e7
-#                    E.g. distrocompare.sh morty pyro
-#
-
-# get input as version
-previous_version=$1
-current_version=$2
-
-# set previous and current version
-if [ -z "$2" ]; then
-    previous_version=$1
-    current_version="current"
-fi
-
-# get script location. That's where the source supposedly located as well.
-scriptdir="$( realpath $(dirname "${BASH_SOURCE[0]}" ))"
-sourcedir="$( realpath $scriptdir/../.. )"
-
-# create working directory
-workdir=$(mktemp -d)
-
-# prepare to rollback to the branch if not similar
-branch=`cd $sourcedir; git branch | grep \* | cut -d ' ' -f2`
-
-# set current workdir to store final result
-currentworkdir=`pwd`
-
-# persists the file after local repo change
-cp $scriptdir/build-recipe-list.py $workdir
-
-#==================================================================
-
-function bake_distrodata {
-    # get to source directory of the git
-    cd $sourcedir
-
-    # change the branch / commit. Do not change if input is current
-    if [ "$1" != "current" ]; then
-        output=$(git checkout $1 2>&1)
-
-        # exit if git fails
-        if [[ $output == *"error"* ]]; then
-            echo "git error : $output"
-            echo "exiting ... "
-            rm -rf $workdir
-            exit
-        fi
-    fi
-
-    # make tmp as workdir
-    cd $workdir
-
-    # source oe-init to generate a new build folder
-    source $sourcedir/oe-init-build-env $1
-
-    # if file already exists with distrodata, do not append
-    if ! grep -q "distrodata" "conf/local.conf"; then
-        # add inherit distrodata to local.conf to enable distrodata feature
-        echo 'INHERIT += "distrodata"' >> conf/local.conf
-    fi
-
-    # use from tmp
-    $workdir/build-recipe-list.py generate_recipe_list
-}
-
-bake_distrodata $previous_version
-bake_distrodata $current_version
-
-#==================================================================
-
-cd $workdir
-
-# compare the 2 generated recipe-list.txt
-$workdir/build-recipe-list.py compare_recipe $previous_version $current_version
-
-# copy final result to current working directory
-cp $workdir/*_new_recipe_list.txt $currentworkdir
-
-if [ $? -ne 0 ]; then
-    rm -rf $workdir/$previous_version
-    rm -rf $workdir/$current_version
-    rm $workdir/build-recipe-list.py
-    # preserve the result in /tmp/distrodata if fail to copy the result over
-    exit
-fi
-
-# cleanup
-rm -rf $workdir
-
-# perform rollback branch
-cd $sourcedir
-currentbranch=`git branch | grep \* | cut -d ' ' -f2`
-if [ "$currentbranch" != "$branch" ]; then
-    git checkout $branch
-fi
-
-cd $currentworkdir
-
-#==================================================================
-- 
2.19.1


