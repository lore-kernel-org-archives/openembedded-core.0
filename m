Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6B410F3DE1
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:50:10 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8103.1774691406378673376
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=twL9nxaR;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=IbCOfh+p;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 99CC1EC01E2;
	Sat, 28 Mar 2026 05:50:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 28 Mar 2026 05:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774691405; x=1774777805; bh=Ab
	ne0WYe4fPogMaKxRf8PoatR0VDCkaiNjvGIgVRb5I=; b=twL9nxaRVIl0PrvVej
	yCG5qiGYhrNbhfUP4+ydfMSbqX2/ULq3ciEEwdE0u/sbbtl2Td9CCRsQGDk1cdtD
	C2SVNOVyCw6CenUd3TJ6fGOdlGmo1u3es3yGZtjNwsM0Il7TbuGHLO9az/wQyVw2
	RLmbHESq68aEzQpf+yJNUKykhHDD+lGpCmpGfHgOnTBtPhzkXei8+SDoDpI3faIS
	OjeSL1HzfDW9JBjsvclvbjGeMuch4W1psmmmUMhliOd5sXJlYA/Xt53gbW6PDB1t
	97lCdnzNrp/lACt/kYtx0IXoMeHrdNomndoSE7ZeyBMYwTT7AUmQQQAM4oc4IYEW
	4SEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1774691405; x=1774777805; bh=Abne0WYe4fPogMaKxRf8PoatR0VD
	CkaiNjvGIgVRb5I=; b=IbCOfh+pajy6hR1Mt4UaCqY5Y32pDuIWU02/6EOhbgMO
	3BZSNe+z/s+QpjvauwXbn+xVj4taDmGN//xtO9G91BsBsOdCKn3NqtbHkVmCjkrT
	RNielHYd1JbuHnS9Nk6LIShGzahy/q4rh1etuQUpx8C71knCKyhSi2AYM/Y6trn3
	/s8snn+uI2taBk7/3KVsdqDGs2C2/3rQw2GKHfMSBlwZTyqFAsT7V5b5Sp9eiCxz
	4hOxgCKiu/3giHp4B/P6Xe19fr7PfGKfcZAwgMQQ9xZujzZdcKJTxjPwruoGVGkY
	DxX0YL74Wvmfpg6zfsEEjYHsRRTeuHI4b5RzlnzfZA==
X-ME-Sender: <xms:TaTHabQm-FTNQFIlnTV-AilXjS9OdhCOwo70C36hIc8qQZfLrPo6-A>
    <xme:TaTHaSzS8b72GGAtiku1cfa8R2DmYf2DwbT7fUTHPpJE5GhmC69EF_70qgYv5d0pT
    Hc8U9prDNdK-G2d1NDswEitY4WDhLkK_uCiCOAIrO5RpGfQAlQSutg>
X-ME-Received: <xmr:TaTHaef6oqyy5OwyjdOToUuB0EDvajCEyf44-5hhR320uAUThUfADv4txSXVZ2vzY3gI5lFC5ZTm7r2IQq5mGbqVBHRJHOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepjeduueevffdtudejgeeiffduhfefgfdvheehtd
    duiefgjeelleelvddtkeeuhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:TaTHaWKnnrX5W2trcO0b92k3RfYMNoJsX_wLZQcu-OHMetXPRnsTXw>
    <xmx:TaTHaXHODRNdUoYMcTJvF3dPeWGrYh-MU51vQTpzjCX9uzN7ALIOrQ>
    <xmx:TaTHaYpXHnBOz3VyyzJt1ZQuL37_IyuNWVDZOVBudFVuUsM6X6ntLw>
    <xmx:TaTHaYT0XTqBfjPmcWwr7saY7zzudNHeRCieABgtx6DGFe52Itl-SQ>
    <xmx:TaTHaT0jyRdm9qK6DbQi9TdcaeS79Oyt9kgwRKUFZOVTLKF-67OpB7VR>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:50:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/2] Some more yocto-check-layer fixes
Date: Sat, 28 Mar 2026 09:49:57 +0000
Message-Id: <20260328-fix-checklayer-3-v1-0-53da29ef5c35@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWkx2kC/yXMUQqDMBCE4avIPnchJijSq5Q+xGSs2xaVREUR7
 27Uxw9m/o0igiDSM9soYJYofZeQPzJyre0+YPHJpJUuldEVN7Kwa+F+f7sisGFd5fC2VIUpGkq
 3ISBtruTrfTtO9RduPDu07wdQHv4adAAAAA==
X-Change-ID: 20260328-fix-checklayer-3-281eda60535f
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=483; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=zC1Jgikl0YlJvb4T2+AxaDVstiiD0HVgelnkkfBZG0A=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeX+Lz5cGbICPB7K+St4KkzUVmvvX4yHik5bzvvRfJx
 q7Fx/ev6yhlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBErMMZ/hcKn5q6fNWB4L/d
 3wp9HvLpFD7enMW5snDj8s9bzZrn+Wxg+B/FUJ68+OrN5GfSMS7WKlkll98sLdyU7uV5e8Y/sTJ
 pf04A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234127

This should be the final set of checklayer fixes for 6.0 M3 :)

---
Paul Barker (2):
      checklayer: Really fix regex in get_signatures
      meson: Disable exe_wrapper for allarch recipes

 meta/classes-recipe/meson.bbclass  | 1 +
 scripts/lib/checklayer/__init__.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: b50d6debf7baa555fbfb3521c4f952675bba2d37
change-id: 20260328-fix-checklayer-3-281eda60535f

Best regards,
--  
Paul Barker


