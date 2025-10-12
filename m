Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59553CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 09:57:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.15998.1760263023731240448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 02:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QRT0gIiI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59C6sgfr007474;
	Sun, 12 Oct 2025 09:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M49Ek602x8SetTBz/HkrYo
	dCa0LGxB1gpUe5aNxJv/k=; b=QRT0gIiIC08it6dTarEZ822dvXPZH2Ydx0toE4
	QejA0YRnGTBbsVEJHb7ARDmew8tyMafQ6J8oTgjhtFG4XwG82fgYtbbg6pDRvgvF
	B9p6mkLdN65skPtp/ZmXh89LAjfmbgWKVLjSD9LFFiGjsOkpJGtrLEON4NDBBBAw
	dosMoCLWM8FYbflxWYARZ6iaSQsTePlnnh3JkBO7m9klmlnWomc8eOCFGI/qm1Md
	fz2yjyOdPDUmd3xOPDDhInTLmscav4bcmT+MNWteDN9rf98qqPYwehPx55a7jWCr
	lhnF2lW4OvsnBqIUrOsZd+l9Wp0vtdqkzbGN5QQA8Ec4AWhw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bst4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Oct 2025 09:57:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59C9v1BJ007174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Oct 2025 09:57:01 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Sun, 12 Oct 2025 02:56:59 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5.1] kernel-fit-image: allow extending compatible string property for DTBs
Date: Sun, 12 Oct 2025 15:26:44 +0530
Message-ID: <20251012095644.1935404-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: to2eupY1QTl-p8rgpQOg-qZu4aUbhf1A
X-Proofpoint-ORIG-GUID: to2eupY1QTl-p8rgpQOg-qZu4aUbhf1A
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68eb7b6e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=R7RgVI56L6oBx1MsmUMA:9 a=rYgVvZsUlkTETui3:21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXxYFdgAU4/tNL
 ehSsT2zAEpUnJRkAlfU5ZqUE6dPOJlZGgbA0UEmRFigMUAgruhLh4D9lFX8LLRDF6kihR54SL85
 1mwtUB8Lj+D9gL+5C9RcmzEq4nE3Q4QlKM1yU8lyQmcx+AWGRujYoyrzvDqYDw+DPS4P5cWfRxp
 elt0pGnD3tqlDSWl1jldn+Skd8novDN5QdhHKjhLCoOC16NeS/Mik5vfNR4j+LndCsoQYThuK0A
 WaYqW3P5phZ0jZ4ShN4d0/nD+VsZQWWPWnMmYtctqmt8If1UL8kPYehXgl9yL6DaDOzqDTgGzby
 jn9SIhoGp5Yqp4nRXgt54E8AvmNCAdsHzy+KcfUiiTLVG9KfpnN7CkwqTi6lD1QT2GqyZzD1onG
 B3PfI7t/ghnW5XYuOwZlqqI01Wd9mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224730

The Linux kernel allows multiple DTBs to share the same compatible string.
For example:
qcs6490-rb3gen2.dtb
qcs6490-rb3gen2-vision-mezzanine.dtb
qcs6490-rb3gen2-industrial-mezzanine.dtb

All of these use the same base compatible string:
compatible = "qcom,qcs6490-rb3gen2", "qcom,qcm6490";

Since the latter two DTBs are overlays on top of the base DTB and do not
modify platform properties, they retain the same compatible string.

When these DTBs are bundled into a single fitImage, the bootloader cannot
distinguish between them due to identical compatible strings.

To address this, introduce a mechanism to extend the compatible string
using a OE build variable:
FIT_DTB_COMPATIBLE_EXTENSION[dtb_name] = "extension"

This appends the extension to the first compatible string in the DTB,
resulting in unique entries in the generated .its file. For example:
FIT_DTB_COMPATIBLE_EXTENSION[qcs6490-rb3gen2-vision-mezzanine] = "vision"
FIT_DTB_COMPATIBLE_EXTENSION[qcs6490-rb3gen2-industrial-mezzanine] = "industrial"

Generates:
compatible = "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";
compatible = "qcom,qcs6490-rb3gen2-industrial", "qcom,qcm6490";

Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  8 ++-
 meta/conf/image-fitimage.conf                | 12 +++++
 meta/lib/oe/fitimage.py                      |  4 +-
 meta/lib/oeqa/selftest/cases/fitimage.py     | 55 ++++++++++++++++++++
 4 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..3fd31db478 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -84,8 +84,14 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
