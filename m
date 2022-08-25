Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B784C65C0D
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:37:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24032.1661434678867660973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2426BD6E;
	Thu, 25 Aug 2022 06:38:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 193833F71A;
	Thu, 25 Aug 2022 06:37:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [PATCH][kirkstone 3/6] oeqa/gotoolchain: set CGO_ENABLED=1
Date: Thu, 25 Aug 2022 14:37:49 +0100
Message-Id: <20220825133752.1660005-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825133752.1660005-1-ross.burton@arm.com>
References: <20220825133752.1660005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169868

In cross-compiles CGO_ENABLED=3D1 needs to be set explicitly, as otherwis=
e
Go refuses to use it even if CC is already set.

This fixes the selftest on setups where the host and the SDK target
don't have matching architectures.

[ YOCTO #14859 ]

(From OE-Core rev: 19be072619d39267df44f23c4c8b64f3808f6148)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


