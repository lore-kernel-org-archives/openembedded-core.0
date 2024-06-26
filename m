Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF8FC30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 09:42:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22066.1719394926111471861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8895D339;
	Wed, 26 Jun 2024 02:42:30 -0700 (PDT)
Received: from e133390.cambridge.arm.com (unknown [10.1.198.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F8993F6A8;
	Wed, 26 Jun 2024 02:42:05 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Subject: [PATCH] testimage: Gate artifact collection with variable
Date: Wed, 26 Jun 2024 10:41:30 +0100
Message-Id: <20240626094130.255905-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 09:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201155

It does not always make sense to collect artifacts and data from the
target on failure, e.g. if testing firmware or if the target is not
running an SSH server.

Introduce the variable TESTIMAGE_RUN_FAILURE_POST_ACTIONS, which
defaults to "1". If this variable is not true, skip the failed test post
actions.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta/classes-recipe/testimage.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index ed0d87b7a7..599a5563a5 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -18,9 +18,11 @@ inherit image-artifact-names
=20
 TESTIMAGE_AUTO ??=3D "0"
=20
-# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and =
for
-# each entry in it, if artifact pointed by path description exists on ta=
rget,
-# it will be retrieved onto host
+# When any test fails, if TESTIMAGE_RUN_FAILURE_POST_ACTIONS equals "1",
+# TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for each entry in it,=
 if artifact
+# pointed by path description exists on target, it will be retrieved ont=
o host
+
+TESTIMAGE_RUN_FAILURE_POST_ACTIONS ??=3D "1"
=20
 TESTIMAGE_FAILED_QA_ARTIFACTS =3D "\
     ${localstatedir}/log \
@@ -367,7 +369,7 @@ def testimage_main(d):
             pass
         results =3D tc.runTests()
         complete =3D True
-        if results.hasAnyFailingTest():
+        if oe.types.boolean(d.getVar('TESTIMAGE_RUN_FAILURE_POST_ACTIONS=
')) and results.hasAnyFailingTest():
             run_failed_tests_post_actions(d, tc)
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
--=20
2.34.1


