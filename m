Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAEEC64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 21:29:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2069.1677187764412421073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 13:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=orULr+vu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1418b3223b=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NGvcgM004213
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:29:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=KBtd/0iEvaB7ACJptSs6QbWFIjroV5iG+xgclYRahVg=;
 b=orULr+vufMUQdS6VvR7dZiG+SnAGrCb4EDD37WNFD/+vJLmsHtF366yHQmIJwvBWBxpf
 nk8fGvKZM1XqH0yN8+VmnBKRM1H/WxGDldb5ZnEeh05flMJ1nUaFpdDiJVPlaL6Rv6mL
 OheoRjwc6Y3q5ANjpgKYw675D4XL/bEvkl5g+7p2wQW0vtwSuZSUWqDeo82E9W9e/j0z
 vNRdIuq7mIOSjK9/k7qI50/jxBtGxIsD05EPmK69iX6tAOopTvAYyC0Lz9FOF2QlukIe
 AzhTEmhq3Bc0kgvRa8tDU2NcW/bAWzonRzEGUDkFIqKiAWDzacZ1jcqdrLLj0RxIq5qH vw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pvxuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:29:23 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 23 Feb 2023 13:29:23 -0800
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Thu, 23 Feb 2023 13:29:23 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] nghttp2: never build python bindings
Date: Thu, 23 Feb 2023 13:29:23 -0800
Message-ID: <20230223212923.4098927-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YQorb4K6EQTYk4hd73uoZbNdLOWkZtdV
X-Proofpoint-GUID: YQorb4K6EQTYk4hd73uoZbNdLOWkZtdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=761 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 21:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177633

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
2.32.0


