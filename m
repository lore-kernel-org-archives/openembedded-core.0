Return-Path: <prvs=221486d377=haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7AC6022F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 22:05:09 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xA7M4l8W024459; Thu, 7 Nov 2019 16:05:09 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2w41wsmrae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 07 Nov 2019 16:05:09 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xA7M58tI018154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2019 16:05:08 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:05:08 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:05:08 -0600
Received: from harisdt.amer.corp.natinst.com (172.18.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Nov 2019 16:05:08 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2019 16:04:21 -0600
Message-ID: <20191107220420.2172544-2-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191107220420.2172544-1-haris.okanovic@ni.com>
References: <20191107220420.2172544-1-haris.okanovic@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-07_07:2019-11-07,2019-11-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH 2/2] opkg: RDEPEND "gnupg-gpg" instead of "gnupg"
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
X-List-Received-Date: Thu, 07 Nov 2019 22:05:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gnupg-gpg is a minimal installation of gnupg with enough functionality
to verify signatures and manage keys. Use this package instead of full
gnupg to slim down opkg installations with "--enable-gpg".

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 104f07fda8..149ee3ca19 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -32,7 +32,10 @@ OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
 PACKAGECONFIG ??= "libsolv"
 
-PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
+PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
+    gnupg gpgme libgpg-error,\
+    ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
+    "
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-- 
2.24.0


