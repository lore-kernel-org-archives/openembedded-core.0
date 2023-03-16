Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450ADC77B61
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:17:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16689.1678983467053040140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 09:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V51RlL1P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24391c9c97=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GEpQq2020460
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:17:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=YQ5JetMnrBmVclbtqcVKa9IHwRegFm4mMVbH18LG+Cs=;
 b=V51RlL1PSa6U20axker6DGqIa/Cx+ASydZfTJAa9tNBvxv7LXvYc99w1kgwlWSD7ue1H
 aC34gLjQhIrXu3Mlo2l+AIRuhRmZcfjfokK4xShRihu4ta0x5xgptXNKtQvLZgvPXdI3
 vCbLCRa6AUCJwxXPGdECSm8dbDLa+AyARoc2PU5mNjRNw0DkmjjpjjB2wLvnzbvUF44e
 /fTAq4D3zKadIGzO6UR2XSLn2oQBgZauS/tGEEY2TuVdMX2PFGEU4a38viCGIOkgRrz7
 kW06kdP+pitz2NcdNsxR/rQp8r/DlW3z2THu7qOPqDHI0VI0GDbTxUoL3qT8xQH1MyPp AQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqdngr0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:17:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 16 Mar 2023 09:17:44 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 16 Mar 2023 09:17:44 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [kirkstone][oe-core][PATCH 1/1] nghttp2: never build python bindings
Date: Thu, 16 Mar 2023 09:17:44 -0700
Message-ID: <20230316161744.564990-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KchwZWt0AEAgSja8MrpM5ORJ-zDx31V-
X-Proofpoint-GUID: KchwZWt0AEAgSja8MrpM5ORJ-zDx31V-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=724 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 16:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178709

This has already been done for oe-core/master.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index 58ce08084d..becacd4502 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -19,6 +19,10 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
 
+# Do not let configure try to decide this.
+#
+EXTRA_OECMAKE += "-DENABLE_PYTHON_BINDINGS=OFF"
+
 PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
 RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
-- 
2.25.1


