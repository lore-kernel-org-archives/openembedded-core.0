Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B902CCA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 14:29:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.18818.1757070138527354922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 04:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YEU1/A8w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5859wQ5Z004158;
	Fri, 5 Sep 2025 11:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwaFlTjtRpLqQHvDp55koSo3N/O6FDkgnaVrjLNcQRw=; b=YEU1/A8wdrX3su4W
	x+b/o/VTCzpvQvojF7qVMWWujrFibxqQl0bhmLKEq4nbACwGcpG04K10RAEt/JEL
	dM+KwZbx+aDbFW3trpoH6VnhMUBNkbkFxP4CubKkKSxuJnoBkjz92DJAonkHMgrU
	qqu0+MacHsr63MYJZ+n/Ow/GfqWnq4GuVJNG5BKVjqJ4TqLT98ojBa8aOMsVTEGH
	FW9Rlf8/vJmyY5Plt80EisJsSbHgBpRKpsePvWc3uoaRa5rvdc5p0mgxJoURNv/k
	g9YbhkWNlwaeGdihy7ARnn+cILLVeRSBFzhR6Id3Uf/fdpIamCddZYNAbyDfhM98
	HpFSrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eu2jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 11:02:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 585B2HwY005242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 11:02:17 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 5 Sep 2025 04:02:15 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Adrian Freihofer
	<adrian.freihofer@siemens.com>
Subject: [PATCH v3 1/2] kernel-fit-image: control kernel section with FIT_LINUX_BIN
Date: Fri, 5 Sep 2025 16:31:51 +0530
Message-ID: <20250905110152.552108-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110152.552108-1-kavinaya@qti.qualcomm.com>
References: <20250905110152.552108-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I_DAo7TyKl0sQXFxDZbNdRM7TJF9DT75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXxcV9iYz0k7Tq
 W0i4sUf1xN3gN0tx+HOGNqBB3vk+jGihuVD62jeMiG3bwWXVL38iGmhX5WIFOwsM8vX08PMZLfZ
 s529tTvAgixPw5HG2HUIGwMbRK3JdxgyjnN3LeaPhwb2EUheoF1LVgmu6hk4yatk0lIz5XsKkBq
 mEYcEmG+xTnbxt7TgkvkC6/59cck98wWSGy2iMehtHnAk2O/nbEwIh1gP3er5c5X6gE1953vd+S
 FXUFUQxTLfrBGvaQAqihIuekIGjQTPppsuorHosz245ee1YwIY7c7KWgydMomMblaF3+pFSHibq
 wPEA0K2TN/0S09h1RjFm1lFwhp+QReyqHD3mCb5uGuC/NWb7Jefrh2OCmFtcy5iLc0YVuPy286Q
 TWJvy0vO
X-Proofpoint-ORIG-GUID: I_DAo7TyKl0sQXFxDZbNdRM7TJF9DT75
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68bac339 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=a_U1oVfrAAAA:8 a=EUspDBNiAAAA:8
 a=pi_VCbDn7lDvN86r4GgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 14:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223006

Update kernel-fit-image.bbclass to conditionally include the kernel
section based on FIT_LINUX_BIN variable.

Suggested-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
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


