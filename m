Return-Path: <peter@pjd.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7B1D10DBA
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 08:06:37 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.web11.169510.1733126793132250005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 00:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pjd.dev header.s=fm2 header.b=ZFOg7rko;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=qG0OkgY2;
 spf=pass (domain: pjd.dev, ip: 103.168.172.148, mailfrom: peter@pjd.dev)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 40A4013805EA;
	Mon,  2 Dec 2024 03:06:32 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 02 Dec 2024 03:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1733126792; x=1733213192; bh=q3wYRm1VMdo6ITuPItE5y
	cryUmf3VS/jJzro78N1g2o=; b=ZFOg7rkodogH0T6w7pDOg2FsYENUc07pRG1gl
	wrnnVo1kNcp9tk3NoQcqyX9i/glBhDvW01qTyi/d5Ko3GAUN+FAQ5vt0ksqZP9l6
	RzwoLZbB5zK3IaL71mcy3yacZWk1XCBwKrcH+L/TqAJKutqSqPGwG7uYL317Lwjl
	gLbxgKxH/0X+MPgglJ/Fi2Bp4V65E+LNT75w+idSkfJf9as8Er726mJCRcuZvZ2C
	0Bu2tD8nMbzLolMhzys3zRS0s09Ghhn9a2a7KglGft+nAX1O1A774rKsnZfdM8XS
	ViYtCsDDbFffmHSXaq4uWglsWHrHDP95dsoQSjkmwruAhc+MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733126792; x=1733213192; bh=q3wYRm1VMdo6ITuPItE5ycryUmf3VS/jJzr
	o78N1g2o=; b=qG0OkgY2w0Iks/1+2LafLHmj0kZdi0tZxoSAxyHOdxBjdx0ffea
	mU0u5DI4tpWD5Tq5YWvB1ssLrmBbyx9ciw6kge2j18OtAb4hHluNJGwChrrutrLZ
	hHsLM8AjB3V5D+Uv6uKR1qs/IUWg3zmtuOOy1RigcIQ0Qu93nOmf+ucCoFtb/QzL
	Lu++DN6Wg7D5Zstc7hZKnbCi0vr87eHLVn1Ra5X9W3MUMj3aG6G2znK7wsr/iS5x
	9Zu3N6iPtb8PWFFiQ0HLsthoxlDRRBXBziFbyeM3MDbf3XnECvweVIK4GAO5zitD
	IK+kfaQvbA3Rl95U3Hj4z0C9GcGU6rlzO1g==
X-ME-Sender: <xms:h2pNZzxF2JUhqhiEl9glsxQ5V59zG-xO6LyiIblh8cLH85Iq3Y0cvw>
    <xme:h2pNZ7R-jz5zavGvl_GWirOkSwhOWYRL_fyntVyvv-kn9lc6OtmO9DJYUEQ-FkC04
    9VkmSH06AquyNXIH1Q>
X-ME-Received: <xmr:h2pNZ9UCP2zUIi8aCYS0OdJYCMDuNIykOCWdngnULWTLNpquLXW48385HnVKGHSL5qf5kHn3nwLmWD-Y4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrheekgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigr
    shcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeffheejvdekhe
    ekgeehkedtudehjeejfeegveffgeekkeejvdeikeehiefhgfevvdenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgvthgvrhesphhjugdruggvvhdpnhgspghrtghpthhtohepvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvg
    eslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphgvthgv
    rhesphhjugdruggvvh
X-ME-Proxy: <xmx:iGpNZ9j-nkror89X8mzWeyJLsHd4gOwiZHqYNIgY67tmK_58jeJx7g>
    <xmx:iGpNZ1BWDBpgHXZf-Xno9ISGDbeQgsrHQ9X9HknO_v9XCoLKwczaSg>
    <xmx:iGpNZ2I8c5_NPw5j3vMpTNiVCJ6AlkDfFz6Ry7Bq_C8BqGgCHF62Ww>
    <xmx:iGpNZ0BTRoVYnVpNm6F8jJW2yipjIK9xqdVbJQPJuD2pmW-cSKwwcA>
    <xmx:iGpNZ4PdjevUyAkhb1No2MVk4DX893QSv4n_Dw1OAXvtglTn0goKzdUD>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Dec 2024 03:06:31 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: openembedded-core@lists.openembedded.org
Cc: peter@pjd.dev
Subject: [PATCH 0/1] ncurses: Add alacritty terminfo
Date: Mon,  2 Dec 2024 00:06:28 -0800
Message-ID: <20241202080629.1639470-1-peter@pjd.dev>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 08:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208125

I use the alacritty terminal emulator and work on the OpenBMC project [1]. I
find that when I login to BMCs, I can't use ctrl-l, ctrl-n, or ctrl-p to clear
the screen or select previously executed shell commands. From my testing locally
with an OpenBMC image, I think all that's necessary is to update this recipe
to copy alacritty terminal info, which is already part of the latest terminfo
library distribution.

[1]: https://github.com/openbmc/openbmc

Peter Delevoryas (1):
  ncurses: Add alacritty terminfo

 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.5


