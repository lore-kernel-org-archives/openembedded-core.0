Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D300C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 19:42:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.4631.1677526960870191390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 11:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fCIVjaWE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0FBE660008;
	Mon, 27 Feb 2023 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677526959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/15l3eLnFWzsGin5shm8HSX+J3XY445ZYhvdxHVGIc=;
	b=fCIVjaWEakMTft62SnzQplvgceaFpm6beivsdXgxpqWlkTC8f9tQUfh404Tnwmz0rL+JIo
	cvUuPXUf7wvXQCCgAur7KpP4M3GwY0b6InVcdW6zBI1jlqzAI6u0zNW/YPHE5ZMHcSe/W7
	ftV4rfIiuFIiVRo40nDq0Rde+xlfrJkT9yBgiJAKjgxEpI4zBB/1uQVgpc49e3oZfcG7jF
	dMaIKHsAI9y1GdS5g0IP3TbaYyVKPBJLmaIORwZYfjHXsMa56IxB8U5S99rH7pqsiytoOa
	jtF2a27zJttNurWwDJqWNXEu7QDXu/tZDQaLum1xxr+PpbIxVYwYwOCNa7fJCw==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 1/2] scripts/yoct_testresults_query: manage base/target revision not found
Date: Mon, 27 Feb 2023 20:42:22 +0100
Message-Id: <20230227194223.24304-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227194223.24304-1-alexis.lothore@bootlin.com>
References: <20230227194223.24304-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 19:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177805

From: Alexis Lothoré <alexis.lothore@bootlin.com>

If yocto_testresults_query.py is run from oe-core instead of poky, the
script will very likely fail since poky tags do no exist in oe-core. If
one or both revisions are not found, log the error and a suggestion
about the reason (the script being run in oe-core instead of poky)

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/yocto_testresults_query.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
index 3b478822dc..3df9d6015f 100755
--- a/scripts/yocto_testresults_query.py
+++ b/scripts/yocto_testresults_query.py
@@ -30,9 +30,13 @@ def create_workdir():
     return workdir
 
 def get_sha1(pokydir, revision):
-    rev = subprocess.check_output(["git", "rev-list", "-n", "1", revision], cwd=pokydir).decode('utf-8').strip()
-    logger.info(f"SHA-1 revision for {revision} in {pokydir} is {rev}")
-    return rev
+    try:
+        rev = subprocess.check_output(["git", "rev-list", "-n", "1", revision], cwd=pokydir).decode('utf-8').strip()
+        logger.info(f"SHA-1 revision for {revision} in {pokydir} is {rev}")
+        return rev
+    except subprocess.CalledProcessError:
+        logger.error(f"Can not find SHA-1 for {revision} in {pokydir}")
+        return None
 
 def fetch_testresults(workdir, sha1):
     logger.info(f"Fetching test results for {sha1} in {workdir}")
@@ -65,6 +69,11 @@ def regression(args):
     try:
         baserevision = get_sha1(poky_path, args.base)
         targetrevision = get_sha1(poky_path, args.target)
+        if not baserevision or not targetrevision:
+            logger.error("One or more revision(s) missing. You might be targeting nonexistant tags/branches, or are in wrong repository (you must use Poky and not oe-core)")
+            if not args.testresultsdir:
+                subprocess.check_call(["rm", "-rf",  workdir])
+            sys.exit(1)
         fetch_testresults(workdir, baserevision)
         fetch_testresults(workdir, targetrevision)
         report = compute_regression_report(workdir, baserevision, targetrevision)
-- 
2.39.2


