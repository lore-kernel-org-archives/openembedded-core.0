Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B7EA26FC2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 00:09:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2014 17:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,984,1392192000"; d="scan'208";a="441514481"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2014 17:09:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 17:09:02 -0700
Message-Id: <1402013345-24930-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/4] update-rc.d/useradd: Add additional dependecies
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
X-List-Received-Date: Fri, 06 Jun 2014 00:09:08 -0000

These dependcies are needed to ensure that thier packages are created
correctly since these classes have runtime dependiences in their packages
but they are not actually created yet at rootfs time.

[YOCTO #6072]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass | 2 ++
 meta/classes/useradd.bbclass     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 56eef4e..ca9486b 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,6 +1,7 @@
 UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
+DEPENDS_append_class-target = " initscripts"
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
@@ -67,6 +68,7 @@ python __anonymous() {
 }
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
+PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
 
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3dd7a61..ea15dab 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -4,7 +4,7 @@ inherit useradd_base
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
-USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
+USERADDDEPENDS = " base-files base-passwd shadow-native shadow-sysroot shadow"
 USERADDDEPENDS_class-cross = ""
 USERADDDEPENDS_class-native = ""
 USERADDDEPENDS_class-nativesdk = ""
-- 
1.8.3.1


