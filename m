Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2AECCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:05:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.10607.1760515525055125008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mpImTYNd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFKC002700;
	Wed, 15 Oct 2025 08:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DmtWeRUQtE12k39XoawNvU
	Coqf9zgAT0JpjPK5sXIAM=; b=mpImTYNdf0merP0I0TmrlXiD0ZOvrF5OUz2IT3
	DFJOAYWJ4vGMp2pWqcnsb7FFSsJWa1EekM/xvFndb4qYO3vvdVwEurXZ/CbmrfxZ
	JrhWuqaBGina+hh/GtS6pijBuK434Kg3736PBxWD35qd8+kn+BP4gGYLN82dQgxu
	SXUNpnRtw7j+y4dIa2He+hmOBqO5iYOhn07s23wu6WPTXQsgaGg9B4QdDr3gmrfG
	sRWJFMHe1kuDhnJv56bytjDc7c/iGTkkiU25loaRoye2JcctYUGSFBpPbhc3e7oz
	oI2h5cdMbv3UOI6wfnLeDPrYLmXWL2prnHnB0QQB+RtSMLBA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8bn7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 08:05:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59F85M0f030956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 08:05:22 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 01:05:20 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7] kernel-fit-image: allow overriding DTB compatible string
Date: Wed, 15 Oct 2025 13:35:02 +0530
Message-ID: <20251015080502.1704801-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MF85h8Wwheqg1o9YThS3QwcVTDIFwq2g
X-Proofpoint-ORIG-GUID: MF85h8Wwheqg1o9YThS3QwcVTDIFwq2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXxwl7GRmDkaqn
 gEKhilDyeK2OdMi4s5qAU5Cr4O+of0+zP26/r4HlTkW7hL2sa2chpPXk5mqNNKuqAg5f9ncmDo/
 MU4rdnvknrIlwv2iHu+EzOGZZEd3lCnQ7v7qpDrCGDQ1+wSgzMpukquuKf3wZ+PB0XF4/Ia/Vvy
 unAV6rZcUaneWEBTCAQvMGg3CwpOTLekEETnp3cfZFAkUeV1l7bFm/hyvLb5eVL8ces45qJB07r
 hU13A/CEr//txwEJmXzs1b60/jjPKdGSOYA4M50aDhjZ++PL8JY7uGmDqJ16/vb6ikwyO6GeYdH
 LFFmn11SVDFkZUTdgKZET0d/BuMWoTPDtZOx5uOetOs009FGzWB0tNOFqlIwjsJCYIaxT2GzMz7
 xnf77Av35HFtG9F4ueRwWcgdX8WS8g==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ef55c3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ljDJxCxBXe7K4waazkEA:9
 a=rYgVvZsUlkTETui3:21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224881

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

To address this, introduce a mechanism to override the compatible string
using a BitBake variable:
FIT_DTB_COMPATIBLE_OVERRIDE[<dtb_name>] = "<compatible_string>"

This overrides the compatible string generated resulting in unique entries in the
generated .its file. For example:
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] = "qcom,qcs6490-rb3gen2-vision"
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] = "qcom,qcs6490-rb3gen2-vision qcom,qcm6490"

Results in:

compatible = "qcom,qcs6490-rb3gen2-vision";
compatible = "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";

Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  7 ++-
 meta/conf/image-fitimage.conf                | 16 +++++++
 meta/lib/oe/fitimage.py                      | 16 +++++--
 meta/lib/oeqa/selftest/cases/fitimage.py     | 50 ++++++++++++++++++++
 4 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..0a6125b3b6 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -84,8 +84,13 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
+
+            dtb_base = os.path.splitext(os.path.basename(dtb_name))[0]
+            compatible_override_str = d.getVarFlag("FIT_DTB_COMPATIBLE_OVERRIDE", dtb_base) or ""
+
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"),
+                compatible_override=compatible_override_str)
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..9c51b28095 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -65,3 +65,19 @@ FIT_ADDRESS_CELLS ?= "1"
 # Machine configurations needing such a script file should include it in the
 # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
 FIT_UBOOT_ENV ?= ""
+
+# For specific DTBs, add custom "compatible" strings when creating FIT images.
+# Format:
+#   FIT_DTB_COMPATIBLE_OVERRIDE[<dtb_name>] = "<compatible_string>"
+#
+# Result:
+#   dtb_name.dtb {
+#    ...
+#    compatible = "compatible_string";
+#   };
+#   Example:
+#   FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] = "qcom,qcs6490-rb3gen2-vision"
+#   This will result in compatible string like:
+#   compatible = "qcom,qcs6490-rb3gen2-vision";
+#
+#
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..fc37ce7665 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -289,7 +289,8 @@ class ItsNodeRootKernel(ItsNode):
         self._kernel = kernel_node
 
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
-                                  dtbo_loadaddress=None, add_compatible=False):
+                                  dtbo_loadaddress=None, add_compatible=False,
+                                  compatible_override=None):
         """Emit the fitImage ITS DTB section"""
         load=None
         dtb_ext = os.path.splitext(dtb_path)[1]
@@ -309,7 +310,10 @@ class ItsNodeRootKernel(ItsNode):
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
         if add_compatible:
-            compatible = get_compatible_from_dtb(dtb_path)
+            if compatible_override:
+                compatible = str(compatible_override).split()
+            else:
+                compatible = get_compatible_from_dtb(dtb_path)
 
         dtb_node = self.its_add_node_dtb(
             "fdt-" + dtb_id,
@@ -321,12 +325,16 @@ class ItsNodeRootKernel(ItsNode):
         )
         self._dtbs.append(dtb_node)
 
-    def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_path, add_compatible=False):
+    def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_path, add_compatible=False,
+                                        compatible_override=None):
         """Add a configuration node referring to another DTB"""
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
         if add_compatible:
-            compatible = get_compatible_from_dtb(dtb_path)
+            if compatible_override:
+                compatible = str(compatible_override).split()
+            else:
+                compatible = get_compatible_from_dtb(dtb_path)
 
         dtb_id = os.path.basename(dtb_path)
         dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, compatible)
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 195b9ee8b5..d32d7b6e2f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -819,6 +819,56 @@ MACHINE:forcevariable = "beaglebone-yocto"
         # The alias is a symlink, therefore the compatible string is equal
         self.assertEqual(comp_alias, comp)
 
+    def test_fitimage_custom_compatible_in_its(self):
+        """
+        Verify that FIT_DTB_COMPATIBLE_OVERRIDE[...] is honored in the generated .its.
+        This test:
+        1) Selects beaglebone-yocto machine and a DTB that is part of its kernel.
+        2) Sets FIT_DTB_COMPATIBLE_EXTENTION[am335x-bonegreen-ext] to a custom string.
+        3) Runs do_assemble_fitimage to generate the FIT .its.
+        4) Asserts the .its 'compatible = ...' includes custom compatible string.
+
+        """
+
+        kernel_dtb = "am335x-bonegreen-ext.dtb"
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
+# Original compatibles: "ti,am335x-bone-green", "ti,am335x-bone-black"
+FIT_DTB_COMPATIBLE_OVERRIDE[{dtb_name}] = "subtypeA"
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
+            self.assertIn('subtypeA', its_text)
+        else:
+            pass
+
     def test_fit_image_ext_dtb_dtbo(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created correctly.
-- 
2.34.1


