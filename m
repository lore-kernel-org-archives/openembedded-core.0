Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E0AC7EE30
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:40 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.31408.1677607839763643802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FnoPgO1n;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 24B50100009;
	Tue, 28 Feb 2023 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8dilXzrQKXmmIkVD1sEsCfDNJ9/I0s++z3sVjqhAEw=;
	b=FnoPgO1nE/vFJoRv31bpi9uJqbFJWxPdRuRWRi3XJDIIab7qacNzsnuIM+NxJyZqKO6798
	Bz3hDEz4F3iF1GMRBQjcxcU1s3zJp2SzYPPY0xo0n0rhmYp6v3y7BX8g+6H+8d1pN7KJNB
	KZcGRmwuPB8cnalFLUTGLYwy8S4BgdmHw1Gyp4WYg8riHy585G1bnEPbSmTtYvToSLAD1j
	KKX5QufEsJoxrMkqxCLNO9LbTF4QmzbohrYjpxF7pNQecYDSBd8VqiPOXgC7TaG0KZDu56
	yXlV+rCwPCEivGgOOrvyCWn5afBeYbFk7tGyKnBBYKXG2jj4yb0txxA0o6lJrQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 3/6] oeqa/selftest/resulttool: fix fake data
Date: Tue, 28 Feb 2023 19:10:49 +0100
Message-Id: <20230228181052.4191521-6-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177851

From: Alexis Lothoré <alexis.lothore@bootlin.com>

resulttool searches for "status" field, not "STATUS", in results.
This fix is more to avoid confusion than fixing anything, since the updated
tests are about regression.can_be_compared, which does not check for "status"

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 8489ae8eb52..eeed276b8de 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -274,14 +274,14 @@ class ResultToolTests(OESelftestTestCase):
             "MACHINE": "qemux86"
         }, "result": {
             "ltpresult_foo": {
-                "STATUS": "PASSED"
+                "status": "PASSED"
             }}}
         target_configuration = {"configuration": {
             "TEST_TYPE": "runtime",
             "MACHINE": "qemux86_64"
         }, "result": {
             "bar": {
-                "STATUS": "PASSED"
+                "status": "PASSED"
             }}}
         self.assertFalse(regression.can_be_compared(self.logger, base_configuration, target_configuration),
                          msg="incorrect ltpresult filtering, mismatching ltpresult content should not be compared")
@@ -292,14 +292,14 @@ class ResultToolTests(OESelftestTestCase):
             "MACHINE": "qemux86"
         }, "result": {
             "ltpresult_foo": {
-                "STATUS": "PASSED"
+                "status": "PASSED"
             }}}
         target_configuration = {"configuration": {
             "TEST_TYPE": "runtime",
             "MACHINE": "qemux86"
         }, "result": {
             "ltpresult_foo": {
-                "STATUS": "PASSED"
+                "status": "PASSED"
             }}}
         self.assertTrue(regression.can_be_compared(self.logger, base_configuration, target_configuration),
                         msg="incorrect ltpresult filtering, matching ltpresult content should be compared")
-- 
2.39.1


