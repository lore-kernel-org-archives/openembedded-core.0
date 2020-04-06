Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.10462.1586179444031548108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 06:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jLRjO-0007lw-3g; Mon, 06 Apr 2020 15:24:02 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jLRjN-0003MW-2M; Mon, 06 Apr 2020 15:24:01 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH] apt-native: don't let dpkg overwrite files by default
Date: Mon,  6 Apr 2020 15:23:57 +0200
Message-Id: <20200406132357.12858-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

With --force-overwrite (implied by --force-all), dpkg will not abort
when a package overwrites files from different packages. As this can
also lead to "The following package disappeared from your system as
all files have been overwritten by other packages: <package>" and
subsequently broken dependencies, this makes the simple case of
conflicting files hard to debug.

Instead of finding all possibly required force options, only disable
overwrite for now.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/recipes-devtools/apt/files/apt.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index 03351356bc01..c95a5b07af54 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -39,4 +39,4 @@ APT
   };
 };
 
-DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
+DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-force-overwrite";"--no-debsig"};
-- 
2.26.0.rc2

