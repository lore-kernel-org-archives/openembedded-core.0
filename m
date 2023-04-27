Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F7DC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 03:58:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12647.1682567916665939344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 20:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JCJ20Iry;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3481d59eab=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R3e3cP007297
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 03:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=l5tuCA05w7cXlmWwbELZ3fyMO9nzDLSEcX9VgXWqRI8=;
 b=JCJ20Iry+wLMT2h5PVjkgQ5EJ+ld5+eEmmGFI4GLV1WEy2LSXzfRd9pQf8IxjqlN38IF
 /HsN8F0BqStr8QfiGGockp5+ilBrVshSHfziq1KcEG1j2NDO66rEMEEO5tp5PuXJTTfA
 Q/VnCLY4ARVrzZGqNVya5f3wDusF/SSLEMXIscIj/nTO+tnYeLMCQw2GL2Wtfq+WWnAS
 M+0XBfNBnhg/sTbnXsTJ1JvYLuqRRf4x8kbfO3etKmGFP4unXnuwxDuSbCQW/uViAbJC
 XprvgF0JAjE7BB4ODk/OddaxSz/SsGzMC4rQ/LjsopXmscJvWI+ZooDLYCHN8Norw3VI UA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q46jbd5rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 03:58:35 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 20:58:33 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] xorg-lib-common: Add variable to set tarball type
Date: Thu, 27 Apr 2023 03:58:14 +0000
Message-ID: <20230427035814.3820581-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: dDSTuiV72ziT9OgKoQ2U3UbEIiXkFodf
X-Proofpoint-ORIG-GUID: dDSTuiV72ziT9OgKoQ2U3UbEIiXkFodf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_01,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=702
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 03:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180463

Upstream has switched some new releases from bz2 to xz compression. Add
an XORG_EXT variable so recipes can set the file name extension needed
for the compression type.

Following the approach in oe-core/master:
  6a8068e036b4b2a40b38896275b936916b4db76e  xorg-lib-common: Add variable to set tarball type
use a variable for the tarball suffix/compression format.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 60bc8c76fa..68137c4147 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -6,8 +6,9 @@ LICENSE = "MIT"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
+XORG_EXT ?= "tar.bz2"
 
-SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.40.0


