Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE66CE7E349
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:38:41 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7352.1775205519709575404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=NZEs0v0P;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ibUK/i+u;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 124F97A01A5;
	Fri,  3 Apr 2026 04:38:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 03 Apr 2026 04:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775205518;
	 x=1775291918; bh=bZgiJ0CzSUrMwaOURoesOhVcXiFKppRM2vUvHoGTEhQ=; b=
	NZEs0v0PVzt0HG7EhsvJplsFelAxMgJII3AnM4rp73fRhHB0z5jCLjnA54MmExSL
	caXsTX4xINlEKWtfKarb4jM+mpZphSOTglKb0f3anvCqty4v/2rha1xZQliaj+g8
	gtmm28wAgO7440lxn4RzfcK7Cn8c0jE47imPPfXfN8oUKuPcvT3Wub5WvUUSwRST
	RlEVy07rw/ksYscwIwKaDDp/Ew9vbOw4MOXvHkjYqXMU5iUXCl3ZLH1pYAvZYtb6
	k/XyL6s6pcA+8d+s1p9K0Gci3dAck3COedRyGjbA08L8yC+hM2pZyi/C1C6glFUj
	RwCfDawAv91rmMUs41YQqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775205518; x=
	1775291918; bh=bZgiJ0CzSUrMwaOURoesOhVcXiFKppRM2vUvHoGTEhQ=; b=i
	bUK/i+u/BXUA3xzmC6MiowyACFI26EMt0nrUIqG75b5EX04Ti5/3fdIKx9+g8jzS
	MTYwGr7qp1/tCCdOdg16Is6yNUTgkkbqNZ952utZdop9J1Qgl78+cvtfuNsNYloP
	MIidS3hPJCKObuMuKjq3D9XgSr8aCLbJxFEJELIO/zDq2j6KVSqZuGr+GfaSBOi3
	Kggh83+26oJJbsqaMdazGmT6GnfLhOh+zpLdTrry6hqkDtWxO4cd4I4nRZ0UIbGy
	RW3Ved07km7NoHwXQimUBJTk+3R40MAMrqTPNrNdSkvALYhmcfmuX3wfvIe8+pxM
	iJwyG4Vx6VTOclAY387Bw==
X-ME-Sender: <xms:jnzPaSoieP7_Iv4yj7wDYhnaWauAL6svTPG7rxyEqi1budcbJVFFaA>
    <xme:jnzPaWrnIws9hYqoRDdSELgdo-6BekeflxaiGxRPgudX8DnyVwjdzgBjbXnz0Mfx4
    rEAkFpfjvriKS-aMPUcVeZyLoWtvOsB0aSi8kek_xl1BEOaD8p_QHE>
X-ME-Received: <xmr:jnzPaU26M3acDimG3lydK3CiF9Io55GKm71n8cIdibjY3d-IG_4qIg7uNaETPqSNW7SAHGR-t4FqgvghcIh_8KVLO_eiJDI>
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
X-ME-Proxy: <xmx:jnzPadDJPXrPgfQxFm4cZHjLNBHcfsI52wld75eTiNp4yLU6ifGiBQ>
    <xmx:jnzPaUdLJuVvuT1Uw09yu6auVvY53y0xfevGmmaC_kuMEWwFI2XP_Q>
    <xmx:jnzPaajC-41gD5LmiFGt2HiRb13gYZEF-i9DGKkuuuuG44dSB2hj4A>
    <xmx:jnzPaUqEiaP9NbF-n539EI3DxHqXOazzi9Ik842skQuROKwtnoYa6Q>
    <xmx:jnzPaRPD_k03mXwVXQDr49oROwcDUtHlvJP5pJfKT-Hunf6ZvJB1OlQc>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 04:38:38 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 03 Apr 2026 09:38:34 +0100
Subject: [PATCH 3/3] oelib: utils: Fix description of set_difference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-default-features-2-v1-3-cba2a1e6224c@pbarker.dev>
References: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
In-Reply-To: <20260403-default-features-2-v1-0-cba2a1e6224c@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=0Q8D9ZwV9I0YuSkKoDg39drkBIzITGWaB7hHADXHmfI=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSer+k+Hrk6PuP3rkTv1o2zupumh5++f128d4IAz853f
 I7fdt+u7ihlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBE1h9g+B9yTbjKZ+tt8y0N
 Yk3rOW91+K8xL+J9khvUFc6++dp50zpGhh3LlzkyrH8g+3qlq9FNJ4dZsXMz2vNm2FnYTnDLlFh
 wlwMA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234570

Forgot to change the description when copy-pasting from set_intersect().

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 639c037c1a01..ed5dd5f45049 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -86,7 +86,7 @@ def set_intersect(variable1, variable2, d):
 def set_difference(variable1, variable2, d):
     """
     Expand both variables, interpret them as lists of strings, and return the
-    intersection as a flattened string.
+    difference as a flattened string.
 
     For example:
     s1 = "a b c"

-- 
2.43.0


