Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B6FCAC583
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:41:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19955.1757515297326890789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A164D16F2
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 07:41:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B9D13F694
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 07:41:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wic: add --extra-space back for compatibility
Date: Wed, 10 Sep 2025 15:41:31 +0100
Message-ID: <20250910144131.2492453-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223223

The --extra-space argument was renamed to --extra-filesystem-space to
be clear what space is being added to, but this breaks existing wic
files.

Add back --extra-space as an alias for --extra-file-system-space so that
existing wks files don't fail.

[1] oe-core 39d10137b86 ("wic: rename wks flag --extra-space to --extra-f=
ilesystem-space")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/wic/ksparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 705f9897508..a762d3b6cf4 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -153,7 +153,7 @@ class KickStart():
         part.add_argument('--exclude-path', nargs=3D'+')
         part.add_argument('--include-path', nargs=3D'+', action=3D'appen=
d')
         part.add_argument('--change-directory')
-        part.add_argument('--extra-filesystem-space', type=3Dsizetype("M=
"))
+        part.add_argument('--extra-filesystem-space', '--extra-space', t=
ype=3Dsizetype("M"))
         part.add_argument('--extra-partition-space', type=3Dsizetype("M"=
))
         part.add_argument('--fsoptions', dest=3D'fsopts')
         part.add_argument('--fspassno', dest=3D'fspassno')
--=20
2.43.0


