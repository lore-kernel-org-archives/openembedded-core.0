Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9245.1585753103325573302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeov-00011e-IQ; Wed, 01 Apr 2020 16:58:21 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeou-0003Fw-RU; Wed, 01 Apr 2020 16:58:20 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 1/5] lib/oe/package_manager: make sure to not remove packages in apt install
Date: Wed,  1 Apr 2020 16:58:01 +0200
Message-Id: <20200401145805.6936-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200401145805.6936-1-jlu@pengutronix.de>
References: <20200401145805.6936-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

apt install can decide to remove already installed packages if there are
conflicts. Avoid this by explicitly specifying --no-remove. This will
then cause a "E: Packages need to be removed but remove is disabled."
message.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2ea8046332af..dfe4197ce1fb 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1624,7 +1624,7 @@ class DpkgPM(OpkgDpkgPM):
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        cmd = "%s %s install --force-yes --allow-unauthenticated %s" % \
+        cmd = "%s %s install --force-yes --allow-unauthenticated --no-remove %s" % \
               (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
 
         try:
-- 
2.26.0.rc2

