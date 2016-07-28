Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B28966FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:06:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2016 07:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1004214235"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2016 07:05:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CB39B6A4006;
	Thu, 28 Jul 2016 07:05:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:42 +0300
Message-Id: <1469714682-31488-13-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 12/12] libproxy: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:07:00 -0000

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian.

So, move all of SRC_URI to the .bb so it can use snapshot.debian.org
instead, and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream
release checking continues to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index 8cc90bb..9c99d6a 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -8,13 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-test-Include-sys-select.h-for-select.patch \
           "
 
 SRC_URI[md5sum] = "3cd1ae2a4abecf44b3f24d6639d2cd84"
 SRC_URI[sha256sum] = "dc3f33de54163718f82b3e7c496a7de97f8862578414b8ecaad3cbfe4821864b"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/libp/libproxy/"
+
 inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)} gnome3"
-- 
2.4.0


