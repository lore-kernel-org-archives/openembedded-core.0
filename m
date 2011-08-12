Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrmZz-0004dR-9n
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:54:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809708"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:49:55 -0700
Message-Id: <f8a8cab26b2ecfc62e22061ed4c27977ca4d42d5.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/25] package: allow setting a section for locale packages
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
X-List-Received-Date: Fri, 12 Aug 2011 07:54:56 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0a954ef..100f465 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -44,6 +44,8 @@ inherit prserv
 PKGD    = "${WORKDIR}/package"
 PKGDEST = "${WORKDIR}/packages-split"
 
+LOCALE_SECTION ?= ''
+
 # rpm is used for the per-file dependency identification
 PACKAGE_DEPENDS += "rpm-native"
 
@@ -401,6 +403,7 @@ python package_do_split_locales() {
 
 	summary = bb.data.getVar('SUMMARY', d, True) or pn
 	description = bb.data.getVar('DESCRIPTION', d, True) or "" 
+        locale_section = bb.data.getVar('LOCALE_SECTION', d, True)
 	for l in locales:
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
@@ -410,6 +413,8 @@ python package_do_split_locales() {
 		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
 		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)
 		bb.data.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l), d)
+		if locale_section:
+			bb.data.setVar('SECTION_' + pkg, locale_section, d)
 
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
 
-- 
1.7.3.4



