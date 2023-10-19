Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F7FCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:41:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27876.1697722857234473903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 06:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D94FB2F4;
	Thu, 19 Oct 2023 06:41:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54F423F5A1;
	Thu, 19 Oct 2023 06:40:56 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] patchtest: sort when reading patches from a directory
Date: Thu, 19 Oct 2023 14:40:53 +0100
Message-Id: <20231019134054.2524949-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 13:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189459

From: Ross Burton <ross.burton@arm.com>

When reading patches from a directory it's important to sort the output
of os.listdir(), as that returns the files in an effectively random
order.  We can't test the patches apply if they're applied in the wrong
order, and typically patch filenames are prefixed with a counter to
ensure the order is correct.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/patchtest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 642486b8c7f..c47b05b7d47 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -172,7 +172,7 @@ def main():
     patch_list =3D None
=20
     if os.path.isdir(patch_path):
-        patch_list =3D [os.path.join(patch_path, filename) for filename =
in os.listdir(patch_path)]
+        patch_list =3D [os.path.join(patch_path, filename) for filename =
in sorted(os.listdir(patch_path))]
     else:
         patch_list =3D [patch_path]
=20
--=20
2.34.1


