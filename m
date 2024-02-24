Return-Path: <wuxiaotian@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E167C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 13:55:03 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.19165.1708782896800744799
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 05:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: wuxiaotian@loongson.cn)
Received: from loongson.cn (unknown [222.128.183.27])
	by gateway (Coremail) with SMTP id _____8CxSPAs9dllERQRAA--.44672S3;
	Sat, 24 Feb 2024 21:54:52 +0800 (CST)
Received: from yetipc.zhcn.cc (unknown [222.128.183.27])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx8OQr9dllo91AAA--.39364S2;
	Sat, 24 Feb 2024 21:54:51 +0800 (CST)
From: Xiaotian Wu <wuxiaotian@loongson.cn>
To: openembedded-core@lists.openembedded.org
Cc: Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH] openssl: add loongarch64 support
Date: Sat, 24 Feb 2024 21:54:44 +0800
Message-ID: <20240224135444.1180166-2-wuxiaotian@loongson.cn>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8OQr9dllo91AAA--.39364S2
X-CM-SenderInfo: 5zx0xtprwlt0o6or00hjvr0hdfq/1tbiAQARCGXZqOQALQAAsF
X-Coremail-Antispam: 1Uk129KBj9xXoW7JrWDJF4rCr4kXr15JrWrZwc_yoW3XFb_ua
	97ZF48WrW8urWxC3W2vw45Cw1Sqw13JFyUJ3Wjgr4jv3y8X3W3uayvv3WI9rn8CF18ZFWU
	Ar4rKw1fur42qosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 13:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196129

---
 meta/recipes-connectivity/openssl/openssl_3.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index 549fa4cd94..bd53853edc 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -96,6 +96,9 @@ do_configure () {
 	linux-gnu64-x86_64)
 		target=linux-x86_64
 		;;
+	linux-loongarch64)
+		target=linux64-loongarch64
+		;;
 	linux-mips | linux-mipsel)
 		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
 		target="linux-mips32 ${TARGET_CC_ARCH}"
-- 
2.43.2


