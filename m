Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEE5C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 18:36:18 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.8520.1655318174167872283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 11:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PDvIq//a;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4ABA2100003;
	Wed, 15 Jun 2022 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655318171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3CaEZhDoihDqItQWvD+Tp4LBq+6fGSWTMemCeSEOjpg=;
	b=PDvIq//azisc2ZML5hFenKHXKVcFGYYbvPyQtX/rSy+wjkTW0LUowwQwjyB34ovghnXopW
	v9yXrkPcHBtsrDp4MG7f7fvGn4y+DX1AzxuAOOZWBeltMpRu9AbAbzyTLm/3/JS7l9N9d4
	4NhbjD7ii47n4+X+qqi6K75Q2ZNEpCbanq56ANk8VqacaYE+kDs4ClSBwJ+kZUL6PHY1lg
	692Xx6rxpCBi7DDDkhE1LEoUsEsGMd8vzxAsJTTXRuAfFLQjtlL0XStduhVvdkiVwa42g2
	4Tvvq8Ma1y8oYuuM0ch4W0Fm1I9EZboO1X+bWc2aXuoj84ZMUXPupFdeWS4vhg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] rootfs-postcommands.bbclass: correct comments
Date: Wed, 15 Jun 2022 20:36:04 +0200
Message-Id: <20220615183604.1165784-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 18:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166991

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 3f9fdb602d..452b87f9b3 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -1,5 +1,5 @@
 
-# Zap the root password if debug-tweaks feature is not enabled
+# Zap the root password if debug-tweaks and empty-root-password features are not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
@@ -8,7 +8,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-root-login is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
 
-# Enable postinst logging if debug-tweaks is enabled
+# Enable postinst logging if debug-tweaks or post-install-logging is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
@@ -140,7 +140,7 @@ read_only_rootfs_hook () {
 }
 
 #
-# This function is intended to disallow empty root password if 'debug-tweaks' is not in IMAGE_FEATURES.
+# This function disallows empty root passwords
 #
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
@@ -202,7 +202,7 @@ python sort_passwd () {
 }
 
 #
-# Enable postinst logging if debug-tweaks is enabled
+# Enable postinst logging
 #
 postinst_enable_logging () {
 	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default
-- 
2.34.1


