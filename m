Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82725C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 15:53:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30011.1658764428360195186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 08:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09CD5D6E;
	Mon, 25 Jul 2022 08:53:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0333B3F73D;
	Mon, 25 Jul 2022 08:53:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] oeqa/gotoolchain: set CGO_ENABLED=1
Date: Mon, 25 Jul 2022 16:53:44 +0100
Message-Id: <20220725155344.427398-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725155344.427398-1-ross.burton@arm.com>
References: <20220725155344.427398-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 15:53:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168489

In cross-compiles CGO_ENABLED=3D1 needs to be set explicitly, as otherwis=
e
Go refuses to use it even if CC is already set.

This fixes the selftest on setups where the host and the SDK target
don't have matching architectures.

[ YOCTO #14859 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/=
selftest/cases/gotoolchain.py
index 345f533379c..978898b86f1 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -51,6 +51,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         cmd =3D cmd + ". %s; " % self.env_SDK
         cmd =3D cmd + "export GOPATH=3D%s; " % self.go_path
         cmd =3D cmd + "export GOFLAGS=3D-modcacherw; "
+        cmd =3D cmd + "export CGO_ENABLED=3D1; "
         cmd =3D cmd + "${CROSS_COMPILE}go %s" % gocmd
         return runCmd(cmd).status
=20
--=20
2.34.1


