Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SJg9H-0002L1-DF
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 09:14:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 00:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="132903237"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2012 00:05:29 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 14:50:00 +0800
Message-Id: <14a8aff9c52b2add7587dbc97f7ee11e7827848c.1334558917.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334558917.git.edwin.zhai@intel.com>
References: <cover.1334558917.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1334558917.git.edwin.zhai@intel.com>
References: <cover.1334558917.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] Multilib: Fix RDEPENDS in libc-package.bbclass, useradd.bbclass...
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
X-List-Received-Date: Mon, 16 Apr 2012 07:14:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

MLPREFIX is needed in RDEPENDS for multilib build

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/classes/gconf.bbclass        |    2 +-
 meta/classes/libc-package.bbclass |    2 +-
 meta/classes/useradd.bbclass      |    3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 095d04b..a966c26 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -57,7 +57,7 @@ python populate_packages_append () {
 			prerm += d.getVar('gconf_prerm', True)
 			d.setVar('pkg_prerm_%s' % pkg, prerm)
 			rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
-			rdepends += " gconf"
+			rdepends += ' ' + d.getVar('MLPREFIX') + 'gconf'
 			d.setVar("RDEPENDS_%s" % pkg, rdepends)
 
 }
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 7cde770..bb4ba68 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -257,7 +257,7 @@ python package_do_split_gconvs () {
 		else:
 			libc_name = name
 		d.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
-			% (bpn, libc_name)))
+			% (d.getVar('MLPREFIX') + bpn, libc_name)))
 
 	commands = {}
 
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0bbb371..0ed91ad 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -201,7 +201,8 @@ fakeroot python populate_packages_prepend () {
 
 		# RDEPENDS setup
 		rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
-		rdepends += " base-passwd shadow"
+		rdepends += ' ' + d.getVar('MLPREFIX') + 'base-passwd'
+		rdepends += ' ' + d.getVar('MLPREFIX') + 'shadow'
 		d.setVar("RDEPENDS_%s" % pkg, rdepends)
 
 	# Add the user/group preinstall scripts and RDEPENDS requirements
-- 
1.7.5.4



