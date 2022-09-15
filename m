Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC0CECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 12:59:52 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.9652.1663246784558217798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 05:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=pPGD2Nis;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 938783200B17;
	Thu, 15 Sep 2022 08:59:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 15 Sep 2022 08:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663246783; x=1663333183; bh=8fy8zUP9Oltox+/MX+RGlT2b7
	nGuWDHdWLOfQjR82qQ=; b=pPGD2NisUZcUXZ6X4CVzB3L6d7qX78qFas3EfGcFn
	q39MWjnoqmXlhZZy7ZGMre2i69bQaihpzqyS5tnCfenO7zNcw4c+lojD6bPeaAKB
	OErTx5p+Nuc9TAgVSOLRMi3OIOTpMSshqU4EAHvRt+TyZwEDxzRlM6SXQVQwEhnv
	LT6J1jJjp/amRNaj+xn5f1NtwoO6csAxIfgosmO6t+KzWHD1Fey7Bht4+RUoro+E
	wkh/iVX1LbtHrixWwPUfZHGZYGHy6V1Yo0Ua/n9amgkP+ksnw3MysOkhALnfvMl7
	50hZDTGEfdwUVzgV91x2C/qmObFrrwsDuddTlEekRyHgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663246783; x=1663333183; bh=8fy8zUP9Oltox+/MX+RGlT2b7nGuWDHdWLO
	fQjR82qQ=; b=W91hc14B0hZrJqdZ7RzsHocZYAWllb/kRPuafSzCeibosqPaAI0
	ngor5NeamORaN9T2lKMT6J4IhTXiNiamgD9DaWecUqqmb/gW5MnFYnHGfyfNmFlN
	5TboMXWG8TVdrv2pE30y79HN22dq+iRwrapL6y4lukjRwxZkS8R9GaTsL8QwCTpQ
	9UBQFmbTdZKjWtqGFH/yGgf2qLAQ/3Im6LMNmWEyqvCm/JI7laQ8F8jU/Bhw6PKa
	BCYvd0IPD+Tr7OSEvUIdMMNwJ//0sTNQWlffxH/3HcSpcmrqy0IIgMASiiXOuQgJ
	5Ow1WwdUCYhS8IMpCIxXY2bxvhgdhed4tQA==
X-ME-Sender: <xms:viEjY3TweZhM4iM1Y8HtAeHQuM9VApoqjA0PvlCCF_H1IQxHa_hkBg>
    <xme:viEjY4y12QQKu_8OMuDDUnLJI-WBvRHGZMyl0iOMaLFmrR0lwPYOhLESqOwtLVU3n
    gzNetKdpWKFENbzcaQ>
X-ME-Received: 
 <xmr:viEjY81sPmYIuDoD6c8rZBlGMPNsUR431mBFoblQxCFwfM3kEKuVX8yr454976WheWP-qGUmLKaQTbBWYjwzfeY_16U90DnHfYMLJ5-bbLMVVcHTdWwiqBK5>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:viEjY3DtM_bMmdcyN9TvrcAAEPTlXxRvvgrM3tQmR8AcnBapnsJqFA>
    <xmx:viEjYwh98rqkG9wKEBqwTyrPRt2_5nZmgibLmIa6aPg08GY8GaufvA>
    <xmx:viEjY7oI2yldVF0GDquom4525J7UY_1nHE-b-n1RDMfZe4QpSByBdQ>
    <xmx:vyEjY8Y2sfm2Sc9pDWBtO0t_aUsmEYbMACSf2y1qzbsoqc2DjL2_EA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 08:59:41 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v2] grub: Allow build on armv7ve/a with softfp
Date: Thu, 15 Sep 2022 14:59:23 +0200
Message-Id: <20220915125922.1666515-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 12:59:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170695

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Grub tries to force the compilation in softfp mode for some known target
CPU. That is because it doesn't use floats or doubles and there are
known limitations of using a configuration with hardfp. There are though
target CPUs that grub won't know how to configure failing with something
similar to:

| checking for options to get soft-float... no
| configure: error: could not force soft-float

This change relaxes a bit the COMPATIBLE_HOST restriction to only apply
for hardfp configuration even for arm7ve/a.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-bsp/grub/grub2.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 47ea561002..e257c31235 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -43,9 +43,13 @@ CVE_CHECK_IGNORE += "CVE-2021-46705"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
-COMPATIBLE_HOST:armv7a = 'null'
-COMPATIBLE_HOST:armv7ve = 'null'
+GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
+# Grub doesn't support hard float toolchain and won't be able to forcefully
+# disable it on some of the target CPUs. See 'configure.ac' for
+# supported/unsupported CPUs in hardfp.
+COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
+COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
 
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
-- 
2.25.1


