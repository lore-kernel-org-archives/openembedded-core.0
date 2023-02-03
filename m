Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B05C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 07:17:08 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.5510.1675408624787275523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 23:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8Ax3erutNxjm0INAA--.26672S3;
	Fri, 03 Feb 2023 15:17:02 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXltNxjUm4oAA--.45244S4;
	Fri, 03 Feb 2023 15:17:01 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v2 2/5] linux: add loongarch64 support
Date: Fri,  3 Feb 2023 07:16:13 +0000
Message-Id: <20230203071615.3501674-3-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
References: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOXltNxjUm4oAA--.45244S4
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQALCGPbp+8V7QAAsK
X-Coremail-Antispam: 1Uk129KBjvJXoWxGr18ur45WF4Uuw1fKw1DAwb_yoWrJw17pr
	1xZFW8Crn5JF9xuanxZ3W7uFyUuw47CryakasrGrWrCryUurW2q3Z8Ka12gFWkXa1UCw4j
	yFykJ3Wa9ayFg37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
	zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
	aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 07:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176709

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/classes-recipe/kernel-arch.bbclass      | 2 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 1531ae6cd5..777f900241 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -19,6 +19,7 @@ valid_archs = "alpha cris ia64 \
                sh sh64 um h8300   \
                parisc s390  v850 \
                avr32 blackfin \
+               loongarch64 \
                microblaze \
                nios2 arc riscv xtensa"
 
@@ -34,6 +35,7 @@ def map_kernel_arch(a, d):
     elif re.match('aarch64_be$', a):            return 'arm64'
     elif re.match('aarch64_ilp32$', a):         return 'arm64'
     elif re.match('aarch64_be_ilp32$', a):      return 'arm64'
+    elif re.match('loongarch(32|64|)$', a):     return 'loongarch'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
     elif re.match('mcf', a):                    return 'm68k'
     elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8671b3d30d..05e405f81c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
+COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 6bd83197fb..66d397837f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -11,10 +11,12 @@ KBRANCH:qemuriscv64  ?= "v6.1/standard/base"
 KBRANCH:qemuriscv32  ?= "v6.1/standard/base"
 KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
 SRCREV_machine:qemuarm ?= "ccd3b20fb504d35147d35962254b68b0041a4c6f"
 SRCREV_machine:qemuarm64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemuloongarch64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
 SRCREV_machine:qemumips ?= "d60ecbda7d4de915c867f751f5c63555a14219d1"
 SRCREV_machine:qemuppc ?= "1caf99d56881e1510afca553cd4a057f80479973"
 SRCREV_machine:qemuriscv64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
@@ -51,7 +53,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.39.1


