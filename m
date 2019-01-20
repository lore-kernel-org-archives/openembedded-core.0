Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 00C7B6D4E4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 12:19:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a62so8351669wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 04:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=47V7946qoMR8+Q4An2Nsd/24frcid/Be5EZhOIsPFCU=;
	b=OxqvtvBL3uNPdX86WxwvSTT5FhXyQWtVqcW1tguK5QdvrDOI1d29GWCTdLLm6f1sj+
	HYRHg8rCnZxxuOjzJXZV682ok6GI2yr5I33IHcISeyGvCuqqN2F+6YTkI5pAyo/tVkJp
	9rAGyljadCxNQYSHn+TSylkNiKEVzKU/gwwnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=47V7946qoMR8+Q4An2Nsd/24frcid/Be5EZhOIsPFCU=;
	b=j+uh9SF415kVGzteP55NQubU4KKH5RHlWkFLANv8vHagtUyachBISKNHqW+Pcuf1x4
	Mu82TiWbHjwkJxC5x3ztYK/51hOhoujf4zMhQPTlL4dIX6k3tM3zIHI98xfM3x2p1Ym/
	6mlO9sIq60UljB77BEa8aMaehNARxgefxQXRWH1OcY2rhCsKzrMvVmbaMKRz5SSBYrV1
	wdi6AA1kJ1MQ+u4PclPWPk0sFzccAGe2/BcANIWGyql30ogI87mpYwFbBxkb/acjqq0Y
	nH+s/yBcQTEb58F2iisKkaZn6EimDTqeWtr2hvh/y+xmty+ln2hSVk+DpVmDSbryQbSw
	veNg==
X-Gm-Message-State: AJcUukf5xf8bsGxOCkqEQMUloWDmb5OIpDYREECAOCl/nC0pguz0h3p+
	HtQYvmvvDiQu8qGhF8Grk/mYsZAXwKU=
X-Google-Smtp-Source: ALg8bN67G8uYlOjhRz4o7sw9Q6xsMd83qIvUDyjJOQFPnmQOQFuKaQL+OrEHo3bU6dyGp7Va0mGL6w==
X-Received: by 2002:a1c:2408:: with SMTP id k8mr20657616wmk.110.1547986792024; 
	Sun, 20 Jan 2019 04:19:52 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f10sm18351497wmb.35.2019.01.20.04.19.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jan 2019 04:19:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2019 12:19:50 +0000
Message-Id: <20190120121950.24657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] scripts/contrib/build-perf-test: Remove it
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
X-List-Received-Date: Sun, 20 Jan 2019 12:19:52 -0000
Content-Transfer-Encoding: 8bit

