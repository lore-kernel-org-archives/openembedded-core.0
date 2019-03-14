Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Mar 2019 19:50:53 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id D9A786C1D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1696; q=dns/txt; s=iport;
	t=1552593055; x=1553802655;
	h=from:to:cc:subject:date:message-id;
	bh=zN7DoMN/PXTtwXl3lSmKxEQ0RJfFWK9gH7L2e9lvEAc=;
	b=FHiHiTBJV0zKrcRymmwIuHIO0cjtx0vjFyqCd+euHndttA3y906vGBv/
	afIsjnMh0j0HD6wNcw6EfcRlvlb7XKx0NG/QPm3WkEi29p/8xYJkmgqWd
	djUHntO6dzDEs9KSIY0WiUNEsu6W67o8UnFP3IcvIPmfHmo3g52A6hEPk E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AFAAB6ropc/xbLJq1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUQUBAQEBCwGCd1AhEieMJ1+LaJkYFIFnDSOESYR0NAkNAQE?=
	=?us-ascii?q?DAQEJAQMCbRwMhkqBPgESgyIBgXUPrmmFRoRuFIEbAYZlhF6BQD+BEYYwAoE?=
	=?us-ascii?q?mI4V5A6RACYdYi0cCF4JVkHYBin+FL0SNHYFHOIFWMxoIGxWDJwmCDhaCJoE?=
	=?us-ascii?q?lilU9AzCQRwEB?=
X-IronPort-AV: E=Sophos;i="5.58,479,1544486400"; d="scan'208";a="10749432"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	14 Mar 2019 19:43:46 +0000
Received: from localhost ([10.63.15.135])
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id x2EJhkie017440;
	Thu, 14 Mar 2019 19:43:46 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 21:43:46 +0200
Message-Id: <1552592626-25569-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-4.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] libnss-nisplus: Add recipe
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
X-List-Received-Date: Thu, 14 Mar 2019 19:50:54 -0000

Same as with libnss-nis - this will substitute
the glibc nisplus module which has been removed

SRCREV points to 1.3 release plus patch on top which
allows to build with recent glibc versions

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 .../libnss-nisplus/libnss-nisplus.bb               | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb

diff --git a/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
new file mode 100644
index 0000000..2dbeee7
--- /dev/null
+++ b/meta/recipes-extended/libnss-nisplus/libnss-nisplus.bb
@@ -0,0 +1,31 @@
+# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
+
+DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
+This code was formerly part of glibc, but is now standalone to\
+be able to link against TI-RPC for IPv6 support."
+
+HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+DEPENDS += "libtirpc libnsl2"
+
+PV = "1.3+git${SRCPV}"
+
+SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
+
+SRC_URI = "git://github.com/thkukuk/libnss_nisplus \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
+#
+# We will skip parsing this packagegeoup for non-glibc systems
+#
+COMPATIBLE_HOST_libc-musl = 'null'
-- 
1.9.1


