Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgdYX-0008Ia-6v
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:03:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 06:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,521,1304319600"; d="scan'208";a="26744102"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.183])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 06:59:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 14:59:08 +0100
Message-Id: <e06067f253d42feefee8852f159de8a22d3f897b.1310478977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310478977.git.paul.eggleton@linux.intel.com>
References: <cover.1310478977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310478977.git.paul.eggleton@linux.intel.com>
References: <cover.1310478977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] busybox: fix missing features due to lack of variable expansion
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
X-List-Received-Date: Tue, 12 Jul 2011 14:03:21 -0000

Expand DISTRO_FEATURES and MACHINE_FEATURES fully so that any inner
variable references (such as DISTRO_FEATURES_LIBC) are expanded properly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc       |    4 ++--
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 1334d06..c51cf6a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -47,8 +47,8 @@ def busybox_cfg(feature, features, tokens, cnf, rem):
 # Map distro and machine features to config settings
 def features_to_busybox_settings(d):
 	cnf, rem = ([], [])
-	distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
-	machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d, True).split()
+	machine_features = bb.data.getVar('MACHINE_FEATURES', d, True).split()
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf, rem)
 	busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
 	busybox_cfg('largefile', distro_features, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index 5883cc6..9d3d5b1 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.4.1



