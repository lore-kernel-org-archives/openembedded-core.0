Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428ABC636D6
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 17:39:29 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.23063.1675964362479352433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 09:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=ZsmGIwaw;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.29, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A4F445C003F;
	Thu,  9 Feb 2023 12:39:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 09 Feb 2023 12:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1675964361; x=1676050761; bh=TryOh5PyooXScb3vbGMQFLfYk
	Rrg5IdBOXqO2IopR8M=; b=ZsmGIwawlsZs3ixOwyX3W5FsyunegW12J5ViSzpO7
	eSRBqL7SsGn4y24Q5vsxwmnFfk2xgORtj+f9WMXTKodOAqh+l6lO68ANhzzd9Amh
	pMu+zd6M9PC90yunMcaOxCycZQgGeIbTOXffvze9KHmXXkb3syNFyVy7jbOERlON
	wWsDQFkb53YWIHZ6mrhu5oyVmvNiDWyUTmP4/vO4xoncsi27Xd71IMk/rNtihAe+
	+YOU1i1Uj3lZU6e5rtPIlns0Tozh+HpKXX2Br9l+Sq31v97fDzhYFP7wc/9I4Exl
	xxMlnfbd/X6UCs93udSYJ9e/FhjPoccIj01Et0z6suJWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1675964361; x=1676050761; bh=TryOh5PyooXScb3vbGMQFLfYkRrg5IdBOXq
	O2IopR8M=; b=PkU47z1IBki8oAvwtf4L7n8GpjoARBBKShmEdFu/YSKDIpRX9rd
	ga7zW3AwwFF0BxBIXZ7m4XyiWkC/8kB6oncnLuVFAsIBHp3J7XQ4J+vcRPzEZTnw
	NBGgvAtyUkCM+H3tDAIT9QCJh3YR2zjFYHRZE7zxvmYFRFzBUdSREOsjErmwuIpD
	QMJVFkU6i9+xiuUxd28F/t4RqebJqxWulQR4ntMXyqgckXhXlXa5+e9eRjS+KdFp
	VyjjO/2zIUYIfVT1UXR75i90s4uD2NqMfQvBDlqcVFlnmlblEYY3yZgusV26pYGI
	nP+gI2DoWQ2JSGuKFfdj4K8oKpclSAWprRA==
X-ME-Sender: <xms:yS_lY8ZB2RR5DyBRrbmwR70ivpKV7G9BrGSVjfq_DTFUvms2TKcc3w>
    <xme:yS_lY3YBF7AZ-4UMLuxG71hIdPA0_9WiCqE6ETkdLcondwMIw32exoYRFrNng0jv3
    OztMic0VLebdDqv8Go>
X-ME-Received: <xmr:yS_lY2_7Q0k2xcVy1xwxuFma_4_9FrWYoafHYGEGuPqO7Yf5y9w5uLMEKd10r1YMRi64z6YTmTS50RzTKxc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:yS_lY2o0D5dFXxmu8WC84VjGvTwdWMUp2Bb7h4akkMOANa0IDT01Dg>
    <xmx:yS_lY3pRjHQo2EulgT6wzIMDisljL92doFUV-49WPs8Y-VNDuFV0WA>
    <xmx:yS_lY0TpUBr5SI70tHID8-ojHd8rNwRb1KpzLK72BFGheKPOWOYmEA>
    <xmx:yS_lY2R3RRtfRd3hSHwwA5iSgtnUekHbZTmSB6iLnk8uYD_z43N2SQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 12:39:20 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] wic: Fix usage of fstype=none in wic
Date: Thu,  9 Feb 2023 18:39:03 +0100
Message-Id: <20230209173902.19980-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 17:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176964

This allows to specify partition with fstype=none in the wks file
to have partition created but without following mkfs. The none fstype
is in the list already but the usage is not documented.

Example;
part /data --ondisk mmcblk0 --fstype=none  --align 4096 --fixed-size 512

will create a partition, filesystem may be created manualy on the host
or target and data will be preserved if the device is reflashed using
same wks. Works with bmaptool and probably does not work with dd.
Use case is persistent filesystem/data between reflashing of the image.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 scripts/lib/wic/partition.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2a916e077c..382afa44bc 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -133,6 +133,8 @@ class Partition():
             self.update_fstab_in_rootfs = True
 
         if not self.source:
+            if self.fstype == "none":
+                return
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
                                "specify a non-zero --size/--fixed-size for that "
@@ -405,6 +407,9 @@ class Partition():
                        (extraopts, self.fsuuid, rootfs, rootfs_dir)
         exec_native_cmd(erofs_cmd, native_sysroot, pseudo=pseudo)
 
+    def prepare_empty_partition_none(self, rootfs, oe_builddir, native_sysroot):
+        pass
+
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):
         """
-- 
2.39.1


