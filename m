Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9244.1585753103325444564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeov-00011d-IP; Wed, 01 Apr 2020 16:58:21 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeou-0003Fy-Sr; Wed, 01 Apr 2020 16:58:20 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 2/5] lib/oe/package_manager: fix handling of last package
Date: Wed,  1 Apr 2020 16:58:02 +0200
Message-Id: <20200401145805.6936-3-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200401145805.6936-1-jlu@pengutronix.de>
References: <20200401145805.6936-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

In commit 7d214b34e11dc57316ed5c1c7747c4601286f6d2, only the code in the
for loop was modified to store the pkgarch value. The code used if there
was no empty line at the end was not modified.

Instead of fixing the duplicated code, remove it and just make sure that
a final empty line is processed.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/lib/oe/package_manager.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index dfe4197ce1fb..072372892732 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -41,7 +41,7 @@ def opkg_query(cmd_output):
     filename = ""
     dep = []
     pkgarch = ""
-    for line in cmd_output.splitlines():
+    for line in cmd_output.splitlines()+['']:
         line = line.rstrip()
         if ':' in line:
             if line.startswith("Package: "):
@@ -80,12 +80,6 @@ def opkg_query(cmd_output):
             dep = []
             pkgarch = ""
 
-    if pkg:
-        if not filename:
-            filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
-        output[pkg] = {"arch":arch, "ver":ver,
-                "filename":filename, "deps": dep }
-
     return output
 
 def failed_postinsts_abort(pkgs, log_path):
-- 
2.26.0.rc2

