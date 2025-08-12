Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFE4CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 19:05:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.70959.1754993610378907755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 03:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IXC3+jKe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5ZM4Q022388
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opKXVRkO3/h+kyQxHctMvPPUhyjg0IZmXJTewGVtw4g=; b=IXC3+jKedrSKiZA3
	PxTJGHHPWFNtsfZfII7VE93jUYTe1L1nYFONRmFiqRw5S+96eNeP7rdVtLj9TaJ/
	aTG5+SEVZCohHRk3kRiR64n4t/zG2KoBI3lPbTTc7kwTcDlA42xIcqcyDTzfn9Jr
	Cn/MHcoPIuVEjJpeBmXzbQb2QCrjbV7nmb4V5BTA4PI9BLX14RysLpHo5/muyOJF
	JtLo2AHeJyZHTIbuKElsykG6Roq4EltaHcgramLXKUKz33FQA0Xe3rtPObyzXjs8
	jE/+HVCstEIsiEoV7SHJks/F/BMLQVpYeCtqQW0v6rMHwmk1tLE1iWt3QtK3QnMr
	68XfpA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vje0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:15:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C9FLDd018348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:15:21 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 02:15:19 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [meta][PATCH 1/1] kernel-fit-image: skip kernel section if linux.bin is missing
Date: Tue, 12 Aug 2025 14:44:53 +0530
Message-ID: <20250812091453.1760880-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812091453.1760880-1-kavinaya@qti.qualcomm.com>
References: <20250812091453.1760880-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXxNYixGZXcl89
 n2lLfIGO5zZ5cBBn+abYgBJ0h7vjZG8mpACPOEo9UZ3HXJvLB80TBmSvDur1NksA9PMaJrYi1Ru
 hF7oibI4N3iD2a0sKxQSqMhQeQ3DeKs68LGZMBCoTAqLktVmPUkrrolXL+tb/JrYQHoUpKkrAmM
 +zUK9Z9LDg1ijn6yFxawPiUTf0NhnoacTEVTkFB0rPc989hG5uBKLwPACl+cad4T/6x0Gwnkt3J
 LnMEh4gNTgQTHV9i4j7ydmymyxmjEU1smPSfIKFBBhlDMyrRIwmCjB2oIIevFMPDdzogqWxKaiE
 C4rI1kQtoOwCjYuaDfgKH0BlpgL17TiFb4VCfEAer6IEW3sO1Ytn0lL7exLaM6MTaP/AtovtGd3
 40MX/Xvk
X-Proofpoint-GUID: KAh_dqMXYXX7iQMpy4Zp2W93e14rFsbI
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689b062a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5N9VRYQZFolNiC6LJuUA:9
X-Proofpoint-ORIG-GUID: KAh_dqMXYXX7iQMpy4Zp2W93e14rFsbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 19:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221868

Avoids errors during image generation by checking for the
presence of linux.bin before attempting to copy and emit the
kernel section. This ensures that the build process continues
gracefully when the kernel binary is not available.

A clean separation between firmware (including DTBs) and the
HLOS (Linux Kernel) is highly recommended and often necessary
to enable independent firmware updates, enforce trust boundaries,
and support running the same kernel across different hardware
platforms by simply swapping DTBs. One effective way to achieve
this separation is by using a Unified Kernel Image (UKI) that
contains only the Linux kernel and initramfs, while keeping the
DTBs in a separate FIT image, such as dtb.bin.

To support this setup, it's important to ensure that a FIT image
can be generated without requiring the Linux kernel binary,
allowing the build process to continue gracefully even when the
kernel is unavailable.

Additionally, this approach is very useful when the kernel-fit-
extra-artifacts class is not set, as it enables the creation of
an .its file without depending on the kernel.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 22 ++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index fd4c6a30fe..c0f925d90e 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -59,12 +59,26 @@ python do_compile() {
     )
 
     # Prepare a kernel image section.
-    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
-    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
-        linux_comp = linux_comp_f.read()
-    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
+    # Construct the full path to linux.bin
+    linux_bin_path = os.path.join(kernel_deploydir, "linux.bin")
+
+    # Check if linux.bin exists
+    if os.path.exists(linux_bin_path):
+        # Copy linux.bin to current directory
+        shutil.copyfile(linux_bin_path, "linux.bin")
+
+        # Read linux_comp file
+        linux_comp_path = os.path.join(kernel_deploydir, "linux_comp")
+        with open(linux_comp_path, 'r') as linux_comp_f:
+            linux_comp = linux_comp_f.read()
+
+        # Emit kernel image section
+        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
         d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
         d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
+    else:
+        bb.note("linux.bin not found. Skipping kernel image preparation. ")
+
 
     # Prepare a DTB image section
     kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
-- 
2.34.1


