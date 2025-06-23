Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478FBC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:03:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14520.1750665796178457582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8269aa0225=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4K2A2027705;
	Mon, 23 Jun 2025 01:03:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mh6hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jun 2025 01:03:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 23 Jun 2025 01:03:08 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 23 Jun 2025 01:03:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <Ross.Burton@arm.com>
Subject: [PATCH] wic-image-minimal, oeqa/selftest/wic: run 'wic ls/cp/rm' in bitbake task
Date: Mon, 23 Jun 2025 16:03:06 +0800
Message-ID: <20250623080306.2976407-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <850a68b08e1cdd1b65e251adf83a62ff928ad070.camel@linuxfoundation.org>
References: <850a68b08e1cdd1b65e251adf83a62ff928ad070.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NyBTYWx0ZWRfX7NBKC5NZagPs T8r6uTRpTI6n3aKfYS7zOzKQ+LEYh1kZJtSSl3T0twn6PaLkDCuPn2Q4h5QUU1GZo5W812lRU3/ P3iZ36X8ETmbQ5kTSuoyLoaBCXKIBmOzYPeWYOa1SAzCycTKfibAksjxJTFMYc9MV/UnoSf2BnC
 574kR8LKMk9otY/Nq3ZUv3DA5pkGExJiFSvG5PY7kInpCzs3GyfIIG8wCGWvH8bxOZLF7w4lZWm vSKY0j9180FwLL67+OUy+3dEz5X2DJeddZPL0hQNqXTohjs/I2Vjj4rejKZ/68+TAWoYFypzgwc 2PV6azYDzgeRlLLwM2u3Scw0bu/r2RFpZUjkc6SExE67/dX27KPWU2nYh3kbY/BZ1yh/uj5yWb9
 TbX5c2OLJ0se5wWOfysZC0sIA1WpX7nvX6VsbBTZjl7LR86NoZwm6ZcyPb3/QDKM7cUoObRp
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=68590a3d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=edk8nUfEGjiSuL9hz5IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4TLpFlvgty6UdaU9_RU_hLC3mXCCdbm0
X-Proofpoint-ORIG-GUID: 4TLpFlvgty6UdaU9_RU_hLC3mXCCdbm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506230047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 08:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219201

Due to commit [2255f28b57 wic: add WIC_SECTOR_SIZE variable][1] applied,
call `wic ls|cp|rm|write' in bitbake task will hung, but we have no scenario
case to cover it

After commit [scripts/wic: fix calling wic ls|cp|rm|write hung in bitbake task] applied,
this commit run `wic cp|ls|rm' in case wic.Wic2.test_wic_image_type and wic.Wic2.test_qemu,
at post function of with do_image_wic in image wic-image-minimal, and
check if file is there

$ echo 'SANITY_TESTED_DISTROS = ""' >> conf/local.conf
$ oe-selftest -r wic.Wic2.test_wic_image_type wic.Wic2.test_qemu
...
2025-06-23 15:46:22,157 - oe-selftest - INFO - Adding: "include selftest.inc" in /buildarea5/hjia/poky/build-st/conf/local.conf
2025-06-23 15:46:22,157 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-06-23 15:46:22,157 - oe-selftest - INFO - test_qemu (wic.Wic2)
The variable 'TEST_RUNQEMUPARAMS' is not defined
2025-06-23 15:56:46,319 - oe-selftest - INFO -  ... ok
2025-06-23 15:56:46,324 - oe-selftest - INFO - test_wic_image_type (wic.Wic2)
2025-06-23 15:57:17,780 - oe-selftest - INFO -  ... ok
2025-06-23 15:57:17,781 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-06-23 15:57:17,781 - oe-selftest - INFO - Ran 2 tests in 655.792s
2025-06-23 15:57:17,781 - oe-selftest - INFO - OK
2025-06-23 15:57:25,743 - oe-selftest - INFO - RESULTS:
2025-06-23 15:57:25,743 - oe-selftest - INFO - RESULTS - wic.Wic2.test_qemu: PASSED (624.16s)
2025-06-23 15:57:25,744 - oe-selftest - INFO - RESULTS - wic.Wic2.test_wic_image_type: PASSED (31.46s)
2025-06-23 15:57:25,746 - oe-selftest - INFO - SUMMARY:
2025-06-23 15:57:25,746 - oe-selftest - INFO - oe-selftest () - Ran 2 tests in 655.793s
2025-06-23 15:57:25,746 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=2, skipped=0, failures=0, errors=0)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-test/images/wic-image-minimal.bb  |  2 ++
 meta/lib/oeqa/selftest/cases/wic.py           | 35 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 84d37218858..89843d9b3ca 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -16,3 +16,5 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 IMAGE_ROOTFS_EXTRA_SPACE = "2000"
 
 inherit image
+
+include test_recipe.inc
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index f45608172f9..680f99d381f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1021,6 +1021,18 @@ class Wic2(WicTestCase):
         """Test building wic images by bitbake"""
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES:append = " efi"\n'
+        image_recipe_append = """
+do_image_wic[postfuncs] += "run_wic_cmd"
+run_wic_cmd() {
+    echo "test" >> ${WORKDIR}/test.wic-cp
+    wic cp --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${WORKDIR}/test.wic-cp  ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/
+    wic ls --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/
+    wic rm --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/test.wic-cp
+    wic cp --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${WORKDIR}/test.wic-cp  ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/
+}
+"""
+        self.write_recipeinc('images', image_recipe_append)
+
         self.append_config(config)
         image = 'wic-image-minimal'
         bitbake(image)
@@ -1029,6 +1041,11 @@ class Wic2(WicTestCase):
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
         prefix = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.' % bb_vars['IMAGE_LINK_NAME'])
 
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        # check if file is there
+        result = runCmd("wic ls %s:1/ -n %s" % (prefix+"wic", sysroot))
+        self.assertIn("test.wic-cp", result.output)
+
         # check if we have result image and manifests symlinks
         # pointing to existing files
         for suffix in ('wic', 'manifest'):
@@ -1044,7 +1061,25 @@ class Wic2(WicTestCase):
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
+        image_recipe_append = """
+do_image_wic[postfuncs] += "run_wic_cmd"
+run_wic_cmd() {
+    echo "test" >> ${WORKDIR}/test.wic-cp
+    wic cp --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${WORKDIR}/test.wic-cp  ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/
+    wic ls --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/
+    wic rm --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/test.wic-cp
+    wic cp --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" ${WORKDIR}/test.wic-cp  ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic:1/
+}
+"""
+        self.write_recipeinc('images', image_recipe_append)
         bitbake('wic-image-minimal')
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], "wic-image-minimal")
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['IMAGE_LINK_NAME'])
+        # check if file is there
+        result = runCmd("wic ls %s:1/ -n %s" % (image_path+".wic", sysroot))
+        self.assertIn("test.wic-cp", result.output)
         self.remove_config(config)
 
         runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'wic-image-minimal') or ""
-- 
2.34.1


