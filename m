Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BF476607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:06:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2016 07:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1015529199"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2016 07:05:25 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 386206A4006;
	Thu, 28 Jul 2016 07:05:13 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:31 +0300
Message-Id: <1469714682-31488-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 01/12] apmd: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:06:43 -0000

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian.

So, move all of SRC_URI to the .bb so it can use snapshot.debian.org
instead, and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream
release checking continues to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 4ff6ad0..1cd1d5c 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://apm.h;beginline=6;endline=18;md5=7d4acc1250910a89f84ce3cc6557c4c2"
 DEPENDS = "libtool-cross"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/a/${BPN}/${PN}_3.2.2.orig.tar.gz;name=tarball \
            file://legacy.patch \
            file://libtool.patch \
            file://unlinux.patch \
@@ -26,6 +26,7 @@ SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apmd/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
 
 S = "${WORKDIR}/apmd-3.2.2.orig"
-- 
2.4.0


