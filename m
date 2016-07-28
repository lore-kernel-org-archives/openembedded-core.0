Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B3A006072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:05:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jul 2016 07:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1025570989"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2016 07:05:27 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 28D306A4006;
	Thu, 28 Jul 2016 07:05:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:32 +0300
Message-Id: <1469714682-31488-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 02/12] ossp-uuid: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:05:46 -0000

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian. So, move all of SRC_URI
to the .bb so it can use snapshot.debian.org instead, and set
UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking continues
to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index 08926ba..85a1bcf 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -16,8 +16,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6a
 	   file://uuid_md5.c;beginline=1;endline=28;md5=9c1f4b2218546deae24c91be1dcf00dd"
 
 PR = "r2"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/o/ossp-uuid/"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
 	   file://0001-Change-library-name.patch \
 	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
 	   file://0003-Fix-whatis-entries.patch \
-- 
2.4.0


