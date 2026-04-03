Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB85E7E347
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:38:41 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7458.1775205518721765180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=ZTyZ9lIV;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=AbWy3YaK;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 41D2D7A01A5;
	Fri,  3 Apr 2026 04:38:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 03 Apr 2026 04:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775205518;
	 x=1775291918; bh=vHVSoWBVIXiVeSyzZkOcgcUOGY0CB2Ut3zEYUI6c+Qs=; b=
	ZTyZ9lIVK7w6kNvexV5Lp9hNusjoz6lsaCffsDMZr4iAwjPmiKYgf/1LaiK6psNP
	6nkLrlTa7yC0kzZ1rOK+uPU7HLAszYo7nP+WYb4dOlh7PyLkVrjJr1ehj8POJAf7
	YMC0tRMS9YSVroCBqqgqN8rv5H8rXlUmN5jr79CQCFxUErJF/jl3VGmn1PuN+99L
	PIovSFcKDZArim/C0LF+bzkuFy5kzTld6Vkv0nOJki9p2h6ARyNS03cM/7XGbf0R
	ivX7sSWftZj5QPEVsN3ZnPDOFXl8TuV6PdN6xGPW+T7ezyInuXBW5xh2DRja5h04
	Pfj/yQTBZktkR/FIQXvvqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775205518; x=
	1775291918; bh=vHVSoWBVIXiVeSyzZkOcgcUOGY0CB2Ut3zEYUI6c+Qs=; b=A
	bWy3YaK6ezruZaqGknopfnhQ+xL7KJoqoeCr74n8v4CEEy0c7/ObQnvuVKjmrXfc
	zxZFhV6hasfl8G2nt0V63om4IE7BDdstBk5HUwkK9crrD/FLKEncc68RUbRC+MXd
	uDPquNLI/nxa4iTmaCmCWocz5YHvPkS6KVk9PHYb4p/yVBnjusQtQOnimyX8Hi2F
	0Ea+srSGVdmp9wvae4umMEFNoq4xunuxudepvBZP+8A45EKwDEHOkBthc2GzlMEa
	teO3delFdtJBblX0mgDB3KK0OULAtvqw1M+lm5TwltZtWPqhm7ZRu4STdeP5N0Jl
	jCtDQxcty8+iCHLNjfe1g==
X-ME-Sender: <xms:jXzPaahPhe3f4BHEZHAQYPVpkrROhAY0k1HeAKiv6c7-eDJyQCMiaA>
    <xme:jXzPaRB6x97DiK_q9MUxgUocU7-bLMZHWyHuK9kZKQgao-MUwKhuHe9B5k3t2s4kL
    UiDbaygLzvM6dWHcUYOsn5PUPzxEv_ED4yBfbPRTAVStw9yj2GN78M>
X-ME-Received: <xmr:jXzPaftOoq30u_waW71VExZZE6IAZIeUIWPT-vhX_4jH5ArWEvTL_hDvbKql2lWMlavcbZ3DJDGn5hoaAuFzzO95IDC2Nz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:jXzPaeZrT2Kmc3N4eqpULbkDPeD72xI3RnSmyij1SrxqOQ5L310W_A>
    <xmx:jXzPaaUSkAzVRk_WEBFJWp4CuWj8CLQOlUac05DvXz-7XJMULlBsRA>
    <xmx:jXzPaa4ZzK15llUn6rvsAXXIVEp18ES5dXvQ9alox2NyWIa8_dehdg>
    <xmx:jXzPadj19cpYD3K7qa58f6Jyc2RGfjIfSS_Giuv771F8sNIugpguIA>
    <xmx:jnzPaXGR5StPQFgPqjf-6FMOgyjgd1GunUfJgm5JUjV6fzVZzrUQTw6d>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 04:38:37 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 03 Apr 2026 09:38:33 +0100
Subject: [PATCH 2/3] oelib: utils: Support opting out of all features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-default-features-2-v1-2-cba2a1e6224c@pbarker.dev>
References: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
In-Reply-To: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=CHuhSgYh4rkjb9p8GY4e4GwrQSOTdr+OPFo/vI6nU3I=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSer+mucbmekc2/zVoh3yS/UN/sx6MFdnN3HespSXRWW
 XJBszCoo5SFQYyLQVZMkWVzz9f7T3sdeTNCbinAzGFlAhnCwMUpABNZPInhf+xSn3kR3/bdbHrN
 pCR0/ZDe4eftcte/vvY581l1sXX/jBaG/5nTXXfEbGfS88jZ0vK7c/8J2VRZE9k030lPmf99VRE
 NZwAA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234569

If '*' is present as a separate token in DISTRO_FEATURES_OPTED_OUT or
MACHINE_FEATURES_OPTED_OUT, interpret this as opting out of all default
features.

If '*' is part of a larger word, this is not treated specially - 'FOO*'
will not trigger removal of all features.

This is implemented in set_difference() so that the behaviour can be
reused in other similar processing we may need to do in the future.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/utils.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 5c722d230842..639c037c1a01 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -93,6 +93,13 @@ def set_difference(variable1, variable2, d):
     s2 = "b c d"
     s3 = set_difference(s1, s2)
     => s3 = "a"
+
+    If '*' is present as a separate token (not part of a larger identifier) in
+    the second operand, this is interpreted as "remove all entries":
+    s1 = "a b c"
+    s2 = "*"
+    s3 = set_difference(s1, s2)
+    => s3 = ""
     """
     val1 = d.getVar(variable1)
     if not val1:
@@ -104,6 +111,9 @@ def set_difference(variable1, variable2, d):
     val1 = set(val1.split())
     val2 = set(val2.split())
 
+    if "*" in val2:
+        return ""
+
     # Return a sorted string to ensure that the result is consistent between
     # parser runs.
     return " ".join(sorted(val1 - val2))

-- 
2.43.0


