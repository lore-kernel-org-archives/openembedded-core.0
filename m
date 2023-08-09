Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67027C0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:08:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89041.1691590098650971260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 07:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EDE8D75;
	Wed,  9 Aug 2023 07:09:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 489663F59C;
	Wed,  9 Aug 2023 07:08:17 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] connman-conf: don't take over any ethernet devices, not just eth0
Date: Wed,  9 Aug 2023 15:08:15 +0100
Message-Id: <20230809140815.3024077-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185703

From: Ross Burton <ross.burton@arm.com>

The goal of connman-conf in qemu environments is to stop connman from
trying to control the network device, because runqemu will set it up
appropriately.

It currently hardcodes eth0, but 6.2 kernels onwards will rename eth0 to
en* even when the interface is already up[1]. So that this recipe
continues to work as intended, expand the list to "eth,en" so that
connman ignores _all_ ethernet devices with either the new or old names.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it?id=3Dbd039b5ea2a91ea707ee8539df26456bd5be80af

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/connman/connman-conf/main.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf/main.conf b/m=
eta/recipes-connectivity/connman/connman-conf/main.conf
index a394e8f25bd..3c9dd396f66 100644
--- a/meta/recipes-connectivity/connman/connman-conf/main.conf
+++ b/meta/recipes-connectivity/connman/connman-conf/main.conf
@@ -1,2 +1,2 @@
 [General]
-NetworkInterfaceBlacklist =3D eth0
+NetworkInterfaceBlacklist =3D eth,en
--=20
2.34.1


