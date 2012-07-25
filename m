Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3h-0004Xl-7Y
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897581"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:10 -0700
Message-Id: <510b7d3426e99c4b77c4f44a47d3d24bec0058c5.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/28] libcgroup_0.37.1.bb: Add recipe
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
X-List-Received-Date: Wed, 25 Jul 2012 07:31:02 -0000

From: Khem Raj <raj.khem@gmail.com>

This recipe is imported from meta-oe its a requirement for
systemd to work. Now that systemd is living in a layer of
its own. Lets have this recipe into core metadata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |   27 +++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
new file mode 100644
index 0000000..a99d7ac
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Libcgroup"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+PR = "r1"
+
+inherit autotools pkgconfig
+
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${PN}/v${PV}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "24a41b18de112e8d085bb1f7d9e82af7"
+SRC_URI[sha256sum] = "0b08632de5d3641aa554b422d02a77d9367e57933328a8765204ad9588cd5c0d"
+
+EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
+
+# http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg21444.html
+PARALLEL_MAKE = ""
+
+PACKAGES =+ "cgroups-pam-plugin"
+FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
+FILES_${PN}-dev += "${base_libdir}/security/*.la"
+
+# We really need the symlink so :(
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.7.6



