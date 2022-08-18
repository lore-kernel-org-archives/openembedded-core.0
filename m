Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652E2C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 11:22:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.40524.1660821714153564658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 04:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oOdax-00039g-S0; Thu, 18 Aug 2022 13:21:51 +0200
Received: from jlu by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oOdax-0000eH-20; Thu, 18 Aug 2022 13:21:51 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 1/2] openssh: sync local ssh_config + sshd_config
 files with upstream 8.7p1
Date: Thu, 18 Aug 2022 13:17:02 +0200
Message-Id: <20220818111703.1858-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 11:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169520

Changes are caused by the removal of deprecated options.

ChallengeResponseAuthentication was replaced by
KbdInteractiveAuthentication in the SSHv2 protocol, see
https://www.openssh.com/txt/release-8.7

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../openssh/openssh/ssh_config                    |  4 ++--
 .../openssh/openssh/sshd_config                   | 15 +++++++--------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
index e0d023803eb3..05eecb465ff0 100644
--- a/meta/recipes-connectivity/openssh/openssh/ssh_config
+++ b/meta/recipes-connectivity/openssh/openssh/ssh_config
@@ -1,4 +1,4 @@
-#	$OpenBSD: ssh_config,v 1.33 2017/05/07 23:12:57 djm Exp $
+#	$OpenBSD: ssh_config,v 1.35 2020/07/17 03:43:42 dtucker Exp $
 
 # This is the ssh client system-wide configuration file.  See
 # ssh_config(5) for more information.  This file provides defaults for
@@ -36,7 +36,6 @@ Host *
 #   IdentityFile ~/.ssh/id_ecdsa
 #   IdentityFile ~/.ssh/id_ed25519
 #   Port 22
-#   Protocol 2
 #   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
 #   MACs hmac-md5,hmac-sha1,umac-64@openssh.com
 #   EscapeChar ~
@@ -46,3 +45,4 @@ Host *
 #   VisualHostKey no
 #   ProxyCommand ssh -q -W %h:%p gateway.example.com
 #   RekeyLimit 1G 1h
+#   UserKnownHostsFile ~/.ssh/known_hosts.d/%k
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index 15f061b570a4..9c5380589013 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -1,4 +1,4 @@
-#	$OpenBSD: sshd_config,v 1.102 2018/02/16 02:32:40 djm Exp $
+#	$OpenBSD: sshd_config,v 1.104 2021/07/02 05:11:21 dtucker Exp $
 
 # This is the sshd server system-wide configuration file.  See
 # sshd_config(5) for more information.
@@ -57,9 +57,9 @@ AuthorizedKeysFile	.ssh/authorized_keys
 #PasswordAuthentication yes
 #PermitEmptyPasswords no
 
-# Change to yes to enable challenge-response passwords (beware issues with
-# some PAM modules and threads)
-ChallengeResponseAuthentication no
+# Change to yes to enable keyboard-interactive authentication (beware issues
+# with some PAM modules and threads)
+KbdInteractiveAuthentication no
 
 # Kerberos options
 #KerberosAuthentication no
@@ -73,13 +73,13 @@ ChallengeResponseAuthentication no
 
 # Set this to 'yes' to enable PAM authentication, account processing,
 # and session processing. If this is enabled, PAM authentication will
-# be allowed through the ChallengeResponseAuthentication and
+# be allowed through the KbdInteractiveAuthentication and
 # PasswordAuthentication.  Depending on your PAM configuration,
-# PAM authentication via ChallengeResponseAuthentication may bypass
+# PAM authentication via KbdInteractiveAuthentication may bypass
 # the setting of "PermitRootLogin without-password".
 # If you just want the PAM account and session checks to run without
 # PAM authentication, then enable this but set PasswordAuthentication
-# and ChallengeResponseAuthentication to 'no'.
+# and KbdInteractiveAuthentication to 'no'.
 #UsePAM no
 
 #AllowAgentForwarding yes
@@ -92,7 +92,6 @@ ChallengeResponseAuthentication no
 #PrintMotd yes
 #PrintLastLog yes
 #TCPKeepAlive yes
-#UseLogin no
 #PermitUserEnvironment no
 Compression no
 ClientAliveInterval 15
-- 
2.20.1


