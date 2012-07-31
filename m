Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SwAsT-0002SK-Ef
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:44:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2012 04:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175235423"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.64])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2012 04:33:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 12:33:01 +0100
Message-Id: <1343734381-11130-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/package: don't make locale pkgs depend on PN pkg if not in PACKAGES
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
X-List-Received-Date: Tue, 31 Jul 2012 11:44:41 -0000

If ${PN} is not in PACKAGES then don't add it as an RDEPENDS for each
locale package. This fixes the installation of gcc-runtime locale
packages, for example.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3aaf999..9c4e643 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -407,12 +407,13 @@ python package_do_split_locales() {
     description = d.getVar('DESCRIPTION', True) or ""
     locale_section = d.getVar('LOCALE_SECTION', True)
     mlprefix = d.getVar('MLPREFIX', True) or ""
+    pndep = base_contains('PACKAGES', pn, '%s ' % pn, '', d)
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
         packages.append(pkg)
         d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
-        d.setVar('RDEPENDS_' + pkg, '%s %svirtual-locale-%s' % (pn, mlprefix, ln))
+        d.setVar('RDEPENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, mlprefix, ln))
         d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
-- 
1.7.9.5



