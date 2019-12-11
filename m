Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 826937FBAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:48:23 +0000 (UTC)
IronPort-SDR: A8B++K27kJBECifQlVse3YhYSqQiNYfnOj++f3o7qxXfb1vagBmiAq/daKzozIbJKbA5G70RpM
	XxCkfVxVAkFDDh8bq/Ig492Z2jEsN9RegjQRW5dYg88TLeQa2vHF9FoDZ5av16o64hHiAzwOye
	kQ7wt7qtcv9MREUteUcR3A2yp56/LIsW+e0m4fi1+MzH98lEurpMPOmQ9pPxVKNqboq03vrA8y
	zk/nIgLQhXoDe387qy89tB4bcT0Il99OLYdy5ifbJ216eySfd4QYryGLtHMocZVwPhVteEMS7V
	8Fo=
X-IronPort-AV: E=Sophos;i="5.69,302,1571695200"; 
   d="scan'208";a="3390377"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 17:48:19 +0100
Message-Id: <20191211164820.26588-7-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211164820.26588-1-pkj@axis.com>
References: <20191211164820.26588-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3 7/8] license_image.bbclass: Report only the licenses that are incompatible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2019 16:48:24 -0000
Content-Transfer-Encoding: 8bit

Instead of reporting ${LICENSE} when a package cannot be installed
into an image because it is using an incompatible license, report the
license(s) that are actually incompatible.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license_image.bbclass               | 5 +++--
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index b5399b6d96..a8c72da3cb 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -51,8 +51,9 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
         for pkg in sorted(pkg_dic):
             if bad_licenses and pkg not in whitelist:
                 try:
-                    if incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"]):
-                        bb.fatal("Package %s has an incompatible license %s and cannot be installed into the image." %(pkg, pkg_dic[pkg]["LICENSE"]))
+                    licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
+                    if licenses:
+                        bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(licenses)))
                     (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
                         oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
                         bad_licenses, canonical_license, d)
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 9d1e801117..458a940618 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -49,7 +49,7 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
     def test_bash_default(self):
         self.write_config(self.default_config())
-        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash has an incompatible license GPLv3+ and cannot be installed into the image."
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0+"
 
         result = bitbake('core-image-minimal', ignore_status=True)
         if error_msg not in result.output:
@@ -57,7 +57,7 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
     def test_bash_and_license(self):
         self.write_config(self.default_config() + '\nLICENSE_append_pn-bash = " & SomeLicense"')
-        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash has an incompatible license GPLv3+ & SomeLicense and cannot be installed into the image."
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0+"
 
         result = bitbake('core-image-minimal', ignore_status=True)
         if error_msg not in result.output:
-- 
2.21.0


