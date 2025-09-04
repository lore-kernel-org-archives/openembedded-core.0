Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A49CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:53:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.35797.1756981401766891896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Jqznf56Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849Tu5G005675;
	Thu, 4 Sep 2025 09:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JNk8RkRSX5I/M0iO0aqD5P
	a4cES2aNjXh2h9E4QzTAk=; b=Jqznf56ZxNwS2DduTA7/eIwC6SoP+5sbmacsvm
	JOoZGFYivg1wnsxVyNIDF8cYVheGjEbMwMKF1vn5iB6O4M2Pes5mzYeD8XccbPw/
	+3g8v9w8GK380Thk79nIJksWG3mzsEYBq991sh53+SVjJAcyc2L/WedH+/Bw+Nhh
	OGTpssP+N2J/zF2PvPn9u4GvPSsUysGqqKa9WJzxOLfsPcNlLXzuYG2K1dUN1gnP
	lAVrYBPhfXHfaQOZpJ4ypYXrxhXmreoT1CSRYDXxk56XayWIYMTJrT34YjprIqN9
	NFRyVcpIUkwnYKcR/XqbOiBqkiBFb4jXm9M+u8W90h9UtF7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj3h2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 09:31:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5849Vpr1008291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 09:31:51 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 4 Sep 2025 02:31:49 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Adrian Freihofer
	<adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/2] kernel-fit-image: control kernel section with FIT_LINUX_BIN
Date: Thu, 4 Sep 2025 15:01:20 +0530
Message-ID: <20250904093122.593125-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX2i2ol0jngDhL
 oS+ZTINR5DQaH2xtVnCNpYeYMoneNygmy1ifopUzMWbnOcQov1XEC4ceo0mmyB5pJ/79lK5MwxE
 TvOvsuijg+VX2G8gZ0NT0NmU8bQbd0BjUcxKwivG0/v3JUi893muQM1TsJ3iCtgDlA+XmJpPqjk
 gFu/kG4VIX7IYjfRTlORTBWJvFfVMVlxMXFrlv4zmSXi9Jsp+r40R4w2HniVuEa7VVuLhNvfs3/
 kxBYzIviiLK5e0ayr7uNF1bwrEu/QOe9b/Eojr0S1nkLpbAu+r/C3SAvFeurG6mIMBLteFhlHun
 gHl8T+WF3EnGkWKmGp7gAGpNmpKZ8L9T/fctQcDogXHt3JxqiOrt/DwIZ3bDmq0D2JTfZHJC1dL
 VUVm9chE
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b95c87 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=a_U1oVfrAAAA:8
 a=pi_VCbDn7lDvN86r4GgA:9
X-Proofpoint-GUID: WCWFU6otJDwCVkc-RSbHqlYNd3P05YXC
X-Proofpoint-ORIG-GUID: WCWFU6otJDwCVkc-RSbHqlYNd3P05YXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222926

Update kernel-fit-image.bbclass to conditionally include the kernel
section based on FIT_LINUX_BIN variable.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index fd4c6a30fe..f04aee1807 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -59,12 +59,14 @@ python do_compile() {
     )
 
     # Prepare a kernel image section.
-    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
-    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
-        linux_comp = linux_comp_f.read()
-    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
-        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
-        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
+    linux_bin = d.getVar('FIT_LINUX_BIN')
+    if linux_bin:
+        shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
+        with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
+            linux_comp = linux_comp_f.read()
+        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
+            d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
+            d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
 
     # Prepare a DTB image section
     kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
-- 
2.34.1


