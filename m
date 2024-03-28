Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18C2CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 17:41:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2984.1711647706184469079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 10:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AEF61476
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 10:42:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75A163F7BD
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 10:41:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: fix quoting when disabling flaky tests
Date: Thu, 28 Mar 2024 17:41:43 +0000
Message-Id: <20240328174143.2712990-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 17:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197599

From: Ross Burton <ross.burton@arm.com>

The list of test labels to disable shouldn't be quoted, and this meant
that tests were running when they should not.

[ YOCTO #15268 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
index acd2892f80e..3d25f3d90b9 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -8,4 +8,4 @@ cd tests
 # Run four tests in parallel
 # Print log output on failure
 # Don't run the flaky or timing dependent tests
-./runtests.pl -a -n -am -j4 -p '!flaky !timing-dependent'
+./runtests.pl -a -n -am -j4 -p !flaky !timing-dependent
--=20
2.34.1


