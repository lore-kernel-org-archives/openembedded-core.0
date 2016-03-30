Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EDB1362133
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 09:35:21 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1alCX2-0003fy-Hd from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2016 02:35:20 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 30 Mar 2016 10:35:19 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 14:35:15 +0500
Message-ID: <1459330515-11129-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][jethro][PATCH] systemd-serialgetty: allow baud rate overriding
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
X-List-Received-Date: Wed, 30 Mar 2016 09:35:22 -0000
Content-Type: text/plain

In case a getty is required on a UART which is not being
used as the kernel console, the current agetty invocation
fails to obey the baud rate configured through the
SERIAL_CONSOLES variable because it uses --keep-baud.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 182167b..e8b027e 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -21,7 +21,7 @@ IgnoreOnIsolate=yes
 
 [Service]
 Environment="TERM=xterm"
-ExecStart=-/sbin/agetty -8 -L --keep-baud %I @BAUDRATE@ $TERM
+ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
 RestartSec=0
-- 
1.9.1


