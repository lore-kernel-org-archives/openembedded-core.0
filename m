Return-Path: <martijn.de.gouw@prodrive-technologies.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790A0E92733
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:38:02 +0000 (UTC)
Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
 by mx.groups.io with SMTP id smtpd.web11.25264.1696534673145290840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: prodrive-technologies.com, ip: 212.61.153.67, mailfrom: martijn.de.gouw@prodrive-technologies.com)
Received: from EXC03.bk.prodrive.nl (10.1.1.212) by EXC05.bk.prodrive.nl
 (10.1.1.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.32; Thu, 5
 Oct 2023 21:37:51 +0200
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXC03.bk.prodrive.nl
 (10.1.1.212) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 5 Oct 2023 21:37:51 +0200
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: <openembedded-core@lists.openembedded.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Subject: [PATCH] busybox: Set PATH in syslog initscript
Date: Thu, 5 Oct 2023 21:37:49 +0200
Message-ID: <20231005193749.3832781-1-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188735

This script is not always called with /sbin and /usr/sbin in the PATH
already, for example when called via ssh. Explicitly set PATH to make
sure it includes /sbin and /usr/sbin since that's where start-stop-daemon
is located.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
 meta/recipes-core/busybox/files/syslog | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/bus=
ybox/files/syslog
index 2208613e8c..a4fea30ab7 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -10,6 +10,8 @@
=20
 set -e
=20
+PATH=3D"/bin:/usr/bin:/sbin:/usr/sbin"
+
 if [ -f /etc/syslog-startup.conf ]; then
 	. /etc/syslog-startup.conf
 	LOG_LOCAL=3D0
--=20
2.30.2


