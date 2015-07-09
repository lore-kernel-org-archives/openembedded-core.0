Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2559272A78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 05:10:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2015 22:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,437,1432623600"; d="scan'208";a="521188830"
Received: from weiteeng-ilbpg1.png.intel.com ([10.88.227.45])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2015 22:10:18 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 13:10:20 +0800
Message-Id: <1436418620-16592-3-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH 2/2] recipes-connectivity: Add iw configuration for enabling Marvell 8897 WiFi feature
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
X-List-Received-Date: Thu, 09 Jul 2015 05:10:19 -0000

From: Ng Shui Lei <shui.lei.ng@intel.com>

iw features was created in the recipes-connectivity layer to
enable Marvell 8897 module in AP mode and STA mode. iw is a
new nl80211 based CLI configuration utility for wireless devices.

Signed-off-by: Ng Shui Lei <shui.lei.ng@intel.com>
Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
---
 ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++++++++++++++++
 meta/recipes-connectivity/iw/iw_3.8.bb             |   27 +++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb

diff --git a/meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
new file mode 100644
index 0000000..f4a7ee7
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -0,0 +1,40 @@
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 29 Nov 2011 17:03:27 +0100
+Subject: [PATCH] iw: version.sh: don't use git describe for versioning
+
+It will detect top-level git repositories like the Angstrom setup-scripts and break.
+
+Upstream-status: Unknown
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ version.sh | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/version.sh b/version.sh
+index db02f0d..336ce2b 100755
+--- a/version.sh
++++ b/version.sh
+@@ -3,21 +3,7 @@
+ VERSION="3.8"
+ OUT="$1"
+
+-if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+-	git update-index --refresh --unmerged > /dev/null
+-	descr=$(git describe)
+-
+-	# on git builds check that the version number above
+-	# is correct...
+-	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
+-
+-	v="${descr#v}"
+-	if git diff-index --name-only HEAD | read dummy ; then
+-		v="$v"-dirty
+-	fi
+-else
+-	v="$VERSION"
+-fi
++v="$VERSION"
+
+ echo '#include "iw.h"' > "$OUT"
+ echo "const char iw_version[] = \"$v\";" >> "$OUT"
diff --git a/meta/recipes-connectivity/iw/iw_3.8.bb b/meta/recipes-connectivity/iw/iw_3.8.bb
new file mode 100644
index 0000000..29dbcd0
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw_3.8.bb
@@ -0,0 +1,27 @@
+# Copyright (C) 2013 Digi International.
+
+SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
+DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
+wireless devices. It supports almost all new drivers that have been added \
+to the kernel recently. "
+HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
+
+DEPENDS = "libnl pkgconfig"
+
+PR = "${DISTRO}.r0"
+
+SRC_URI = "http://www.kernel.org/pub/software/network/iw/iw-${PV}.tar.bz2 \
+           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
+          "
+
+SRC_URI[md5sum] = "618ad1106a196fb1c3d827de96da437c"
+SRC_URI[sha256sum] = "3dae92ca5989cbc21155941fa01907a5536da3c5f6898642440c61484fc7e0f9"
+
+EXTRA_OEMAKE = ""
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.7.9.5


