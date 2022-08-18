Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E3FC32772
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 11:22:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.40523.1660821713710589828
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
	id 1oOdax-00039h-S1; Thu, 18 Aug 2022 13:21:51 +0200
Received: from jlu by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oOdax-0000eJ-2n; Thu, 18 Aug 2022 13:21:51 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 2/2] openssh: add support for config snippet includes
 to ssh and sshd
Date: Thu, 18 Aug 2022 13:17:03 +0200
Message-Id: <20220818111703.1858-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220818111703.1858-1-jlu@pengutronix.de>
References: <20220818111703.1858-1-jlu@pengutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/169519

This makes it simpler to set specific ssh/sshd config options by adding
snippet files to /etc/ssh/ssh_config.d/ or /etc/ssh/sshd_config.d/
instead of modifying a copy of the full configuration file. As new
snippets can be added from separate recipes, targeted changes can be
done in multiple layers.

These specific directories are also used in Debian's default
configuration.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/recipes-connectivity/openssh/openssh/ssh_config  | 2 ++
 meta/recipes-connectivity/openssh/openssh/sshd_config | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
index 05eecb465ff0..ca70f3737596 100644
--- a/meta/recipes-connectivity/openssh/openssh/ssh_config
+++ b/meta/recipes-connectivity/openssh/openssh/ssh_config
@@ -17,6 +17,8 @@
 # list of available options, their meanings and defaults, please see the
 # ssh_config(5) man page.
 
+Include /etc/ssh/ssh_config.d/*.conf
+
 Host *
   ForwardAgent yes
   ForwardX11 yes
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index 9c5380589013..e9eaf9315775 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -10,6 +10,8 @@
 # possible, but leave them commented.  Uncommented options override the
 # default value.
 
+Include /etc/ssh/sshd_config.d/*.conf
+
 #Port 22
 #AddressFamily any
 #ListenAddress 0.0.0.0
-- 
2.20.1


