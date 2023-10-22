Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8C9C00A8F
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 17:49:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.103869.1697996935260497683
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 10:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QyYV+nay;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD684E0007;
	Sun, 22 Oct 2023 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697996933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HURJjrAvaMDxabzmJkUVya+TJLu3DmRBEJkm04hgF3s=;
	b=QyYV+naysT4l18yQcQYqztPCVMJ3Z3imPSav/uNiEFyWAdWc/GLSzMmvuUrsOCel8viWA8
	vdnNkjDW3LuXIqhatSwQssYcD4W4zOpqsl4vG/Yc9qY8m9I9j0UJo6nBjzh0GZqwxZCfV0
	Rj6bjM+t7RLMGH1aCY7HxCrj+mu9ciSGbHW/TyNjbEAh+DGvniZOz/pi1SvogoriMjDxIJ
	5niGahwdKG+oCcz75hTi7ZLGAEa7ht82zTJX0hSgYBBKhkTyeWJX2eonjO6SuWs+/CGD4u
	GkzsOCw1g4cCZ1d9NNFPaOg8s8rBxqNlV9wwbr5UShNQVZek2glhCgyP57Ivrg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 4/4] scripts/yocto_testresults_query: add option to change display limit
Date: Sun, 22 Oct 2023 19:49:38 +0200
Message-ID: <20231022174938.7012-5-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231022174938.7012-1-alexis.lothore@bootlin.com>
References: <20231022174938.7012-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 17:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189610

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


