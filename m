Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF70E7E345
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:38:41 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7351.1775205517736794828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=V2bRNqro;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=edOJESU8;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 458E07A0252;
	Fri,  3 Apr 2026 04:38:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 03 Apr 2026 04:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775205517;
	 x=1775291917; bh=Hn9lQCCVGwEM3dw+/hN5Yk9zjSKPO+OEZYQCn8h3XLE=; b=
	V2bRNqroDOzGbKBCzFNx3x0oA7Np2ih1mUk7LREWyrujlXISx8vcgF+A23pFRGpn
	4b6DnSEZCrFjg2UNED9p84vh3TGTwTh3OwkDnUejapmuCkyFO5GzSFpX6/MgdEjJ
	SWre4TCwVp0+eoObRDc3jQbZYQIxO5+snRwtUst/oqLX0gHJSsFNy073h3qVr/SE
	ZYMVpxqZG2vaFIAO+xdcTlI9SS7xFKak903JmTkojUbpDTM2jCIjow7StUjXynz/
	qBCMn1Fz3iQwrMYwBEZlbfZX2CziB+dQ5Lvh5yY07vVACpnP964ivenMOH3r6/Ql
	+9f7x0HNymMDoHwhtEWZmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775205517; x=
	1775291917; bh=Hn9lQCCVGwEM3dw+/hN5Yk9zjSKPO+OEZYQCn8h3XLE=; b=e
	dOJESU8W82cAw3h6bvjD2hv12zOBP4XXQRpcw4LXRaZxeMqJ9aEtmNi5dljamjC5
	5R+ar8Lc55iRZ0pd1Mb/Y+2PZPM+TLwexCUSlDI9LnTmeSMZGtFlgio9HyW3Ri/U
	d7EFOG3Kn2E3em0yFVpHjGhq/BLDftb903Dr8H1lck9EK7vN39VwI+7SkKqfsqWJ
	XO0LbMLR/6mf7RMAmTFw80z4jThAo9GsqAKRWp98bAoGSJHrVV9Uf1iio8+Rv1Vg
	eQm73q9NXllP90P7jFITdG++SrbeMS3DObAFWqcdGpT1u2VjuvWIfc/JDuXP5uQl
	HmLPW9x6WUq1YumyJ1D7w==
X-ME-Sender: <xms:jXzPaWrfbgt2P-KQfAQFLYmo3AaI8epPx74PZgXZByyif70BkbFZrQ>
    <xme:jXzPaar7OTW2HYwwU9Uu9GP8D9wNp_kHYzrS_shjfQI1VPi1z1w_k3K1KqHMzyUDK
    JWbOCcZJDBBvQ-JMrrVzb6dPOa6g7DgzUzK272gFAxW5KvI6syZDg>
X-ME-Received: <xmr:jXzPaY3Zy2KqxYiovBT2wC7AI4_yL8B1RtvkhA57NCpVaOAYLXIZrsUuu6r4XlCN5ZP-oXJ6Z67IdoSIUSv7d4rYk2RGv-U>
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
X-ME-Proxy: <xmx:jXzPaRCYFjLnk_66qxxjamvelMrdBu47tZOqFW7-WW14IRZ_b7A1rw>
    <xmx:jXzPaYecw5jkzEiJGDpCm3Wz-2LZ6m1DcZnb9CmY7TxZ8x_1Ure2_g>
    <xmx:jXzPaeja9sWjzne7NOOyDspdANW4rwQ0HKVbp5NoroGQvdMjhxUVNg>
    <xmx:jXzPaYpXPOyv9gYI-nh8NyLRGqZLzDP7P4ITiPutPOoMvhR9Ncc_GA>
    <xmx:jXzPaVO03dKFyEGoFD33XJiTMnnTYEnn8Ux9kkqVp6ynal2riPns3ngZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 04:38:36 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 03 Apr 2026 09:38:32 +0100
Subject: [PATCH 1/3] bitbake.conf: Document renamed default machine/distro
 features vars
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-default-features-2-v1-1-cba2a1e6224c@pbarker.dev>
References: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
In-Reply-To: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=xh9M9iVhyg7CrJ/2RRSARJILCnhS7ZueS2XTgDo+KJ0=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSer+kqa7tdvVhcqXrKD8MPjsHvRbT3a9/giP51PP2Y9
 saLkjHlHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZiIeyDD/+RNutlzSt9ws2cr
 av465Sno7/m9bnvkntUhTy+wtPOGujL8L3afkJPir1J2NiJ6caE3o9dC//0rHbZxfS1furP2jzk
 nPwA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234568

Adding support for opting out of any machine/distro features has
obsoleted a few variables, add them to BB_RENAMED_VARIABLES so that
users get an error if they try to use the old names.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/conf/bitbake.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 84450386d984..9fcd16615db5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -121,6 +121,13 @@ BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0+] = "is deprecated, convert to INCOMPATIB
 BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:LGPL-3.0-only'"
 BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0+] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:LGPL-3.0-or-later'"
 
+BB_RENAMED_VARIABLES[DISTRO_FEATURES_DEFAULT] = "is obsolete, add all default features to DISTRO_FEATURES_DEFAULTS"
+BB_RENAMED_VARIABLES[DISTRO_FEATURES_BACKFILL] = "is obsolete, add all default features to DISTRO_FEATURES_DEFAULTS"
+BB_RENAMED_VARIABLES[DISTRO_FEATURES_BACKFILL_CONSIDERED] = "DISTRO_FEATURES_OPTED_OUT"
+BB_RENAMED_VARIABLES[MACHINE_FEATURES_DEFAULT] = "is obsolete, add all default features to MACHINE_FEATURES_DEFAULTS"
+BB_RENAMED_VARIABLES[MACHINE_FEATURES_BACKFILL] = "is obsolete, add all default features to MACHINE_FEATURES_DEFAULTS"
+BB_RENAMED_VARIABLES[MACHINE_FEATURES_BACKFILL_CONSIDERED] = "MACHINE_FEATURES_OPTED_OUT"
+
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################

-- 
2.43.0


