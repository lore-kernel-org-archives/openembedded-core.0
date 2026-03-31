Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804F510F92EE
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:29:41 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2265.1774985377619638138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=G97D6Uz1;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=DTQ2zQ3C;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C1AD314001B5;
	Tue, 31 Mar 2026 15:29:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 15:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774985376;
	 x=1775071776; bh=SmmBT7DmdoLRIggdYy2VjYXmiTdeyzeuNg0YmHvHIF4=; b=
	G97D6Uz1yTGMxtW+HtBmw/Bt6eNT/esMkrlOW7LgH/66rfKt69gmlcb6z+LDWJfN
	KJTS2LHjfT4keVKBg3/0QiPjBF0AMUGZqq5H8kZrWY36fhMXVe71qxZs+bFYyJT3
	AQv4kQe5j1bLeHRs0wRWowA746/PnJoi8cm4Nxd/URqC9+Rew0tWmuDOxStcVrK3
	EOXutHiHE8rkLlMVSbWcvAZHy7BSusQvcv3AEMvweJgCO4xsvSLxR4cUDnwEYqV5
	LmK0e+asfC5T7q0Bj5QjVG8Eb6koRkvdRg8CBmuGk0Euo6hU6/02fgRPuI9V6wnM
	dR456GCeqbKDhyuiZ02K8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774985376; x=
	1775071776; bh=SmmBT7DmdoLRIggdYy2VjYXmiTdeyzeuNg0YmHvHIF4=; b=D
	TQ2zQ3CqWhSaRxJ+ilBpPt1PrRv7k5/6UuIqxvREWl0J5csgKBYVYo0EGaCCG2VA
	QAbfiX9pmg09IZLzbpQBVohJzBXuqu/vRrfUdZdTIDpNv6Ze2roOoNSOb/x6QKf0
	HOqinmcJn2UfC50myDf4Ub7KhnLi6KPRc77JmwhiTaD1fjMTqQmoulB7xO7oYQ+0
	0jcauc8i34Pl45yBmWRRZq86hOP3tuTtY/8VQwDf0x20ae2+fyCp5VJdraIDKsJG
	sZjxyN8dpJNCYAcr9s+6E3CgfhqrqQv4prgiP3NrtrTwbVaIuRQniaMs+RSlHvKk
	z8KJyymZ3GsM8V9H5Ho8w==
X-ME-Sender: <xms:oCDMaYIW2-QaQMNW2-_I8FWlsqGw9sDmoTrQnapKjCa_NTfS2DmhHg>
    <xme:oCDMaeIA7ZtAJ7IU8AiBSy-3MYkT2HEFiKfKWuKrnV_rMQbRef-CbKd44b4jErl3D
    v4z32xSLR4kc_8_V-eI54ds7ziIDbJvkPogVtWmYRKpJlbpMztO0Y4>
X-ME-Received: <xmr:oCDMaWViVVNQX9U4hiN_LPWaDjGKHC_xndFIoogjvTPK9Jx8mgW_OVah8Y-4QG2MoupMu5c79C8EQ0IJXlC6XkoLVB0YHA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:oCDMaQjst6TSL8icCWGma0eLEuOptgP6vL8KgA5qRIdGRfMhxr4KYg>
    <xmx:oCDMaR8thdEawEbSHRKwbgZTxeYz4tRVKGDQQ8p21WTO29liPAI-Xg>
    <xmx:oCDMaaD7afTKOzTJz38tyKRMRR7GFGCjs6NL8k6c6bZfkqCmJuopbA>
    <xmx:oCDMaeKVRtwvKL5Tq2cs85aPUz1sng_cJ9Hm1c-CMQKrQIdSqm-Kgw>
    <xmx:oCDMaetwa1iWsyZciKdJw5LSosDaas2IwQfElOcomb-zNg40zgxRaLj5>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:29:36 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 31 Mar 2026 20:29:33 +0100
Subject: [PATCH v2 4/4] lib: oe: Drop backfill support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-default-features-v2-4-f73b43d8bd57@pbarker.dev>
References: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
In-Reply-To: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=ylLyWOd0C+7hs6uF8No3/byg1Ys4kapYu56+bjuIOvU=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSeUZg7deLG3B3Cew8Vy30/xJSSzbz9v5a/sAtjacJSk
 S9PnvN6dJSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAi0b8Z/sqLfZ3LIrvMvSK+
 Vn73taaY92aaVltkj9164JNmqVXS2cTwV9rxY5igyAqX1A7Pb6dCPz08+8l51zmZVau2JZdPWLl
 zNi8A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234311

We have removed DISTRO_FEATURES_BACKFILL and MACHINE_FEATURES_BACKFILL,
so we no longer need the features_backfill() function.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/utils.py | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 52f2f1bd55e0..5c722d230842 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -137,27 +137,6 @@ def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
 
-def features_backfill(var,d):
-    # This construct allows the addition of new features to variable specified
-    # as var
-    # Example for var = "DISTRO_FEATURES"
-    # This construct allows the addition of new features to DISTRO_FEATURES
-    # that if not present would disable existing functionality, without
-    # disturbing distributions that have already set DISTRO_FEATURES.
-    # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
-    # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
-    features = (d.getVar(var) or "").split()
-    backfill = (d.getVar(var+"_BACKFILL") or "").split()
-    considered = (d.getVar(var+"_BACKFILL_CONSIDERED") or "").split()
-
-    addfeatures = []
-    for feature in backfill:
-        if feature not in features and feature not in considered:
-            addfeatures.append(feature)
-
-    if addfeatures:
-        d.appendVar(var, " " + " ".join(addfeatures))
-
 def filter_default_features(varname, d):
     # Process default features to exclude features which the user has opted out
     # of. The result is appended to the target variable (e.g. DISTRO_FEATURES

-- 
2.43.0


