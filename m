Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6276EE47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 22:48:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1BMmJ4Z019980 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 22:48:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8Z6207abh2cZ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 22:48:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1BMmEdh019976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 22:48:15 GMT
Message-ID: <1392158889.7120.183.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2014 22:48:09 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] systemd-serialgetty: Update to match version in recent systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2014 22:48:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Whilst debugging other issues I noticed this was out of sync with the code
in systemd itself. This brings things back into sync and shouldn't hurt
anything.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 1c14dfe..46c15ed 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -20,7 +20,7 @@ Before=getty.target
 IgnoreOnIsolate=yes
 
 [Service]
-ExecStart=-/sbin/agetty -s %I @BAUDRATE@ vt102
+ExecStart=-/sbin/agetty --keep-baud %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
 RestartSec=0
@@ -30,7 +30,4 @@ TTYReset=yes
 TTYVHangup=yes
 KillMode=process
 IgnoreSIGPIPE=no
-
-# Some login implementations ignore SIGTERM, so we send SIGHUP
-# instead, to ensure that login terminates cleanly.
-KillSignal=SIGHUP
+SendSIGHUP=yes



