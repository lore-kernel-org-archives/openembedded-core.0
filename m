Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 150586FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:06:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2016 07:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="855211205"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 28 Jul 2016 07:05:29 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1B11A6A4082;
	Thu, 28 Jul 2016 07:05:16 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:33 +0300
Message-Id: <1469714682-31488-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 03/12] serf: use snapshot.debian.org for SRC_URI
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
only contain releases that are currently in Debian. So, move all of SRC_URI
to the .bb so it can use snapshot.debian.org instead, and set
UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking continues
to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/serf/serf_1.3.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.8.bb
index b5059d5..c498d90 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.8.bb
@@ -1,11 +1,13 @@
 SUMMARY = "High-Performance Asynchronous HTTP Client Library"
-SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://norpath.patch \
            file://env.patch"
 
 SRC_URI[md5sum] = "713beaf05d7f3329de121e218e2fcb93"
 SRC_URI[sha256sum] = "77134cd5010664ca023585bce50978bd4005906ed280ff889f591f86df7c59e4"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/serf/"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-- 
2.4.0


