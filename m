Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9C3C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 17:30:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.58543.1682357451902580292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 10:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gG91ItCQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=347898eb4c=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OBn0uo026899
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 17:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=wRtKE+ma/cwDzNj9QwJEgU4HrLVOn6HLprvSywgalEE=;
 b=gG91ItCQmvY+/bQN9FcqrQwXvA5rb/lbvpFCBdkoqgD5ViwiBFUGz8nzGlYt+yn6wzUL
 F8LcRtgS1C8EnoB3TgpfECjNpnJ2qP+DYAt4moVncVdhaW1uhPrK9Hy5JOKirMGYtKxB
 cT7WIQDPDNKK4/uUIECXHPiuCHvX/Ip+g70Q/vO0DvP7ALIpBGmQoCxl239mGYNcSx0y
 CGQJ8fg9dyiTxT7Nqozjxp9cNecGkjSwtrNoUJrcv1MOIIUVTqAgFid6uEDc0rFt++qc
 qsb6Tu8lJThKF4HQ44D1zyjxAry21ZDci9P7m3iTeHtHhRBtwk1KDHk4spN5clVqatbT mQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3tkp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 17:30:50 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 10:30:49 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 10:30:48 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] ghostscript: fix CVE-2023-28879
Date: Mon, 24 Apr 2023 10:30:48 -0700
Message-ID: <20230424173048.3185286-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0JoKAh1i4gpRDGA5vjI4r2tFcfsaU7uL
X-Proofpoint-ORIG-GUID: 0JoKAh1i4gpRDGA5vjI4r2tFcfsaU7uL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_10,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=511 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 17:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180359

Backport from tag ghostpdl-10.01.1-gse-10174 which is
after 10.01.1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 56a93632e2..86ecdbe24a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -34,6 +34,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://cross-compile.patch \
+                file://cve-2023-28879.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


