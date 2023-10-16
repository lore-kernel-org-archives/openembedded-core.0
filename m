Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEDDCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:45:12 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.177903.1697485503918075404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 12:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NihveTAK;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-419b232fc99so22988671cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697485503; x=1698090303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6G3wHUWECx7oQ7pOtZta9h+eZdSoJ2MLLWJ3dJ4QbJs=;
        b=NihveTAKeqZAXwhLxrUmXZub3YopN5g8PLn45s/cz1tVHIkL58dBdL8cErjvz7vDKS
         W1gfyv1V8RCbaMKB5XxJKeWqNF3NPQ64GsDr66YBaLHtvKNIC6WoOQPcl2rZ6zNJ6cQ2
         7IzfmBTvKXczVp5MyqFkBvPvbYe2EIKxsW8l8dS7FW92RUP1/EXK8NCXySypeXyLbAfl
         xnSv363G2lhqvja73Qc731rIn5qMtU1vkFnMewUxkOFFvbcgeP3cFUbMLswmycNU8Ksc
         U4xUhuOvt0Rg85m4oPAA1vqwgouujGEZZ84bgb0wfrzOrGVjfcZSVaBG7vUpV9wo3xQQ
         rw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485503; x=1698090303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6G3wHUWECx7oQ7pOtZta9h+eZdSoJ2MLLWJ3dJ4QbJs=;
        b=QpxP0ha/1ogt7etFjLPkeRr5VHfSbanotzMEGlpnAEFJstt6XDJf0p0dS1hbycErwZ
         F/zLh+o/VSv1f2OqK9fqGmgjZ8fUv+ZoAwxeY2Z7c9HtqBuZh/5sDuLvCfM1qG3RjZ/2
         u59LcUN/mZVFRLD2hSx3UQ/Vrdg1rqbXJ4iqgOWSyFBlUFEZvzvCLx5NL50WqFA2zHwt
         hhQWtef8oIZdEuhN7IfjDvGrRYvfirwI3nE2uHDVLqmac0Sjt/K5KUTZsPccTdzDq4fi
         /JDgpJhvB143OjNbJzLbc6B9HeoEdqLJU78UJLHkqOokebdwNElsDHdmcpLiVuU4Yhb0
         RZZw==
X-Gm-Message-State: AOJu0Yz0P+zVN2/jnwXwX4fDsDxTC/4q+X9ZXB7rGmKQx5zNlUzZP5MA
	j5K3mIvPu+DuAd1iK8BmXMYKqrtNgownGmh82Fdfvg==
X-Google-Smtp-Source: AGHT+IF3QWBmrj9iARI6S4nKgvxzcuEvk5Tzjc19cEsHmqXuGy7FqJltP3mSZxloampXptPS7idU1A==
X-Received: by 2002:ac8:5c4c:0:b0:417:c16a:c2c9 with SMTP id j12-20020ac85c4c000000b00417c16ac2c9mr287911qtj.62.1697485502128;
        Mon, 16 Oct 2023 12:45:02 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b004033c3948f9sm6733qtp.42.2023.10.16.12.45.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:45:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] patchtest: add scripts to oe-core
Date: Mon, 16 Oct 2023 15:44:57 -0400
Message-ID: <20231016194458.2243201-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016194458.2243201-1-tgamblin@baylibre.com>
References: <20231016194458.2243201-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 19:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189313

Add the following from the patchtest repo:

- patchtest: core patch testing tool
- patchtest-get-branch: determine the target branch of a patch
- patchtest-get-series: pull patch series from Patchwork
- patchtest-send-results: send test results to selected mailing list
- patchtest-setup-sharedir: create sharedir for use with patchtest guest
  mode
- patchtest.README: instructions for using patchtest based on the README
  in the original repository

