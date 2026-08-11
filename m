Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0D9C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:44:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51411.1786445074099501470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=q/1EWKRc;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 816A61516
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:44:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12F983F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786445073; bh=rThyhDnbVCjocoBMchnwHJ8ELFYL0hMXrjy9JgQcXTM=;
	h=From:To:Subject:Date:From;
	b=q/1EWKRcYJF59XjeZ7d7wIkkNzZ079Zf/anWKwWJGcKPSdEcb16E+hUHP/Qws0TEw
	 /25NQmgCsAbRt6Fc2wjOTVlg2zM1JcOPWbjcpSz/5AhQglHVjENTYwnoml/XdYGrZY
	 dyal+B6xNbJyJRNCCnb5Thz4vtcyjUstEc/znYhQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/ptest-cargo: use oe.path.join instead of os.path.join
Date: Tue, 11 Aug 2026 11:44:27 +0100
Message-ID: <20260811104428.1875677-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243184

Use oe.path.join() to avoid having to strip leading slashes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recip=
e/ptest-cargo.bbclass
index 30463e117b7..f4c881c2f9d 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -85,7 +85,7 @@ python do_install_ptest_cargo() {
     cargo_test_binaries_file =3D d.getVar('CARGO_TEST_BINARIES_FILES')
     rust_test_args =3D d.getVar('RUST_TEST_ARGS') or ""
=20
-    ptest_dir =3D os.path.join(dest_dir, ptest_path.lstrip('/'))
+    ptest_dir =3D oe.path.join(dest_dir, ptest_path)
     os.makedirs(ptest_dir, exist_ok=3DTrue)
=20
     test_bins =3D []
--=20
2.43.0


