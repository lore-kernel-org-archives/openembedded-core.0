Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 91E9F78202
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=+xyn58My0vFhkN+vF5zKALfUH9EZY0/zXAkWCY4enmw=; 
	b=Xs1ROzArLRlOJbcgzeVulZtgZ/tzzIpfoZvSwDV8Cpo4FAqEe2IIfehqKGD7JFKoF23rB5c/o+XJiiePISKUk3kRmFq5l/zJeiJNoaE8A6cj/T/UXgly1PUYakUt8xkDOZa40cMsbBoGyobcI3F+4ozyXU7GtRW9TleAGOls5BB+cvUgmyVY2a7hy+exUojO7vERrVK4d/h/Jvv2Pf37uB/uXb+L0+rz/2rLETjEqiMw1apbfmmEBenpsgfBkChsViECqABAGRvjcEbUgjdlLgd35JRLe5jV+sqNn4eCWWaqawPu/uvKZaPYo1gEVYCxJCbTER2+apszXTDlg3VwcA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005Lp-Oc; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003Q8-NH; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:49 +0300
Message-Id: <1500556991-11471-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 01/23] buildhistory.bbclass: add LICENSE and CVE_PRODUCT to recipe and package data
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:26 -0000

LICENSE can be used in various checks after builds. Reading license data
from buildhistory is better than trying to parse recipes in a source tree.

CVE_PRODUCT can be used by scripts to e.g. check if it matches to the
CVE product names in CVE/NVD database.

It the two are combined, a CVE product name check can for example ignore
recipes with CLOSED license.

Note about sstate caching: recipe and package buildhistory data is
regenarated only when the recipe is rebuild from sources. New fields
like LICENSE and CVE_PRODUCT in buildhistory will be deployed only after
the recipes are recompiled.

Example:

$ bitbake -c cleanall busybox && bitbake busybox
$ egrep "LICENSE|CVE_PRODUCT" buildhistory/packages/i586-poky-linux/busybox/busybox/latest
LICENSE = GPLv2 & bzip2
CVE_PRODUCT = busybox

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/buildhistory.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 81784ee..cc3b144 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -92,6 +92,8 @@ python buildhistory_emit_pkghistory() {
             self.packages = ""
             self.srcrev = ""
             self.layer = ""
+            self.license = ""
+            self.cve_product = ""
 
 
     class PackageInfo:
@@ -105,6 +107,8 @@ python buildhistory_emit_pkghistory() {
             self.pkge = ""
             self.pkgv = ""
             self.pkgr = ""
+            self.license = ""
+            self.cve_product = ""
             self.size = 0
             self.depends = ""
             self.rprovides = ""
@@ -141,6 +145,10 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.pkgv = value
                 elif name == "PKGR":
                     pkginfo.pkgr = value
+                elif name == "LICENSE":
+                    pkginfo.license = value
+                elif name == "CVE_PRODUCT":
+                    pkginfo.cve_product = value
                 elif name == "RPROVIDES":
                     pkginfo.rprovides = value
                 elif name == "RDEPENDS":
@@ -193,6 +201,9 @@ python buildhistory_emit_pkghistory() {
     pv = d.getVar('PV')
     pr = d.getVar('PR')
     layer = bb.utils.get_file_layer(d.getVar('FILE', True), d)
+    license = d.getVar('LICENSE') or ''
+    # If recipe does not define CVE_PRODUCT, the default is pn
+    cve_product = d.getVar('CVE_PRODUCT') or pn
 
     pkgdata_dir = d.getVar('PKGDATA_DIR')
     packages = ""
@@ -233,6 +244,8 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
     rcpinfo.layer = layer
+    rcpinfo.license = license
+    rcpinfo.cve_product = cve_product
     write_recipehistory(rcpinfo, d)
 
     pkgdest = d.getVar('PKGDEST')
@@ -249,6 +262,8 @@ python buildhistory_emit_pkghistory() {
         pkge = pkgdata.get('PKGE', '0')
         pkgv = pkgdata['PKGV']
         pkgr = pkgdata['PKGR']
+        pkg_license = d.getVar('LICENSE_%s' % (pkg,), True) or license
+        pkg_cve_product = d.getVar('CVE_PRODUCT_%s' % (pkg,), True) or cve_product
         #
         # Find out what the last version was
         # Make sure the version did not decrease
@@ -272,6 +287,8 @@ python buildhistory_emit_pkghistory() {
         pkginfo.pkge = pkge
         pkginfo.pkgv = pkgv
         pkginfo.pkgr = pkgr
+        pkginfo.license = pkg_license
+        pkginfo.cve_product = pkg_cve_product
         pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
         pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
         pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
@@ -347,6 +364,8 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
         f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
         f.write(u"LAYER = %s\n" %  rcpinfo.layer)
+        f.write(u"LICENSE = %s\n" % rcpinfo.license)
+        f.write(u"CVE_PRODUCT = %s\n" % rcpinfo.cve_product)
 
     write_latest_srcrev(d, pkghistdir)
 
@@ -374,6 +393,8 @@ def write_pkghistory(pkginfo, d):
             f.write(u"PKGV = %s\n" % pkginfo.pkgv)
         if pkginfo.pkgr != pkginfo.pr:
             f.write(u"PKGR = %s\n" % pkginfo.pkgr)
+        f.write(u"LICENSE = %s\n" % pkginfo.license)
+        f.write(u"CVE_PRODUCT = %s\n" % pkginfo.cve_product)
         f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
         f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
         f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
-- 
1.9.1


