Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531B7C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:50 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.31411.1677607841001630554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M6Ankg+K;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5DCB310000A;
	Tue, 28 Feb 2023 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phWTC9wjG66QZ40Qrn3NnJZufKBUmaxcJFDHSb9wLeA=;
	b=M6Ankg+KmjZM8m1MzSCBr+0ws7dqWr7N0+hYPOMaXFGESoPAGlW74As34kF6wIHfCDY2AZ
	jchX7Zdl4TFBxfHjni1NWqV+gCjhJtgfNICl5RTsaHgG+B06xKo5PuhDBX3/pzo94vYkg0
	K9R0/D5q6WTUSWswgAUyB0H8wkmUQlgjBkS2eVC1vd5BcwwaD5awEnIl8FikiebtgSnDDh
	RTaKT3CzppDZDGHyew4XS3MlCVry4ATVXnZ7CTK9XprXffhnE2RWo8D8l8cGDo/e7hTWOP
	wK4D9jwI13N1OyN2wcbPnbqIeybodC460UySgmqsWDZaPQG93Cd/j4z24BkOLg==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 5/6] oeqa/selftest/resulttool: add test for error propagation in test name filtering
Date: Tue, 28 Feb 2023 19:10:51 +0100
Message-Id: <20230228181052.4191521-8-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177853

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index eeed276b8de..c3303f3fbbe 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -322,6 +322,18 @@ class ResultToolTests(OESelftestTestCase):
                     },
                     "ptestresult.curl.test_0000__foo_out_of_bar": {
                         "status": "PASSED"
+                    },
+                    "ptestresult.dbus.test_0000__foo_out_of_bar,_remaining:_00:02,_took_0.032s,_duration:_03:32_": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.binutils-ld.in testcase /foo/build-st-bar/moo/ctf.exp": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.gcc-libstdc++-v3.Couldn't create remote directory /tmp/runtest.30975 on target": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.gcc-libgomp.Couldn't create remote directory /tmp/runtest.3657621 on": {
+                        "status": "PASSED"
                     }
                 }}}}
         target_configuration = {"a": {
@@ -341,6 +353,18 @@ class ResultToolTests(OESelftestTestCase):
                     },
                     "ptestresult.curl.test_0000__xxx_out_of_yyy": {
                         "status": "PASSED"
+                    },
+                    "ptestresult.dbus.test_0000__yyy_out_of_zzz,_remaining:_00:03,_took_0.034s,_duration:_03:30_": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.binutils-ld.in testcase /xxx/build-st-yyy/zzz/ctf.exp": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.gcc-libstdc++-v3.Couldn't create remote directory /tmp/runtest.45678 on target": {
+                        "status": "PASSED"
+                    },
+                    "ptestresult.gcc-libgomp.Couldn't create remote directory /tmp/runtest.3657621 on": {
+                        "status": "PASSED"
                     }
                 }}}}
         regression.fixup_ptest_names(base_configuration, self.logger)
-- 
2.39.1


