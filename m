Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC31CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 05:53:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.36254.1760334798556567996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 22:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aH3M5Dcs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nAIN029358
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Dvsu4R1dZmRV8E24y8ahQ
	uTeOHKksoMUoEs3UxfRHU=; b=aH3M5Dcsv2XrlmYf2QOQ6Av8xePbK892GfeENJ
	hZLeJhfYSPulbLhMu0y0uVDsgnxzG5MPnjDOh+BoEJW/nZFfqimdQobvlOpgsIgR
	HX9wPk8vZg0VbB1P1BxaDrGQ4hVsp+I1r87l1JREG+wWIoXQj1YTpBLjWsqbB7tY
	SBqQRl7nJ1YDsfOmsG7wpur2MrMnVps93w5mDpESCBis/4kFXKuNywhMMaT9LsAS
	JV9I1iWNz7e3Hl/EsgdHQM6ZbGyLK14jh+sRjjMhLuHoa6suodUiTsjH3LalkpqL
	BJZeG3O8WgS1dHxYFta4Erp/xATutFYzIV10+TQkZbOGCPCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5bdcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:53:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59D5rGsw024364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:53:16 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Sun, 12 Oct 2025 22:53:15 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v2] kernel-fit-image: enable compatible string for kernel built-in DTBs
Date: Mon, 13 Oct 2025 11:23:00 +0530
Message-ID: <20251013055300.2425913-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o5QqGvQztIf6b-Uj5SLy6Hq4Q3IzcYXd
X-Proofpoint-ORIG-GUID: o5QqGvQztIf6b-Uj5SLy6Hq4Q3IzcYXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXyxxJAFu+ZjZ9
 bLTZw0UkEN/KtyWTDCjLyjQniV/qNQp8nqdhofxJ98k6GQJcqe/EhMyDYZ6HmXTWK25uMjRCqcB
 hMwjh0Hg+JB2evy+gzZFFh/vt7qPvjXbDamquJRPHJm+ouP+9MHVYBLtvgrRnXscY2YQX3+igRz
 Dy8f6CX2otJYLmmutioIX1LhsVilrA3iIrfUXwDMeRfRY59m0ss+WIJ5josBwdWebJLL9IBxP1A
 s150fFTojsH8DpkSBMfy2i+bMtUicys1hRgGTKEgsEL9fvgD9RdUTgjGZgoCZwIMYJl5LDOPtnV
 eS2QaUVWktMGflvoV2UiIND2RvDc73T4UPwT08W7BO64vtmDFvqf5naTk/5YMjWp7LIUh1akbXU
 17eVlOJ5vtnn+SLimKnGSjdiWJimKw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ec93cd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=6cRAjit5A-7ZIy2jTxoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224757

At present, the kernel-fit-image bbclass is adding compatible strings only
for external DTBs, omitting them for DTBs built from the kernel tree. This
behavior is limiting the ability to clearly identify the DTBs in FIT image
that includes multiple kernel built-in DTBs and possibly mix of in tree and
external ones, due to lack of consistent compatible strings.

To fix this, introduce a new BitBake variable, FIT_DTB_ADD_COMPATIBLE
when set to "True", the bbclass will extract and include the compatible
string from kernel-built DTBs also in the .its file, just like it does
for external DTBs.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
 meta/conf/image-fitimage.conf                | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..3aa7a2e75a 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -85,7 +85,8 @@ python do_compile() {
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"),
+                add_compatible = bb.utils.to_boolean(d.getVar("FIT_DTB_ADD_COMPATIBLE"), False))
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..35e0459d09 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -47,6 +47,9 @@ FIT_LINUX_BIN ?= "linux.bin"
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
+# Allow user to choose if DTB in FIT image can have compatible strings.
+FIT_DTB_ADD_COMPATIBLE ?= "False"
+
 # length of address in number of <u32> cells
 # ex: 1 32bits address, 2 64bits address
 FIT_ADDRESS_CELLS ?= "1"

