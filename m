Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213CDC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:23:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16178.1700648633881273302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VVED3nBs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3B38C0007;
	Wed, 22 Nov 2023 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700648632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ycD2kzKm6ydvL0P7dHnNBMMfgUWvlQZRoxvj6mnxC6M=;
	b=VVED3nBs7cUVcaUXn3Nm6qg4cVJ0EpVdWaQui0kgtagAdOo2CoAxdOgEUd98jCYd6vc+3w
	TkVuiYnZEkg8lwMnMjobx33MyUN4wQajONLOCSrpMS6fhRe8JFy7WiHxUCKlgxYz6Lax16
	2RnnvequAR6AfgBrzAwT16TL0no1+1Xwoip2wDsa7AxbgjQLX9qXRXWEKbBgYbXqUBCtOW
	54EEvDbekGAqIv8fcuMbH37AQfGew3bsgHfIvBYuapyEa2MdXV0ESfGTBUBMND1JAC825P
	bxRj0WFe9/vP7LtGk5uSnxsfXIEX72Lx+ehwLWs3DBDWQqpYv8NiDHJHW1NyVw==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] systemd-compat-units.bb: fix postinstall script
Date: Wed, 22 Nov 2023 11:23:48 +0100
Message-Id: <20231122102348.19755-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191055

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes an issue running "opkg upgrade" on a system with systemd
(and when there is an update to "systemd-compat-units",
for example between yocto 4.2.2 and 4.2.3):

//var/lib/opkg/info/systemd-compat-units.postinst: cd: line 3: can't cd to /etc/init.d: No such file or directory

The existence of /etc/init.d is now tested
without causing an error if doesn't exist.

Fixes [YOCTO #15292]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 253bc9fcf1..c03d97f9c9 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -27,7 +27,8 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
 
 pkg_postinst:${PN} () {
 
-	cd $D${sysconfdir}/init.d  ||  exit 0
+	test -d $D${sysconfdir}/init.d  ||  exit 0
+	cd $D${sysconfdir}/init.d
 
 	echo "Disabling the following sysv scripts: "
 
-- 
2.34.1


