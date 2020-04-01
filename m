Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9243.1585753103295444168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeov-00011i-IR; Wed, 01 Apr 2020 16:58:21 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeou-0003G8-VU; Wed, 01 Apr 2020 16:58:20 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 5/5] lib/oe/package_manager: don't try to rm /var/lib/opkg
Date: Wed,  1 Apr 2020 16:58:05 +0200
Message-Id: <20200401145805.6936-6-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200401145805.6936-1-jlu@pengutronix.de>
References: <20200401145805.6936-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

As opkglibdir starts with a /, os.path.join will ignore
self.target_rootfs, leading to an attempt to remove /var/lib/opkg.

This only fails if it exists on the host, explaining why this remained
undiscovered for long.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/lib/oe/package_manager.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2a5d7ef539e6..b0660411eaf5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1796,8 +1796,7 @@ class DpkgPM(OpkgDpkgPM):
             open(os.path.join(target_dpkg_dir, "available"), "w+").close()
 
     def remove_packaging_data(self):
-        bb.utils.remove(os.path.join(self.target_rootfs,
-                                     self.d.getVar('opkglibdir')), True)
+        bb.utils.remove(self.target_rootfs + self.d.getVar('opkglibdir'), True)
         bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
 
     def fix_broken_dependencies(self):
-- 
2.26.0.rc2

