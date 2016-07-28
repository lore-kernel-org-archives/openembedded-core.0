Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B5D226E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:05:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 28 Jul 2016 07:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1025571104"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2016 07:05:34 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7CE016A4006;
	Thu, 28 Jul 2016 07:05:22 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:36 +0300
Message-Id: <1469714682-31488-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 06/12] linuxdoc-tools: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:05:33 -0000

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian. So, move all of SRC_URI
to the .bb so it can use snapshot.debian.org instead, and set
UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking continues
to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index a8a90fc..a5deb2e 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
 
 DEPENDS = "groff-native openjade-native"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/l/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://disable_sgml2rtf.patch \
            file://disable_txt_doc.patch \
            file://disable_tex_doc.patch \
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.
 SRC_URI[md5sum] = "1d13d500918a7a145b0edc2f16f61dd1"
 SRC_URI[sha256sum] = "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd1c34f83d6bfd4101"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/"
 inherit autotools-brokensep native
 
 do_configure () {
-- 
2.4.0


