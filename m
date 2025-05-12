Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BF0C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 19:05:07 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web10.58479.1747076697681834213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 12:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=PPS11142024 header.b=nua4ZeGp;
 spf=pass (domain: ni.com, ip: 148.163.142.35, mailfrom: prvs=422722877e=erick.shepherd@ni.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIDx7p004080
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 19:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS11142024; bh=6Fob+hSyXngQu/1Cryoi
	Fe+ob3loN8YeVyK0DJbnkGU=; b=nua4ZeGp98x1whoNqvILu2VF5zou15RfvdhK
	kcU3iEMMUlTZKUcHLR3aWhG6N3PancMx4kWcZyOY5NkJfFCEiEIkS4qPO2ybEMwf
	5lz2dADMmxAMg490HO6gHmpd6JQytKoArL2yOBilBWwNdJiv0NPBPtiVKx1h0Wyw
	EsYOJUxxweWlyxWSuGwqOOrbCRuza2PlWGIsoRAL1mFD8PU7BuJOrim6kKewU86a
	+iaw2lmVPXBnpbLLdrX1UI/5kX/P1J9KykqdnpWZn6xZm8CWQUCQNBEbq1qBcHif
	tBooZ8svnIt5UpmgwZEFIsCBWxqbj6jcOVI7qNLa9bZx0Gw6qw==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46kmq61nn9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 19:04:56 +0000 (GMT)
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 12 May 2025 14:04:54 -0500
Received: from ershephe-ubuntu.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Mon, 12 May 2025 14:04:54
 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [PATCH] kernel-devsrc.bb: Remove extra System.map file
Date: Mon, 12 May 2025 14:04:51 -0500
Message-ID: <20250512190451.1363972-1-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SfX3duRu c=1 sm=1 tr=0 ts=68224658 cx=c_pps a=VUOoxcgKHUMpfFMIT0tLvw==:117 a=VUOoxcgKHUMpfFMIT0tLvw==:17 a=dt9VzEwgFbYA:10 a=gVGD3344AAAA:8 a=697aNiapx2Y-GGsev04A:9 a=xQEvYfgLW3QvObN0DhJi:22
X-Proofpoint-ORIG-GUID: zEzPdiA50lyhC0FvcLfs1mAoGWIA4IxH
X-Proofpoint-GUID: zEzPdiA50lyhC0FvcLfs1mAoGWIA4IxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5NiBTYWx0ZWRfX050+ThpqeRxp lZ2zSxIeYJ7VwnO6TosgHnAUfvyX6WuDZkGtWLeIzdJarRqJopDr3HvMx7qmyzuYPyETwHnyHKN KmjAqHPWp1t3lIR69mqDgKEsR+MJ9KHyZtVFcNKxnqvAUKZcYri0Eda2wAlub8/DDR8BE0K0WFg
 xeDrv1tVGfAPJSH+j7X2VE9X+7Ck/3PCIpJZ3+Yn1yhtarxCYnhPt4sNZJWaANTmpra1+IsO/vY 6YH6hmR1aBl+Yh1I4MEAXxGg0jaHtZz2b/JUDWIVsDCO/pubnhxDQp9LtYy6+PDC2Kl/0UsVdnj doAqDiQh+pOt/lW9jq5BVmgtX64t3Tv8vOIaHM9G6tnIIGTCtcbablcfHBe9NMf0SpyVSdxmZSB
 Av+H43wpVQ2SO5ywi2M2u4KA3xPiJjaIs4Q1L13z8wuSxnMjukZ6Os2xPfYDvzpIcUnbb39O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=763 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 19:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216385

Currently there are two .map files being copied to $kerneldir/build.
One of the files is System.map and the other is
System.map-<kernel version>. Each .map file takes up about 5MB and
have identical sha256sum hashes. This change will make it so only
System.map is copied in order to save disk space.

Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 1500aff2e2..9729a25440 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -75,7 +75,7 @@ do_install() {
         if [ -s Module.symvers ]; then
             cp Module.symvers $kerneldir/build
         fi
-        cp System.map* $kerneldir/build
+        cp System.map $kerneldir/build
         if [ -s Module.markers ]; then
             cp Module.markers $kerneldir/build
         fi
-- 
2.43.0


