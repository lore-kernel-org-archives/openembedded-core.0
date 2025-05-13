Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E4EC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:47:54 +0000 (UTC)
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com [148.163.146.64])
 by mx.groups.io with SMTP id smtpd.web11.85811.1747165670336102540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=PPS11142024 header.b=EJJ0/O+t;
 spf=pass (domain: ni.com, ip: 148.163.146.64, mailfrom: prvs=422828d1af=erick.shepherd@ni.com)
Received: from pps.filterd (m0359308.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DITFcY015448
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS11142024; bh=7rhC2Tt8c/FL0UODo/B7
	njUMS6R/CLfwJN2yhU/cr0Y=; b=EJJ0/O+tqk9hhZNUSFVku/tS8vawXX7oMJli
	QnUDqS10IgT3NXdto4fCaG5vCKb24baZKlItN7swM8xv2IjoBnMMvvrIjLOX+Peu
	Ma83op7FRb2T1q2N8aLFd6GfMsLNqVgAATlasPTtbcqMGIQKpj8i6Y8/pThHnAKz
	hPSbfYo/aiSBXy/V2zLpgcAgn0i7F1eNvwQdrf0KpLAxO2AiD7x7VWtGYQN1CQTy
	cSCRS5L/sJjeq3PUZ/WSJOm6/tZO6QM5dNjRbyzdt4ME+Uq+7oyfUHTL4PcNnPDp
	HxwgPZYcb8/K6P+o2OLq53LEz3WqORSdPNqvhPIaBMYEiWQGZQ==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46mbd7hbq7-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:47:49 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 13 May 2025 14:47:45 -0500
Received: from ershephe-ubuntu.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Tue, 13 May 2025 14:47:45
 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [PATCH] kernel-devsrc.bb: Replace extra System.map file with symlink
Date: Tue, 13 May 2025 14:47:42 -0500
Message-ID: <20250513194742.1441418-1-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE4OSBTYWx0ZWRfX2Z+QabznQ8Hi 92Kx8UZO1y28Yr5GXWWAJ3cm93k8iijzCHw5cfmlIod/tGBihGsEcnTmMCQQhbvc4vt5NmG3ped Gf96b9tiFzBlpzNB+zeLwI4IttbHvIKvReoRDPzZbl3Kxt2metkKS93z57G4CoTXmalkQ5v/CHl
 WvjWTe4tbuAqEKdR1t1jkDcgpbkw6ZO761NKNsQKmsDD0aiBP1ceIjfRFhzbzlRRWZYLfw8uKKw tdQI2MGuNVSLsiaIrdCExpthVUVEDXxBnL5NpO4mOaYRFMjrNdoNJoaLxB5Umoqs3Qo9njEBNOm CaJniKy04xy2ollnBYOKxLOcet3W+zhHljiT0taZLwlgE6djXPaOpS5A7zJM3UbbdcaRUb4i8vX
 bnhkf3HU8oGqAPxp0q0W2TD8m3gWFarnT2JB9iBVv2Ly2D9TuHsgw3jsrfbRelUi4q5otyJh
X-Authority-Analysis: v=2.4 cv=GPIIEvNK c=1 sm=1 tr=0 ts=6823a1e5 cx=c_pps a=VUOoxcgKHUMpfFMIT0tLvw==:117 a=VUOoxcgKHUMpfFMIT0tLvw==:17 a=dt9VzEwgFbYA:10 a=gVGD3344AAAA:8 a=X-T7wuUG41dRaClQT0cA:9 a=xQEvYfgLW3QvObN0DhJi:22
X-Proofpoint-GUID: TDecgqyr8iV7VjQ2HjU3fsZCvMvo0EzE
X-Proofpoint-ORIG-GUID: TDecgqyr8iV7VjQ2HjU3fsZCvMvo0EzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=567
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216449

Currently there are two .map files being copied to $kerneldir/build.
One of the files is System.map and the other is
System.map-<kernel version>. Each .map file takes up about 5MB and
have identical sha256sum hashes. This change will make it so only
System.map-<kernel version> is copied in order to save disk space.
It also recreates System.map as a symlink to that .map file.

Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 1500aff2e2..84a1c19fa9 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -75,7 +75,8 @@ do_install() {
         if [ -s Module.symvers ]; then
             cp Module.symvers $kerneldir/build
         fi
-        cp System.map* $kerneldir/build
+        cp System.map-* $kerneldir/build
+        ln -s System.map-* $kerneldir/build/System.map
         if [ -s Module.markers ]; then
             cp Module.markers $kerneldir/build
         fi
-- 
2.43.0


