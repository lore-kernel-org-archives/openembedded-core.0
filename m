Return-Path: <prvs=221486d377=haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9536F7FA1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 22:04:35 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xA7M3WKB019579; Thu, 7 Nov 2019 16:04:35 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2w41w84qyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 07 Nov 2019 16:04:35 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xA7M4Yct017785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2019 16:04:34 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:04:34 -0600
Received: from harisdt.amer.corp.natinst.com (172.18.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Nov 2019 16:04:34 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2019 16:04:19 -0600
Message-ID: <20191107220420.2172544-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-07_07:2019-11-07,2019-11-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH 1/2] gnupg: Split gpg and gpg-agent into a minimal gnupg-gpg package
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
X-List-Received-Date: Thu, 07 Nov 2019 22:04:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add minimal "gnupg-gpg" package containing just enough binaries to run
gpg and gpg-agent. Add dependency in normal "gnupg" package to preserve
old behavior.

Some applications like opkg don't need all functionality provided by
normal gnupg installations. This minimal package provides just enough
functionality to verify and manage keys in opkg, in order to minimize
disk overhead.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/recipes-support/gnupg/gnupg_2.2.17.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
index 689cf8a75e..ab19a1ad11 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
@@ -29,6 +29,21 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--enable-gpg-is-gpg2 \
                "
+
+# A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
+PACKAGES =+ "${PN}-gpg"
+FILES_${PN}-gpg = " \
+	${bindir}/gpg \
+	${bindir}/gpg2 \
+	${bindir}/gpg-agent \
+"
+
+# Normal package (gnupg) should depend on minimal package (gnupg-gpg)
+# to ensure all tools are included. This is done only in non-native
+# builds. Native builds don't have sub-packages, so appending RDEPENDS
+# in this case breaks recipe parsing.
+RDEPENDS_${PN} += "${@ "" if ("native" in d.getVar("PN")) else (d.getVar("PN") + "-gpg")}"
+
 RRECOMMENDS_${PN} = "pinentry"
 
 do_configure_prepend () {
-- 
2.24.0


