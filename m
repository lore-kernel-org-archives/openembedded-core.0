Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2BD10F3DDA
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:49:20 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8248.1774691356769729304
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=SNHZg+rH;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=PDmGTHFD;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 26B1EEC01E2;
	Sat, 28 Mar 2026 05:49:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 28 Mar 2026 05:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774691356;
	 x=1774777756; bh=hGPKx1G+2IZNAskzfnp0Tw3k4FmDuWWjcf70kYok6aQ=; b=
	SNHZg+rHQ+Y0w3IgxBjvUJR97ch9F/7N45mTdNWGn7PjNE9hX/6pzp86OrhIpLgz
	z5kkDI4PxvnCU+rWHJkkMYo6J5gn4rvH1G+nb5CqFsKPXhRY3StOaFganOcqNLcW
	SEkMzpuXwcESqa+cC9MjJEebbvJi/vbtDlfMG4P7Wv5QxE0ySWaVRU2z/Wtx/acS
	a9Lz7FXaAB8o9Nd9VOflRRx9tOkLjAWjJq8vFT7hpqAfZzKuk61uaMaZolSnYdIW
	zMmUwdMCHfg7FASa10xVVLyThC5rpcCX3lF69R54gG8OtWqvp8/ks1HoCkyD1C5q
	lG/lFpNahzPUln1daCKvBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774691356; x=
	1774777756; bh=hGPKx1G+2IZNAskzfnp0Tw3k4FmDuWWjcf70kYok6aQ=; b=P
	DmGTHFDNsXODak1grN6pv/y9DiA0NAfN5QIUfgJxY7DwYjJksr1YRXxLXAaMNoDP
	QtFAUOzJwwbq7I28dJtiZJAbvys3I49yA463yNWk2fD7SeBdDJfD7t5vN/wTv/xQ
	BspUAHIrfSpAMqzMJjrpK3eoSIJ+ir2sl6QtNfU+rw1VL+pGJykbRsnlMVXh79Ov
	VnTXqHOutQ0oExHFWJ1wH8To/kVwxiHcsSlsb1iMOEEIx9lzSAbl2XKZitmF4eda
	V9JAJe9nMp+vZ9mG2h/4qPIWylLH22gtl7Z4F9r8raxO9KjmbJW1TgNnBeXcWci0
	1BSKn7hwmHAHLkNvFhXgA==
X-ME-Sender: <xms:HKTHaQkAHotTM0eEGqS7ph6t7JrmwP0C6jQXI0PdZ5herKc_AkO-XQ>
    <xme:HKTHaV25rd69A_pwzJA1ZA65Cto0LoV-0JrULf6au1396neSE7a0q2kIPVmnojwxe
    D8a4IJhSU3Eb2jI4eW9xsmU7Yj7UxJGOcO5jyl6_dKWrawVZb4SshwO>
X-ME-Received: <xmr:HKTHacRwhqB_edWIAHxszB6xGxYrOhNj0RxW9PW48cttM2SGKcFP8tHslcDv22P88uo3qktQxxxNmHSqOENRY2wdPJQEqDc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:HKTHaXtkGDeKLqniUBcvwN3UOlYrtDzfjWWgbc2TNJZhdtSC_Q6-Gw>
    <xmx:HKTHaRbI05SdBPPDVGLLJaiRdcLskj6oFzMwt09MAWwzpUbg-Fg3fw>
    <xmx:HKTHacvgz8l1FSixd2TnZz7ANijJPaDolSsA3Il0UoiAD5KP8YFX0Q>
    <xmx:HKTHaTHLMdJq-LWt_Wpnp7w69Ih5PRseDkwTG9dvBMocxHb_9wG9Wg>
    <xmx:HKTHaWLTzUPRWXCEJ2d1p_l9ArCfJ_5vc6VPGVM62TXsdHlAbowFg9aG>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:49:15 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 28 Mar 2026 09:49:02 +0000
Subject: [PATCH 4/4] lib: oe: Drop backfill support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-default-features-v1-4-90790864d734@pbarker.dev>
References: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
In-Reply-To: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=6Vl9G+T6pzGvonZPc8TCRORNyVbDSf1dMyPcnVBdhfA=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeXyLB1NbeHD7xtsmvyxw7C64+CBKIko2YeYJ9yS2T7
 TYC9psFOkpZGMS4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjCR982MDCd+y/w/FKh23aGL
 R36LyIqm7heecjpsAr3VU8ImWT1wecbIMM/6+hS+hDS+IwwcBp8j/wXf1XwafH7q+hIG9vgW10s
 SnAA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234126

We have removed DISTRO_FEATURES_BACKFILL and MACHINE_FEATURES_BACKFILL,
so we no longer need the features_backfill() function.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/utils.py | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 928b38c64cf9..d5766fdbac2a 100644
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
     # of. This should be called from an anonymous Python function and uses

-- 
2.43.0


