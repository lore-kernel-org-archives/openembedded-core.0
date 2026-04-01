Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A489F107639C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 17:42:15 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19113.1775065328239007965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 10:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=miq5FKmR;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=mo5KRtlz;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AF9BF7A0065;
	Wed,  1 Apr 2026 13:42:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 01 Apr 2026 13:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775065327;
	 x=1775151727; bh=SmmBT7DmdoLRIggdYy2VjYXmiTdeyzeuNg0YmHvHIF4=; b=
	miq5FKmRPsSiacy79sDBPrkbQ1jPZ4gVxVlzlWi7aQyVzvCvJIYgUKqGFKzLgr+v
	/T3E7BzmAZOeLa1O30wlCvOos029CKFJX8tDGLI0K73H5onTz4Gf3hc4fW/GKBri
	daAHlTqAd+CF+5/fbhFnAiLXfhk/TLk0vA9fmO6aaVyXnIhT549O9tD+daIp5aZe
	ijlsXYbaYbLKIcGJkIwoWMYA9JNeUGwZM6P5eiJkGaw/FUVoR7wTxMRRIQnsog3n
	68+Lx1vOIuHi2sd4aJ2oHhJye99cNRWxztPoxtXzvsOH6uHo1Bve3vmEQ81QhFWD
	uc5nsU8kiBkMgbrKn+YioQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775065327; x=
	1775151727; bh=SmmBT7DmdoLRIggdYy2VjYXmiTdeyzeuNg0YmHvHIF4=; b=m
	o5KRtlzxezgb8r9RM8V5fy4VUQ84Pfy0D83wl62zyR4wQICFIFGJPUcuH12y2atf
	GSXZMEidbzaIw/ejH7KEZ9jFF496CCIUteJC3+vjzj34jIVagb0pWHBKW5xrqcM+
	vaP6rgJeCjBcOrUm4Rh9is43juY7ZylPBFab8D3g4MMoRK7yvUde7Gn/gXgkn6x9
	5903mx9AhkpqPMc+HD6kL/jnKk3vqclCWXRgRz/DmhoUnQ3rfF5qESIxiz6grFCv
	OHrzcmQdoQqJgEt3TJ+Kgii7vnr8o3Ze709f0RWqbUSgdh7gDgvFg59mUeUx8428
	c9jChv0GvJYy+4JlKUKzQ==
X-ME-Sender: <xms:71jNacZMOoXVCPUERl7IOw1RXHeIvBJDvsrzSOvXEDcSTKJrZ8niPA>
    <xme:71jNadYz6G2b82yUi8ageYVmHCl0iITJhpVE7it_G--rh_tjskKmJ-UN9cJmNVo7R
    4XwpY3dDBUIRuVKBNsV0363Oi7QZxuz-ZJfPFMeWKLFmDW7e3xsqFI>
X-ME-Received: <xmr:71jNaUlMAfzHfLih8nRcDLHMtJIivhOhsrXKHLUdcbyxxpUxyxhVe7N4AGcQRsiLiePKgqqrM537LtZQbwVfuYjlYUhI-HY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgv
    rhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsth
    hsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:71jNaRxaPUAC5oC8S6EILRlgF5ZEgLoNtWpT4cghlkmL1I4T1Uas4g>
    <xmx:71jNaaMDq7z3dC5hkqzfCCtDZSMsDs0KCaOijBWB48fEH_Kd13OwGw>
    <xmx:71jNadTp8EveVlRMHmf52NbQN0wn5kVl3OkjMbD51-n50tbUdg8PnQ>
    <xmx:71jNaQa6rAozrDcayGYKnViw1RfX-R4venlSe3rkoYWYWxaDQfbLwA>
    <xmx:71jNaW_ZcovNaD2ZBthS2rGFxd6E3NHBzSpE8odNI7yTbZqSljh8RLfj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 13:42:06 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 01 Apr 2026 18:41:59 +0100
Subject: [PATCH v3 4/4] lib: oe: Drop backfill support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-default-features-v3-4-8f4b40401ab7@pbarker.dev>
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
In-Reply-To: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=ylLyWOd0C+7hs6uF8No3/byg1Ys4kapYu56+bjuIOvU=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSejXj1Zsoy/odNb+/ck+qMtw48PfvpXa34tx3n+g3fi
 5Vp+d971VHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJJCgzMnS93/C9akaWhplr
 gfSVqSu2qwYFNU3cvuigklbb5i9Mc1cwMjzXvcw+65ZssItCxkafHONL2rJO15ovp4gn/Ij+uFd
 Bgw8A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234454

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


