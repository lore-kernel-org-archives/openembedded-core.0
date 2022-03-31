Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6C1C43217
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.700.1648751358764181178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 671D41596
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1926F3F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/23] oeqa/selftest/devtool: ensure Git username is set
 before upgrade tests
Date: Thu, 31 Mar 2022 19:28:55 +0100
Message-Id: <20220331182915.22128-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163843

The 'devtool upgrade' tests fail if Git doesn't know the user's name or
email, so verify this before the tests start and skip if it is not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index e910672c314..9c69585a88c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1471,6 +1471,14 @@ class DevtoolExtractTests(DevtoolBase):
=20
 class DevtoolUpgradeTests(DevtoolBase):
=20
+    def setUp(self):
+        super().setUp()
+        try:
+            runCmd("git config --global user.name")
+            runCmd("git config --global user.email")
+        except:
+            self.skip("Git user.name and user.email must be set")
+
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This tes=
t cannot be run with a workspace directory under the build directory')
--=20
2.25.1


