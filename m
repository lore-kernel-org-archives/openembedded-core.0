Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E2FC77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 14:39:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.28027.1684507169033105517
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 07:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 843E31FB;
	Fri, 19 May 2023 07:40:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FEBD3F793;
	Fri, 19 May 2023 07:39:28 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] gdbm: improve run-ptest
Date: Fri, 19 May 2023 15:39:26 +0100
Message-Id: <20230519143926.378732-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 14:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181556

From: Ross Burton <ross.burton@arm.com>

There's no need to use a sed to get the output we need, autotest can do
that itself if told.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gdbm/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gdbm/files/run-ptest b/meta/recipes-sup=
port/gdbm/files/run-ptest
index 615da8444b2..8d6481185d0 100755
--- a/meta/recipes-support/gdbm/files/run-ptest
+++ b/meta/recipes-support/gdbm/files/run-ptest
@@ -4,4 +4,4 @@
=20
 cd tests
=20
-./testsuite AUTOTEST_PATH=3D$PWD abs_builddir=3D$PWD COMPAT=3D1 | sed 's=
/^[^0-9]*\([0-9]\+\): \(.*\)\(ok\|pass\|skipped\|fail\|FAILED\)\(.*\)$/\3=
: \2 \4/;s/ \+/ /g;s/^ok/PASS/;s/^skipped/SKIP/;s/^fail/FAIL/;s/^FAILED/F=
AIL/'
+./testsuite --am-fmt AUTOTEST_PATH=3D$PWD abs_builddir=3D$PWD COMPAT=3D1
--=20
2.34.1


