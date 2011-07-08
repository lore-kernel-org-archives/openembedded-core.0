Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QfEvt-0004qT-VX
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:33:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 10:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24991291"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2011 10:29:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:29:39 -0700
Message-Id: <75657b920e0f0d2836ae7b51e6ff4b3c330497f1.1310145969.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
Subject: [PATCH v2 1/4] rootfs_rpm: Add 50M to IMAGE_ROOTFS_EXTRA_SPACE for zypper /var space
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
X-List-Received-Date: Fri, 08 Jul 2011 17:33:42 -0000

[YOCTO #1171]

This is a temporary fix to address the fact that zypper's db configuation
uses a large amount of /var space. When the correct'ed zypper config can
be applied, this fix can be removed. The zypper bug for yocto is 1174
http://bugzilla.pokylinux.org/show_bug.cgi?id=1174

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 3a11858..3cdcbd5 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -3,6 +3,10 @@
 #
 
 ROOTFS_PKGMANAGE = "rpm zypper"
+
+# Add 50Meg of extra space for zypper database space
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"
+
 # Postinstalls on device are handled within this class at present
 ROOTFS_PKGMANAGE_BOOTSTRAP = ""
 
@@ -101,6 +105,7 @@ EOF
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 
+
 	${ROOTFS_POSTINSTALL_COMMAND}
 
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts/
-- 
1.7.3.4



