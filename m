Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SRzer-0007Zq-Oc
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:42:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 May 2012 22:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140707688"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by azsmga001.ch.intel.com with ESMTP; 08 May 2012 22:31:59 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 13:28:21 +0800
Message-Id: <6d3ff6d619c2bfaf876890372bd71a7ef2be1583.1336541197.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1336541197.git.dongxiao.xu@intel.com>
References: <cover.1336541197.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1336541197.git.dongxiao.xu@intel.com>
References: <cover.1336541197.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] libc-package.bbclass: Add MLPREFIX while dynamically set RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 05:43:26 -0000

We need to add MLPREFIX when set RDEPENDS by setVar() function.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/libc-package.bbclass          |   12 +++++++-----
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 51edba2..57b6fd9 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -126,6 +126,8 @@ python package_do_split_gconvs () {
 	if not d.getVar('PACKAGES', True):
 		return
 
+	mlprefix = d.getVar("MLPREFIX", True) or ""
+
 	bpn = d.getVar('BPN', True)
 	libdir = d.getVar('libdir', True)
 	if not libdir:
@@ -149,7 +151,7 @@ python package_do_split_gconvs () {
 		for l in f.readlines():
 			m = c_re.match(l) or i_re.match(l)
 			if m:
-				dp = legitimize_package_name('%s-gconv-%s' % (bpn, m.group(1)))
+				dp = legitimize_package_name('%s%s-gconv-%s' % (mlprefix, bpn, m.group(1)))
 				if not dp in deps:
 					deps.append(dp)
 		f.close()
@@ -170,7 +172,7 @@ python package_do_split_gconvs () {
 		for l in f.readlines():
 			m = c_re.match(l) or i_re.match(l)
 			if m:
-				dp = legitimize_package_name('%s-charmap-%s' % (bpn, m.group(1)))
+				dp = legitimize_package_name('%s%s-charmap-%s' % (mlprefix, bpn, m.group(1)))
 				if not dp in deps:
 					deps.append(dp)
 		f.close()
@@ -190,7 +192,7 @@ python package_do_split_gconvs () {
 		for l in f.readlines():
 			m = c_re.match(l) or i_re.match(l)
 			if m:
-				dp = legitimize_package_name(bpn+'-localedata-%s' % m.group(1))
+				dp = legitimize_package_name(mlprefix+bpn+'-localedata-%s' % m.group(1))
 				if not dp in deps:
 					deps.append(dp)
 		f.close()
@@ -234,7 +236,7 @@ python package_do_split_gconvs () {
 
 	def output_locale_source(name, pkgname, locale, encoding):
 		d.setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
-		(bpn, legitimize_package_name(locale), bpn, legitimize_package_name(encoding)))
+		(mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
 		d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst', True) \
 		% (locale, encoding, locale))
 		d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm', True) % \
@@ -247,7 +249,7 @@ python package_do_split_gconvs () {
 		else:
 			libc_name = name
 		d.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
-			% (d.getVar('MLPREFIX') + bpn, libc_name)))
+			% (mlprefix+bpn, libc_name)))
 
 	commands = {}
 
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 9d5434f..70c5cd1 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,7 +26,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r20"
+PR = "r21"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.7.4.1



