Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F68BCCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11177.1762521331224718887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Li0xcp6R;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DBA464E41595;
	Fri,  7 Nov 2025 13:15:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2F87606A6;
	Fri,  7 Nov 2025 13:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98B17118525DE;
	Fri,  7 Nov 2025 14:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521329; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tPPTE7d8qkd2OYGHFDfC7TGIgikr1XioHWIWUT7XHfM=;
	b=Li0xcp6Ri8gn7isnGjijoVk7VelSfF+GbjFqYYNO2G/nlEwTxYXQb03z2nDFZyYBr2CDc6
	A/0ujWMThi4LuKPCc9igeEk0hTk+zS4OzLjGLYtID44jwiSFsmsdTo+KeYmkKr9Hma2TLI
	XFf9uZt05rdLGy6UctSA4TvI58Q5AZqclC02aSLAz4Y40L2qQu+ZtaY4Ndiz24ewOjsAI4
	kyC2HytL3qXRJamXpjmbkNsLDVCiLYaQBI5o3k/s0+lRmR/ev5kLyF/8Bj73CaXs575QJC
	ESGVufkJNn9LYfXMJBX2q9wE0xHxDNgg/+8nN268m4Fet7g/m8mFJvzT1gNxTA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 16/17] oeqa: spdx: Add tar test for SPDX 2.2
Date: Fri,  7 Nov 2025 14:14:50 +0100
Message-ID: <20251107131502.3857600-17-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226052

From: Joshua Watt <JPEWhacker@gmail.com>

The base-files test for SPDX 2.2 did not give good coverage, since
base-files doesn't have any dependencies. Add building tar as another
test which more fully exercises the code

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index f22bd6c275..8cd4e83ca2 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -31,10 +31,10 @@ class SPDX22Check(OESelftestTestCase):
         self.write_config(config)
=20
         deploy_dir =3D get_bb_var("DEPLOY_DIR")
-        machine_var =3D get_bb_var("MACHINE")
+        arch_dir =3D get_bb_var("PACKAGE_ARCH", target_name)
         spdx_version =3D get_bb_var("SPDX_VERSION")
         # qemux86-64 creates the directory qemux86_64
-        machine_dir =3D machine_var.replace("-", "_")
+        #arch_dir =3D arch_var.replace("-", "_")
=20
         full_file_path =3D os.path.join(
             deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, =
spdx_file
@@ -68,6 +68,9 @@ class SPDX22Check(OESelftestTestCase):
     def test_spdx_base_files(self):
         self.check_recipe_spdx("packages", "base-files.spdx.json", "base=
-files")
=20
+    def test_spdx_tar(self):
+        self.check_recipe_spdx("packages", "tar.spdx.json", "tar")
+
=20
 class SPDX3CheckBase(object):
     """
--=20
2.43.0


