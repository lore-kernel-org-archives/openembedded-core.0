Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C43F506F6
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 14:59:35 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52748.1773673167775018995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 07:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=wV60QKVF;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Uf/y7Iim;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id D3690EC08E0;
	Mon, 16 Mar 2026 10:59:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 16 Mar 2026 10:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773673166; x=1773759566; bh=Pv
	qyGyXalawh6aVMPcNFZR3jYU0FDGPFlBceotzER6Y=; b=wV60QKVFoWcNKFjddL
	kp8a00loojF5uX0n3G+p9aRFah+A9RNhUOt2NlcyagZGuvkGNLIeRF1jvvzdCPbH
	ndvO5q7Z+LXIUlKd4A3XSuRBp/5VzqO53e8L+SCQPlYVfBmxnJg3T9NvbVmPg3dy
	0YzzJonSM0RPACaNjKs9Y5Kz6g90eHS6MmQysh0oEyP3YH2frY7i1bwUodDNc1HW
	L1KPQ8egS/+fQysQThGyBATmZBwETdyxQwO463EZWvYrGbuT6YobcqklFLxNwOGT
	ZJYfcAzVWL2MCgrKPsGUkKhXb3wx/kYAFuwD/oep9hf5JG6cWDf9dpVS5p0U6sEi
	U+zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773673166; x=1773759566; bh=PvqyGyXalawh6aVMPcNFZR3jYU0F
	DGPFlBceotzER6Y=; b=Uf/y7IimJD+nCHb84WzieJ3Vu1gtpBhUETrSHfZfBi4W
	E46bjdHhL98M5svekL+RnYDnFSSoJLouoXgJYhkXiU9LUrBA/mZ2/w8gq7y63cix
	NlueIcc1OQDe8xBPMebmhmSp+11V998k5Wd8vsXiI9fAr3aDAskw0SRaCn39GwKr
	RQNlKeuOX/Dn+XkVEi/cV/sF8PxdPNJg8Vek3tlmqqOa7x04HN7UAUNhXAfFvDeR
	NH4hdKgYpk1ZwJqAVMQZlAaBb7q58HtcWk52P6VjA9mP3pjofBcaRR8ibk9S7T76
	ziO8prg94KzNwUoOpPEv+lN6zgAaRAZB6y4EbuUjxw==
X-ME-Sender: <xms:zhq4aYzRAz7DkNfbYjwr0FiX_vWQUAeNp1PJmjPM4rqOpliWph5XZw>
    <xme:zhq4aSSgh0MzGhO38CZMmH7GZm8njc1POvOSHt-G4dOWJY0S2Sm_4CFSalaf2sExF
    zGrAzU88WF3NbntMieGG773bw335rFgOU86OKKc3UqTvZ2kG9N2y9Ii>
X-ME-Received: <xmr:zhq4aX99GKgaRQ59kx9HmufXQK689LGR_PED8o_oFprBhYMf3WJ3tgH9FebgZrEhFiSuQTAZbM6tDzcarP4f0z2wGMMMuxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleekieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepjeduueevffdtudejgeeiffduhfefgfdvheehtd
    duiefgjeelleelvddtkeeuhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:zhq4aRrSG44I5GKIOCTDXJncYkCfUXrlVZvj1Wo1waQwt3lAUXpxsQ>
    <xmx:zhq4aclOWqaI5_NF57j4Pvr7Qc8PIDeNQMTR-s_a8sPOX_ow14NfCg>
    <xmx:zhq4aQINIIQgqbL8L2MVg1O188WmbfVITC5J8uivLRD6T7Fe8DX7AA>
    <xmx:zhq4aZwIwqIbqQEHj1YzsadgF8d0OXneT8IDf9bppblHi8ABXo2GCA>
    <xmx:zhq4aZWv1IzE2n-nsyhMuCaW1JCWYmiP0jWM452KONc9EXWrdRRKX32x>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 10:59:26 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/2] Fix yocto-check-layer issues
Date: Mon, 16 Mar 2026 14:59:15 +0000
Message-Id: <20260316-fix-checklayer-v1-0-f3bcaa60e93c@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMauGkC/x2M0QpAQBAAf0X7bOvOSfgVeTh3i43QXonk320ep
 2bmgUTClKDNHhA6OfG+Kdg8gzD7bSLkqAyFKSrjbIUjXxhmCsvqbxKsqSmdGYfoBwsaHUJq/MO
 uf98P3lLOt2AAAAA=
X-Change-ID: 20260316-fix-checklayer-8e9430fbdab1
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=663; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=kaNBnXRJuf1/S2ayDxeeg6C58MCuuPQUucT3gOsHq38=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukDq7NchPtzT/jmjFYYlGnujUfLckQ/ktsQo+i5j+d
 QXzz/boKGVhEONikBVTZNnc8/X+015H3oyQWwowc1iZQIYwcHEKwEQsHjD8L33O1TOtccuuiNgD
 AcuUmOU2qN36rq3G+bxP9NBLnhXpUxj+6U9lS+1vU2h2nDPnvo8u/+H5W5gexShLmV7rPs8l89a
 DDQA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 14:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233255

Running yocto-check-layer against the core metadata showed a couple of
issues that are easy to fix.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Paul Barker (2):
      oeqa: manual: Add Upstream-Status to abat patch
      packagegroup-core-tools-profile: Avoid dependency on systemtap for loongarch64

 meta/lib/oeqa/manual/abat.patch                                    | 3 ++-
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)
---
base-commit: c1fb515f2a88fa0a0e95529afc07a99db001af0e
change-id: 20260316-fix-checklayer-8e9430fbdab1

Best regards,
-- 
Paul Barker


