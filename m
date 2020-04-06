Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LwtXY0ZJQuqmP5k0dtQU9qxuOYfOuP58opBNbeBuPzwftVwycRYYy9IQwHM34udHNUYxQ/3H1G
 qdvI95ns4L6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:08 -0700
IronPort-SDR: vuvOFN9XCbvtcj94WdIvdSz9D2Y+y03LfqbruIMBVR5Aa5z4uZNKSGGNeOHD1FGnQzskgLT66a
 xXWbXFOBgMiQ==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391179"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 08/13] lib/oe/package_manager: collect provided package names when using debs
Date: Mon,  6 Apr 2020 23:11:36 +0800
Message-Id: <1bedfdf58d3ebd06126aa45c7bdc84e66c750725.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

This is needed for a later change to avoid installing packages which are
already provided by an installed package.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad72dfaaa2caf2c39d033dc1682f0bbbbe45dbbd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 27b2f17f95..e6319dc3b8 100644
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
@@ -354,7 +360,7 @@ class DpkgPkgsList(PkgsList):
                "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
                "-W"]
 
-        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
+        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\nProvides: ${Provides}\n\n")
 
         try:
             cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
-- 
2.25.1

