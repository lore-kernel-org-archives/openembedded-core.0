Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB87C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:40:08 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.20783.1646059207360287324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=Ix3my0Zt;
 spf=pass (domain: aj.id.au, ip: 66.111.4.27, mailfrom: andrew@aj.id.au)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AF5DD5C0300;
	Mon, 28 Feb 2022 09:40:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 28 Feb 2022 09:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=jY1C/7R6oJKj8pr/84TM9vzNtkKnSB
	s+BCv+n/f7Jbc=; b=Ix3my0ZtUvJJPCO1J1GQ2wvVInhJO0WuwAIwE7GxItpdEG
	Cpj9aIF0mxlMJziOEHGtLGVTWw4k+qLnjAIMNB9Dhu0iNueV6j42vDRI1nvjvZ2G
	SF2AezKhH216XDiC5uDq8UWdRv6OQcAqfgatT7W/j1GrHEyEQmq4iISS1L5tnBIL
	O1ocnTt/p9c1x9rByf/Uo1/DUD/E5XRTIqsuL8V54GunQ3L5CDbsbXOCnFjjAxjB
	SbKhiYxRhbyBWyf6mNUNJeG9kBL52S1vRrp2nVYGKaF0HwV1QSHGL0tn0xQE+niH
	M0pkaBofKZi/+AM4SEUY6x9bbo3yHGGm+ybmF5WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jY1C/7
	R6oJKj8pr/84TM9vzNtkKnSBs+BCv+n/f7Jbc=; b=bIXMztC05qBodng0JRXn7J
	VkeDx+e3bZ+qjGdGN7TucOH8TDxVjQ25T9rd5W6KtSxNzbKGIsQ+lOv3nciQEUI8
	8MfP8MiLxSj2wORweYlMyRrXe/SllsDatOMW08POL6Ny407POSLxFtGPEqYnZuE+
	V9aF39eZQec1r5EVeSkeBAxNg4dZGSvBbLQv8UOgrrnvoFahgBJwub0EKrHczTfN
	7hw+xA28fDO98Ergh6+B7A1OufsABbVb2dII6lLwJU/SjK+Bs9tp1lkLaEvPBlAA
	lF3HmsZ3Q8e9JsgFEi1SVoXuD/nc+cWfyj/VOE3EyF3UKSV3u5InwvaIku5qU/zg
	==
X-ME-Sender: <xms:xt4cYlT_33VWDwDDceuTQqqNYWKB-PGNl5Rt2Icra_CzooDpAO8xpQ>
    <xme:xt4cYuxKK_GCn7F5A_sG96RNxmD6y5cmOAwVDFWb3wSJfWC3v7gCELSm7rJrKhJL4
    Gpiww-nyvqH-CILmg>
X-ME-Received: 
 <xmr:xt4cYq1Gr0Xu2u1AaTmFawqiEbmLQjtkV5f0AuidYN-Ddpa5rjYCckzJpYPsgScSz3YrcNXgdAQxCtFE7UpcHuG7KQiMRgY4AvGhM6rg-Sl7QbBtVzcOH_msuT9IPc_d>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepleffvdfgheelteelgfehfeegfefhud
    eukeegvdevffdutdduieevffetvdeuudeunecuffhomhgrihhnpehruhhsthdqlhgrnhhg
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:xt4cYtDxf5cqH5ao6b7nWeNKWqXhKpf-39E3NddlefONrt6skz1rbQ>
    <xmx:xt4cYuiZvvzROANiG3e0rnCWYeT62WOwJe2w0phaSQN9IiZoKx_--A>
    <xmx:xt4cYhqUNG6mJaUsyFfORm0vqJvcJgYBRJzgeIkSl06Fl6wyv37XLA>
    <xmx:xt4cYiZnFT1uwaOHNRfdpc2JhVR2nYHNWPSiYqk2W_UigCTAGJzAKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 09:40:04 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org
Subject: [PATCH v2 3/3] rust: Add snapshot checksums for powerpc64le
Date: Tue,  1 Mar 2022 01:09:48 +1030
Message-Id: <20220228143948.50809-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220228143948.50809-1-andrew@aj.id.au>
References: <20220228143948.50809-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:40:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162504

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/recipes-devtools/rust/rust-snapshot.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 173648c889fb..d0c05aec7866 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -14,6 +14,10 @@ SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3618da916a0f92f241cf1d67d04bb578
 SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6df36990953c1670c6a5676bc12d4cb"
 SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
 
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "fc07eb3e9f3d227428cc5b53ca868e3de375bc198ce4dce7b87a9246e6fec81a"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f43cb99109c3438c77c7079cdce4673df3320e310158e0b4d949c1babc4300fc"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "599cf1b5a8cdbf76d591621bc9222aefa60e2f5fd378ae71c4dcf4514c47122e"
+
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
     https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
-- 
2.32.0


