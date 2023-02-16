Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C412AC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:24:09 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.8717.1676550239466301841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=CrUZIrJW;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 56DC532009A9;
	Thu, 16 Feb 2023 07:23:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 16 Feb 2023 07:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1676550237; x=1676636637; bh=BESYJRVYcNXqXclPTHnRbFCvI
	Z3FoL5CBDcX8neGC2I=; b=CrUZIrJWk1Vk+tt0z3XjKPUcGVwaqgz32CF83fxAY
	/+lU9Si4d19gFW3GI982NYaDi1gGg9+t5N4wMbLPx2mh0P5jCYO+DQdAdo9/Zyc/
	mLEuF8i9+n4roP5vwWcsWuWc5sYPh+cIJV7tGjP1SotSy1cMNHYy64wwrWlJrwFG
	4UeP1UHYscqIBxvIauMMSB+ekWFZbz/IfSlnqqbFp89shJ1wKOlbrnbFmyZMIxU/
	xNpbgZrxO/3I/doRG3bt7jP/R+jnZRfZH0H9WEa12P+a3wTBbv9mr97UvzEfS+q3
	ctMluw90KotbC5cG4KJZx6LM44J2iw/GAITBx0duGh+wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1676550237; x=1676636637; bh=BESYJRVYcNXqXclPTHnRbFCvIZ3FoL5CBDc
	X8neGC2I=; b=sbjmFVew4H/la9SPClnMhVfEOKkSCfYYSxRHbwPIUKu1sNfpt6J
	sRRu0yq7X1MCz7KHRRdmN2CELKj1og1hahjkmwUuXwfUl5QcszCgrtF7o9GnzffU
	njXbXZ7nKbqe5t+13IMltHdcRr6useIyRWyAp+DjLoxpiRcs7DbS9hfLMq4vRXcA
	P0YVY+dhfbrFuEjXWFn9J0m+e7OqZKq3/1T3mosJG1oUt3Y/qyomPw9K9VSAfiJ6
	2yP6TbDGR2Ri/b2fZ4P1NFwrH6iCTQMXbh+gnpIJkgNZQ7NduD5IKLe3PqprjoZo
	aFwSdndzlnBK8SRjtY4ZzbUmy26sPfQULuQ==
X-ME-Sender: <xms:XSDuYy7zGDFB7hYrYdLxNx6XvJfq68eMU0_Nf_ikymyKPU7REqv3Ag>
    <xme:XSDuY776eKwWFWdL-_ZlJCoYl430o6bTaJUgJ4ptq3t9m1oAZ4tgmvIV-1jCf5Ea4
    IzBI-e4ajhcwu5ecRA>
X-ME-Received: <xmr:XSDuYxfPUQP0OPXxZWaIrB77Xq8X7oKayeaPR2_09TgonG7fqlYZoabOHMq18Se8Gy7jJkDY0GfSlWc3_zlK9bBx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrvhgvlhcu
    kghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepveefjeekjedugeeltdekjefhtedtfeejueffheeikedvudfgtdffffelvddvfefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvh
    gvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:XSDuY_JC-wmqR_lw0L45qmdNhAQTj8yiUxs6ZkmJkQF_1TkOykYykQ>
    <xmx:XSDuY2KxfM0n9518wVUGrDP7JdaQQGuAryXQCQLNBb2HaVz5SZT2Mg>
    <xmx:XSDuYwwvtIi9R6YnGSzO-YbMGd6tgeMrBQjeakMoflJyWFVLeIvFow>
    <xmx:XSDuY4j6SG6FL5yf4L58DiY7yK_mm9bJf2Po1vBpe3aMRCdCy5KvsQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 07:23:56 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCH] wic: Fix populating of IMAGE_EFI_BOOT_FILES with uefi-kernel
Date: Thu, 16 Feb 2023 13:23:39 +0100
Message-Id: <20230216122338.17270-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 12:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177286

wic plugin crashed if IMAGE_EFI_BOOT_FILES is not empty and uefi-kernel
loader specified because of preliminary return from the function.
[Yocto #15033]
Fixes:
|   File "/mnt/builds/yocto/sources/scripts/lib/wic/plugins/source/bootimg-efi.py", line 371, in do_prepare_partition
|     for src_path, dst_path in cls.install_task:
|                               ^^^^^^^^^^^^^^^^
| AttributeError: type object 'BootimgEFIPlugin' has no attribute 'install_task'. Did you mean: 'do_install_disk'?

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4b00913a70..d6aeab2aad 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -221,7 +221,7 @@ class BootimgEFIPlugin(SourcePlugin):
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
             elif source_params['loader'] == 'uefi-kernel':
-                return
+                pass
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
-- 
2.39.1


