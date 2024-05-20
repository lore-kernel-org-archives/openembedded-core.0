Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89E5C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 16:34:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1128.1716222884652780426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55CB0DA7
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 09:35:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFDCC3F762
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 09:34:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: skip FTP tests in run-ptest
Date: Mon, 20 May 2024 16:34:42 +0000
Message-Id: <20240520163442.3648767-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 16:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199599

It looks like something related to FTP in curl, be it the protocol itself
or the harness, is unstable under load.  We've been seeing random failure=
s
in automated QA, and Debian does too.

Until this issue is resolved, disable all of the FTP tests on the hope
that this is the underlying common factor.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
index 3d25f3d90b9..579b3f4587e 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -7,5 +7,7 @@ cd tests
 # Use automake-style output
 # Run four tests in parallel
 # Print log output on failure
+
 # Don't run the flaky or timing dependent tests
-./runtests.pl -a -n -am -j4 -p !flaky !timing-dependent
+# Until https://github.com/curl/curl/issues/13350 is resolved, don't run=
 FTP tests
+./runtests.pl -a -n -am -j4 -p !flaky !timing-dependent !FTP
--=20
2.34.1


