Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SUx96-0006Ng-LH
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 11:37:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 May 2012 02:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145066565"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.120])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2012 02:27:16 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 17:25:06 +0800
Message-Id: <932f6592281b43603354b0b41ff4e292548190c7.1337246557.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337246557.git.lianhao.lu@intel.com>
References: <cover.1337246557.git.lianhao.lu@intel.com>
Subject: [PATCH 1/3] (libc-)package.bbclass: Added MLPREFIX to locale packages.
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
X-List-Received-Date: Thu, 17 May 2012 09:37:20 -0000

Added multilib prefix to the locale related package names/dependencies.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/libc-package.bbclass |    4 ++--
 meta/classes/package.bbclass      |    5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 57b6fd9..10f5f87 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -308,10 +308,10 @@ python package_do_split_gconvs () {
 		pkgname = d.getVar('MLPREFIX') + 'locale-base-' + legitimize_package_name(name)
 		d.setVar('ALLOW_EMPTY_%s' % pkgname, '1')
 		d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES', True)))
-		rprovides = ' virtual-locale-%s' % legitimize_package_name(name)
+		rprovides = ' %svirtual-locale-%s' % (mlprefix, legitimize_package_name(name))
 		m = re.match("(.*)_(.*)", name)
 		if m:
-			rprovides += ' virtual-locale-%s' % m.group(1)
+			rprovides += ' %svirtual-locale-%s' % (mlprefix, m.group(1))
 		d.setVar('RPROVIDES_%s' % pkgname, rprovides)
 
 		if use_bin == "compile":
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 99836e9..6fba5b6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -400,13 +400,14 @@ python package_do_split_locales() {
 	summary = d.getVar('SUMMARY', True) or pn
 	description = d.getVar('DESCRIPTION', True) or "" 
         locale_section = d.getVar('LOCALE_SECTION', True)
+	mlprefix = d.getVar('MLPREFIX', True) or ""
 	for l in sorted(locales):
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
 		d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
-		d.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (pn, ln))
-		d.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln))
+		d.setVar('RDEPENDS_' + pkg, '%s %svirtual-locale-%s' % (pn, mlprefix, ln))
+		d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
 		d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
 		d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
 		if locale_section:
-- 
1.7.0.4



