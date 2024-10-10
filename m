Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75659CF07B1
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 06:30:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.37291.1728541854940797475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 23:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1symhB-0005vp-6Y; Thu, 10 Oct 2024 08:30:45 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1symhA-000mLR-63; Thu, 10 Oct 2024 08:30:44 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1symhA-006tnW-0O;
	Thu, 10 Oct 2024 08:30:44 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v8 4/7] oeqa/utils/qemurunner: support ignoring vt100 escape sequences
Date: Thu, 10 Oct 2024 08:29:38 +0200
Message-Id: <20241010062941.1644325-5-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010062941.1644325-1-ejo@pengutronix.de>
References: <20241010062941.1644325-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 06:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205379

From: Enrico Jorns <ejo@pengutronix.de>

If we talk to terminals that like colors, we need to ignore the vt100
escape sequences when matching strings.

An unprocessed barebox console prompt would e.g. look like:

  ESC[1;32mbarebox@ESC[1;36mARM QEMU virt64:/ESC[0m

where we cannot match for something like "barebox@ARM QEMU virt64:/".
The same applies to colored Linux terminal output of course.

The "\x1b\[" from the regex catches the standard start of ANSI escape
sequence while the rest catches the actual command code executed.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cda43aad8c..63fc6f6b53 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -30,6 +30,8 @@ control_range = list(range(0,32))+list(range(127,160))
 control_chars = [chr(x) for x in control_range
                 if chr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
+# Regex to remove the ANSI (color) control codes from console strings in order to match the text only
+re_vt100 = re.compile(r'(\x1b\[|\x9b)[^@-_a-z]*[@-_a-z]|\x1b[@-_a-z]')
 
 def getOutput(o):
     import fcntl
@@ -681,7 +683,7 @@ class QemuRunner:
                     time.sleep(0.1)
                     answer = self.server_socket.recv(1024)
                     if answer:
-                        data += answer.decode('utf-8')
+                        data += re_vt100.sub("", answer.decode('utf-8'))
                         # Search the prompt to stop
                         if re.search(self.boot_patterns['search_cmd_finished'], data):
                             break
-- 
2.39.5


