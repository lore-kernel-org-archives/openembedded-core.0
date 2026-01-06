Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC1FCE9D6B
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:48:51 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92871.1767714521356876520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=yCWKig+Z;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=umG3oEOC;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id A6DEF1D00101;
	Tue,  6 Jan 2026 10:48:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 06 Jan 2026 10:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767714520; x=1767800920; bh=h9
	Vn87J40AFYXpnOiCyVJLKNb15M4aK5WT6qU7+Ccvc=; b=yCWKig+ZH6mB8+cwYA
	zCtfmFwo5PVhxW7HHOh8MWWVG7gWH8US9UJc2LX8HB0voqa3kljB/cnNYWc8Khdz
	ChVdxJ8oslrB73o7ufbZooDhDHZvjU3c0/lQz8TowrUDA2wRxT51L6M8VWf4w/u+
	WPBusoCOtDq2kZdLPszh9JeXcsKo3gv4ieAKI1NDrN1pRynZfnrR1RuS8X92bjR4
	mzLgDCkopH14vmssKdFpp/J1JrZGBExsKr8qnnafJoZlG8PSdOfy2SznbdAFVkwq
	B9drqgAh8TnQ/kweQVjpNgGrZ0aK1L5yYYMDdVC+juePwliOTJpyPL5DXVlLXkqI
	yIsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767714520; x=1767800920; bh=h9Vn87J40AFYXpnOiCyVJLKNb15M
	4aK5WT6qU7+Ccvc=; b=umG3oEOCT7r+IFbPfvbRQ7X3ViOSNWTEy25vjxP/ApKi
	SitdA8aA1VRPf7+jAiTu/1etPWtlK717TSwMZfDtX/sXh2Yyf9WquVU+0MphWEWL
	Jk+PHQKOrePn4NCHmKl4DiTW+q0+/tVddSyKN/QVhIqjrz+aaVR6BFwmoauTQh6Y
	7sQpsWSEUrcZdZDA2KP+PEUI3KP7remdN7jSYwJY36W9J6oBZbJ42qte0+grnrJZ
	3CZQMeLloHvFoJdWOLIB2zazqJc3fBf9O91GXGJFURhZN8V1wcZ6ZmWHQoy/8d8A
	zsdb0VOTVpZ/6Fb3AbR9Oi4c21haJZtlj7MIc9rN1A==
X-ME-Sender: <xms:2C5daV41N-xRTZW_iLi1ZsvtvxQDUemdH1Ufh2rHbh-p7a9b7QxLrA>
    <xme:2C5daY7Mr7xgtwA_InZNzisqsdx3ifQVc-tx4eWAG_xGNGD7Cov2laEWTH9NU0WyZ
    7kbH3FOqrXncF10u3vVCPJveON5pwYL-0sN22w6js4f5BSHSGOW_LzM>
X-ME-Received: <xmr:2C5daaGi0jONK281479Hiz9299NcAh0Cv8WyK6CQLDiBjIBkgO-Ou6Kk-Ls8Gr4qFovDWHIqJSzLKgbRl9qcmMTH83kkCBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepjeelteefleetkeduueefteffgeeltdeguefgve
    etteekveetieektdfftedtkefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:2C5daZQtEgFQWM9Tp7JYUXazXVca6pscgp1vUmWa_e7kwDHt-FmkhQ>
    <xmx:2C5dabvd5g906RmOERDTdRuZlLChApkd9D3J79KbCAEohnIuwgZnag>
    <xmx:2C5daQxWfmAzjlEVtM0XeDQz_rLZgDHerMGAOt1JRVCJxDmwKdsS-w>
    <xmx:2C5dad4dvi3wvXyJP69GFwy1snN34Uq7OZ317AG_9sX_sgk9ry-S0Q>
    <xmx:2C5daYef3QFzGhjsONK7_vp53aFXC-Re_apqC29dcq9bn03n4xFkxqcA>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 10:48:39 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 06 Jan 2026 15:48:36 +0000
Subject: [PATCH] devtool: package: Drop unnecessary import
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-devtool-package-v1-1-c205ebf09867@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIANMuXWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwMz3ZTUspL8/BzdgsTk7ESgdJKJubFFikGapUFqqhJQV0FRalpmBdj
 E6NjaWgCiYmQXYQAAAA==
X-Change-ID: 20260106-devtool-package-b4738d0f90ee
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=IRVIdF09VsLNOz0hBm3AVDRRCbmLp1BqNu9b0awHqZY=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTG6l0ve1N3dO2ic9dPPr5zOPlTsXDFdK+vvwqMtk7+d
 L9Cbn3Hq45SFgYxLgZZMUWWzT1f7z/tdeTNCLmlADOHlQlkCAMXpwBMZFkRI8P5jiffpK8WX5kn
 yXz2bajAnsYZqq8Etn5ZPXXd6S+XvnnzMDK8XjmnuiNrHqOwnX/FWmvTlxxrtq6q73op45PleVJ
 k4zN+AA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228904

The package module in devtool never actually used subprocess.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/lib/devtool/package.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index c2367342c3a8..c8be176127d0 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -7,7 +7,6 @@
 """Devtool plugin containing the package subcommands"""
 
 import os
-import subprocess
 import logging
 from bb.process import ExecutionError
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError

---
base-commit: 0ed4776533145c901611d7f4f942490e33481335
change-id: 20260106-devtool-package-b4738d0f90ee

Best regards,
-- 
Paul Barker


