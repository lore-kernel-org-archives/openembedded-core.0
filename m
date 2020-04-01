Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9241.1585753103281714408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeov-00011g-IQ; Wed, 01 Apr 2020 16:58:21 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeou-0003G0-Tp; Wed, 01 Apr 2020 16:58:20 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 3/5] lib/oe/package_manager: collect provided package names when using debs
Date: Wed,  1 Apr 2020 16:58:03 +0200
Message-Id: <20200401145805.6936-4-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200401145805.6936-1-jlu@pengutronix.de>
References: <20200401145805.6936-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

This is needed for a later change to avoid installing packages which are
already provided by an installed package.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/lib/oe/package_manager.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 072372892732..e862915b1b75 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -40,6 +40,7 @@ def opkg_query(cmd_output):
     ver = ""
     filename = ""
     dep = []
+    prov = []
     pkgarch = ""
     for line in cmd_output.splitlines()+['']:
         line = line.rstrip()
@@ -64,6 +65,10 @@ def opkg_query(cmd_output):
                     dep.append("%s [REC]" % recommend)
             elif line.startswith("PackageArch: "):
                 pkgarch = line.split(": ")[1]
+            elif line.startswith("Provides: "):
+                provides = verregex.sub('', line.split(": ")[1])
+                for provide in provides.split(", "):
+                    prov.append(provide)
 
         # When there is a blank line save the package information
         elif not line:
@@ -72,12 +77,13 @@ def opkg_query(cmd_output):
                 filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
             if pkg:
                 output[pkg] = {"arch":arch, "ver":ver,
-                        "filename":filename, "deps": dep, "pkgarch":pkgarch }
+                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
             pkg = ""
             arch = ""
             ver = ""
             filename = ""
             dep = []
+            prov = []
             pkgarch = ""
 
     return output
@@ -355,7 +361,7 @@ class DpkgPkgsList(PkgsList):
                "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
                "-W"]
 
-        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
+        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\nProvides: ${Provides}\n\n")
 
         try:
             cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
-- 
2.26.0.rc2

