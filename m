Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58309CD1297
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 01:17:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7051.1712798266677159039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 18:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z87jS4VY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48317d0765=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43ANALvD026126
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 18:17:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=MA+CJQDRQ55sCUTxH9tvuTJJ+3L1UtPrmBcAjbMXT6E=; b=
	Z87jS4VY5BAbmVAYQgX+HsQEZzEn7U+cjvx8wBi5EHayRGQXoruzyoa6bHzZaVW+
	WaYY1adXcIxk1Kluf5tL4CDzLOBFH2X3fdeT1oNjCPPV2OvmGrateZuIX5pDMbJQ
	/3yOjXx2sp8AyoLID77N+saHCihXCw3Uw07GWtOnvqy4dQ8wZAYT3l2iDekLFhcm
	6W4RK9xhmuFujoLtFS+3RYfwTQ1ZiofjO2Y7uDiZI5eGsCPlRFQUy3xIECGyBzcb
	UK9A/gqktF7dB0Uv3Kkyc7jKsvTscdRhHTttC0+WrjEZ8WxMWAEhDBGs4TNVH2xS
	Pp/g0cmRjFxVpJ9zA8GLTw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0dec9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 18:17:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 10 Apr 2024 18:17:45 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 10 Apr 2024 18:17:45 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Date: Wed, 10 Apr 2024 18:17:45 -0700
Message-ID: <20240411011745.574202-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240411011745.574202-1-joe.slater@windriver.com>
References: <20240411011745.574202-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cI2wKsazZT-UderexA_DkRSr1ohupP9l
X-Proofpoint-GUID: cI2wKsazZT-UderexA_DkRSr1ohupP9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=935 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 01:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198114

From: Joe Slater <joe.slater@windriver.com>

If the distro features sysvinit and pni-names are
enabled, RRECOMMENDS ifupdown because busybox ifupdown
will not initialize the renamed interfaces.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../init-ifupdown/init-ifupdown-1.0/qemuall/interfaces       | 5 -----
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb    | 4 +++-
 2 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces
deleted file mode 100644
index 16967763e5..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index d96d2f5fff..fecc3334ea 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -37,4 +37,6 @@ RDEPENDS:${PN} = "\
 RRECOMMENDS:${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils-syslog} \
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "init-ifupdown", "", d)}"
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "init-ifupdown", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit pni-names", "ifupdown", "", d)} \
+    "
-- 
2.25.1


