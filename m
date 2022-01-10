Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC8AC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 15:37:44 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.33003.1641829062486755885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OPE6xPGp;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641829063;
  x=1673365063;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9XDKrsHXpHF/I7wgMOkfMzCU6eM6tLL8fNHGbRGGnyk=;
  b=OPE6xPGpEGmu9kyY4198702vHVpqygM0eQkMXZaS9YDbXl94mwzAOE5Q
   w0eRmEMiT1iCOpYEby+dt/dD6uKcrKqUF/uz3rb76hyhpCAXh+Zxt/g+T
   C43ikh+2zUlJTJdF48eMn3r1f1BcNRIFmC4Ou2dEKCk4Grvl5r0NOxQjn
   nJQG3/JuqsQhD3a/OAV5muwUDray3DVbrxYOSYvYll3wAoSIkQhzMNPQn
   j78r9cXlvFJLiaQi/yZpCI2MQj/fs6mQ9tp4BlVBsMr0rGjTE/zdHqzCr
   DNxesE3fdrC2nMob8t5D4yUXPZFAdEa1J/ZXtPSAvaZBPS+26gFJLW6gS
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rootfs-postcommands.bbclass: Change the default.target
 location
Date: Mon, 10 Jan 2022 16:37:33 +0100
Message-ID: <20220110153733.29006-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 15:37:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160370

Rather than adding a default.target in /etc/systemd/system, modify the
one in /usr/lib/systemd/system.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/rootfs-postcommands.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a3f96ef7ed..713ae5bfe0 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -218,8 +218,9 @@ postinst_enable_logging () {
 # Modify systemd default target
 #
 set_systemd_default_target () {
-	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ]; then
-		ln -sf ${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
+	if [ "${SYSTEMD_DEFAULT_TARGET}" ] &&
+	   [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ]; then
+		ln -sf ${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${systemd_system_unitdir}/default.target
 	fi
 }
 

