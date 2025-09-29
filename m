Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5E6CAC5BE
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 14:47:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.56083.1759157265844505852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 07:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FpZEP/tI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9Ki39019276
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1W48W+pqHLvle6mjTR/6599FuYCYdwDkEqARycodxM4=; b=FpZEP/tIpV9VUPJF
	3888/q0OLmihprGnEPC6vv3uDrFqa699lXDas8aorD18OI6j2Rzz95HrX0yuuZBq
	4bMM+aVbwQjBA+sk5RUHqwaX+2Xp6AlFsKMM940EbZCcU1hPXb11A38U0dPTnDx1
	4oscmw9lV+WlAsdZn9PjfN/YsXT+LI3lbrLltHersEYCkC6cN+tfckBzluDe3xA8
	GyOHchJDAqAzYB9VLqUQWraUfmoNWJyyl3qwcSaCVCf5GIVLL5kh1U9PNxwVtouo
	S2ScUldiLUCRNhMyMpUL0w07flm/iuZjEvowtrsM5F+UXtGL7s2Z7lpyfX8DP3F6
	UqB40w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hddqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58TEliRA027084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:44 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 29 Sep 2025 07:47:43 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v1 1/1] fitimage: Add support for custom compatible string via optional parameter
Date: Mon, 29 Sep 2025 20:17:21 +0530
Message-ID: <20250929144721.1001156-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929144721.1001156-1-kavinaya@qti.qualcomm.com>
References: <20250929144721.1001156-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXyqhv93MpyhmB
 sXl3Y+kmrR9xQrxHxS+i+KfonqBVvOGh0vAMdN+MRME2WxXfBD7fTwt/TqaW7J/N43FTiv6dOho
 +PE+41iBRqO3ephmnF4yPb+z7F9hnd34bWzJMY9Ym2AQa9RNLny0F+vNPhydxs+WzHVMVLScAvr
 AeKAGD+mEETc/wjrfy1t+4rl3Q8Vu68XofDt7zNSkolezM6sj0Q/NyOAX6x5QzWLb4yqG9yLpoO
 iXK8scq6kTeYzgOdsKtt//TR9qjM3ofDjcf5RtBy33xc0j7PkrhvaosBgEKEpFlYlz8sddOEfXV
 izZtuytvqZ7mf5KMLWpGyg1f0CaUMQtozz4r4YPJJS8wkMMGTecxH5xwRcUaYDLJZxPBrHNgw3W
 8PLfHpoY1S8LSuLc7FQFmCy4KbBpaA==
X-Proofpoint-GUID: XZzo101hWpfbWNfpCun9-pVek_CqQqLE
X-Proofpoint-ORIG-GUID: XZzo101hWpfbWNfpCun9-pVek_CqQqLE
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da9c11 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tOpqdU99uoYDTdphbhQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224146

Currently, fitimage_emit_section_dtb() always derives the 'compatible'
property from the DTB using fdtget when add_compatible=True. In some
cases, it is desirable to override this with a custom compatible string
defined in the build metadata.

This patch introduces an optional 'custom_compatible' parameter to
fitimage_emit_section_dtb(). When provided, this value is used instead
of extracting from the DTB. The parameter accepts either a space-
separated string or a list of strings, which are split into the
compatible array for the ITS node.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
 meta/conf/image-fitimage.conf                |  6 ++++++
 meta/lib/oe/fitimage.py                      | 12 ++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..08b05f7aed 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -84,8 +84,9 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
+            custom_compatible_str = d.getVar(f"COMPATIBLE:{dtb_name}")
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"), True, custom_compatible=custom_compatible_str)
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..16fa0de9fa 100644
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
+#   COMPATIBLE:<dtb-filename.dtb> = "custom-compatible-string"
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..2ff39e9e62 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
         self._kernel = kernel_node
 
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
-                                  dtbo_loadaddress=None, add_compatible=False):
+                                  dtbo_loadaddress=None, add_compatible=False, custom_compatible=False):
         """Emit the fitImage ITS DTB section"""
         load=None
         dtb_ext = os.path.splitext(dtb_path)[1]
@@ -309,7 +309,15 @@ class ItsNodeRootKernel(ItsNode):
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
         if add_compatible:
-            compatible = get_compatible_from_dtb(dtb_path)
+            if custom_compatible:
+            # Accept either a string (space-separated) or an iterable of strings
+                if isinstance(custom_compatible, (list, tuple)):
+                    compatible = list(custom_compatible)
+                else:
+                    compatible = str(custom_compatible).split()
+            else:
+                compatible = get_compatible_from_dtb(dtb_path)
+
 
         dtb_node = self.its_add_node_dtb(
             "fdt-" + dtb_id,
-- 
2.34.1


