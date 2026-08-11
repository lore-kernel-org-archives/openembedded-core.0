Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0215FC5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:44:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51412.1786445074832847409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=blAq7o+Q;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 455141682
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:44:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA88D3F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786445074; bh=o24mvEXiw2cUEe/bqjBapVv1eMWwcn4GJE17/neWg70=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=blAq7o+QJRkjqxQTEoDKDQsdGjy7a7uxGcD9yFOu7ypW2Imm6pnNdhcQS46W3juhb
	 g30oJ+42eJ57ZriPwhXQYPaGLueJ3ZgdwamEGyw42kWuACu9ZwiE5PPlKVgp6KoZFC
	 o6v6ti0bZY4obJXU09d8M1SIy/wPxkEcNtKkVRuY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/ptest-cargo: add explanatory comment
Date: Tue, 11 Aug 2026 11:44:28 +0100
Message-ID: <20260811104428.1875677-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811104428.1875677-1-ross.burton@arm.com>
References: <20260811104428.1875677-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243185

Add a comment to avoid someone else in the future wasting their time by
having the the idea of stripping the cargo hash from the test binary
filenames.

Some packages, notably librsvg, build multiple tests with the same base
name that are differentiated by the hash:

  primitives-3fd9d71b0a55e20a
  reference-00d9b406d910a645
  render_crash-c88a2b880ba97e09
  rsvg_convert-b43bd2236753f43d
  rsvg_convert-eef250e6c0174413
  rsvg_convert-f70976dd6cda88b0
  rsvg-eec8e799568381a3

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recip=
e/ptest-cargo.bbclass
index f4c881c2f9d..2e008b306a8 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -95,6 +95,8 @@ python do_install_ptest_cargo() {
=20
     test_paths =3D []
     for test_bin in test_bins:
+        # Note that we can't strip the hash from the filename as some pa=
ckages
+        # (eg librsvg) have multiple binaries with the same prefix.
         shutil.copy2(test_bin, ptest_dir)
         test_paths.append(os.path.join(ptest_path, os.path.basename(test=
_bin)))
=20
--=20
2.43.0


