Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89031C7EE30
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.22898.1677257157158790165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k7GDG95+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7223410000E;
	Fri, 24 Feb 2023 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TezxmH1GgEU1xPlN5nCiDf3Flcs8r8bBSfLbH/KfJsg=;
	b=k7GDG95+9cuSJDlTS+QyuReM3YYMvSgfVaewBojoBRnWOHQ9muzIdHxUbDuAns4RhPK4IW
	evaggdtbMVRA3/d/SBzHovOZ7q9eBTHHWZoLTU3qzIJEDfFVgGsnxca6gKFBuynr7u81EJ
	sogTy7zb2Ta/1iTCf8VBNBczbAj3cVEWYF5kHP2LJ6hNAz5E0C9BoJQnA4ZXHOA166wGpH
	xaXckB00bHG31ZYlIesAA1XQV4szfWRKPwdFKvhnWzWZ8T42umxXSrn0AfoCB2XWATLgnd
	IGqZdzf0WMXVjV4dAqhtzw4TQAAh1+/Ul9BAjSAoJoOfsne2h9aEyNfHer6fSw==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 5/6] scripts: add new helper for regression report generation
Date: Fri, 24 Feb 2023 17:45:54 +0100
Message-Id: <20230224164555.67634-6-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224164555.67634-1-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177703

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add yocto-testresults-query script. This is a thin wrapper over resulttool which
is able to translate tags or branch name to specific revisions, and then to work
with those "guessed" revisions with resulttool

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/yocto_testresults_query.py | 106 +++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100755 scripts/yocto_testresults_query.py

diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
new file mode 100755
index 00000000000..fee3855c6d8
--- /dev/null
+++ b/scripts/yocto_testresults_query.py
@@ -0,0 +1,106 @@
+#!/usr/bin/env python3
+
+# Yocto Project test results management tool
+# This script is an thin layer over resulttool to manage tes results and regression reports.
+# Its main feature is to translate tags or branch names to revisions SHA1, and then to run resulttool
+# with those computed revisions
+#
+# Copyright (C) 2023 OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import sys
+import os
+import argparse
+import subprocess
+import tempfile
+import lib.scriptutils as scriptutils
+
+script_path = os.path.dirname(os.path.realpath(__file__))
+poky_path = os.path.abspath(os.path.join(script_path, ".."))
+resulttool = os.path.abspath(os.path.join(script_path, "resulttool"))
+logger = scriptutils.logger_create(sys.argv[0])
+testresults_default_url="git://git.yoctoproject.org/yocto-testresults"
+
+def create_workdir():
+    workdir = tempfile.mkdtemp(prefix='yocto-testresults-query.')
+    logger.info(f"Shallow-cloning testresults in {workdir}")
+    subprocess.check_call(["git", "clone", testresults_default_url, workdir, "--depth", "1"])
+    return workdir
+
+def get_sha1(pokydir, revision):
+    rev = subprocess.check_output(["git", "rev-list", "-n", "1", revision], cwd=pokydir).decode('utf-8').strip()
+    logger.info(f"SHA-1 revision for {revision} in {pokydir} is {rev}")
+    return rev
+
+def fetch_testresults(workdir, sha1):
+    logger.info(f"Fetching test results for {sha1} in {workdir}")
+    rawtags = subprocess.check_output(["git", "ls-remote", "--refs", "--tags", "origin", f"*{sha1}*"], cwd=workdir).decode('utf-8').strip()
+    if not rawtags:
+        raise Exception(f"No reference found for commit {sha1} in {workdir}")
+    for rev in [rawtag.split()[1] for rawtag in rawtags.splitlines()]:
+        logger.info(f"Fetching matching revisions: {rev}")
+        subprocess.check_call(["git", "fetch", "--depth", "1", "origin", f"{rev}:{rev}"], cwd=workdir)
+
+def compute_regression_report(workdir, baserevision, targetrevision):
+    logger.info(f"Running resulttool regression between SHA1 {baserevision} and {targetrevision}")
+    report = subprocess.check_output([resulttool, "regression-git", "--commit", baserevision, "--commit2", targetrevision, workdir]).decode("utf-8")
+    return report
+
+def print_report_with_header(report, baseversion, baserevision, targetversion, targetrevision):
+    print("========================== Regression report ==============================")
+    print(f'{"=> Target:": <16}{targetversion: <16}({targetrevision})')
+    print(f'{"=> Base:": <16}{baseversion: <16}({baserevision})')
+    print("===========================================================================\n")
+    print(report, end='')
+
+def regression(args):
+    logger.info(f"Compute regression report between {args.base} and {args.target}")
+    if args.testresultsdir:
+        workdir = args.testresultsdir
+    else:
+        workdir = create_workdir()
+
+    try:
+        baserevision = get_sha1(poky_path, args.base)
+        targetrevision = get_sha1(poky_path, args.target)
+        fetch_testresults(workdir, baserevision)
+        fetch_testresults(workdir, targetrevision)
+        report = compute_regression_report(workdir, baserevision, targetrevision)
+        print_report_with_header(report, args.base, baserevision, args.target, targetrevision)
+    finally:
+        if not args.testresultsdir:
+            subprocess.check_call(["rm", "-rf",  workdir])
+
+def main():
+    parser = argparse.ArgumentParser(description="Yocto Project test results helper")
+    subparsers = parser.add_subparsers(
+        help="Supported commands for test results helper",
+        required=True)
+    parser_regression_report = subparsers.add_parser(
+        "regression-report",
+        help="Generate regression report between two fixed revisions. Revisions can be branch name or tag")
+    parser_regression_report.add_argument(
+        'base',
+        help="Revision or tag against which to compare results (i.e: the older)")
+    parser_regression_report.add_argument(
+        'target',
+        help="Revision or tag to compare against the base (i.e: the newer)")
+    parser_regression_report.add_argument(
+        '-t',
+        '--testresultsdir',
+        help=f"An existing test results directory. {sys.argv[0]} will automatically clone it and use default branch if not provided")
+    parser_regression_report.set_defaults(func=regression)
+
+    args = parser.parse_args()
+    args.func(args)
+
+if __name__ == '__main__':
+    try:
+        ret =  main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
\ No newline at end of file
-- 
2.39.1


