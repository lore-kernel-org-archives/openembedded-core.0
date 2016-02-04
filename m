Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE2E77298
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:13:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Feb 2016 12:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="908718120"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.148])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2016 12:13:40 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>
Date: Thu,  4 Feb 2016 12:12:39 -0800
Message-Id: <1454616759-20614-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Thu, 04 Feb 2016 20:13:46 -0000

udev-cache uses find and xargs, which are provided by findutils. It also
uses gzip, which is provided by gzip. These utilities need to be present
when udev-cache runs. Thus, add them as RDEPENDSs.

Otherwise, if busybox is not included in the built image, the following
errors could be observed when booting if such packages are not present:

    /etc/rcS.d/S36udev-cache: line 66: xargs: command not found
    /etc/rcS.d/S36udev-cache: line 65: find: command not found
    /etc/rcS.d/S36udev-cache: line 67: gzip: command not found

Cc: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v1:
 * Narrow the dependency only to udev-cache
 * Reword the commit message to mention that the issue is only
   reproducible if busybox is not included in the image.
---
 meta/recipes-core/udev/udev.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 93d7369..4e8e758 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -38,6 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 
 inherit autotools pkgconfig update-rc.d ptest
 RDEPENDS_${PN}-ptest += "make perl python"
+RDEPENDS_${PN}-cache += "gzip findutils"
 
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
-- 
1.9.1