+
+            # Consider compatible extension if avilable
+            name, ext = os.path.splitext(dtb_name)
+            extension = (d.getVarFlag("FIT_DTB_COMPATIBLE_EXTENSION", name) or "").strip()
+
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"),
+                compatible_extension=extension)
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..b00c1ad814 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -65,3 +65,15 @@ FIT_ADDRESS_CELLS ?= "1"
 # Machine configurations needing such a script file should include it in the
 # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
 FIT_UBOOT_ENV ?= ""
+
+# For specific DTBs extend "compatible" strings when creating FIT images.
+# Format:
+#   FIT_DTB_COMPATIBLE_EXTENSION[<dtb_name>] = "<extension>"
+#
+# Result:
+#   dtb_name.dtb {
+#    ...
+#    compatible = "string1-extension", "string2", ...;
+#   };
+#
+FIT_DTB_COMPATIBLE_EXTENSION ?= ""
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..58de1afaaa 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
         self._kernel = kernel_node
 
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
-                                  dtbo_loadaddress=None, add_compatible=False):
+                                  dtbo_loadaddress=None, add_compatible=False, compatible_extension=""):
         """Emit the fitImage ITS DTB section"""
         load=None
         dtb_ext = os.path.splitext(dtb_path)[1]
@@ -310,6 +310,8 @@ class ItsNodeRootKernel(ItsNode):
         compatible = None
         if add_compatible:
             compatible = get_compatible_from_dtb(dtb_path)
+            if compatible and compatible_extension:
+                compatible[0] = compatible[0] + "-" + compatible_extension
 
         dtb_node = self.its_add_node_dtb(
             "fdt-" + dtb_id,
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 195b9ee8b5..582e581415 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -17,6 +17,9 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var
 
 
+from pathlib import Path
+
+
 class BbVarsMockGenKeys:
     def __init__(self, keydir, gen_keys="0", sign_enabled="0", keyname="", sign_ind="0", img_keyname=""):
         self.bb_vars = {
@@ -819,6 +822,58 @@ MACHINE:forcevariable = "beaglebone-yocto"
         # The alias is a symlink, therefore the compatible string is equal
         self.assertEqual(comp_alias, comp)
 
+    def test_fitimage_compatible_extn_in_its(self):
+        """
+        Verify that FIT_DTB_COMPATIBLE_EXTENSION[...] is honored in the generated .its.
+
+        This test:
+        1) Selects beaglebone-yocto machine and a DTB that is part of its kernel.
+        2) Sets FIT_DTB_COMPATIBLE_EXTENSION[am335x-bonegreen-ext] to custom extension.
+        3) Runs do_assemble_fitimage to generate the FIT .its.
+        4) Asserts the .its 'compatible = ...' includes extended ones.
+
+        """
+
+        kernel_dtb = "am335x-bonegreen.dtb"
+        dtb_name = os.path.splitext(os.path.basename(kernel_dtb))[0]
+
+        config = f"""
+DISTRO = "poky"
+MACHINE = "beaglebone-yocto"
+
+# Ensure the FIT flow is active
+KERNEL_CLASSES += "kernel-fit-extra-artifacts "
+
+# Ensure the selected DTB is built into the kernel deploy output
+KERNEL_DEVICETREE = "{kernel_dtb}"
+
+# Provide the extension as a varflag (pairs: base:suffix)
+# Original compatibles: "ti,am335x-bone-green", "ti,am335x-bone-black"
+FIT_DTB_COMPATIBLE_EXTENSION[{dtb_name}] = "subtypeA"
+
+"""
+        self.write_config(config)
+
+        bitbake('virtual/kernel:do_deploy')
+        bitbake('linux-yocto-fitimage:do_deploy')
+
+        # Find the generated .its in DEPLOY_DIR_IMAGE
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.assertTrue(deploy_dir_image and os.path.isdir(deploy_dir_image),
+                    f"DEPLOY_DIR_IMAGE not found or invalid: {deploy_dir_image}")
+
+        its_path = os.path.join(deploy_dir_image, 'fit-image.its')
+        self.assertTrue(os.path.exists(its_path), f"Expected ITS file not found: {its_path}")
+
+        # Read the ITS content
+        its_text = Path(its_path).read_text(encoding='utf-8', errors='ignore')
+
+        # Assertions: extended compatibles must appear
+        if "compatible" in its_text:
+            self.assertIn('ti,am335x-bone-green-subtypeA', its_text)
+        else:
+            pass
+
     def test_fit_image_ext_dtb_dtbo(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created correctly.
-- 
2.34.1


