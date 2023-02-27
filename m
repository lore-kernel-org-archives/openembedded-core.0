Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFC9C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 13:13:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89454.1677503588227238810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 05:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C81FC14;
	Mon, 27 Feb 2023 05:13:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F393F67D;
	Mon, 27 Feb 2023 05:13:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] ptest-runner: add non-root ptest user for tests to run as
Date: Mon, 27 Feb 2023 13:13:02 +0000
Message-Id: <20230227131303.3104010-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 13:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177792

Some tests really don't want to be run as root, either because they
expect to get "permission denied" errors occasionally, or have explicit
checks.

Instead of numerous recipes re-inventing user creation in run-ptest,
create a user in the ptest-runner recipe that they can all use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/me=
ta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 5a1d3299930..ee13e28c7df 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -32,3 +32,8 @@ RDEPENDS:${PN}:append:libc-glibc =3D " libgcc"
=20
 # pstree is called by ptest-runner-collect-system-data
 RDEPENDS:${PN}:append =3D " pstree"
+
+# Create a non-root user that test suites can use easily
+inherit useradd
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --home / --user-group=
 ptest"
--=20
2.34.1