This is the older script which the code in lib/oeqa/buildperf replaces so
delete the obsolete script to avoid confusion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/build-perf-test.sh | 400 -----------------------------
 1 file changed, 400 deletions(-)
 delete mode 100755 scripts/contrib/build-perf-test.sh

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
deleted file mode 100755
index 9a091edb0a4..00000000000
--- a/scripts/contrib/build-perf-test.sh
+++ /dev/null
@@ -1,400 +0,0 @@
-#!/bin/bash
-#
-# This script runs a series of tests  (with and without sstate) and reports build time (and tmp/ size)
-# 
-# Build performance test script
-#
-# Copyright 2013 Intel Corporation
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
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-#
-#
-# AUTHORS:
-# Stefan Stanacar <stefanx.stanacar@intel.com>
-
-
-ME=$(basename $0)
-
-#
-# usage and setup
-#
-
-usage () {
-cat << EOT
-Usage: $ME [-h]
-       $ME [-c <commit>] [-v] [-m <val>] [-j <val>] [-t <val>] [-i <image-name>] [-d <path>]
-Options:
-        -h
-                Display this help and exit.
-        -c <commit>
-                git checkout <commit> before anything else
-        -v
-                Show bitbake output, don't redirect it to a log.
-        -m <machine>
-                Value for MACHINE. Default is qemux86.
-        -j <val>
-                Value for PARALLEL_MAKE. Default is 8. 
-        -t <val>
-                Value for BB_NUMBER_THREADS. Default is 8.
-        -i <image-name>
-                Instead of timing against core-image-sato, use <image-name>
-        -d <path>
-                Use <path> as DL_DIR
-        -p <githash>
-                Cherry pick githash onto the commit
-                
-Note: current working directory must be inside a poky git clone.
- 
-EOT
-}
-
-
-if clonedir=$(git rev-parse --show-toplevel); then
-        cd $clonedir
-else
-        echo "The current working dir doesn't seem to be a poky git clone. Please cd there before running $ME"
-        exit 1
-fi
-
-IMAGE="core-image-sato"
-verbose=0
-dldir=
-commit=
-pmake=
-cherrypicks=
-while getopts "hvc:m:j:t:i:d:p:" opt; do
-        case $opt in
-                h)      usage
-                        exit 0
-                        ;;
-                v)      verbose=1
-                        ;;
-                c)      commit=$OPTARG
-                        ;;
-                m)      export MACHINE=$OPTARG
-                        ;;
-                j)      pmake=$OPTARG
-                        ;;
-                t)      export BB_NUMBER_THREADS=$OPTARG
-                        ;;
-                i)      IMAGE=$OPTARG
-                        ;;
-                d)      dldir=$OPTARG
-                        ;;
-                p)      cherrypicks="$cherrypicks $OPTARG"
-                        ;;
-                *)      usage
-                        exit 1
-                        ;;                      
-        esac
-done
-
-
-#drop cached credentials and test for sudo access without a password
-sudo -k -n ls > /dev/null 2>&1
-reqpass=$?
-if [ $reqpass -ne 0 ]; then
-    echo "The script requires sudo access to drop caches between builds (echo 3 > /proc/sys/vm/drop_caches)"
-    read -s -p "Please enter your sudo password: " pass
-    echo
-fi
-
-if [ -n "$commit" ]; then
-            echo "git checkout -f $commit"
-            git pull > /dev/null 2>&1
-            git checkout -f $commit || exit 1
-            git pull > /dev/null 2>&1
-fi
-
-if [ -n "$cherrypicks" ]; then
-    for c in $cherrypicks; do
-        git cherry-pick $c
-    done
-fi
-
-rev=$(git rev-parse --short HEAD)  || exit 1
-OUTDIR="$clonedir/build-perf-test/results-$rev-`date "+%Y%m%d%H%M%S"`"
-BUILDDIR="$OUTDIR/build"
-resultsfile="$OUTDIR/results.log"
-cmdoutput="$OUTDIR/commands.log"
-myoutput="$OUTDIR/output.log"
-globalres="$clonedir/build-perf-test/globalres.log"
-
-mkdir -p $OUTDIR || exit 1
-                                
-log () {
-    local msg="$1"
-    echo "`date`: $msg" | tee -a $myoutput
-}
-
-
-#
-# Config stuff
-#
-
-branch=`git branch 2>&1 | grep "^* " | tr -d "* "`
-gitcommit=$(git rev-parse HEAD)  || exit 1
-log "Running on $branch:$gitcommit"
-
-source ./oe-init-build-env $OUTDIR/build >/dev/null || exit 1
-cd $OUTDIR/build
-
-[ -n "$MACHINE" ] || export MACHINE="qemux86"
-[ -n "$BB_NUMBER_THREADS" ] || export BB_NUMBER_THREADS="8"
-
-if [ -n "$pmake" ]; then
-        export PARALLEL_MAKE="-j $pmake"
-else
-        export PARALLEL_MAKE="-j 8"
-fi
-
-if [ -n "$dldir" ]; then
-    echo "DL_DIR = \"$dldir\"" >> conf/local.conf
-else
-    echo "DL_DIR = \"$clonedir/build-perf-test/downloads\"" >> conf/local.conf
-fi
-
-# Sometimes I've noticed big differences in timings for the same commit, on the same machine
-# Disabling the network sanity check helps a bit (because of my crappy network connection and/or proxy)
-echo "CONNECTIVITY_CHECK_URIS =\"\"" >> conf/local.conf
-
-
-#
-# Functions
-#
-
-declare -a TIMES
-time_count=0
-declare -a SIZES
-size_count=0
-
-time_cmd () {
-    log "   Timing: $*"
-
-    if [ $verbose -eq 0 ]; then 
-        /usr/bin/time -v -o $resultsfile "$@" >> $cmdoutput
-    else
-        /usr/bin/time -v -o $resultsfile "$@"
-    fi
-    ret=$?
-    if [ $ret -eq 0 ]; then
-        t=`grep wall $resultsfile | sed 's/.*m:ss): //'`
-        log "   TIME: $t"
-        TIMES[(( time_count++ ))]="$t"
-    else
-        log "ERROR: exit status was non-zero, will report time as 0."
-        TIMES[(( time_count++ ))]="0"
-    fi
-    
-    #time by default overwrites the output file and we  want to keep the results
-    #it has an append option but I don't want to clobber the results in the same file
-    i=`ls $OUTDIR/results.log* |wc -l`
-    mv $resultsfile "${resultsfile}.${i}"
-    log "More stats can be found in ${resultsfile}.${i}"    
-}
-
-bbtime () {
-    time_cmd bitbake "$@"
-}
-
-#we don't time bitbake here
-bbnotime () {
-    local arg="$@"
-    log "   Running: bitbake ${arg}"
-    if [ $verbose -eq 0 ]; then
-        bitbake ${arg} >> $cmdoutput
-    else
-        bitbake ${arg}
-    fi
-    ret=$?
-    if [ $ret -eq 0 ]; then
-        log "   Finished bitbake ${arg}"
-    else
-        log "ERROR: exit status was non-zero. Exit.."
-        exit $ret
-    fi
-
-}
-
-do_rmtmp() {
-    log "   Removing tmp"
-    rm -rf bitbake.lock pseudodone conf/sanity_info cache tmp
-}
-do_rmsstate () {
-    log "   Removing sstate-cache"
-    rm -rf sstate-cache
-}
-do_sync () {
-    log "   Syncing and dropping caches"
-    sync; sync
-    if [ $reqpass -eq 0 ]; then
-        sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
-    else
-        echo "$pass" | sudo -S sh -c "echo 3 > /proc/sys/vm/drop_caches"
-        echo
-    fi
-    sleep 3
-}
-
-write_results() {
-    echo -n "`uname -n`,$branch:$gitcommit,`git describe`," >> $globalres
-    for i in "${TIMES[@]}"; do
-        echo -n "$i," >> $globalres
-    done
-    for i in "${SIZES[@]}"; do
-        echo -n "$i," >> $globalres
-    done
-    echo >> $globalres
-    sed -i '$ s/,$//' $globalres
-}
-
-####
-
-#
-# Test 1
-# Measure: Wall clock of "bitbake core-image-sato" and size of tmp/dir (w/o rm_work and w/ rm_work)
-# Pre: Downloaded sources, no sstate
-# Steps:
-#     Part1:
-#        - fetchall 
-#        - clean build dir
-#        - time bitbake core-image-sato
-#        - collect data
-#     Part2:
-#        - bitbake virtual/kernel -c cleansstate
-#        - time bitbake virtual/kernel
-#     Part3:
-#        - add INHERIT to local.conf
-#        - clean build dir
-#        - build
-#        - report size, remove INHERIT
-
-test1_p1 () {
-    log "Running Test 1, part 1/3: Measure wall clock of bitbake $IMAGE and size of tmp/ dir"
-    bbnotime $IMAGE --runall=fetch
-    do_rmtmp
-    do_rmsstate
-    do_sync
-    bbtime $IMAGE
-    s=`du -s tmp | sed 's/tmp//' | sed 's/[ \t]*$//'`
-    SIZES[(( size_count++ ))]="$s"
-    log "SIZE of tmp dir is: $s"
-    log "Buildstats are saved in $OUTDIR/buildstats-test1"
-    mv tmp/buildstats $OUTDIR/buildstats-test1
-}
-
-
-test1_p2 () {
-    log "Running Test 1, part 2/3: bitbake virtual/kernel -c cleansstate and time bitbake virtual/kernel"
-    bbnotime virtual/kernel -c cleansstate
-    do_sync
-    bbtime virtual/kernel
-}
-
-test1_p3 () {
-    log "Running Test 1, part 3/3: Build $IMAGE w/o sstate and report size of tmp/dir with rm_work enabled"
-    echo "INHERIT += \"rm_work\"" >> conf/local.conf
-    do_rmtmp
-    do_rmsstate
-    do_sync
-    bbtime $IMAGE
-    sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
-    s=`du -s tmp | sed 's/tmp//' | sed 's/[ \t]*$//'`
-    SIZES[(( size_count++ ))]="$s"
-    log "SIZE of tmp dir is: $s"
-    log "Buildstats are saved in $OUTDIR/buildstats-test13"
-    mv tmp/buildstats $OUTDIR/buildstats-test13
-}
-
-
-#
-# Test 2
-# Measure: Wall clock of "bitbake core-image-sato" and size of tmp/dir
-# Pre: populated sstate cache
-
-test2 () {
-    # Assuming test 1 has run
-    log "Running Test 2: Measure wall clock of bitbake $IMAGE -c rootfs with sstate"
-    do_rmtmp
-    do_sync
-    bbtime $IMAGE -c rootfs
-}
-
-
-# Test 3
-# parsing time metrics
-#
-#  Start with
-#   i) "rm -rf tmp/cache; time bitbake -p"
-#  ii) "rm -rf tmp/cache/default-glibc/; time bitbake -p"
-# iii) "time bitbake -p"
-
-
-test3 () {
-    log "Running Test 3: Parsing time metrics (bitbake -p)"
-    log "   Removing tmp/cache && cache"
-    rm -rf tmp/cache cache
-    bbtime -p
-    log "   Removing tmp/cache/default-glibc/"
-    rm -rf tmp/cache/default-glibc/
-    bbtime -p
-    bbtime -p
-}
-
-#
-# Test 4 - eSDK
-# Measure: eSDK size and installation time
-test4 () {
-    log "Running Test 4: eSDK size and installation time"
-    bbnotime $IMAGE -c do_populate_sdk_ext
-
-    esdk_installer=(tmp/deploy/sdk/*-toolchain-ext-*.sh)
-
-    if [ ${#esdk_installer[*]} -eq 1 ]; then
-        s=$((`stat -c %s "$esdk_installer"` / 1024))
-        SIZES[(( size_count++ ))]="$s"
-        log "Download SIZE of eSDK is: $s kB"
-
-        do_sync
-        time_cmd "$esdk_installer" -y -d "tmp/esdk-deploy"
-
-        s=$((`du -sb "tmp/esdk-deploy" | cut -f1` / 1024))
-        SIZES[(( size_count++ ))]="$s"
-        log "Install SIZE of eSDK is: $s kB"
-    else
-        log "ERROR: other than one sdk found (${esdk_installer[*]}), reporting size and time as 0."
-        SIZES[(( size_count++ ))]="0"
-        TIMES[(( time_count++ ))]="0"
-    fi
-
-}
-
-
-# RUN!
-
-test1_p1
-test1_p2
-test1_p3
-test2
-test3
-test4
-
-# if we got til here write to global results
-write_results
-
-log "All done, cleaning up..."
-
-do_rmtmp
-do_rmsstate
-- 
2.19.1


