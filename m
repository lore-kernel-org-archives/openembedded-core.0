Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD0CC63797
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 07:17:08 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.5512.1675408627257731126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 23:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8BxqOnxtNxjpEINAA--.22593S3;
	Fri, 03 Feb 2023 15:17:05 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOXltNxjUm4oAA--.45244S6;
	Fri, 03 Feb 2023 15:17:05 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v2 4/5] loongarch: disable seccomp from default feature
Date: Fri,  3 Feb 2023 07:16:15 +0000
Message-Id: <20230203071615.3501674-5-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
References: <20230203071615.3501674-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOXltNxjUm4oAA--.45244S6
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQALCGPbp+8V8QAAsW
X-Coremail-Antispam: 1Uk129KBjvdXoW7JFW5Gr18Kr4kJr48Ww4fGrg_yoWDJFX_Kw
	1Dtr40yF1rJ3Z2kFySvF1fGw1xtFZ5XF1kGFy5JF1UC3WxKw4qqa1kCa1q9ry3K3W5urnx
	XrWfAas5Cr4FqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
	37CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
	6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 07:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176711

Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
---
 meta/conf/distro/include/default-distrovars.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index d05390d3cc..7554081e8b 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -22,6 +22,9 @@ DISTRO_FEATURES_DEFAULT:remove:arc = "seccomp"
 # seccomp is not yet ported to microblaze
 DISTRO_FEATURES_DEFAULT:remove:microblaze = "seccomp"
 
+# seccomp is not yet ported to loongarch64
+DISTRO_FEATURES_DEFAULT:remove:loongarch64 = "seccomp"
+
 DISTRO_FEATURES_DEFAULT ?= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
-- 
2.39.1


