Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QekAq-0005oO-Gx
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 10:43:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2011 01:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,492,1304319600"; d="scan'208";a="27331452"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2011 01:39:11 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:39:15 +0800
Message-Id: <cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1310027619.git.dexuan.cui@intel.com>
References: <cover.1310027619.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1310027619.git.dexuan.cui@intel.com>
References: <cover.1310027619.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] powertop: inherit update-alternatives and use a higher priority than busybox
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
X-List-Received-Date: Thu, 07 Jul 2011 08:43:04 -0000

busybox-1.18.4 installs /bin/powertop and the powertop recipe installs
/usr/bin/powertop. So, in PATH, if /bin appears before /usr/bin, we would
run the version offered by busybox, which has a very limited function (e.g.,
no parameter is accepted) and this causes trouble to eclipse plugin.

We can use update-alternatives for powertop with higher priority to resolve
the issue.

Fixes [YOCTO #1208]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-kernel/powertop/powertop_1.13.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
index dff4fcd..472a2bb 100644
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_1.13.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/libintl ncurses"
 # powertop 1.13 needs lspci
 RDEPENDS_${PN} = "pciutils"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
            file://stub_out_the_ncurses_calls_in_dump_mode.patch"
@@ -22,6 +22,12 @@ SRC_URI[sha256sum] = "2bc866089496877dd26d2d316ad5763ab8ecb5e28aefba44bc5d355dcd
 CFLAGS += "${LDFLAGS}"
 EXTRA_OEMAKE = "VERSION=\"${PV}\""
 
+inherit update-alternatives
+ALTERNATIVE_NAME = "powertop"
+ALTERNATIVE_PATH = "${bindir}/powertop"
+ALTERNATIVE_LINK = "${base_bindir}/powertop"
+ALTERNATIVE_PRIORITY = "100"
+
 do_configure() {
 	# We do not build ncurses with wide char support
 	sed -i -e "s/lncursesw/lncurses/" ${S}/Makefile
-- 
1.7.6



