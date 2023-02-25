Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4EEC64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 21:20:30 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.53762.1677360020363962733
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 13:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=UtWcEvot;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.26, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 8DE475C004E;
	Sat, 25 Feb 2023 16:20:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 25 Feb 2023 16:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1677360019; x=1677446419; bh=lPpu6YdMxMYU3C8GBcaVSFsKt
	/ajh1hvlAjhgGbPeTU=; b=UtWcEvot9jzIm5tWdWyifE/wx3ItgTgRExeD1bHGu
	WSRGN63cCcHnWHLpsMUKyTt5PSOwG+gMFIEhnHYGSA+Z1JVmuswGJAHH+G9juMqd
	gvqWTgPwGS8/anH089mGatLqxusBN39N2tpFrUhu3NjtsBHGJebkPmRqQ+wMLpIf
	jk603REUX0BUU4D6ZvwOB3ykFzmbHwpBWdxrreA62fYTfGz6joF2zUUS8Oi7Jz5F
	PQHc1fHT2MHgNXwV51CASi2xQz5EsyZ5EulXQgRCTntYoxIUOGVT9+0QM9HG0f84
	4g6+WnGl4U1EL7hOuuNMfyyN2Rx/LS3Q0lRwZT1s+QbsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677360019; x=1677446419; bh=lPpu6YdMxMYU3C8GBcaVSFsKt/ajh1hvlAj
	hgGbPeTU=; b=PWnsk/mMgd2/tMjIUse7RnbcAUJpn9AnZG8sRLc8EjEAc4fjKc+
	EAl65FSovuRV4RSxsQDLR8lOxrKJFZklmmsE9EMazaeWClI+LQXFDOY11T7nOIW1
	zI+/Mmp+tnbwMaEeQMfKoEl51wJrbtc+l4r+erHbUP1JXFR7bVe5BsiW3Mc1IDfM
	a07Vj+rxaJx45spEe4k0/Fj5AD14nvyF+3vtCMNkG/8soEHzVkbCIX6MT8zoU0JF
	vHhrJRITnjp/Z8k0VEi0WYWg0SAaEnhclOtVhDc2fTU3WDm3BaALGbw/UCQrNtpK
	NltYZ4/JuBd/bU7w+iakrfhJgZFxe0JE/1A==
X-ME-Sender: <xms:k3v6Y2f5ZhO4kGq2wBNW7NBX6WlDXQHhIW04YqERu2iOBuBQjohTbg>
    <xme:k3v6YwPX1Et4l7h1Pr7LLKnlgl4uXcwugZ5DI2CMXxST1cpDu-Rg6Aqj_HEYovYFi
    SCEd9MIfX2DPsVyxe0>
X-ME-Received: <xmr:k3v6Y3iW8Eo1y9Zd5pD6_2GKno_axV5PzANQHQr8I8bsechpNV0D53tnawVi9f64AWcIzU2uBsUECaRLVUK_VbUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeegkedttdfhlefghfduvdehtdehffetfe
    ffkeekteevfeevueffvedvgfejheejtdenucffohhmrghinhephihotghtohhprhhojhgv
    tghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:k3v6Yz9NIxshR8fsMpTBUczMhyiHqt_XmyMnEhWUEjteofWeSkMvnw>
    <xmx:k3v6YytCxlkf0KPb9Q-E-s0H9zrDOYpcnwJTarU49xswiWaTilHBVg>
    <xmx:k3v6Y6FqZyMzv8GPjmQR39GMk9UCl8CQho4q3xclYAdWZd5DUwGuJQ>
    <xmx:k3v6Y40KHYYlka9J22hHO9GiYsjN5Ib9M_aSxCCKuNcwv7_4uBKM9w>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 16:20:18 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] oeqa/selftest/wic: Add test for uefi-kernel loader
Date: Sat, 25 Feb 2023 22:20:04 +0100
Message-Id: <20230225212003.30932-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 21:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177720

This is regression test for [1].
[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15033

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta-selftest/wic/test_uefikernel.wks |  5 +++++
 meta/lib/oeqa/selftest/cases/wic.py   | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-selftest/wic/test_uefikernel.wks

diff --git a/meta-selftest/wic/test_uefikernel.wks b/meta-selftest/wic/test_uefikernel.wks
new file mode 100644
index 0000000000..bede2288f6
--- /dev/null
+++ b/meta-selftest/wic/test_uefikernel.wks
@@ -0,0 +1,5 @@
+# short-description: This file is used in oe-selftest wic module to test uefi-kernel loader
+
+part /boot --source bootimg-efi --sourceparams="loader=uefi-kernel"
+part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
+
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ca1abb970a..b9430cdb3b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1151,6 +1151,26 @@ class Wic2(WicTestCase):
             out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
             self.assertEqual(1, len(out))
 
+    @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
+    def test_uefi_kernel(self):
+        """ Test uefi-kernel in wic """
+        config = 'IMAGE_EFI_BOOT_FILES="/etc/fstab;testfile"\nIMAGE_FSTYPES = "wic"\nWKS_FILE = "test_uefikernel.wks"\nMACHINE_FEATURES:append = " efi"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
+
+        img = 'core-image-minimal'
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part /boot --source bootimg-efi --sourceparams="loader=uefi-kernel"\n'
+                            'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
+                            'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
+            wks.flush()
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            runCmd(cmd)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
+            self.assertEqual(1, len(out))
+
     # TODO this test could also work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
-- 
2.39.1


