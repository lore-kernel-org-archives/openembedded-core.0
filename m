Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RLH4w-0002it-II
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 17:20:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2011 09:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,438,1315206000"; d="scan'208";a="80097648"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.93])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2011 09:14:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 16:14:29 +0000
Message-Id: <5b7c51578822d870d425fc2bf5bb282c553af292.1320163967.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320163967.git.paul.eggleton@linux.intel.com>
References: <cover.1320163967.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320163967.git.paul.eggleton@linux.intel.com>
References: <cover.1320163967.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] udev: Split out consolekit and udev-acl
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
X-List-Received-Date: Tue, 01 Nov 2011 16:20:47 -0000

From: Holger Hans Peter Freyther <zecke@selfish.org>

This can safe another megabyte on the tar.bz2 of the minimal
image. udev-acl is linking to glibc which will pull in libglib,
libgio, libgthread, libgmodule, libgobject.

2.0M 2011-07-02 01:57 after.tar.bz2
3.0M 2011-07-02 01:52 before.tar.bz2

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
---
 meta/recipes-core/udev/udev-new.inc |    6 ++++++
 meta/recipes-core/udev/udev_164.bb  |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 0247a83..eac7903 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -35,6 +35,7 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
+PACKAGES =+ "udev-acl udev-consolekit"
 PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
 PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
@@ -57,6 +58,11 @@ FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libg
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
 
+FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
+
+RDEPENDS_udev-consolekit += "udev-acl"
+FILES_udev-consolekit = "${libdir}/ConsoleKit"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 689b5fd..7cbe4d8 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.5.4



