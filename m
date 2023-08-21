Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39707EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:12:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9361.1692619922662170702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742A42F4;
	Mon, 21 Aug 2023 05:12:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1EECA3F762;
	Mon, 21 Aug 2023 05:12:01 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] linux/generate-cve-exclusions.py: fix comparison
Date: Mon, 21 Aug 2023 13:11:58 +0100
Message-Id: <20230821121159.3924600-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 12:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186435

From: Ross Burton <ross.burton@arm.com>

The backport detection logic didn't handle issues which were backported
to the current version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/=
recipes-kernel/linux/generate-cve-exclusions.py
index 4d96f19fe7a..34f9ee731dc 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -70,7 +70,7 @@ def main(argp=3DNone):
                 backport_data =3D stream_data[cve]
                 if base_version in backport_data:
                     backport_ver =3D Version(backport_data[base_version]=
["fixed_version"])
-                    if backport_ver < version:
+                    if backport_ver <=3D version:
                         print(
                             f'CVE_STATUS[{cve}] =3D "cpe-stable-backport=
: Backported in {backport_ver}"'
                         )
--=20
2.34.1


