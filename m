Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: EwEvlLpmdZ8JnYsfICkVqPB4YXJhIr3r0w4bdOGl70ap6rfmrUx8qu6D6hUS4AdmhDT7RucHLZ
 a0n3Ca9WCskA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:10 -0700
IronPort-SDR: r+CyMcSr6Eg1G/uAWX1oaPSQdcj2QilEkH32Z2pgldka13G/KTNLH1Lx6TYusLO3ZZ1/yGr7sT
 u0Feh9+0gSJQ==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391185"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 09/13] lib/oe/package_manager: avoid installing provided packages via apt
Date: Mon,  6 Apr 2020 23:11:37 +0800
Message-Id: <978eeeb7c975441e5b05253a63b9d954af2b903b.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

If there already is a package providing (and conflicting against)
packages what should be installed, apt will try remove the conflicting
package (target-sdk-provides-dummy) and any that depend on it (like apt
and dpkg). This usually fails because of the protection of essential
packages. In that case, no -dev/-dbg packages are installed to the SDK.

Avoid this problem by checking which packages are already provided and
removing them from the list to be installed. Also sort the list to make
it easier to read when debugging.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ffb339dd55f8ca7c952fd3390608510f772e19f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e6319dc3b8..4d9e501f0e 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -578,6 +578,11 @@ class PackageManager(object, metaclass=ABCMeta):
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
@@ -589,10 +594,15 @@ class PackageManager(object, metaclass=ABCMeta):
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
2.25.1

