Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F376EC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 12:42:49 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.11889.1676896960250115815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 04:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=nyVyAvbA;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.19, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 102573200912;
	Mon, 20 Feb 2023 07:42:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 20 Feb 2023 07:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1676896958; x=1676983358; bh=DPDvbQl5TobhlXwgWgJk27wMa
	ZJiw15KkCCxVMBX/U4=; b=nyVyAvbA+4x8dZVqA2VxAfu5YLmSX0ImSbpK6C61K
	l7dqFVrT914M1nB/F5/jK6QXdXvyCR7qNFnBT5esj35bGDXT4JoGDho+uguK70BW
	8aMBP47Hvzrchteqxl3jzGvR/gKS6r5HImUsmQahqWSQcGtwWe0isM39zCXgDu4c
	w3lDygBhcn/Wy/VADbDf9Un8FRgWjvzkRCaHuO7mY1HrOhjZxW4aDTcMPVe2XQGO
	NBepWs56eZWVfzGAk3bJAwAlkFP3YVX6mIaEZFF+qkN28KZJIKjvFhQVbtXMvrXA
	uUm+u6eLBkqH9LYsdbY7zr/FELJhgMdVOmCniMsVWq/SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1676896958; x=1676983358; bh=DPDvbQl5TobhlXwgWgJk27wMaZJiw15KkCC
	xVMBX/U4=; b=CWevuwcIn11V3sKgSjOz+w1ToFksL4n1nLZZBCy6E7ztAQ2d1PL
	trLyaz5ods5Q2T7rBFsIrKsv8qWhwcpxlrCAjWX/0PqIjDy0tSaEnmze9uU+/zON
	GJ/Gf0VaDU1RyaHjd78gJUT3hz50S9Nvk6hwlbdCgG2Qf+/5NHMkcqlVD5SvbQNd
	A05KqifCnCfXXNwDAsnxFdIolWuxVS1RU3uGijcbs06UOMLar1mtjPIQ42Be0dgm
	do6JCZ0OZYpB6Md1Ln2WOyVnolgDnW0g8v4M5T/R/ZA4FGQNQhpKcVb3hilK06ut
	REDYDV2g1qXndX3133Bs2IgOJ6BeCu0WxLQ==
X-ME-Sender: <xms:vmrzYyw7dmeD37pdfLBlLtBX-PWp1F63HqT3yX6Ku8ih--5pA1iGwQ>
    <xme:vmrzY-TVBkO2pxjFq-fASyYwqu-_kZzl2kV97yuXmCukZ9uQs-ew1rH3jHsfNu6vG
    T1yeMFTCtaJVwmkDPY>
X-ME-Received: <xmr:vmrzY0VCpIsQxFaAHSxlkYBSs3_VeykhzBqFCAsVDAlJSO9mXWpXbtKmId49uS3T1ZGbqfJadtMAzv4hHjB2Qq1h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:vmrzY4ih-ToZFuecF9OUysqOC7a-ak_yO3oTCnaJ6iqKhGdt6bEEAg>
    <xmx:vmrzY0C7DXlNHh9D-CCxuKwsAkE7hiewMxsFGjbRW6ZNAxSEiiSgpg>
    <xmx:vmrzY5LW-oCC7GwyXwHecAf-zLSSfi9dOR8j4tCS02H5kwLhA9_L3Q>
    <xmx:vmrzY_qCm5wsfcBhsABvEwnbKtONdyzbf3EFBbsjcrWXEe7e4cwzgw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 07:42:37 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] kernel-arch.bbclass: Map arm64 to arm
Date: Mon, 20 Feb 2023 13:42:31 +0100
Message-Id: <20230220124231.17673-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 12:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177399

The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm' so
adding arm64 case to existing map.

Fixes:
| install: cannot stat '.../u-boot/1_2023.01-r0/build/arch/arm64/dts/u-boot.dtb': No such file or directory

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-recipe/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 777f900241..4f88c47ef1 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -55,6 +55,7 @@ def map_uboot_arch(a, d):
     import re
 
     if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
+    elif re.match('arm(|64)', a): return 'arm'
     elif re.match('i.86$', a): return 'x86'
     return a
 
-- 
2.39.1


