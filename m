Received: from mail-db8lp0186.outbound.messaging.microsoft.com
	([213.199.154.186] helo=db8outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UIZvT-00042O-31
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 08:28:40 +0100
Received: from mail7-db8-R.bigfish.com (10.174.8.244) by
	DB8EHSOBE002.bigfish.com (10.174.4.65) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 06:56:44 +0000
Received: from mail7-db8 (localhost [127.0.0.1])	by mail7-db8-R.bigfish.com
	(Postfix) with ESMTP id 5AF6F1EC01AF	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 06:56:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail7-db8 (localhost.localdomain [127.0.0.1]) by mail7-db8
	(MessageSwitch) id 1363849003780383_18005;
	Thu, 21 Mar 2013 06:56:43 +0000 (UTC)
Received: from DB8EHSMHS007.bigfish.com (unknown [10.174.8.254])	by
	mail7-db8.bigfish.com (Postfix) with ESMTP id BC5725C006E	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 06:56:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS007.bigfish.com
	(10.174.4.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 06:56:39 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 21 Mar 2013 06:56:37 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2L6uXM9017971;
	Wed, 20 Mar 2013 23:56:35 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Mar 2013 15:00:46 +0800
Message-ID: <1363849246-9294-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: rpm: fix probably redundant RPATH issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 07:28:40 -0000
Content-Type: text/plain

Clear the rpath define to fix below build issue:
ERROR: QA Issue: rpm-build: /work/ppce500mc-fsl_networking-linux/rpm/5.4.9-r61/packages-split/rpm-build/usr/lib/rpm/bin/sqlite3 contains probably-redundant RPATH /usr/lib/../lib
ERROR: QA Issue: rpm-build: /work/ppce500mc-fsl_networking-linux/rpm/5.4.9-r61/packages-split/rpm-build/usr/lib/rpm/bin/cp contains probably-redundant RPATH /usr/lib/../lib
...

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index cfdc390..12a1642 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r62"
+PR = "r63"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -368,6 +368,9 @@ do_configure() {
 	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
 	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i ${S}/configure
 
+        # Clear hardcode_libdir_flag_spec to avoid redundant rpath definition
+        sed -i 's/hardcode_libdir_flag_spec=$lt.*/hardcode_libdir_flag_spec=/g' ${S}/configure
+
 	export varprefix=${localstatedir}
 	oe_runconf
 }
-- 
1.7.9.5




