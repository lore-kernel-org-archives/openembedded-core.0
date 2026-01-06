Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B6CE9D74
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:03:41 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93188.1767715419239323588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 08:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=TVC2e81R;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=c/Xh5cI+;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 6B7041D00035;
	Tue,  6 Jan 2026 11:03:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 06 Jan 2026 11:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767715418; x=1767801818; bh=nJ
	dRmn7ve5h8pbrtT0P8RMLXi9YGZd3aMT3djfz3Tuw=; b=TVC2e81R7i9sp51CbR
	sVdY2eAlwpHtkZ5wIkyz4bCpKowkeZIc4y24ttLfXNlzKehCmdUvHC3ZNP+i36qm
	hi4uCi8WnYT8/4C0Potscxa9H6IhHCsyHMohKjRRsW9FHLwnYpr5rNaxuY+iHueC
	ot1aKut0q8PF67iTJG1k6kab4Rxq/dZUIssYHo6lpZZ/k4MWB7QAnWu6l7KxrtP0
	Z58SfcNPBQyxPeGxPeI/PQRxYTgB9oF65ZoTpeC6hmXc6MsbFJfMR5qaQUj0T730
	9ydkIEfuGPAQQO1UH8tE5bgEnoUj6SlyHpy7zx+MEqe3NJh9M4uwdhjZPfjD8AuA
	6Uyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767715418; x=1767801818; bh=nJdRmn7ve5h8pbrtT0P8RMLXi9YG
	Zd3aMT3djfz3Tuw=; b=c/Xh5cI++OZCIl/NmkCIPuuUDRRajkZ6VWVZ5ag6MwYp
	46Hb5B2kTQwbxHiSjYK0Tbk+tURd9Pr1GvFvN2EboXslp5p7mPtWZjqqdwItC+Kt
	JgMmW6LF/XhPfWKqM+sTW4rVlTEeWmAJeFfT4B6Y1VAlICRfC4YL22nuXWxnpjjI
	BrzlQTl6QbJST2pt7+sechZIWdU2yIMUgOjLZOzrdxPDK/h1tA30RdYE7X4b9cJ4
	LQgYbLSiKQhc0HTlE7VUIsB6KD3sQN3sF2NAgDNYpi3oMWCJ/WwBGCY44FWFCGsj
	oowG5wj+j7J/gKuJ2WxDUGsoTpxjEv9vqDQLVc1ohw==
X-ME-Sender: <xms:WjJdaSoCUGOtRO9LNfdAW74xQ7uq_bjy2lQUaDP_R792kqScmNnIuw>
    <xme:WjJdaWpHTm5wzeHtBVWyY3Ay3ZMF3hRMVnJ9ifxUYGDqp9-Pm2KEbl5mglqarRVHo
    0Il4EfDdPeKgtNziQONpGg66LApgyZCixM1zK9124mUYvrBa5g0nx4>
X-ME-Received: <xmr:WjJdaU2afkH3ABsslxeeQcPdahiGYAnwsC-hrAkPwgDB3OeAWhjElwI1eyIFilJFHeJKgC_603x_1J4de7jr53C6bN5lzhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepfeehffeujedvjeeigeeiveelueetvdeuffekle
    efjeekleekgeekhfehueffvdeunecuffhomhgrihhnpehmshhgihgurdhlihhnkhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvg
    hnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdgu
    vghv
X-ME-Proxy: <xmx:WjJdadApX87GFQEvU0ZyVpb8Dk5xIt2Ul26EtDm6Pyn4R4ec-5zosQ>
    <xmx:WjJdaUcrnDP0Kr0k4KbQ8BXd-MLADrMK0xGQMDuvL_I40OrzNJQ8AQ>
    <xmx:WjJdaagibF0SZC53KULbCOG0PrsrbI68EqoqXSiiCF0J7IEwd_wGHg>
    <xmx:WjJdaUpkomwTNco90sRV-XuRucNNE9cUEJHCv3pHHdbqW6jagDS2bw>
    <xmx:WjJdaROj5Gz_3ddl-sUeD6FYKEjXB2dkGuk5veBg7yXP3IJqhJ3vcSXb>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 11:03:37 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/2] Fixes for PATH usage in devtool
Date: Tue, 06 Jan 2026 16:03:31 +0000
Message-Id: <20260106-devtool-path-v1-0-23fd7a493fe8@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQyXWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwMz3ZTUspL8/BzdgsSSDF2LRJM00yRT81QLSxMloJaCotS0zAqwcdG
 xtbUA7rBjpV4AAAA=
X-Change-ID: 20260106-devtool-path-8a4f5b57e894
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=NVLjJSBldckXDa3JQZaiMlTIn0iJvqxsvR/CQJXv86M=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTGGkXwLQ3Z9FaH4/kG7vrv9ln3lvwtYJt6aPkhhn5Dj
 4w0zw2/OkpZGMS4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjCRHlZGhmMrVnbPOhMT+KLN
 q2HOjNM2FXtPLN2rfHXNzHefGNefvvuK4Z9d8cI983+z3Zn8/UeqyPR7vW0iWl7CGY/W8B8MqpI
 9Us4CAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 16:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228905

These patches follow up the fix for the devtool selftest which has
already been sent [1].

[1]: https://msgid.link/20251222-devtool-deploy-selftest-v1-1-2e656331dbec@pbarker.dev/

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Paul Barker (2):
      devtool: deploy: Run pseudo with correct PATH
      devtool: deploy: Reset PATH after strip_execs

 scripts/lib/devtool/__init__.py | 3 ++-
 scripts/lib/devtool/deploy.py   | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)
---
base-commit: 0ed4776533145c901611d7f4f942490e33481335
change-id: 20260106-devtool-path-8a4f5b57e894

Best regards,
-- 
Paul Barker


