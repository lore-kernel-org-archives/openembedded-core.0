Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CE5CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1648.1762187254480261525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0wGZa8So;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24A644E414DA;
	Mon,  3 Nov 2025 16:27:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF7AA60628;
	Mon,  3 Nov 2025 16:27:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBCAA10B501AB;
	Mon,  3 Nov 2025 17:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187252; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tPPTE7d8qkd2OYGHFDfC7TGIgikr1XioHWIWUT7XHfM=;
	b=0wGZa8SokY84s65BzSTBqXhb380QwJJKmw648uwQ52R8GLG4ryH08d5YaBXRxg7hN8zTME
	5bGhzq5gzac1TiOvXROv4lzD17aND1N36SUcFnq64yUxuj+ZqGrGqe0a6x9edVlyIKHNtw
	mqw8RmQ5vW7mC/64G5sl1BLiatbFQZyJp6JNF8+Y9gvNpmxkfln3BJiN4Re4ZWSix3o4Ue
	suZr/CxoNN9RwiJiswZ0VaBhZIB0kiLbsDm8p4Y7aaiwoTyS9sLQK0/92v59zsKKWVIchU
	AHqPC+p1WMyMD0TmIsFniSvOlyonCjWBckEmEpDT/Ejly97w9al7VJaVoyH81w==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v3 16/16] oeqa: spdx: Add tar test for SPDX 2.2
Date: Mon,  3 Nov 2025 17:26:42 +0100
Message-ID: <20251103162654.1714239-17-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225683

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


