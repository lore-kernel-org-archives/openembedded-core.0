Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9114C77B72
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.51257.1680258405587841655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086p-PZ; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-007yPe-1o; Fri, 31 Mar 2023 12:26:43 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxx-006Ahm-3L; Fri, 31 Mar 2023 12:26:41 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 07/10] oeqa/utils/qemurunner: replace hard-coded user 'root' in debug output
Date: Fri, 31 Mar 2023 12:26:19 +0200
Message-Id: <20230331102622.1468385-8-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331102622.1468385-1-ejo@pengutronix.de>
References: <20230331102622.1468385-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 10:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179416

Since login user is configurable with boot_patterns['send_login_user'],
unconditionally using 'root' in the debug message can be confusing.

Also fix the debug message to say 'Logged in' instead of 'Logged'.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 05385763ac..9d6fe4fe59 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -516,7 +516,7 @@ class QemuRunner:
             (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True, timeout=120)
             if re.search(self.boot_patterns['search_login_succeeded'], output):
                 self.logged = True
-                self.logger.debug("Logged as root in serial console")
+                self.logger.debug("Logged in as %s in serial console" % self.boot_patterns['send_login_user'].replace("\n", ""))
                 if netconf:
                     # configure guest networking
                     cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
@@ -527,7 +527,7 @@ class QemuRunner:
                         self.logger.debug("Couldn't configure guest networking")
             else:
                 self.logger.warning("Couldn't login into serial console"
-                            " as root using blank password")
+                            " as %s using blank password" % self.boot_patterns['send_login_user'].replace("\n", ""))
                 self.logger.warning("The output:\n%s" % output)
         except:
             self.logger.warning("Serial console failed while trying to login")
-- 
2.39.2


