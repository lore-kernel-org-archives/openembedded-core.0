Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA61607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 03:27:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 17 Apr 2016 20:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,500,1455004800"; d="scan'208";a="786863178"
Received: from mbmatesa-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.151])
	by orsmga003.jf.intel.com with ESMTP; 17 Apr 2016 20:27:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2016 15:27:07 +1200
Message-Id: <12309dbca73c958f5f74fddde621d43ec55bd096.1460949989.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460949989.git.paul.eggleton@linux.intel.com>
References: <cover.1460949989.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1460949989.git.paul.eggleton@linux.intel.com>
References: <cover.1460949989.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] buildtools-tarball: fix perl being included when building with ipk
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
X-List-Received-Date: Mon, 18 Apr 2016 03:27:49 -0000

Due to some logic within opkg, a package with the name matching a
dependency will always win over a package with that name in RPROVIDES -
even if there is an RCONFLICTS (which is silently ignored), higher feed
priority and version. The end result is that buildtools gets perl
installed instead of the nativesdk-buildtools-perl-dummy package and
that perl (with missing dependencies) gets used in preference to the
host one, which is precisely what we were trying to avoid.

This is almost certainly a bug in opkg, especially as the other
package's dependencies aren't properly installed under these
circumstances either. However, specifying RREPLACES works around this,
and with no apparent side-effects is probably the safest solution for
now.

At the same time I noticed that in prepending to SDK_PACKAGE_ARCHS we
were actually ending up with a low priority for the dummy package feed
rather than a high one, so change to append it instead. This has no
effect on the packages that get installed at the moment, but should be
done in case the package manager behaviour changes to factor in the feed
priority in future.

Fixes [YOCTO #9469].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb              | 2 +-
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 7186ac4..20e2c9b87 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -26,7 +26,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-texinfo \
     "
 
-SDK_PACKAGE_ARCHS =+ "buildtools-dummy-${SDKPKGSUFFIX}"
+SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 90784a9..2b96111 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit allarch
 
-PR = "r1"
+PR = "r2"
 
 python() {
     # Put the package somewhere separate to ensure it's never used except
@@ -22,5 +22,6 @@ ALLOW_EMPTY_${PN} = "1"
 python populate_packages_prepend() {
     d.appendVar(d.expand('RPROVIDES_${PN}'), '${PERLPACKAGES}')
     d.appendVar(d.expand('RCONFLICTS_${PN}'), '${PERLPACKAGES}')
+    d.appendVar(d.expand('RREPLACES_${PN}'), '${PERLPACKAGES}')
 }
 
-- 
2.5.5


