Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYl-0008UB-A2
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:05:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580340"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:12 -0700
Message-Id: <5322e54c65dbd118085df08a9d7408197f9d19db.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (Updated) 10/15] gtk-icon-cache: fix RDEPENDS append bug
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
X-List-Received-Date: Sun, 07 Aug 2011 05:05:59 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

python += doesn't add a leading space, which we do need:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome-themes:
|  *    gnome-icon-themehicolor-icon-theme *
|  * opkg_install_cmd: Cannot install package task-gnome-themes.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome-apps:
|  *    iso-codeshicolor-icon-theme *
|  * opkg_install_cmd: Cannot install package task-gnome-apps.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome:
|  *    grephicolor-icon-theme *
|  * opkg_install_cmd: Cannot install package task-gnome.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/gtk-icon-cache.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 5d8ef34..3bfb8ff 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -38,7 +38,7 @@ python populate_packages_append () {
 
 		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
 		rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
-		rdepends += "hicolor-icon-theme"
+		rdepends += " hicolor-icon-theme"
 		bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
 	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
-- 
1.7.3.4



