Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E21CD5858
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:08:34 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3535.1767784113130290332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Km0pAodg;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WB4V1cge;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 821141D00150;
	Wed,  7 Jan 2026 06:08:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 07 Jan 2026 06:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767784112; x=1767870512; bh=qn
	QYGjAgRpVgiP7+wC4gabesAkm13ElvQ/NZ3nG3YPk=; b=Km0pAodg1vcFkKlPXC
	QCWHtVW2sw/dMmj7rkkEHCWAPlb1339DAPRCXfSTRWlc/WWpotAvn/imt09ak/P6
	PvET8moqgaaDwv9MzCo+0EgKtORGI3HiRizrviiW5Ht5z6Ej12g/UMvPlb+4o7JC
	N8WqSgFlgiFece86dLvNRSHEo6FOx7vc3DseclNhwba9T37FfAPToQIDrjw2/79e
	khzZ2s2BGtES9fEPwabSADCnvNq1T0x5GD+qrpXbznx4Dt1MjK4DE2Pd1yvKCH5h
	v6k1W+Tqzl3RPFZnx8iXNFpmtZg8OSKESTUVeaihXMql7210XlzBxgOY68fibt7V
	abeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767784112; x=1767870512; bh=qnQYGjAgRpVgiP7+wC4gabesAkm1
	3ElvQ/NZ3nG3YPk=; b=WB4V1cge4aH0ONtAG53nwtASDY1UJQPdtU8cA8qCNMJ+
	d9xPfNWdUCMWH5hKwrv+TEbwLLfRsg0tww9SpuhkFuIZXWcrsbvz9k5RJxEa5ksA
	COaCa6DEHcKRg8zfwKTsN+LvqfGFgKyzg43sSwh3kTtpd/KIaW82bVFiaaKGeHRz
	vBIZ/FaeS8teWydLJURqvwZ4fT41eBq1+QbuMV3Y16JWgGKYFOCg2a1iIaZEb4DY
	MO7wS097n+qjz4k68BLDaznfrTJLDdW5d7991Ecep57KKiSSYzKxGONmjgG1GnnH
	fPBMKtRoNjpMkbSiYYrdeGtZp0aE3i89Aa7OAcc7fg==
X-ME-Sender: <xms:sD5eaZK2ZY-TyWXbYJ7HY_Gclwtlu-Jufq8bI7hv74vVpSfLf0TZ3Q>
    <xme:sD5eabKHgTNrJXK1g97gRjDwFZ9rZIWbbO0TkmMIrzkq8cEN0T3UozQtNcqRnnWrH
    F3ZrCnnl1Rnzeo08lzX5dcz2oQSFiHXSrRCBB3hG_r_VE_UcV8j0Q>
X-ME-Received: <xmr:sD5eafWocfaJWFUuy_UOa8hAMEOsVVYVa2CiFoKhLwTsezcU3eeDo0c4GZsrxGavhtixjTpIedvII0aECzb6rt33Bdn1iG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddvleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepjeelteefleetkeduueefteffgeeltdeguefgve
    etteekveetieektdfftedtkefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:sD5eaVhX52u3ITbVE0v9iT-boT6I2-AkxjBx5EpQwMvOwEHOdZ7tDA>
    <xmx:sD5eaS--34hJTg2Zrgrd_oUieTnjXKz0aJXeu_w3thuoCXCzRao15g>
    <xmx:sD5eaXAfDv8tCbYhLw8uT5Y_bx_Eb_wYtD277zo2XfkmNJGspy4gdQ>
    <xmx:sD5eaXK1FkAcfRXJA65QXxVx4JzMBQaz84pN4cc70LGh39k_eaVb4g>
    <xmx:sD5eafvJM7zXf24eolOLKF2Z7EHOprIQAKNKBypRfrdYETpe17vyQgZA>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 06:08:31 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 07 Jan 2026 11:08:25 +0000
Subject: [PATCH] create-pull-request: Keep commit hash to be pulled in
 cover email
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-create-pr-v1-1-bf9a9c5eae06@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAKg+XmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNz3eSi1MSSVN2CIl3LxNRUsySLJBNj02QloPqCotS0zAqwWdGxtbU
 ApHdo71sAAAA=
X-Change-ID: 20260107-create-pr-9aee6b8b435c
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=qzFlHxJf41MhBIHqqwD7qAwqz9apJ7EdtXoJjAB6unQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTG2a3fLbzWPl37QtfkP7Jn+a3spK+EuzBe/HJ9WfSkU
 2pu2pnnO0pZGMS4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjCRtHxGhmlleYItWQq6fAtO
 3qvov///2BcOhezQK3+4/h+zVNW5+pHhf7rtPttj5adOzZqy2UiCgUN66Zo5j/umN8nff7J9cfY
 DLzYA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228990

The cover email mangling in create-pull-request was cutting off the
actual commit hash to be pulled, making it difficult to verify that the
changes a maintainer merges exactly match those intended by the pull
request author.

The extra lines we want to include are, for example from a recent
whinlatter stable branch PR:

    for you to fetch changes up to 6c4c6d39ea3202d756acc13f8ce81b114a468541:

      cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3da..5c4414ecd5f7 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

---
base-commit: 0ed4776533145c901611d7f4f942490e33481335
change-id: 20260107-create-pr-9aee6b8b435c

Best regards,
-- 
Paul Barker


