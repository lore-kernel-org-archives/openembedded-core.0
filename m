Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.9302.1585753103304265496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 07:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeov-00011h-IR; Wed, 01 Apr 2020 16:58:21 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jJeou-0003G3-Uh; Wed, 01 Apr 2020 16:58:20 +0200
From: "Jan Luebbe" <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [OE-core][PATCH 4/5] lib/oe/package_manager: avoid installing provided packages via apt
Date: Wed,  1 Apr 2020 16:58:04 +0200
Message-Id: <20200401145805.6936-5-jlu@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200401145805.6936-1-jlu@pengutronix.de>
References: <20200401145805.6936-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

If there already is a package providing (and conflicting against)
packages what should be installed, apt will try remove the conflicting
package (target-sdk-provides-dummy) and any that depend on it (like apt
and dpkg). This usually fails because of the protection of essential
packages. In that case, no -dev/-dbg packages are installed to the SDK.

Avoid this problem by checking which packages are already provided and
removing them from the list to be installed. Also sort the list to make
it easier to read when debugging.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/lib/oe/package_manager.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e862915b1b75..2a5d7ef539e6 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -581,6 +581,11 @@ class PackageManager(object, metaclass=ABCMeta):
         # oe-pkgdata-util reads it from a file
         with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
             pkgs = self.list_installed()
+
+            provided_pkgs = set()
+            for pkg in pkgs.values():
+                provided_pkgs |= set(pkg.get('provs', []))
+
             output = oe.utils.format_pkg_list(pkgs, "arch")
             installed_pkgs.write(output)
             installed_pkgs.flush()
@@ -592,10 +597,15 @@ class PackageManager(object, metaclass=ABCMeta):
             if exclude:
                 cmd.extend(['--exclude=' + '|'.join(exclude.split())])
             try:
-                bb.note("Installing complementary packages ...")
                 bb.note('Running %s' % cmd)
                 complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
-                self.install(complementary_pkgs.split(), attempt_only=True)
+                complementary_pkgs = set(complementary_pkgs.split())
+                skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
+                install_pkgs = sorted(complementary_pkgs - provided_pkgs)
+                bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
+                    ' '.join(install_pkgs),
+                    ' '.join(skip_pkgs)))
+                self.install(install_pkgs, attempt_only=True)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not compute complementary packages list. Command "
                          "'%s' returned %d:\n%s" %
-- 
2.26.0.rc2

