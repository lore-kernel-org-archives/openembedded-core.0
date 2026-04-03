Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC99DE7E34B
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:38:41 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7456.1775205517188119370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=JzS16zey;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=RMUr0eeZ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 430F67A01A5;
	Fri,  3 Apr 2026 04:38:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 03 Apr 2026 04:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1775205516; x=1775291916; bh=B3
	n4FfX314GiKeM5KzFWFwo5dB5DgHf5b8Ig4U33S4Q=; b=JzS16zeyAqN+ieMjG9
	0L+9ROih6p2u5hj5T91OAU0bLJGlspk1ydj1zDtpb3PTrPC70gex0ZtG3NxMvtI1
	RhStYjApB7FLYHER6VOyP9qm656dFhmvYQTb9o34NMounQji0RVPl21tuG3W66lu
	uN5IJ/rAXh+ESOxp2yW5jWolavQl4Mr3RsqbBqgITHH+Z9MH7I5TregCb+Uz+yhI
	l7JG/Ef8+5fsGxxcYM8a+K5k/ryhTHDLPYZbXPiWwd3sET5VuBijx866RHY6RB99
	Wt/Pg10RRL2N0sjD2HiCh7a8tQVRggUnFCs3uXC3qYGcKnbBw4ZURbiTzR0y8Mqx
	3FpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775205516; x=1775291916; bh=B3n4FfX314GiKeM5KzFWFwo5dB5D
	gHf5b8Ig4U33S4Q=; b=RMUr0eeZ7UJyMZgR5m0jBfnm8hs1WIHPuwtp/XRMlRaK
	kxyUYHm1cAogMbjL5jOq1KPndeO46Vsnwcic/spBnwNx+JIWLJbJGE4C0zRp/uTd
	J5n5OHvc0xrU8pXFb4mMILNn2ECd2zShwJ4MnFcIO0k99abpNJThHk5itBCsJp7P
	UVcMQrbv4lUwfbhVBH1K2poNQ4QMAj9ZhajC9A7l0fXZYu+c0/bSLHylLDHUtrO4
	/PbxcB+ghYNKJSwk192MVEuF1ZwjIMvI35Ndsj9BkCwLsjNAfzqXxkMDsh19NgO4
	/g/VtQBFTtAE8T2BdF0C4inwhVdgU+1RIJSIszkTkQ==
X-ME-Sender: <xms:i3zPaZC0lgj7cTdKcdW3sQWXmfg_52rrRHapCtTw3gVzFtWYe1CL_Q>
    <xme:i3zPadjgtzuBPo97Uo4BZkn08pBOcPZYG-4zpg4MEGvyKQdM_Dm0YDr1dX0966ECc
    HSPbC5F7D1BZ7JPEIUqwoWxvL8jYs3BESOcyYM6L7Tz4Fk-XBgbbA>
X-ME-Received: <xmr:i3zPaSPCtWx16vl4FETWuv-iW0o4wpMZZdY1ATLGa_4QVpzgB8icD7b5tLd5GMMIKZBT3uQ5Y2ibE7cZfyEvIK3k7ZB9ZtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtredtje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepjeduueevffdtudejgeeiffduhfefgfdvheehtdduie
    fgjeelleelvddtkeeuhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhope
    dvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdq
    tghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhope
    hprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:i3zPae5j7Q8REJ3myp19f9ygUcHlVDEqZcYBuSqdckIAUaKu0YJyPw>
    <xmx:i3zPaQ3eCX2jvYoNVG892XAfBi8ZAlM1_yNNrHonmMs24MxKUUZh5A>
    <xmx:i3zPafYkR7JGo8lWyrI-CowFIu0GFr-yhtg4u_YAWncVCgynNa4NMw>
    <xmx:i3zPaYBz3BWzq6-5QXcpbN8_r3zi_AeLAY408I0y_S7YPu6NWRRjew>
    <xmx:jHzPadkwcbz5tlxT1x6xywb1-Ob3cLey-iN6nObty9YUAyXlu01qpFf4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 04:38:35 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/3] Follow up patches for default features
Date: Fri, 03 Apr 2026 09:38:31 +0100
Message-Id: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAId8z2kC/yXMQQrCMBBG4auUWTsQE7XgVcRFTP7REamSSYpQe
 nejLr/FewsZisLoOCxUMKvpc+rYbgZKtzhdwZq7yTt/cDsXOENie1QWxNoKjD0n7HNwYRQZM/X
 wVSD6/k1P57+tXe5I9Xuidf0AIqVXkHYAAAA=
X-Change-ID: 20260403-default-features-2-ce5d3037ff7d
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=648; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=h/s4knLQfRZ60D5QfBMb3AC3IZLBpLgFoY8KA9AxOrM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSer+ky/amyJlOmbNYk9Zez8ix0VWc23PrkU6jpvnPZd
 Qm7ZuVlHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjIE1mG/3kBuQfS3t1caXur
 IuIxM3vX7rnNRZr/n13f/vmbU6zVfzNGhrsM0dwPmk00yu2qbh14ZWAm/iNVjWHrgzLBZwoKG2S
 ZOQA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234567

As discussed on the patch review call and IRC, here are a couple of
follow-ups to the default feature handling for DISTRO_FEATURES &
MACHINE_FEATURES.

---
Paul Barker (3):
      bitbake.conf: Document renamed default machine/distro features vars
      oelib: utils: Support opting out of all features
      oelib: utils: Fix description of set_difference

 meta/conf/bitbake.conf |  7 +++++++
 meta/lib/oe/utils.py   | 12 +++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: e954a94b5b528b2430e8da331107d7d58287f89b
change-id: 20260403-default-features-2-ce5d3037ff7d

Best regards,
--  
Paul Barker


