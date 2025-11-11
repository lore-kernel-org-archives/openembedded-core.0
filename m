Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6563CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 06:06:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11438.1762841184994753330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 22:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eSKIwunC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: vudupa@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AALYCFL3307000
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TxmfujvRHPaQA/0F5huMDMY6Cxj7auisuHR
	i6WDDbck=; b=eSKIwunC9YfLS4gnz4rJjfqLWzzDNgo9h3BOMbagPH/33IEv8vC
	R/rlsIDpv5O8CAuWG814f20oxLYW+WfQW9tQ2Mu2hPseN5a0AK20zSkOgWjVL+jP
	qtwKxK1lcz0R/yYlu0c6x2B7QWX8cwFlNRYBvePnWZaQn4V3EPn6YropmUd3NRbC
	S6U1VhSniCbqI7jRzPIfPq540MZYXyO4cLhT6gHD8MActRO3ODbwH4S2ueUy75tY
	97+fSzcdYSBrAHEKLvq3O6fpOiFG11S46KT6WAgaFeByRP9izCSZO+P6cwGKuFuT
	qa1O5GnW2PTpg3V7J6+7Rl1hw/StK0fGMLA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0qan1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:23:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB5N419007773
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:23:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkw8gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:23:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AB5N4Nt007663
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:23:04 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (hyd-e160-a01-2-03.qualcomm.com [10.147.154.239])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AB5N3Hx007631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:23:04 +0000
Received: by hyd-e160-a01-2-03.qualcomm.com (Postfix, from userid 3978420)
	id F2B9F4DD0; Tue, 11 Nov 2025 10:53:02 +0530 (IST)
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, Vishwas Udupa <vudupa@qti.qualcomm.com>
Subject: [PATCH] findutils: /var is populated by base-files, so no need to repack empty dir
Date: Tue, 11 Nov 2025 10:52:44 +0530
Message-Id: <20251111052244.3228403-1-vudupa@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=6912c83c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=MHo1wMy07wiU54WxFgcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDAzOSBTYWx0ZWRfX1xPpogM/VPk6
 Cazze9UO7uhqqIz7hCLJoAU1U4IVkpKZNmRqfl2pkPehBQyMpm83sydScDAwkC6OVlLxxtG96o2
 RNLY1u9VaIpYvTFn/hv/sof4UEmHICY3bPqj3TIgD5Oo+4Wg4iAMFL4J4SWhA0ggldGCUWyHIhS
 Olg6xb1uxxrxfbHomp8TUaAl+BLXgbiRg6WNwDQXd4ck8SSi7hLpN7gQ942xBBQaxmjBl6JBgiC
 4aWHpOh5HYvSjaVA6P+UyOPmEvdrPeUqd11Iq5/I+sC+w8P64A05iys1KCYQfuheREvIOxBetRc
 yI7bOHsgu9qTCBlXVQZw2RDEmv+fECDAb4XfIksMDcWbW3c8iptIAhmd3uFN8JQ4LrkCyXNmIKE
 Vrkbbqqb3NFkT9XwYMmAZCUFrwtnsg==
X-Proofpoint-GUID: zasDUgKbAIg_SEd6SWwv8i8vN2gd8uHI
X-Proofpoint-ORIG-GUID: zasDUgKbAIg_SEd6SWwv8i8vN2gd8uHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226147

findutils installs an empty /var/lib which is already created
by base-files. It doesn't need to be packaged by findutils.

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 meta/recipes-extended/findutils/findutils_4.10.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
index 29ad6c7350..8d5c721522 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -15,6 +15,10 @@ EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 # need od from coreutils for -t option
 RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
 
+do_install:append() {
+	rm -rf ${D}${localstatedir}
+}
+
 do_install_ptest:class-target() {
 	mkdir -p ${D}${PTEST_PATH}/tests/
 	cp ${S}/init.cfg ${D}${PTEST_PATH}
-- 
2.25.1


