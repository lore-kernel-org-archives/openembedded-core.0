Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDA8C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:50 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.31410.1677607840433532012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OhzbuErN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ACA37100010;
	Tue, 28 Feb 2023 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0EdXF/+9/LWXG6RqA/gnOp4+mIVgxx5r+STd6Q+44Y=;
	b=OhzbuErNZt+zC23VMEaqNBqDv36XkPPZGvdq8WZbut9DyzLmO6rrmBGDfAtoRUX+ZVRaG2
	gdAvfucgeSkL2oHK2GREBVixLXU/UIvyqT7XwsuGbMRsiQkO467C4j4KPRSqcIv504RKxd
	i3lD2xUxhAxIVaa9wv1tou00BTZB4Ec8XVo4AXUvCAHvuybnupfjjaArvv0ogdP9g1wJLP
	TkEp3/7DccZ1ZDU/5/vY0noyenTSS5pUuYqPrQ8ZeXT17djAwF+kK/4BoaiaoeHVJkPO1k
	00Duw478YThGCuZcE2gOjSUECFDcWPR6cnqwHKjAJ5L/ZnmkSxj2CyuWOvkQcA==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 4/6] scripts/resulttool: fix ptests results containing a non reproducible path
Date: Tue, 28 Feb 2023 19:10:50 +0100
Message-Id: <20230228181052.4191521-7-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177852

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Some ptests results may be wrongly sampled, resulting in some part of the error
being propagated in test name. For example:

"ptestresult.binutils-ld.in testcase /home/pokybuild/yocto-worker/qemumips/build/build-st-1666126/tmp/work/mips32r2-poky-linux/binutils-cross-testsuite/2.40-r0/git/ld/testsuite/ld-ctf/ctf.exp"
"ptestresult.gcc.Couldn't create remote directory /tmp/runtest.455781 on ssh"
"ptestresult.gcc-libstdc++-v3.Couldn't create remote directory /tmp/runtest.3814266 on target"

While the root errors must be fixed in corresponding ptests packages for those
tests, the test results history must still be usable even with this issue

Add new filters to detect if temporary test directories (build-st-*,
/tmp/runtime.*) are present in name. If so, truncate test name. As a side
effect, it will aggregate multiple failing errors into one, but the regression
will still be raised

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index ad377c596b6..d7f0b16ca98 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -219,6 +219,12 @@ def fixup_ptest_names(results, logger):
                     new = test.split("_-_")[0]
                 elif test.startswith(("ptestresult.curl.")) and "__" in test:
                     new = test.split("__")[0]
+                elif test.startswith(("ptestresult.dbus.")) and "__" in test:
+                    new = test.split("__")[0]
+                elif test.startswith("ptestresult.binutils") and "build-st-" in test:
+                    new = test.split(" ")[0]
+                elif test.startswith("ptestresult.gcc") and "/tmp/runtest." in test:
+                    new = ".".join(test.split(".")[:2])
                 if new:
                     results[r][i]['result'][new] = results[r][i]['result'][test]
                     del results[r][i]['result'][test]
-- 
2.39.1


