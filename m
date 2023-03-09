Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73FCC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:55:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.17187.1678377304214972450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dz/sOhLc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 887AAC0008;
	Thu,  9 Mar 2023 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678377301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X3owzYveu9tqOAKMLfbNvE2I1RTuY29bm8x5qrvd8e0=;
	b=dz/sOhLcC696qnJo+5FgX/7jd2AshoV79okng+KLC4Z0uv1l1JrWKIsfiHN3fp9DppUZBC
	QiQ8CaqICyCYi+469CT878aTikN9GGrPu1PyIN37cjfIJO85zfb9q9MYhB/d69OichzF0K
	Y/ncR2CQrMqQr3kHP99bJoU86nvgI0kmom7h7H0OMAqz1juYR3HYS0h0tj44fupLulMOrA
	9MTTNEDWmVX9WR7eXY2KK/QPaf9NPj0S94JJhAfnlIUc52ya+1RA/0Eoq6/FxjZkB2etSc
	l2R7plN0nJaWMzMEK9wu/y9aHM8uVf0ae+NZlHgBe/l6ynF/HtK2PF6BMF1p3A==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH] scripts/yocto_testresults_query.py: set proper branches when using resulttool
Date: Thu,  9 Mar 2023 16:53:01 +0100
Message-Id: <20230309155301.68731-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178258

From: Alexis Lothoré <alexis.lothore@bootlin.com>

The script currently only works if base and target can be found on default
branches. It breaks if we try to generate a regression report between revisions
that live on different branches (as needed on integration and testing branches).
For example, the following command:

./scripts/yocto_testresults_query.py regression-report yocto-4.0.6 yocto-4.0.7

ends with the follwing error:

[...]
ERROR: Only 1 tester revisions found, unable to generate report
[...]

Read branches from tags names in test results repository, and pass those
branches to resulttool when generating the report

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/yocto_testresults_query.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
index 3df9d6015fe..4df339c92eb 100755
--- a/scripts/yocto_testresults_query.py
+++ b/scripts/yocto_testresults_query.py
@@ -38,18 +38,27 @@ def get_sha1(pokydir, revision):
         logger.error(f"Can not find SHA-1 for {revision} in {pokydir}")
         return None
 
+def get_branch(tag):
+    # The tags in test results repository, as returned by git rev-list, have the following form:
+    # refs/tags/<branch>/<count>-g<sha1>/<num>
+    return tag.split("/")[2]
+
 def fetch_testresults(workdir, sha1):
     logger.info(f"Fetching test results for {sha1} in {workdir}")
     rawtags = subprocess.check_output(["git", "ls-remote", "--refs", "--tags", "origin", f"*{sha1}*"], cwd=workdir).decode('utf-8').strip()
     if not rawtags:
         raise Exception(f"No reference found for commit {sha1} in {workdir}")
+    branch = ""
     for rev in [rawtag.split()[1] for rawtag in rawtags.splitlines()]:
-        logger.info(f"Fetching matching revisions: {rev}")
+        if not branch:
+            branch = get_branch(rev)
+        logger.info(f"Fetching matching revision: {rev}")
         subprocess.check_call(["git", "fetch", "--depth", "1", "origin", f"{rev}:{rev}"], cwd=workdir)
+    return branch
 
-def compute_regression_report(workdir, baserevision, targetrevision):
+def compute_regression_report(workdir, basebranch, baserevision, targetbranch, targetrevision):
     logger.info(f"Running resulttool regression between SHA1 {baserevision} and {targetrevision}")
-    report = subprocess.check_output([resulttool, "regression-git", "--commit", baserevision, "--commit2", targetrevision, workdir]).decode("utf-8")
+    report = subprocess.check_output([resulttool, "regression-git", "--branch", basebranch, "--commit", baserevision, "--branch2", targetbranch, "--commit2", targetrevision, workdir]).decode("utf-8")
     return report
 
 def print_report_with_header(report, baseversion, baserevision, targetversion, targetrevision):
@@ -74,9 +83,9 @@ def regression(args):
             if not args.testresultsdir:
                 subprocess.check_call(["rm", "-rf",  workdir])
             sys.exit(1)
-        fetch_testresults(workdir, baserevision)
-        fetch_testresults(workdir, targetrevision)
-        report = compute_regression_report(workdir, baserevision, targetrevision)
+        basebranch = fetch_testresults(workdir, baserevision)
+        targetbranch = fetch_testresults(workdir, targetrevision)
+        report = compute_regression_report(workdir, basebranch, baserevision, targetbranch, targetrevision)
         print_report_with_header(report, args.base, baserevision, args.target, targetrevision)
     finally:
         if not args.testresultsdir:
-- 
2.39.2


