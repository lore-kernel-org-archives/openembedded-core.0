Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8AAC63797
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:02:34 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.9824.1675324947437457333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8AxnOoQbttjHzcMAA--.24684S3;
	Thu, 02 Feb 2023 16:02:24 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxmb0NbttjxTknAA--.11392S2;
	Thu, 02 Feb 2023 16:02:22 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v1 0/5] Add support for LoongArch
Date: Thu,  2 Feb 2023 08:02:14 +0000
Message-Id: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxmb0NbttjxTknAA--.11392S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQAKCGPaVm8S1QAMsI
X-Coremail-Antispam: 1Uk129KBjvJXoW7WFy5XrWxXFy3Xw4fCFW7Arb_yoW8uryUpa
	97Zr1rJF1xWr93Aa97A345WrW5W3Z2g342gF1fWw40krWqkr1UXr1Ikryqga45X34DtFy0
	qr95Gw13Wa18ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
	44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176676

LoongArch is a new architecture, already supported by linux-6.1, gcc-12, I want to add support to openembedded.

These patch sets add basic support, and it can run cross-compile on on x86_64.
The next step is to add support for yocto repositories, such as yocto-kernel-cache.

Please review these patches, thanks.

Xiaotian Wu (5):
  base: add support for loongarch64
  linux: add loongarch64 support
  binutils: disable gold on loongarch64
  loongarch: disable seccomp from default feature
  uboot: loongarch64

 meta/classes-recipe/kernel-arch.bbclass       |  2 ++
 meta/classes-recipe/siteinfo.bbclass          |  4 +++
 .../distro/include/default-distrovars.inc     |  3 ++
 meta/conf/machine-sdk/loongarch64.conf        |  2 ++
 .../include/loongarch/arch-loongarch.inc      |  7 ++++
 .../include/loongarch/qemuloongarch.inc       | 35 +++++++++++++++++++
 .../include/loongarch/tune-loongarch.inc      | 13 +++++++
 meta/conf/machine/qemuloongarch64.conf        | 11 ++++++
 meta/conf/templates/default/local.conf.sample |  1 +
 meta/lib/oe/elf.py                            |  2 ++
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  1 +
 meta/recipes-devtools/binutils/binutils.inc   |  5 +--
 meta/recipes-devtools/meson/meson_1.0.0.bb    |  2 ++
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  4 ++-
 meta/site/loongarch64-linux                   | 11 ++++++
 scripts/lib/wic/canned-wks/qemuloongarch.wks  |  3 ++
 scripts/runqemu                               |  4 ++-
 19 files changed, 108 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/machine-sdk/loongarch64.conf
 create mode 100644 meta/conf/machine/include/loongarch/arch-loongarch.inc
 create mode 100644 meta/conf/machine/include/loongarch/qemuloongarch.inc
 create mode 100644 meta/conf/machine/include/loongarch/tune-loongarch.inc
 create mode 100644 meta/conf/machine/qemuloongarch64.conf
 create mode 100644 meta/site/loongarch64-linux
 create mode 100644 scripts/lib/wic/canned-wks/qemuloongarch.wks

-- 
2.39.1


