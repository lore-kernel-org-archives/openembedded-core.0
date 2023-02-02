Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E690C64EC3
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:02:34 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.9825.1675324952814896184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [10.2.9.245])
	by gateway (Coremail) with SMTP id _____8DxRukXbttjKzcMAA--.17205S3;
	Thu, 02 Feb 2023 16:02:31 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxmb0NbttjxTknAA--.11392S6;
	Thu, 02 Feb 2023 16:02:31 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: chenjiping@loongson.cn,
	zhuqizheng@loongson.cn,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v1 4/5] loongarch: disable seccomp from default feature
Date: Thu,  2 Feb 2023 08:02:18 +0000
Message-Id: <20230202080219.3465767-5-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxmb0NbttjxTknAA--.11392S6
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQAKCGPaVm8S7QAAs8
X-Coremail-Antispam: 1Uk129KBjvdXoW7JFW5Gr18Kr4kJr48Ww4fGrg_yoWDJFX_Kw
	1Dtr40yF1rJ3Z2kFySvF1fGw1xtFZ5XF1kGFy5JF1UC3WxKw4qqa1kCa1q9ry3K3W5urnx
	XrWfAas5Cr4FqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
	V7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
	FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
	8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176679

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


