Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FF9C3ABCB
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6806.1746866645824886136
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5772C153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4DDB3F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/23] buildtools-tarball: fix default_cases assignment
Date: Sat, 10 May 2025 09:43:34 +0100
Message-ID: <20250510084400.269726-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216249

This is meant to be a list of strings not a single string. For example,
this is overwriting the default in OESDKTestContextExecutor which is:

      default_cases =3D [os.path.join(os.path.abspath(os.path.dirname(__f=
ile__)), 'cases')]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index 8e78169e237..6fa6d93a3d3 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -135,7 +135,7 @@ python do_testsdk() {
     testsdk =3D oeqa.sdk.testsdk.TestSDK()
=20
     cases_path =3D os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk=
.testsdk.__file__)), d.getVar("TESTSDK_CASES"))
-    testsdk.context_executor_class.default_cases =3D cases_path
+    testsdk.context_executor_class.default_cases =3D [cases_path,]
=20
     testsdk.run(d)
 }
--=20
2.43.0


