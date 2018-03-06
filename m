Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1146778AA9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w26IBReF012921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Mar 2018 10:11:27 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:54 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:16 -0500
Message-ID: <c10ab5fb2baf2fbfdd31518941dc22f5810471b7.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/4.12: warning: drm/i915/cfl: Coffee Lake works on Kaby Lake PCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2018 18:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Integrating the following warning backport:

    commit eb371933cf4d3495d0899880b2e0e252ce9db517 upstream.

    Coffee Lake CPU on Kaby Lake PCH is possible.
    It does exist, and it does work.

    The only missed case was this warning here noticed
    by Wendy who could get one system with this configuration
    and reported the issue for us:

    Hardware Configuration
    Board ID KBL S DDR4 UDIMM EV CRB
    Processor    Intel® Processor code named Coffee Lake S, (6+2), 6 cores 12 threads, GT2, A0 (Internal) (QNJ4)

    [ 3.220585] WARNING: CPU: 10 PID: 206 at drivers/gpu/drm/i915/i915_drv.c:340 i915_driver_load+0x1210/0x1660 [i915]
    [ 3.221312] Modules linked in: hid_generic usbhid i915 i2c_algo_bit drm_kms_helper e1000e syscopyarea sysfillrect sysimgblt nvme fb_sys_fops ptp ahci i2c_hid drm pps_core nvme_core libahci wmi hid video
    [ 3.222050] CPU: 10 PID: 206 Comm: systemd-udevd Not tainted 4.13.0-rc5-intel-next+ #1
    [ 3.222706] Hardware name: Intel Corporation Kabylake Client platform/KBL S DDR4 UDIMM EV CRB, BIOS KBLSE2R1.R00.X089.P00.1705051000 05/05/2017

    Cc: Wendy Wang <wendy.wang@intel.com>
    Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20170821235056.9015-1-rodrigo.vivi@intel.com
    Signed-off-by: Liwei Song <liwei.song@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 3f2a1ef7afa7..a100f7d4a9f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "27c21aed67a28d08b13c5cc1fe4287b2cf389ede"
-SRCREV_meta ?= "5a06598524482b43b9e502bf02c1f4fd5c2e598b"
+SRCREV_machine ?= "b103a20d4b507ede60adc8478dade56a4bdaffad"
+SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 2ecb1cd70d49..c306db292b2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.20"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_meta ?= "5a06598524482b43b9e502bf02c1f4fd5c2e598b"
+SRCREV_machine ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 0a6b2b883e0c..78a291acf0a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c9f0aa61969279f3ff36f2bc5dcad333f1e6fe59"
-SRCREV_machine_qemuarm64 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_machine_qemumips ?= "c327b2ea91c97957e865f90e7555aa4689cb5787"
-SRCREV_machine_qemuppc ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_machine_qemux86 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_machine_qemux86-64 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_machine_qemumips64 ?= "d25e0aa3f09dff2b8b908c7764c3c5244134d1a4"
-SRCREV_machine ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_meta ?= "5a06598524482b43b9e502bf02c1f4fd5c2e598b"
+SRCREV_machine_qemuarm ?= "4fb13c0d7254fe9753bebdfcfe47fd1ba4487386"
+SRCREV_machine_qemuarm64 ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_machine_qemumips ?= "9eb1f72874eeadb1f17e59faaca331971d522e12"
+SRCREV_machine_qemuppc ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_machine_qemux86 ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_machine_qemux86-64 ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_machine_qemumips64 ?= "710cc1cb7ba1384b9b0f43fc811a18a7c5a4e03f"
+SRCREV_machine ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


