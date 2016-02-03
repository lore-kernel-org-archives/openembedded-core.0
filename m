Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F24AD772B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 19:08:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 03 Feb 2016 11:08:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,391,1449561600"; d="scan'208";a="895725351"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.148])
	by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2016 11:08:03 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed,  3 Feb 2016 11:07:17 -0800
Message-Id: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Wed, 03 Feb 2016 19:08:06 -0000

udev-cache uses find and xargs, which are provided by findutils. It also
uses gzip, which is provided by gzip. These utilities need to be present
when udev-cache runs. Thus, add them as RDEPENDSs.

Otherwise, the following errors could be observed when booting if such
packages are not present in the image:

    /etc/rcS.d/S36udev-cache: line 66: xargs: command not found
    /etc/rcS.d/S36udev-cache: line 65: find: command not found
    /etc/rcS.d/S36udev-cache: line 67: gzip: command not found

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/recipes-core/udev/udev.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 93d7369..7a124cb 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -38,6 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 
 inherit autotools pkgconfig update-rc.d ptest
 RDEPENDS_${PN}-ptest += "make perl python"
+RDEPENDS_${PN} += "gzip findutils"
 
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
-- 
1.9.1


