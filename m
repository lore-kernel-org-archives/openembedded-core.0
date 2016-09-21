Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AC50D605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 21:54:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 21 Sep 2016 14:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="12309313"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 21 Sep 2016 14:54:30 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 13:50:43 +0000
Message-Id: <2d429f0b645a700d31352bcd876b178b9c8735b5.1474465823.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1474465823.git.mariano.lopez@linux.intel.com>
References: <cover.1474465823.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] testimage.bbclass: Add package manager dependency
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
X-List-Received-Date: Wed, 21 Sep 2016 21:54:37 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The feature to install packages in the target requires to
build the package manager. It would fail, with very obtuse
errors, if a test requires to install something and the
package manager hasn't been build. This will add the package
manager as dependency for testimage.

[YOCTO #10260]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 263d539..a908f92 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -68,6 +68,10 @@ TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:d
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
+
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
-- 
2.6.6


