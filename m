Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB0AC3ABDD
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6815.1746866656019126055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D9B153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54CDF3F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/23] oeqa/sdk/autotools: verify that configure is using the correct host
Date: Sat, 10 May 2025 09:43:50 +0100
Message-ID: <20250510084400.269726-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216265

Search config.log for the correct host_alias assignment to verify that
configure has correctly identified the host system.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/autotools.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cas=
es/autotools.py
index b3a71f2aa50..ee6c522551b 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -36,6 +36,12 @@ class AutotoolsTest(OESDKTestCase):
             os.makedirs(dirs["build"])
=20
             self._run("cd {build} && {source}/configure CFLAGS=3D'-std=3D=
gnu17 -Dbool=3Dint -Dtrue=3D1 -Dfalse=3D0 -Wno-error=3Dimplicit-function-=
declaration' $CONFIGURE_FLAGS".format(**dirs))
+
+            # Check that configure detected the target correctly
+            with open(os.path.join(dirs["build"], "config.log")) as f:
+                host_sys =3D self.td["HOST_SYS"]
+                self.assertIn(f"host_alias=3D'{host_sys}'\n", f.readline=
s())
+
             self._run("cd {build} && make CFLAGS=3D'-std=3Dgnu17 -Dbool=3D=
int -Dtrue=3D1 -Dfalse=3D0 -Wno-error=3Dimplicit-function-declaration' -j=
".format(**dirs))
             self._run("cd {build} && make install DESTDIR=3D{install}".f=
ormat(**dirs))
=20
--=20
2.43.0


