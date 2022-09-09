Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBBBECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 15:57:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.683.1662739060777004074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 08:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kFN6XnE7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 37A8660003;
	Fri,  9 Sep 2022 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662739058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JSLmsUm3CGijzU9+QQDUkAvHrplqA0aOp9oo0s19va4=;
	b=kFN6XnE7tkTmig/tDxVEVUR1Q3j7LjkBOfbFD/BzoxTNiNtj8jMzUoAoxGKhWNu6k+nJr7
	20Mc3NhBCJs7w5dWdpZKjWL5pnlPBLmactMCoDDsZ4IVlG6c9GMrH4hfeTTHgOYAPGXPIu
	hAvzpYTUQTUXePBFPHpYgTw0RTrMLv7V9qrHg+joK8MPV5hx6Z+DXqLZK2D7hmgbIGfBwg
	Jp9YHjEEnzugAvYON98YxEdjabbW6FKPSYtST8/G3hIsnQsCy4Kb1CPuZG9Ms9yc2goOdG
	58H5dZ85fL6FZDtHV5AAOm3RUryc0wqTzkYfFI3+xlLe2yef9ToWJA8L+JLpZQ==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] runqemu: display host uptime when starting
Date: Fri,  9 Sep 2022 17:57:34 +0200
Message-Id: <20220909155734.2131957-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 15:57:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170493

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

In order to be able to debug issues on the host that have an impact on the
guest, it is useful to get the uptime of the host while starting so we can
match with the events in dmesg. Also include the uptime when cleaning up.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 scripts/runqemu | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index b6fc212ebe20..983f7514c759 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1505,6 +1505,9 @@ class BaseConfig(object):
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
+        with open('/proc/uptime', 'r') as f:
+            uptime_seconds = f.readline().split()[0]
+        logger.info('Host uptime: %s\n' % uptime_seconds)
         pass_fds = []
         if self.taplock_descriptor:
             pass_fds = [self.taplock_descriptor.fileno()]
@@ -1528,6 +1531,9 @@ class BaseConfig(object):
         signal.signal(signal.SIGTERM, signal.SIG_IGN)
 
         logger.info("Cleaning up")
+        with open('/proc/uptime', 'r') as f:
+            uptime_seconds = f.readline().split()[0]
+        logger.info('Host uptime: %s\n' % uptime_seconds)
         if self.cleantap:
             cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % str(cmd))
-- 
2.37.3


