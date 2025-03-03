Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79122C282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:15:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.57479.1741018540106150531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE57E113E
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Mar 2025 08:15:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 680613F673
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Mar 2025 08:15:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] systemd: if getty generator is disabled remove the generator, not the units
Date: Mon,  3 Mar 2025 16:15:26 +0000
Message-ID: <20250303161527.602462-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303161527.602462-1-ross.burton@arm.com>
References: <20250303161527.602462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212216

If the getty generator is disabled then it's neater to remove just the
generator tool instead of the unit files as the unit files are still
useful.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-co=
re/systemd/systemd_257.3.bb
index 324e91e0515..64fb8fe69ac 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -287,9 +287,11 @@ do_install() {
 		fi
 	fi
 	install -d ${D}/${base_sbindir}
-	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'fal=
se', 'true', d)}; then
-		# Provided by a separate recipe
-		rm ${D}${systemd_system_unitdir}/serial-getty* -f
+
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 't=
rue', 'false', d)}; then
+		# Remove the serial-getty generator and instead use explicit services
+		# created by the systemd-serialgetty recipe
+		find ${D} -name \*getty-generator\* -delete
 	fi
=20
 	# Provide support for initramfs
--=20
2.43.0


