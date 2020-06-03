Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.9082.1591171967429339999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jgOVw-0002UJ-Jr; Wed, 03 Jun 2020 10:12:44 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jgOVw-0001hI-Ab; Wed, 03 Jun 2020 10:12:44 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH] classes/buildhistory: capture package config
Date: Wed,  3 Jun 2020 10:12:37 +0200
Message-Id: <20200603081237.1959-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

As the PACKAGECONFIG variable has a large influence on the resulting
package sizes and dependencies, it's useful to capture it in the
recipe-level buildhistory. This makes it straightforward to analyze the
impact of PACKAGECONFIG changes on the resulting image size.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/classes/buildhistory.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index eb7295570dbd..a4288ef9e1f5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -113,6 +113,7 @@ python buildhistory_emit_pkghistory() {
             self.packages = ""
             self.srcrev = ""
             self.layer = ""
+            self.config = ""
 
 
     class PackageInfo:
@@ -254,6 +255,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
     rcpinfo.layer = layer
+    rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
     write_recipehistory(rcpinfo, d)
 
     pkgdest = d.getVar('PKGDEST')
@@ -368,6 +370,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
         f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
         f.write(u"LAYER = %s\n" %  rcpinfo.layer)
+        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
 
     write_latest_srcrev(d, pkghistdir)
 
-- 
2.27.0

