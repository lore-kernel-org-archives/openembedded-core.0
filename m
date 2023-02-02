Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D74C6379F
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:02:34 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.9865.1675324949878436850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8DxcvAUbttjJzcMAA--.25093S3;
	Thu, 02 Feb 2023 16:02:28 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxmb0NbttjxTknAA--.11392S4;
	Thu, 02 Feb 2023 16:02:27 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v1 2/5] linux: add loongarch64 support
Date: Thu,  2 Feb 2023 08:02:16 +0000
Message-Id: <20230202080219.3465767-3-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxmb0NbttjxTknAA--.11392S4
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQAKCGPaVm8S6QAAs4
X-Coremail-Antispam: 1Uk129KBjvJXoWxGr18ur45WF4Uuw1fKw1DAwb_yoWrJw17pr
	1IvFW8Crn5tr9xZanrZ3W3uFyUuw47u343C3srGrZ5CryUCrW2q3Z8Ka12gFZ7Wa1UCw4j
	yFykJw4ag3yFg37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
	44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176678

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
index f543240cd8..4c70a509ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -11,10 +11,12 @@ KBRANCH:qemuriscv64  ?= "v6.1/standard/base"
 KBRANCH:qemuriscv32  ?= "v6.1/standard/base"
 KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
 SRCREV_machine:qemuarm ?= "45f7cca5081d3cb4ad4fae8e158cd58ea4db6c1f"
 SRCREV_machine:qemuarm64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemuloongarch64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
 SRCREV_machine:qemumips ?= "eb204027dbb98317d002250cc594de30ecc62b90"
 SRCREV_machine:qemuppc ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
 SRCREV_machine:qemuriscv64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
@@ -51,7 +53,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.39.1


