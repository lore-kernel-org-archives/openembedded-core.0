Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BA6CAC5A9
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:58:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11278.1758270144408625833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 01:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QZryOI+r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J1RlS1007439
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHIJ0lQmYKAncm1uvRnE+CK2xKN4MNFKR1xbCxMZOUg=; b=QZryOI+rx714ZAiz
	8gVx97idRIMlcCCC6EtVXu48n0w4OQZQrqGucu6ltWyhCNZg+8aeEtHe1gLPXcWi
	3Aw2H8a2NofMwuzSlZaTZ0mTLgedmS6eU28NvW13ATXmJ5RbYP6CEC5/9+YFJVmV
	avCjkD+o4Gm6bfwPob4nXVzOPd+IDKHwGyk68ZSTmV4Z+loj3ODdRbnritq/TOGZ
	nrHIzBaXi/y7bY/byzp1dyysS11oxJSXVV1HORTsOnJSzG2MvNsgeSiOdfEgmLuS
	dV1b5Sqb4IttsWghY5Sx+6HE9gn2k6qGwazDSA2nCyKyZpQl5PnKc/yH57EvhqGE
	vjzchA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebeuybf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:34:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58J7Y2Lx002222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:34:02 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 19 Sep 2025 00:34:01 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH 1/2] kernel-fitimage: add support for custom ITS file override
Date: Fri, 19 Sep 2025 13:03:34 +0530
Message-ID: <20250919073335.2069114-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919073335.2069114-1-kavinaya@qti.qualcomm.com>
References: <20250919073335.2069114-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K6u0HqKzfRSFyiBn2HlBNt6a1ZGWr63m
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd076b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ndsmC8xSO5GF6cpKoY0A:9
X-Proofpoint-GUID: K6u0HqKzfRSFyiBn2HlBNt6a1ZGWr63m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX5IsbIcc2glPz
 ILm5RpRwueBd9s6IA+m6U/DH/7oNpaS33xcs0ErrxJhw6iGEb1cXO4MmQ5MiYcOeRiYREU+4Dfl
 JzpQjziKMVtaFJ7P94WONRjjo2btNPA9zqcQl/1oH72iWetAJOJ7x2WDPMuvwafkiosN+JXsOvU
 0bbIWEiVsMlwoRVtPFWm/xy5f1ca1BhwmeyCnXop3pk7BQnT9OuxN0bLUNaOaY/txHKP4SkA5wZ
 vtZ+LmtME7U56quD2b6LbrYq1COjyK9FQSZlPVNTg58Wxi3wO4HgeU0uuUjNreBIhf3FnP38UzO
 HfE0ofOJVH6S3IZ+I6C7HFI3VLxDX1OXAgTInCIBLkJfjGBK2YUU95SAIbKtoiM2Cw4CbpxNPit
 Wqn1WLIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223768

Update kernel-fitimage.bbclass to use CUSTOM_ITS_FILE when provided.
If the file exists, it will be used instead of generating an ITS file.
This improves flexibility for advanced use cases while maintaining
backward compatibility.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..9258af938c 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -139,8 +139,15 @@ python do_compile() {
     # Generate the configuration section
     root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"))
 
-    # Write the its file
-    root_node.write_its_file(itsfile)
+    # Resolve the full path to the custom ITS file if one is specified.
+    # If CUSTOM_ITS_FILE is not set, the ITS file will be generated dynamically
+    custom_its_file = d.getVar('CUSTOM_ITS_FILE')
+    if custom_its_file:
+        custom_its_file = os.path.join(kernel_deploydir, custom_its_file)
+        bb.note(f"Using custom ITS file: {custom_its_file}")
+        shutil.copyfile(custom_its_file, itsfile)
+    else:
+        root_node.write_its_file(itsfile)
 
     # Assemble the FIT image
     root_node.run_mkimage_assemble(itsfile, fitname)
-- 
2.34.1