Note that the patchtest script was modified slightly from the repo
version to retain compatibility with the oe-core changes.
patchtest-send-results and patchtest-setup-sharedir are also primarily
intended for automated testing in guest mode, but are added for
consistency.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest                | 233 +++++++++++++++++++++++++++++++
 scripts/patchtest-get-branch     |  92 ++++++++++++
 scripts/patchtest-get-series     | 125 +++++++++++++++++
 scripts/patchtest-send-results   |  93 ++++++++++++
 scripts/patchtest-setup-sharedir |  95 +++++++++++++
 scripts/patchtest.README         | 152 ++++++++++++++++++++
 6 files changed, 790 insertions(+)
 create mode 100755 scripts/patchtest
 create mode 100755 scripts/patchtest-get-branch
 create mode 100755 scripts/patchtest-get-series
 create mode 100755 scripts/patchtest-send-results
 create mode 100755 scripts/patchtest-setup-sharedir
 create mode 100644 scripts/patchtest.README

diff --git a/scripts/patchtest b/scripts/patchtest
new file mode 100755
index 00000000000..9525a2be17d
--- /dev/null
+++ b/scripts/patchtest
@@ -0,0 +1,233 @@
+#!/usr/bin/env python3
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# patchtest: execute all unittest test cases discovered for a single patch
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Author: Leo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+#
+
+import sys
+import os
+import unittest
+import fileinput
+import logging
+import traceback
+import json
+
+# Include current path so test cases can see it
+sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
+
+# Include patchtest library
+sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), '../meta/lib/patchtest'))
+
+from data import PatchTestInput
+from repo import PatchTestRepo
+
+import utils
+logger = utils.logger_create('patchtest')
+info = logger.info
+error = logger.error
+
+import repo
+
+def getResult(patch, mergepatch, logfile=None):
+
+    class PatchTestResult(unittest.TextTestResult):
+        """ Patchtest TextTestResult """
+        shouldStop  = True
+        longMessage = False
+
+        success     = 'PASS'
+        fail        = 'FAIL'
+        skip        = 'SKIP'
+
+        def startTestRun(self):
+            # let's create the repo already, it can be used later on
+            repoargs = {
+                'repodir': PatchTestInput.repodir,
+                'commit' : PatchTestInput.basecommit,
+                'branch' : PatchTestInput.basebranch,
+                'patch'  : patch,
+            }
+
+            self.repo_error    = False
+            self.test_error    = False
+            self.test_failure  = False
+
+            try:
+                self.repo = PatchTestInput.repo = PatchTestRepo(**repoargs)
+            except:
+                logger.error(traceback.print_exc())
+                self.repo_error = True
+                self.stop()
+                return
+
+            if mergepatch:
+                self.repo.merge()
+
+        def addError(self, test, err):
+            self.test_error = True
+            (ty, va, trace) = err
+            logger.error(traceback.print_exc())
+
+        def addFailure(self, test, err):
+            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
+            "Signed-off-by").replace("upstream status",
+            "Upstream-Status").replace("non auh",
+            "non-AUH").replace("presence format", "presence")
+            self.test_failure = True
+            fail_str = '{}: {}: {} ({})'.format(self.fail,
+            test_description, json.loads(str(err[1]))["issue"],
+            test.id())
+            print(fail_str)
+            if logfile:
+                with open(logfile, "a") as f:
+                    f.write(fail_str + "\n")
+
+        def addSuccess(self, test):
+            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
+            "Signed-off-by").replace("upstream status",
+            "Upstream-Status").replace("non auh",
+            "non-AUH").replace("presence format", "presence")
+            success_str = '{}: {} ({})'.format(self.success,
+            test_description, test.id())
+            print(success_str)
+            if logfile:
+                with open(logfile, "a") as f:
+                    f.write(success_str + "\n")
+
+        def addSkip(self, test, reason):
+            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
+            "Signed-off-by").replace("upstream status",
+            "Upstream-Status").replace("non auh",
+            "non-AUH").replace("presence format", "presence")
+            skip_str = '{}: {}: {} ({})'.format(self.skip,
+            test_description, json.loads(str(reason))["issue"],
+            test.id())
+            print(skip_str)
+            if logfile:
+                with open(logfile, "a") as f:
+                    f.write(skip_str + "\n")
+
+        def stopTestRun(self):
+
+            # in case there was an error on repo object creation, just return
+            if self.repo_error:
+                return
+
+            self.repo.clean()
+
+    return PatchTestResult
+
+def _runner(resultklass, prefix=None):
+    # load test with the corresponding prefix
+    loader = unittest.TestLoader()
+    if prefix:
+        loader.testMethodPrefix = prefix
+
+    # create the suite with discovered tests and the corresponding runner
+    suite = loader.discover(start_dir=PatchTestInput.startdir, pattern=PatchTestInput.pattern, top_level_dir=PatchTestInput.topdir)
+    ntc = suite.countTestCases()
+
+    # if there are no test cases, just quit
+    if not ntc:
+        return 2
+    runner = unittest.TextTestRunner(resultclass=resultklass, verbosity=0)
+
+    try:
+        result = runner.run(suite)
+    except:
+        logger.error(traceback.print_exc())
+        logger.error('patchtest: something went wrong')
+        return 1
+
+    return 0
+
+def run(patch, logfile=None):
+    """ Load, setup and run pre and post-merge tests """
+    # Get the result class and install the control-c handler
+    unittest.installHandler()
+
+    # run pre-merge tests, meaning those methods with 'pretest' as prefix
+    premerge_resultklass = getResult(patch, False, logfile)
+    premerge_result = _runner(premerge_resultklass, 'pretest')
+
+    # run post-merge tests, meaning those methods with 'test' as prefix
+    postmerge_resultklass = getResult(patch, True, logfile)
+    postmerge_result = _runner(postmerge_resultklass, 'test')
+
+    if premerge_result == 2 and postmerge_result == 2:
+        logger.error('patchtest: any test cases found - did you specify the correct suite directory?')
+
+    return premerge_result or postmerge_result
+
+def main():
+    tmp_patch = False
+    patch_path = PatchTestInput.patch_path
+    log_results = PatchTestInput.log_results
+    log_path = None
+    patch_list = None
+
+    if os.path.isdir(patch_path):
+        patch_list = [os.path.join(patch_path, filename) for filename in os.listdir(patch_path)]
+    else:
+        patch_list = [patch_path]
+
+    for patch in patch_list:
+        if os.path.getsize(patch) == 0:
+            logger.error('patchtest: patch is empty')
+            return 1
+
+        logger.info('Testing patch %s' % patch)
+
+        if log_results:
+            log_path = patch + ".testresult"
+            with open(log_path, "a") as f:
+                f.write("Patchtest results for patch '%s':\n\n" % patch)
+
+        try:
+            if log_path:
+                run(patch, log_path)
+            else:
+                run(patch)
+        finally:
+            if tmp_patch:
+                os.remove(patch)
+
+if __name__ == '__main__':
+    ret = 1
+
+    # Parse the command line arguments and store it on the PatchTestInput namespace
+    PatchTestInput.set_namespace()
+
+    # set debugging level
+    if PatchTestInput.debug:
+        logger.setLevel(logging.DEBUG)
+
+    # if topdir not define, default it to startdir
+    if not PatchTestInput.topdir:
+        PatchTestInput.topdir = PatchTestInput.startdir
+
+    try:
+        ret = main()
+    except Exception:
+        import traceback
+        traceback.print_exc(5)
+
+    sys.exit(ret)
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
new file mode 100755
index 00000000000..9415de98efb
--- /dev/null
+++ b/scripts/patchtest-get-branch
@@ -0,0 +1,92 @@
+#!/usr/bin/env python3
+
+# Get target branch from the corresponding mbox
+#
+# NOTE: this script was based on patches coming to the openembedded-core
+# where target branch is defined inside brackets as subject prefix
+# i.e. [master], [rocko], etc.
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import mailbox
+import argparse
+import re
+import git
+import sys
+
+re_prefix = re.compile("(\[.*\])", re.DOTALL)
+
+def get_branch(filepath_repo, filepath_mbox, default_branch):
+    branch = None
+
+    # get all remotes branches
+    gitbranches = git.Git(filepath_repo).branch('-a').splitlines()
+
+    # from gitbranches, just get the names
+    branches = [b.split('/')[-1] for b in gitbranches]
+
+    subject = ' '.join(mailbox.mbox(filepath_mbox)[0]['subject'].splitlines())
+
+    # we expect that patches will have somewhere between one and three
+    # consecutive sets of square brackets with tokens inside, e.g.:
+    # 1. [PATCH]
+    # 2. [OE-core][PATCH]
+    # 3. [OE-core][kirkstone][PATCH]
+    # Some of them may also be part of a series, in which case the PATCH
+    # token will be formatted like:
+    # [PATCH 1/4]
+    # or they will be revisions to previous patches, where it will be:
+    # [PATCH v2]
+    # Or they may contain both:
+    # [PATCH v2 3/4]
+    # In any case, we want mprefix to contain all of these tokens so
+    # that we can search for branch names within them. 
+    mprefix = re.findall(r'\[.*?\]', subject)
+    found_branch = None
+    if mprefix:
+        # Iterate over the tokens and compare against the branch list to
+        # figure out which one the patch is targeting
+        for token in mprefix:
+             stripped = token.lower().strip('[]')
+             if default_branch in stripped:
+                 found_branch = default_branch
+                 break
+             else:
+                 for branch in branches:
+                     # ignore branches named "core"
+                     if branch != "core" and stripped.rfind(branch) != -1:
+                         found_branch = token.split(' ')[0].strip('[]')
+                         break
+
+    # if there's no mprefix content or no known branches were found in
+    # the tokens, assume the target is master
+    if found_branch is None:
+        found_branch = "master"
+
+    return (subject, found_branch)
+
+if __name__ == '__main__':
+
+    parser = argparse.ArgumentParser()
+    parser.add_argument('repo', metavar='REPO', help='Main repository')
+    parser.add_argument('mbox', metavar='MBOX', help='mbox filename')
+    parser.add_argument('--default-branch', metavar='DEFAULT_BRANCH', default='master', help='Use this branch if no one is found')
+    parser.add_argument('--separator', '-s', metavar='SEPARATOR', default=' ', help='Char separator for output data')
+    args = parser.parse_args()
+
+    subject, branch = get_branch(args.repo, args.mbox, args.default_branch)
+    print("branch: %s" % branch)
+
diff --git a/scripts/patchtest-get-series b/scripts/patchtest-get-series
new file mode 100755
index 00000000000..773701f80b5
--- /dev/null
+++ b/scripts/patchtest-get-series
@@ -0,0 +1,125 @@
+#!/bin/bash -e
+#
+# get-latest-series: Download latest patch series from Patchwork
+#
+# Copyright (C) 2023 BayLibre Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+# the interval into the past which we want to check for new series, in minutes
+INTERVAL_MINUTES=30
+
+# Maximum number of series to retrieve. the Patchwork API can support up to 250
+# at once
+SERIES_LIMIT=250
+
+# Location to save patches
+DOWNLOAD_PATH="."
+
+# Name of the file to use/check as a log of previously-tested series IDs
+SERIES_TEST_LOG=".series_test.log"
+
+# Patchwork project to pull series patches from
+PROJECT="oe-core"
+
+# The Patchwork server to pull from
+SERVER="https://patchwork.yoctoproject.org/api/1.2/"
+
+help()
+{
+    echo "Usage: get-latest-series [ -i | --interval MINUTES ]
+        [ -d | --directory DIRECTORY ]
+        [ -l | --limit COUNT ]
+        [ -h | --help ]
+        [ -t | --tested-series LOGFILE]
+        [ -p | --project PROJECT ]
+        [ -s | --server SERVER ]"
+    exit 2
+}
+
+while [ "$1" != "" ]; do
+    case $1 in
+        -i|--interval)
+        INTERVAL_MINUTES=$2
+        shift 2
+        ;;
+    -l|--limit)
+        SERIES_LIMIT=$2
+        shift 2
+        ;;
+    -d|--directory)
+        DOWNLOAD_PATH=$2
+        shift 2
+        ;;
+    -p|--project)
+        PROJECT=$2
+        shift 2
+        ;;
+    -s|--server)
+        SERVER=$2
+        shift 2
+        ;;
+    -t|--tested-series)
+        SERIES_TEST_LOG=$2
+        shift 2
+        ;;
+    -h|--help)
+            help
+        ;;
+    *)
+        echo "Unknown option $1"
+        help
+        ;;
+    esac
+done
+
+# The time this script is running at
+START_TIME=$(date --date "now" +"%Y-%m-%dT%H:%M:%S")
+
+# the corresponding timestamp we want to check against for new patch series
+SERIES_CHECK_LIMIT=$(date --date "now - ${INTERVAL_MINUTES} minutes" +"%Y-%m-%dT%H:%M:%S")
+
+echo "Start time is $START_TIME"
+echo "Series check limit is $SERIES_CHECK_LIMIT"
+
+# Create DOWNLOAD_PATH if it doesn't exist
+if [ ! -d "$DOWNLOAD_PATH" ]; then
+    mkdir "${DOWNLOAD_PATH}"
+fi
+
+# Create SERIES_TEST_LOG if it doesn't exist
+if [ ! -f "$SERIES_TEST_LOG" ]; then
+    touch "${SERIES_TEST_LOG}"
+fi
+
+# Retrieve a list of series IDs from the 'git-pw series list' output. The API
+# supports a maximum of 250 results, so make sure we allow that when required
+SERIES_LIST=$(git-pw --project "${PROJECT}" --server "${SERVER}" series list --since "${SERIES_CHECK_LIMIT}" --limit "${SERIES_LIMIT}" | awk '{print $2}' | xargs | sed -e 's/[^0-9 ]//g')
+
+if [ -z "$SERIES_LIST" ]; then
+    echo "No new series for project ${PROJECT} since ${SERIES_CHECK_LIMIT}"
+    exit 0
+fi
+
+# Check each series ID
+for SERIES in $SERIES_LIST; do
+    # Download the series only if it's not found in the SERIES_TEST_LOG
+    if ! grep -w --quiet "${SERIES}" "${SERIES_TEST_LOG}"; then
+        echo "Downloading $SERIES..."
+        git-pw series download --separate "${SERIES}" "${DOWNLOAD_PATH}"
+        echo "${SERIES}" >> "${SERIES_TEST_LOG}"
+    else
+        echo "Already tested ${SERIES}. Skipping..."
+    fi
+done
diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
new file mode 100755
index 00000000000..2a2c57a10e0
--- /dev/null
+++ b/scripts/patchtest-send-results
@@ -0,0 +1,93 @@
+#!/usr/bin/env python3
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# patchtest: execute all unittest test cases discovered for a single patch
+# Note that this script is currently under development and has been
+# hard-coded with default values for testing purposes. This script
+# should not be used without changing the default recipient, at minimum.
+#
+# Copyright (C) 2023 BayLibre Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Author: Trevor Gamblin <tgamblin@baylibre.com>
+#
+
+import argparse
+import boto3
+import configparser
+import mailbox
+import os
+import sys
+
+greeting = """Thank you for your submission. Patchtest identified one
+or more issues with the patch. Please see the log below for
+more information:\n\n---\n"""
+
+suggestions = """\n---\n\nPlease address the issues identified and
+submit a new revision of the patch, or alternatively, reply to this
+email with an explanation of why the patch format should be accepted.
+Note that patchtest may report failures in the merge-on-head test for
+patches that are part of a series if they rely on changes from
+preceeding entries.
+
+If you believe these results are due to an error in patchtest, please
+submit a bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
+category under 'Yocto Project Subprojects'). Thank you!"""
+
+parser = argparse.ArgumentParser(description="Send patchtest results to a submitter for a given patch")
+parser.add_argument("-p", "--patch", dest="patch", required=True, help="The patch file to summarize")
+args = parser.parse_args()
+
+if not os.path.exists(args.patch):
+    print(f"Patch '{args.patch}' not found - did you provide the right path?")
+    sys.exit(1)
+elif not os.path.exists(args.patch + ".testresult"):
+    print(f"Found patch '{args.patch}' but '{args.patch}.testresult' was not present. Have you run patchtest on the patch?")
+    sys.exit(1)
+
+result_file = args.patch + ".testresult"
+result_basename = os.path.basename(args.patch)
+testresult = None
+
+with open(result_file, "r") as f:
+    testresult = f.read()
+
+reply_contents = greeting + testresult + suggestions
+subject_line = f"Patchtest results for {result_basename}"
+
+if "FAIL" in testresult:
+    ses_client = boto3.client('ses', region_name='us-west-2')
+    response = ses_client.send_email(
+        Source='patchtest@automation.yoctoproject.org',
+        Destination={
+            'ToAddresses': ['test-list@lists.yoctoproject.org'],
+        },
+        ReplyToAddresses=['test-list@lists.yoctoproject.org'],
+        Message={
+            'Subject': {
+                'Data': subject_line,
+                'Charset': 'utf-8'
+            },
+            'Body': {
+                'Text': {
+                    'Data': reply_contents,
+                    'Charset': 'utf-8'
+                }
+            }
+        }
+    )
+else:
+    print(f"No failures identified for {args.patch}.")
diff --git a/scripts/patchtest-setup-sharedir b/scripts/patchtest-setup-sharedir
new file mode 100755
index 00000000000..a1497987cb1
--- /dev/null
+++ b/scripts/patchtest-setup-sharedir
@@ -0,0 +1,95 @@
+#!/bin/bash -e
+#
+# patchtest-setup-sharedir: Setup a directory for storing mboxes and
+# repositories to be shared with the guest machine, including updates to
+# the repos if the directory already exists
+#
+# Copyright (C) 2023 BayLibre Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Author: Trevor Gamblin <tgamblin@baylibre.com>
+
+# poky repository
+POKY_REPO="https://git.yoctoproject.org/poky"
+
+# patchtest repository
+PATCHTEST_REPO="https://git.yoctoproject.org/patchtest"
+
+# the name of the directory
+SHAREDIR="patchtest_share"
+
+help()
+{
+    echo "Usage: patchtest-setup-sharedir [ -d | --directory SHAREDIR ]
+        [ -p | --patchtest PATCHTEST_REPO ]
+        [ -y | --poky POKY_REPO ]"
+    exit 2
+}
+
+while [ "$1" != "" ]; do
+    case $1 in
+    -d|--directory)
+        SHAREDIR=$2
+        shift 2
+        ;;
+    -p|--patchtest)
+        PATCHTEST_REPO=$2
+        shift 2
+        ;;
+    -y|--poky)
+        POKY_REPO=$2
+        shift 2
+        ;;
+    -h|--help)
+        help
+        ;;
+    *)
+        echo "Unknown option $1"
+        help
+        ;;
+    esac
+done
+
+# define MBOX_DIR where the patch series will be stored by
+# get-latest-series
+MBOX_DIR="${SHAREDIR}/mboxes"
+
+# Create SHAREDIR if it doesn't exist
+if [ ! -d "$SHAREDIR" ]; then
+    mkdir -p "${SHAREDIR}"
+    echo "Created ${SHAREDIR}"
+fi
+
+# Create the mboxes directory if it doesn't exist
+if [ ! -d "$MBOX_DIR" ]; then
+    mkdir -p "${MBOX_DIR}"
+    echo "Created ${MBOX_DIR}"
+fi
+
+# clone poky if it's not already present; otherwise, update it
+if [ ! -d "$POKY_REPO" ]; then
+    BASENAME=$(basename ${POKY_REPO})
+    git clone "${POKY_REPO}" "${SHAREDIR}/${BASENAME}"
+else
+    (cd "${SHAREDIR}/$BASENAME" && git pull)
+fi
+
+# clone patchtest if it's not already present; otherwise, update it
+if [ ! -d "$PATCHTEST_REPO" ]; then
+    BASENAME=$(basename ${PATCHTEST_REPO})
+    git clone "${PATCHTEST_REPO}" "${SHAREDIR}/${BASENAME}"
+else
+    (cd "${SHAREDIR}/$BASENAME" && git pull)
+fi
diff --git a/scripts/patchtest.README b/scripts/patchtest.README
new file mode 100644
index 00000000000..689d513df51
--- /dev/null
+++ b/scripts/patchtest.README
@@ -0,0 +1,152 @@
+# Patchtest
+
+## Introduction
+
+Patchtest is a test framework for community patches based on the standard
+unittest python module. As input, it needs tree elements to work properly:
+a patch in mbox format (either created with `git format-patch` or fetched
+from 'patchwork'), a test suite and a target repository.
+
+The first test suite intended to be used with patchtest is found in the
+openembedded-core repository [1] targeted for patches that get into the
+openembedded-core mailing list [2]. This suite is also intended as a
+baseline for development of similar suites for other layers as needed.
+
+Patchtest can either run on a host or a guest machine, depending on which
+environment the execution needs to be done. If you plan to test your own patches
+(a good practice before these are sent to the mailing list), the easiest way is
+to install and execute on your local host; in the other hand, if automatic
+testing is intended, the guest method is strongly recommended. The guest
+method requires the use of the patchtest layer, in addition to the tools
+available in oe-core: https://git.yoctoproject.org/patchtest/
+
+## Installation
+
+As a tool for use with the Yocto Project, the [quick start guide](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) 
+contains the necessary prerequisites for a basic project. In addition,
+patchtest relies on the following Python modules:
+
+- boto3 (for sending automated results emails only)
+- git-pw>=2.5.0
+- jinja2
+- pylint
+- pyparsing>=3.0.9
+- unidiff
+
+These can be installed by running `pip install -r
+meta/lib/patchtest/requirements.txt`. Note that git-pw is not
+automatically added to the user's PATH; by default, it is installed at
+~/.local/bin/git-pw.
+
+For git-pw (and therefore scripts such as patchtest-get--series) to work, you need
+to provide a Patchwork instance in your user's .gitconfig, like so (the project
+can be specified using the --project argument):
+
+    git config --global pw.server "https://patchwork.yoctoproject.org/api/1.2/"
+
+To work with patchtest, you should have the following repositories cloned:
+
+1. https://git.openembedded.org/openembedded-core/ (or https://git.yoctoproject.org/poky/)
+2. https://git.openembedded.org/bitbake/ (if not using poky)
+3. https://git.yoctoproject.org/patchtest (if using guest mode)
+
+## Usage
+
+### Obtaining Patches
+
+Patch files can be obtained directly from cloned repositories using `git
+format-patch -N` (where N is the number of patches starting from HEAD to
+generate). git-pw can also be used with filters for users, patch/series IDs,
+and timeboxes if specific patches are desired. For more information, see the
+git-pw [documentation](https://patchwork.readthedocs.io/projects/git-pw/en/latest/).
+
+Alternatively, `scripts/patchtest-get-series` can be used to pull mbox files from
+the Patchwork instance configured previously in .gitconfig. It uses a log file
+called ".series_test.log" to store and compare series IDs so that the same
+versions of a patch are not tested multiple times unintentionally. By default,
+it will pull up to five patch series from the last 30 minutes using oe-core as
+the target project, but these parameters can be configured using the `--limit`,
+`--interval`, and `--project` arguments respectively. For more information, run
+`patchtest-get-series -h`.
+
+### Host Mode
+
+To run patchtest on the host, do the following:
+
+1. In openembedded-core/poky, do `source oe-init-build-env`
+2. Generate patch files from the target repository by doing `git-format patch -N`,
+   where N is the number of patches starting at HEAD, or by using git-pw
+   or patchtest-get-series
+3. Run patchtest on a patch file by doing the following:
+
+        patchtest --patch /path/to/patch/file /path/to/target/repo /path/to/tests/directory 
+
+    or, if you have stored the patch files in a directory, do:
+
+        patchtest --directory /path/to/patch/directory /path/to/target/repo /path/to/tests/directory 
+
+    For example, to test `master-gcc-Fix--fstack-protector-issue-on-aarch64.patch` against the oe-core test suite:
+        
+        patchtest --patch master-gcc-Fix--fstack-protector-issue-on-aarch64.patch /path/to/openembedded-core /path/to/openembedded-core/meta/lib/patchtest/tests 
+
+### Guest Mode
+
+Patchtest's guest mode has been refactored to more closely mirror the
+typical Yocto Project image build workflow, but there are still some key
+differences to keep in mind. The primary objective is to provide a level
+of isolation from the host when testing patches pulled automatically
+from the mailing lists. When executed this way, the test process is
+essentially running random code from the internet and could be
+catastrophic if malicious bits or even poorly-handled edge cases aren't
+protected against. In order to use this mode, the
+https://git.yoctoproject.org/patchtest/ repository must be cloned and
+the meta-patchtest layer added to bblayers.conf.
+
+The general flow of guest mode is:
+
+1. Run patchtest-setup-sharedir --directory <dirname> to create a
+   directory for mounting
+2. Collect patches via patchtest-get-series (or other manual step) into the
+   <dirname>/mboxes path
+3. Ensure that a user with ID 1200 has appropriate read/write
+   permissions to <dirname> and <dirname>/mboxes, so that the
+   "patchtest" user in the core-image-patchtest image can function
+4. Build the core-image-patchtest image
+5. Run the core-image-patchtest image with the mounted sharedir, like
+   so:
+   `runqemu kvm nographic qemuparams="-snapshot -fsdev
+   local,id=test_mount,path=/workspace/yocto/poky/build/patchtestdir,security_model=mapped
+   -device virtio-9p-pci,fsdev=test_mount,mount_tag=test_mount -smp 4 -m
+   2048"`
+
+Patchtest runs as an initscript for the core-image-patchtest image and
+shuts down after completion, so there is no input required from a user
+during operation. Unlike in host mode, the guest is designed to
+automatically generate test result files, in the same directory as the
+targeted patch files but with .testresult as an extension. These contain
+the entire output of the patchtest run for each respective pass,
+including the PASS, FAIL, and SKIP indicators for each test run.
+
+## Contributing
+
+The yocto mailing list (yocto@lists.yoctoproject.org) is used for questions,
+comments and patch review.  It is subscriber only, so please register before
+posting.
+
+Send pull requests to yocto@lists.yoctoproject.org with '[patchtest]' in the
+subject.
+
+When sending single patches, please use something like:
+
+    git send-email -M -1 --to=yocto@lists.yoctoproject.org  --subject-prefix=patchtest][PATCH
+
+## Maintenance
+-----------
+
+Maintainers:
+    Trevor Gamblin <tgamblin@baylibre.com>
+
+## Links
+-----
+[1] https://git.openembedded.org/openembedded-core/
+[2] https://www.yoctoproject.org/community/mailing-lists/
-- 
2.41.0


