Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16490CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:13:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.2133.1759162372947297768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 09:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Z8yZNMHm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9nMTu017957;
	Mon, 29 Sep 2025 16:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	enfNZ40hFGmKcrJgtmbtyej/OTYA2PlsxBdYSpm1uKw=; b=Z8yZNMHm+jqKun1D
	mslEIqh1gQc+9j8mqqr5IsnjDgfzqYa40wgaE3asLgaBnBFL/1RwgNhr9S2jQcL4
	jPkoBhR4Ki1FErl1bGuNFHH44xa1A2eHi5UNwIty14CCg30dngcgkylmVxGAtjnS
	iHULDc6A8iSn7rvoM4Tq3Sz5+GJ8+cGF0cPTOU3OYJfPIRVl3azCeqr1c1cVqfRW
	zDKOWf53jjX9h+r13Uq2LldFD+F9UUIoPXgo6qjutYaOU3Xu2P/4/DbYE97fZ6MD
	qb+6VifJK9znXpoRleQmrZRbAXmQwKq8Oi8CViBuvMOQkU3OhEmWDrfvWcsut99A
	4m4f9Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tp07b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:12:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58TGCo1b005310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:12:50 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 29 Sep 2025 09:12:48 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: [PATCH v3 1/1] fitimage: Add support for custom compatible string via optional parameter
Date: Mon, 29 Sep 2025 21:42:25 +0530
Message-ID: <20250929161225.1290751-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929161225.1290751-1-kavinaya@qti.qualcomm.com>
References: <20250929161225.1290751-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXz6mBwM+i+/6e
 u45nS41iPK3hCdA7QqEAhC9oaWp+pixUT572MKIwT9rnUTbXo9FdWNQ7f/RyQ4UWe/PhTiCh/o2
 q3u5+rczaO4CXL6rtwIajrDep5uYO7znlph1mSp40kmf4AbFDnk4JNMIwYkJPXZpzDgGgxi1Ryf
 4Oe4i2QYqALe0fMXEv3iR3/eB7kF78//U73iKJoVPQEM6r96a06E7gkjeyxGkYYY9q+aS9UnhjO
 xk7D/Sqf5MlBM6FkX+x6Bzuga4u2SJv7RKMx6bgPdu3Es1TFczb8NFGGu7Qm23q5Aklbyw4i9nV
 sV6hwHag2Jhg95qZYSgxF/EfnlGgJCYbuZMr2cmLuNDls/axXIKj5PSIEP6jgjUsWhGL/5y0qiT
 A3MGdPRzgKbxtnAYuTwLYTmsMlY1ww==
X-Proofpoint-GUID: 5004nbQs1IDBW8vhz-EiK-JxOEev3C1G
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dab003 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=1BC9iaNsXRMBJFzlubMA:9
X-Proofpoint-ORIG-GUID: 5004nbQs1IDBW8vhz-EiK-JxOEev3C1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224154

Currently, fitimage_emit_section_dtb() always reads the 'compatible'
property from the DTB when add_compatible=True. This patch adds an
optional 'custom_compatible' parameter that, when set, overrides the
value from the DTB. If not provided, the existing behavior remains.

The compatible property is also skipped for DTBO nodes.

Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
 meta/conf/image-fitimage.conf                | 6 ++++++
 meta/lib/oe/fitimage.py                      | 9 ++++++---
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..2a266242d0 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -84,8 +84,9 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
+            custom_compatible_str = d.getVar(f"FIT_DTB_COMPATIBLE_OVERRIDE:{dtb_name}") or None
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"), True, custom_compatible=custom_compatible_str)
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..62f7bcde6c 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -65,3 +65,9 @@ FIT_ADDRESS_CELLS ?= "1"
 # Machine configurations needing such a script file should include it in the
 # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
 FIT_UBOOT_ENV ?= ""
+
+
+# To override the DTB 'compatible' string in the FIT image, add in your
+# machine.conf or local.conf:
+#
+#  FIT_DTB_COMPATIBLE_OVERRIDE:<dtb-filename.dtb> = "custom-compatible-string"
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..0d42bca5d7 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
         self._kernel = kernel_node
 
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
-                                  dtbo_loadaddress=None, add_compatible=False):
+                                  dtbo_loadaddress=None, add_compatible=False, custom_compatible=None):
         """Emit the fitImage ITS DTB section"""
         load=None
         dtb_ext = os.path.splitext(dtb_path)[1]
@@ -308,8 +308,11 @@ class ItsNodeRootKernel(ItsNode):
 
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
-        if add_compatible:
-            compatible = get_compatible_from_dtb(dtb_path)
+        if add_compatible and dtb_ext != ".dtbo":
+            if custom_compatible:
+                compatible = str(custom_compatible).split()
+            else:
+                compatible = get_compatible_from_dtb(dtb_path)
 
         dtb_node = self.its_add_node_dtb(
             "fdt-" + dtb_id,
-- 
2.34.1


