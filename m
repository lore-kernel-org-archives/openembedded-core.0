Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0840D109024C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:13 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14712.1773936308028438117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=vJk4a9mK;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=40JZbX2T;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 3FB1CEC00FD;
	Thu, 19 Mar 2026 12:05:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 19 Mar 2026 12:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936307;
	 x=1774022707; bh=KZKTV82pf38TFN18PVaw82xKwtyIYa3Wz5X0KTm3tn8=; b=
	vJk4a9mKuYJ3otWqn2o3ZPtTsyn+fwp8D7R9xUZzfBbnslA4/lyLxoZuw5UTLlnU
	v98UiXJsQPm3b+bolMcGKxPwUVQeV/XzqmNv6zs82bifu7quc3gQfUj/GTLt2w5j
	V4Xy+KSEq9q1vLQVWJ5M2Mv3psmx6Iv8Ue5s+iUlHFmxdEDWfTe1BuACATifagjq
	YzMtGaesEPks9A+Yj0rw9Kq32PgyRXDEf1VsC95NB/vxau2ue5cKQtv+OAXYbpGK
	opoDyS/SYhgqw4uZwwIxvBSyXHdldw4zZdku6Z4Rp++qmUJuLygIzSOhR3oT1iWP
	XCZbqGnSNOe8d22PmD5ckw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936307; x=
	1774022707; bh=KZKTV82pf38TFN18PVaw82xKwtyIYa3Wz5X0KTm3tn8=; b=4
	0JZbX2Tuo8d24E+AuzeBPREA9Kwnwu9a+n+5TiyO2/j1ZwA5VnhJnmnMRl0MN7P8
	zwgWwpYL9nufHjld7EPNxlEULx1o1VdmwoPBldwkgk6xqVLbkMTZ0cQngBGJbWxZ
	NSYDpY3v9exQJF7Bl+yxyNtbvITj4iXQbrVioN2Prw+d86N5JvP8gWU0SCBqYTSC
	CJUOZ9obZsc5Nq0MsfYIuoDiTwIGforpFjNCvBdZ2AsMw2hb2Zfuowm0ZXRN99OH
	Cq+PDt5DGo+XlBVqwsqttBEe6DPkNZ6IW4iKH5eqgFpNr9eBTq5e6+E90NqxWeDw
	kIYuInOMcfXUifuUHU/DA==
X-ME-Sender: <xms:sx68aXSThuA4bTLUBfT4plbrcbem6xLZGIkr9tFiYZc5fLmYjccIbw>
    <xme:sx68aeyfSuHwWWZefSDvMG8NkGeHdgUngWc6LDQDMFQG6g0seRtNY_0GPN2Pacsoa
    U55ChaqYp7B7FQlrZgikjhXLSkwZXHxTucvw5K4GVIqo37_j169q7U>
X-ME-Received: <xmr:sx68aacVTUJnLv92hywj3Dpv_BFelqVRP8Vh46tb9FXXaZ3cVzPqIu6CYJtANlpYGUyUn0XRy3itaB1DQgLb-TBk4-JP_LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:sx68aSKLFGwmTMsWccKlanBoGSI5XtMjzGiOERBLcR5G-wDIEqdiug>
    <xmx:sx68aTFH3iKTbXYrDs6VLcp6ezAqyDfOV5xt9agL17V2SpYsUObteA>
    <xmx:sx68aUpBXkmCisD7PI8JPp60uZ8-svUafO-YR73lEpYFXLk-T8M6zQ>
    <xmx:sx68aUT7liPfYziVhTX4xpdNNN7D0rpSouh3o1gmWvHQrB9gW1ffSw>
    <xmx:sx68af37BKP6nacuBdeAnad6M0PVDlGNspv8ywbirl_5BAFY8hFLGPVf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:05:06 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:46 +0000
Subject: [PATCH v2 8/8] initscripts: Make SRC_URI arch independent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-8-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=WD2Tzs/31BFshwG3nfeIQqmyVlA2hiLh+0n6vSwNDRE=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVs54/YE2/PzMh1unHqs9OrWjXQZXYv62Xt0034un
 nriZ05VT0cpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAmMvUEwz8rZ4lrOltijvYt
 f+rpcuz8hOkeKqGPF+u+3uLWvP3Up++HGf7ph7pmT5BYd7M2UOfhqV93C1Kef3fakTPnnvTXJ0c
 eCQZzAwA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233542

Avoid making SRC_URI unnecessarily dependent on the target architecture.
The alignment.sh file will only be installed for relevant 32-bit ARM
targets, but there's no benefit to making SRC_URI inclusion conditional.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index c984257c5c8f..23411b6a7149 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -32,14 +32,12 @@ SRC_URI = "file://functions \
            file://save-rtc.sh \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
+           file://alignment.sh \
            ${@bb.utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)} \
 "
 
 S = "${UNPACKDIR}"
 
-SRC_URI:append:arm = " file://alignment.sh"
-SRC_URI:append:armeb = " file://alignment.sh"
-
 KERNEL_VERSION = ""
 
 DEPENDS:append = " update-rc.d-native"

-- 
2.43.0


