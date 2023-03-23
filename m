Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F24C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 19:59:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.83479.1679601571548407464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 12:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3F214B3;
	Thu, 23 Mar 2023 13:00:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44BB33F6C4;
	Thu, 23 Mar 2023 12:59:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] quilt: fix non-deterministic ownership in ptest package
Date: Thu, 23 Mar 2023 19:59:28 +0000
Message-Id: <20230323195928.2055600-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 19:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178991

The quilt package files are owned by the ptest user, which is provided
by the ptest-runner package.  The quilt recipe depends on ptest-runner
but there have been instances where rebuilds of quilt end up without the
right passwd being present, so the files are not owned by ptest.

I suspect what's happening is that the re-package is happening without
the ptest-runner package being present (reproducible with bitbake quilt;
bitbake quilt -cclean; bitbake quilt -Cpackage_write_rpm), so add an
explicit dependency on ptest-runner in the packaging dependencies to
ensure this doesn't happen.

[ YOCTO #15062  ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index 01fc22e9963..c93c38b83ca 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -63,6 +63,7 @@ do_install:append:class-native () {
=20
 # The tests need to run as a non-root user, so pull in the ptest user
 DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED', '=
1', ' ptest-runner', '', d)}"
+PACKAGE_WRITE_DEPS +=3D "ptest-runner"
=20
 do_install_ptest() {
 	install ${WORKDIR}/test.sh ${D}${PTEST_PATH}
--=20
2.34.1


