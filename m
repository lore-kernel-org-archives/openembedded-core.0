Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 66F9F6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 09:39:08 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v0J9GiW4019358
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 10:16:44 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.32])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v0J9Gh1M024495;
	Thu, 19 Jan 2017 10:16:44 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 10:16:37 +0100
Message-Id: <1484817397-7308-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1484817397-7308-1-git-send-email-pascal.bach@siemens.com>
References: <1484817397-7308-1-git-send-email-pascal.bach@siemens.com>
Subject: [PATCH] package.bbclass: allow additional variables to be added to pkgdata
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
X-List-Received-Date: Thu, 19 Jan 2017 09:39:13 -0000

Adding variable names to the variable PACKAGE_EXTRA_PKGDATA allows including
this variables in the pkgdata file of a package.

For example PACKAGE_EXTRA_PKGDATA = "MACHINE" will add the MACHINE variable to
pkgdata. These fields can be used later in the process by some custom package
processing for example during image creation.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/package.bbclass | 8 +++++++-
 meta/conf/documentation.conf | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 568b85c..2ed1ecc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1388,6 +1388,11 @@ python emit_pkgdata() {
             write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
         sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
+
+        # Write additional variables listed in PACKAGE_EXTRA_PKGDATA
+        for extra_var in (d.getVar('PACKAGE_EXTRA_PKGDATA') or "").split():
+            write_if_exists(sf, pkg, extra_var)
+
         sf.close()
 
         # Symlinks needed for rprovides lookup
@@ -1986,12 +1991,13 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE PACKAGE_EXTRA_PKGDATA"
 
 def gen_packagevar(d):
     ret = []
     pkgs = (d.getVar("PACKAGES") or "").split()
     vars = (d.getVar("PACKAGEVARS") or "").split()
+    vars.extend((d.getVar("PACKAGE_EXTRA_PKGDATA") or "").split())
     for p in pkgs:
         for v in vars:
             ret.append(v + "_" + p)
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 06527cb..e0fb8cf 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -311,6 +311,7 @@ PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN
 PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
 PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed package is required, an error is generated."
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
+PACKAGE_EXTRA_PKGDATA[doc] = "Additional variables to be included in a packages pkgdata."
 PACKAGE_GROUP[doc] = "Defines one or more packages to include in an image when a specific item is included in IMAGE_FEATURES."
 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
 PACKAGE_INSTALL_ATTEMPTONLY[doc] = "List of packages attempted to be installed. If a listed package fails to install, the build system does not generate an error. This variable is generally not user-defined."
-- 
2.1.4


