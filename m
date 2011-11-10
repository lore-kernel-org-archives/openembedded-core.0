Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOL-0005bO-DL
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351231"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:06 -0800
Message-Id: <75889c8d53b4220146d737c59cfe923784a2739b.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 24/33] useradd.bbclass: do not modify -nativesdk packages
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:49 -0000

From: Scott Garman <scott.a.garman@intel.com>

Exclude the addition of user/group code and RDEPENDS changes for
-nativesdk packages.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3b2d1db..64d6861 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -153,10 +153,11 @@ fakeroot python populate_packages_prepend () {
 		rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
 		rdepends += " base-passwd shadow"
 		bb.data.setVar("RDEPENDS_%s" % pkg, rdepends, d)
-	
+
 	# Add the user/group preinstall scripts and RDEPENDS requirements
 	# to packages specified by USERADD_PACKAGES
-	useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
-	for pkg in useradd_packages.split():
-		update_useradd_package(pkg)
+	if not bb.data.inherits_class('nativesdk', d):
+		useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
+		for pkg in useradd_packages.split():
+			update_useradd_package(pkg)
 }
-- 
1.7.6.4



