Return-Path: <ivan.nestlerode@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9171C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 20:37:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33344.1784666240065728806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 13:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VxgPQTVU;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+ivan.nestlerode.sonos.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C938E60A6B;
	Tue, 21 Jul 2026 20:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E67EC2BCC7;
	Tue, 21 Jul 2026 20:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784666238;
	bh=LR6aQisfHiSe7prxsA0dqqzmZs4oiE8DamHxE8K6v44=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VxgPQTVUNsByH1NyKsR+51on41EZ6eOJt7O03F2sYOdRGNUq/8j7qOLBrVoKgiz4n
	 97dbKvwy3rhdBO+jk3rMGunm9SP5R3LZbDS1eTMQ34U2yB6PIOLwgVOoULquObj77w
	 2aZ6vdRRzzaIGJTes41dO/mz7+Ryij7c8M4teSqlZl+GB6q3E2mZB4tFaOyly9YNoW
	 mHEVaWJgJ2UFXA8o5e2jy+BwlGfYmKu/PorwMuDFQRghnlCBqDHrdTl67uywFuEjSV
	 2Z1qr3qgaVNwTYSut4AjBm7+wMVWEL4yIrudiEIZbz1Ea4ZHfIcSdEqi25f90YGwJk
	 QRMMiHqX+OvBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECCCC4452D;
	Tue, 21 Jul 2026 20:37:18 +0000 (UTC)
From: Ivan Nestlerode via B4 Relay <devnull+ivan.nestlerode.sonos.com@kernel.org>
Date: Tue, 21 Jul 2026 16:37:06 -0400
Subject: [PATCH] mpg123: fix lack of NEON usage on aarch64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-fix_mpg123_aarch64_neon-v1-1-b5cc73ff9d10@sonos.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TnBXMegrEWK11h6yUIgg+nvSc
 WBmHiichQv0zQOZLylypArYNjBvIa2sZKkMpMnpjlBFuf1+rkjGh5DnzVmf+EjK2KjNYggni1D
 rM3NV//Mwvu8HgFbqemkAAAA=
X-Change-ID: 20260721-fix_mpg123_aarch64_neon-34f03d321b41
To: openembedded-core@lists.openembedded.org
Cc: Ivan Nestlerode <ivan.nestlerode@sonos.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784666237; l=1526;
 i=ivan.nestlerode@sonos.com; s=20260504; h=from:subject:message-id;
 bh=KVry7zihjl+u7ivKUjf42xSXaxtMInvV9UYsERPzfmU=;
 b=umktnFQ56Cc/ymX0hg/W0L6PY9LmKxOA5sdM5EHuI3ggXf8FeFG96+e9OQ1rCTgXK/4m7BSqD
 hA611+9u8RiBOP+ugS+ZKN3yrv/N1VXX4g0oekHBSrn0Wo0SH7Hpq2n
X-Developer-Key: i=ivan.nestlerode@sonos.com; a=ed25519;
 pk=kcjfcLwbjs7Fqv95W59a7YVW52AGAkgpAOoPa23YKXU=
X-Endpoint-Received: by B4 Relay for ivan.nestlerode@sonos.com/20260504
 with auth_id=767
X-Original-From: Ivan Nestlerode <ivan.nestlerode@sonos.com>
Reply-To: ivan.nestlerode@sonos.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 20:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241576

From: Ivan Nestlerode <ivan.nestlerode@sonos.com>

Fixes [YOCTO #16359]

mpg123 supports specific --with-cpu= configure options to use NEON
instructions, but this recipe was not using any of these on aarch64.
The problem is that it was only keying off of whether TUNE_FEATURES
contains "neon". aarch64 never puts "neon" into TUNE_FEATURES so it
has to be checked separately.

Use --with-cpu=neon64 on aarch64.

Signed-off-by: Ivan Nestlerode <ivan.nestlerode@sonos.com>
---
The mpg123 recipe has a bug on aarch64 that makes it not use NEON.
This patch series fixes that bug.
---
 meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
index f07e6dbcd3..7fa048c9fc 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
@@ -42,6 +42,7 @@ EXTRA_OECONF = " \
     --enable-largefile \
     --with-audio='${AUDIOMODS}' \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '--with-cpu=neon64', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-cpu=generic_nofpu', '', d)} \
 "

---
base-commit: a4eb7bc2a750f76d9772eb88b7afb2b801bd1250
change-id: 20260721-fix_mpg123_aarch64_neon-34f03d321b41

Best regards,
-- 
Ivan Nestlerode <ivan.nestlerode@sonos.com>



