Return-Path: <prvs=29000c118d=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4145D60290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 16:25:11 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	wBSGKuKS007389 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 10:25:12 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2pmpm7vkn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 10:25:12 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	wBSGPBAU005293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 10:25:11 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 28 Dec 2018 10:25:11 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Fri, 28 Dec 2018 10:25:11 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 10:27:18 -0600
Message-ID: <20181228162718.18815-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAMKF1srgZnSdeikUO0TvBk4vVrzU4vVMps_=VJ+7Se7A3AOPdQ@mail.gmail.com>
References: <CAMKF1srgZnSdeikUO0TvBk4vVrzU4vVMps_=VJ+7Se7A3AOPdQ@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-12-28_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 3/3 v2] package_ip.bbclass: add xz threading
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
X-List-Received-Date: Fri, 28 Dec 2018 16:25:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Before, threading was enabled via a patch to opkg-build. Now that
opkg-build provides a hook for extra arguments, use that.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/classes/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 5eb910ca31..acc8245ffb 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -8,7 +8,7 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??= "opkg-build -Z xz"
+OPKGBUILDCMD ??= "opkg-build -Z xz -a '--threads 0'"
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
-- 
2.20.1


