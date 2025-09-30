Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BED0CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 06:51:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.19278.1759215102481440172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 23:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jcG3B3Y1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HObD027376;
	Tue, 30 Sep 2025 06:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	joj7UjuUiLlO1VIbF7eMbX4b9qNYFPPyfX6h5lleImg=; b=jcG3B3Y1jHX1fBnF
	9QAghKHsWKYQrCIKgmElGS7pXkRG1oVj1THNzw5MeeAEtt1z1+CCIVJpI0qw+CRg
	wYBA2OyrqQdxwq/zCkSOI08j131Hu5yw9L2eUroJVMiLlLAx6umRUs8sAHNFt5hs
	C6gXTi06v1TVof6AyFTeK7qmPOcXbjsK8pOdDZhoPqnyggkm116SaXaFgO618UR7
	IKfE3C11mqgEW8H1CluahaS5yY69f8qqWzlBtaVbne7WsyFTB3sCwSJWE2gnetX6
	xrFgKVmsJXrMdbgOtKVnup6qMTO3JwkgBydEYGy8A/JebZ/SwgeidQCUzqFJ8BvO
	39RFyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fva8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 06:51:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58U6peQZ016335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 06:51:40 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 29 Sep 2025 23:51:38 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: [PATCH v4 1/1] fitimage: Add support for custom compatible string via optional parameter
Date: Tue, 30 Sep 2025 12:21:17 +0530
Message-ID: <20250930065117.2625998-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
References: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db7dfd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=xIKALe65fH5wjVXwnnIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX6d91iun/QMGA
 tYycqhaI1iyl0ANshcvyaxGyC+D6FfosHD6A6G9RWof+swaLhFfbo7YhjzHD09GFwIIv8JllatR
 x7gswlLku+QCvwtmllJEUhS6dgu1wJfN1GEB0k5Z20I4dXKciGkw0Z+z97R0osYFd74Q4WPLvxt
 7s2kRSI12I9FBPsqoPdwZh2nBPQXZ7nV4Fjiv72hgdSqp3/b0VjXeH+Ru+beikFZfItxSUj299h
 rT02FER6QY3GVv43dlkWDXCig6+z1og3qt7SCoJ/+MhcRj40s9XmyD52rnEcPpHBL4Rdt9BPXPN
 M8cRYHW7Y/KV8zz2Y9bbpAOMIa5PkC+UWD5kUVeUXA8sZwcy8bk0fx87MB+WXwU+NNC2uZ2+EQO
 suHEo7HUXTpwk2of8faVAbZ5QXPiYw==
X-Proofpoint-ORIG-GUID: ixL8uQXsd5pMZErD-eZUSOtg-8tf5sxb
X-Proofpoint-GUID: ixL8uQXsd5pMZErD-eZUSOtg-8tf5sxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 06:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224175

Currently, fitimage_emit_section_dtb() always derives the 'compatible'
property from the DTB using fdtget when add_compatible=True. In some
cases, it is desirable to override this with a custom compatible string
defined in the build metadata.

1.The compatible string format that we require is different from what
  dynamic generation allows. The format that we rely on is:

   compatible = "qcom,<SoC>[-<soc_version>][-<foundry_id>]-<board>
   [/<subtype>][-<pmic>][-<board_version>]"

  This structure enables precise identification of the appropriate DTB
  for each board variant.

2.As in the upstream kernel Makefile for QCOM platforms
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/Makefile ), overlays are used to generate composite DTBs:

   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
   qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
   qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo

   In the above cases, the base DTB remains the same, but the
   overlays differ. In such cases,we cannot assign unique compatible
   strings to these variants.

This patch introduces an optional 'custom_compatible' parameter to
fitimage_emit_section_dtb(). When provided, this value is used instead
of extracting from the DTB. The parameter accepts either a space-
separated string or a list of strings, which are split into the
compatible array for the ITS node.

This patch also updates test_get_compatible_from_dtb() to check that the
FIT_DTB_COMPATIBLE_OVERRIDE_<dtb>.dtb variable is applied correctly.

Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
 meta/conf/image-fitimage.conf                |  6 ++++++
 meta/lib/oe/fitimage.py                      | 12 +++++++++---
 meta/lib/oeqa/selftest/cases/fitimage.py     |  8 ++++++++
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..de0f3c332e 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -84,8 +84,9 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
+            custom_compatible_str = d.getVar(f"FIT_DTB_COMPATIBLE_OVERRIDE_{dtb_name}") or None
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"), True, custom_compatible=custom_compatible_str)
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..f685948c3b 100644
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
+#  FIT_DTB_COMPATIBLE_OVERRIDE_qcs6490-rb3gen2-vision-mezzanine.dtb = "qcom,qcs6490-rb-subtype2"
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..54baba28bc 100644
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
@@ -309,7 +309,10 @@ class ItsNodeRootKernel(ItsNode):
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
         if add_compatible:
-            compatible = get_compatible_from_dtb(dtb_path)
+            if custom_compatible:
+                compatible = str(custom_compatible).split()
+            else:
+                compatible = get_compatible_from_dtb(dtb_path)
 
         dtb_node = self.its_add_node_dtb(
             "fdt-" + dtb_id,
@@ -326,7 +329,10 @@ class ItsNodeRootKernel(ItsNode):
         # Preserve the DTB's compatible string to be added to the configuration node
         compatible = None
         if add_compatible:
-            compatible = get_compatible_from_dtb(dtb_path)
+            if custom_compatible:
+                compatible = str(custom_compatible).split()
+            else:
+                compatible = get_compatible_from_dtb(dtb_path)
 
         dtb_id = os.path.basename(dtb_path)
         dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, compatible)
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3c40857747..1ca55a7706 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -778,6 +778,8 @@ FIT_CONF_PREFIX = "foo-"
         1. bitbake bbb-dtbs-as-ext
         2. Check if symlink_points_below returns the path to the DTB
         3. Check if the expected compatible string is found by get_compatible_from_dtb()
+        4. Verify that a custom compatible string can be passed
+
         """
         DTB_RECIPE = "bbb-dtbs-as-ext"
         DTB_FILE = "am335x-bonegreen-ext.dtb"
@@ -788,6 +790,7 @@ FIT_CONF_PREFIX = "foo-"
         config = """
 DISTRO = "poky"
 MACHINE = "beaglebone-yocto"
+FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb = "custom,board custom,variant"
 """
         self.write_config(config)
 
@@ -819,6 +822,11 @@ MACHINE = "beaglebone-yocto"
         # The alias is a symlink, therefore the compatible string is equal
         self.assertEqual(comp_alias, comp)
 
+        # Test custom compatible string override via FIT_DTB_COMPATIBLE_OVERRIDE variable
+        custom_override = get_bb_var("FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb", DTB_RECIPE)
+        self.assertTrue(custom_override)
+        self.assertEqual(str(custom_override).split(), ["custom,board", "custom,variant"])
+
     def test_fit_image_ext_dtb_dtbo(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created correctly.
-- 
2.34.1


