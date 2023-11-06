Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94CFC4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:55:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51567.1699268154049081747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E9A71FB;
	Mon,  6 Nov 2023 02:56:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BED9B3F64C;
	Mon,  6 Nov 2023 02:55:52 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][master v2] poky-tiny: fix PACKAGE_EXCLUDE
Date: Mon,  6 Nov 2023 10:55:50 +0000
Message-Id: <20231106105550.501389-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 10:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190201

From: Ross Burton <ross.burton@arm.com>

poky-tiny does a PACKAGE_EXCLUDE on shadow-base as the kernel doesn't
support multiple users.  However it does this by assigning to an
override, which makes it impossible for images or machines to extend
PACKAGE_EXCLUDE with their own exclusions.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-tiny.conf
index 32c2ec3e1fa..24bcbee9bb6 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -125,4 +125,4 @@ PACKAGECONFIG:remove:pn-opkg-utils =3D "python"
=20
 # If shadow-base is brought into the image, logins will fail because it
 # doesn't have the heuristics to work when CONFIG_MULTIUSER is unset.
-PACKAGE_EXCLUDE:poky-tiny =3D "shadow-base"
+PACKAGE_EXCLUDE +=3D "shadow-base"
--=20
2.34.1


