Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFpOw-0006kN-Cf
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:19:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2012 09:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150028187"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2012 09:09:57 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 00:10:12 +0800
Message-Id: <db6ed82ab474a1b521b8f9bcb14abee243ac63a9.1333642153.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1333642153.git.dexuan.cui@intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333642153.git.dexuan.cui@intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
Subject: [PATCH 2/3] xterm: port the recipe from OE and upgrade to v278
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
X-List-Received-Date: Thu, 05 Apr 2012 16:19:10 -0000

The recipe is ported from OE:
http://git.openembedded.org/openembedded/tree/recipes/xorg-app/xterm_266.bb

I upgraded it from v266 to v278.
I added LICENSE, LIC_FILES_CHKSUM and updated SRC_URI checksums.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-graphics/xorg-app/xterm_278.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-app/xterm_278.bb

diff --git a/meta/recipes-graphics/xorg-app/xterm_278.bb b/meta/recipes-graphics/xorg-app/xterm_278.bb
new file mode 100644
index 0000000..64c8866
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xterm_278.bb
@@ -0,0 +1,25 @@
+require xorg-app-common.inc
+DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
+DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
+PR = "${INC_PR}.0"
+
+SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
+
+LICENSE = "MIT & MIT-style"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=d1415419990d510a698de36fb386f797"
+
+SRC_URI[md5sum] = "3eeddfe35cb0a2db1924cfe0c20be443"
+SRC_URI[sha256sum] = "1372f9afe07bc35bfd47482db146c649223dadd0b472da31f8c337ab37f90585"
+
+EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
+                 --x-libraries=${STAGING_LIBDIR} \
+                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
+                 --disable-imake \
+                 --disable-setuid"
+
+do_configure() {
+        sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
+        oe_runconf
+}
+
+FILES_${PN} += " /usr/lib/X11"
-- 
1.7.6



