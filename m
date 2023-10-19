Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79334CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:52:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.23937.1697709162384420682
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X9bUX8wm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 974F040019;
	Thu, 19 Oct 2023 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697709160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HURJjrAvaMDxabzmJkUVya+TJLu3DmRBEJkm04hgF3s=;
	b=X9bUX8wmMQCny0oqeCkxUm5910sqgQVTRmDIzoK3vplCeLoBE4kmYbGsLzvDLIYcyWDtov
	w3vjgVPHPx7SX8Hf3tNHccAznr8BL13nRibbGvy5nL7GCXBeR4xqdFsYuHtkhn+doDGw7l
	x0yy9l1+YUsxjLhjKV3BmuX5SxPkBqLLcaipFfJaPlB0kzVWUmqSZ5yqiooPhM/8dG0pwN
	t4wtQuxDWYwwAyjjjC95M28RRxefpHCBM0cYEofnpQUyHHHav57USO306HLA8XT0/Sb7iP
	oIPsAByUsk02HYWDfE5+Q0Q/HUIIYB9mTZre50qsEMluzu5CeD8OiR3nt7q9bQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 2/2] scripts/yocto_testresults_query: add option to change display limit
Date: Thu, 19 Oct 2023 11:53:52 +0200
Message-ID: <20231019095352.25923-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019095352.25923-1-alexis.lothore@bootlin.com>
References: <20231019095352.25923-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 09:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189441

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add a "-l"/"--limit" option to allow changing the display limit in
resulttool.
- If no value is passed, resulttool uses its default value.
- If 0 is passed, the display limit is removed and every regression will be
  displayed
- If a custom value is passed, this value overrides the vlaue configured in
  resulttool

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/yocto_testresults_query.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
index a5073736aab5..521ead8473ad 100755
--- a/scripts/yocto_testresults_query.py
+++ b/scripts/yocto_testresults_query.py
@@ -56,9 +56,12 @@ def fetch_testresults(workdir, sha1):
         subprocess.check_call(["git", "fetch", "--depth", "1", "origin", f"{rev}:{rev}"], cwd=workdir)
     return branch
 
-def compute_regression_report(workdir, basebranch, baserevision, targetbranch, targetrevision):
+def compute_regression_report(workdir, basebranch, baserevision, targetbranch, targetrevision, args):
     logger.info(f"Running resulttool regression between SHA1 {baserevision} and {targetrevision}")
-    report = subprocess.check_output([resulttool, "regression-git", "--branch", basebranch, "--commit", baserevision, "--branch2", targetbranch, "--commit2", targetrevision, workdir]).decode("utf-8")
+    command = [resulttool, "regression-git", "--branch", basebranch, "--commit", baserevision, "--branch2", targetbranch, "--commit2", targetrevision, workdir]
+    if args.limit:
+        command.extend(["-l", args.limit])
+    report = subprocess.check_output(command).decode("utf-8")
     return report
 
 def print_report_with_header(report, baseversion, baserevision, targetversion, targetrevision):
@@ -85,7 +88,7 @@ def regression(args):
             sys.exit(1)
         basebranch = fetch_testresults(workdir, baserevision)
         targetbranch = fetch_testresults(workdir, targetrevision)
-        report = compute_regression_report(workdir, basebranch, baserevision, targetbranch, targetrevision)
+        report = compute_regression_report(workdir, basebranch, baserevision, targetbranch, targetrevision, args)
         print_report_with_header(report, args.base, baserevision, args.target, targetrevision)
     finally:
         if not args.testresultsdir:
@@ -109,6 +112,10 @@ def main():
         '-t',
         '--testresultsdir',
         help=f"An existing test results directory. {sys.argv[0]} will automatically clone it and use default branch if not provided")
+    parser_regression_report.add_argument(
+        '-l',
+        '--limit',
+        help=f"Maximum number of changes to display per test. Can be set to 0 to print all changes")
     parser_regression_report.set_defaults(func=regression)
 
     args = parser.parse_args()
-- 
2.42.0


