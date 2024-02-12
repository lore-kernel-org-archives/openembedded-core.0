Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55E3C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 21:44:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.19231.1707774289058615306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 13:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rZe6Y-00015n-PP; Mon, 12 Feb 2024 22:44:46 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1rZe6X-000MXw-Qg; Mon, 12 Feb 2024 22:44:45 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1rZe6X-008t6F-2U;
	Mon, 12 Feb 2024 22:44:45 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] rootfs-postcommands: remove make_zimage_symlink_relative()
Date: Mon, 12 Feb 2024 22:44:12 +0100
Message-Id: <20240212214412.2118209-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 21:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195362

This does not seem to have any purpose anymore since the pkg_postinst
from kernel.bbclass always creates relative symlinks from zImage to
zImage-${KERNEL_VERSION}.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 3d05ff3b28..e81b69a239 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -364,12 +364,6 @@ remove_init_link () {
 	fi
 }
 
-make_zimage_symlink_relative () {
-	if [ -L ${IMAGE_ROOTFS}/boot/zImage ]; then
-		(cd ${IMAGE_ROOTFS}/boot/ && for i in `ls zImage-* | sort`; do ln -sf $i zImage; done)
-	fi
-}
-
 python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
-- 
2.39.2


