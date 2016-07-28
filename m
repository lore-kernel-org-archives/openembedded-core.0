Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A74A0731D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:06:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jul 2016 07:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1030826402"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2016 07:05:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 49E1A6A4006;
	Thu, 28 Jul 2016 07:05:24 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:37 +0300
Message-Id: <1469714682-31488-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 07/12] blktool: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:06:31 -0000

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian.

So, move all of SRC_URI to the .bb so it can use snapshot.debian.org
instead, and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream
release checking continues to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/blktool/blktool_4-7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.bb
index d6250a9..4551c32 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/${BPN}/${BPN}_4.orig.tar.gz;name=tarball \
            file://0001-fix-typos-in-manpage.patch \
            file://0002-fix-string-error.patch \
            file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
@@ -20,6 +20,7 @@ SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e0680
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/blktool/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
 
 S = "${WORKDIR}/${BPN}-4.orig"
-- 
2.4.0


