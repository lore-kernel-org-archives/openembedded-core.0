Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42F4CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 16:43:36 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.web10.38134.1761583408475478162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 09:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=e1PuPv3N;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=axqznspI;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.154, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BB4FA1400197;
	Mon, 27 Oct 2025 12:43:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 27 Oct 2025 12:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1761583407; x=1761669807; bh=6z353+fUYF
	gl7AhnYKDoLgir7bRj1MHYQVqLi7oxnzI=; b=e1PuPv3Ndkr6WzjkbbA+cT+K3J
	2FBioDUk/DL/SGDB6jmYsUu8E2nz1u8DGDSCDuFpNH4SdFtkKttC9vbt7qQgnSAl
	Nv2hQrEd1Z+ndfOI8070RjOL/2HAvSswBVGCEFRiAWEI/L1XT1dpvLob40pERJiz
	xECkBppGBZXDpqJE//REpFbRpFlyj7fMTa2Hcuk5z9popIg8TYjTYfagm0G9Vcjw
	MNukf461h44avertFW9WZN9EpHknEU7WZRRcm8JafR0BFT8mI/ZrlJAxuVBq58kD
	JgqddGC+rMNpFYKsL4ewnXd3Ds53ar2/L6g7bIe6OSIlctNoobnQzNHooEaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1761583407; x=1761669807; bh=6z353+fUYFgl7AhnYKDoLgir7bRj1MHYQVq
	Li7oxnzI=; b=axqznspIhY5rp5KKNATGfgFTHg8pbSQG3O2I2BAgan7qZfjtG8V
	9ncNZxl5MWSQuhS7ri8Wy9MG3+nW9MZG/xVzPWcpP2RJ2EPCeKPu5pkoAExBd7Rs
	Evuc692P4jH1qHi1ZTram8dNr4P8EGyEKebrCJ00wH7I9oUN4dtex5usTcNjIA2s
	bbAFIFPgzI5DUAbbMq+cmirZMvAYALD6fOx315t5pfxEj8scGLk2FQ+XrzJwNC2w
	mX52KWOVG8BI3Q+vOcsJuwT9ON0vrai1zPYPDRR9G3C75gqSe417rdsllOx3av4t
	BUAeB9rbZqqXDrWAo4n2EpQeeIxLcG6S87w==
X-ME-Sender: <xms:L6H_aKTTKar7InHlpxz7ZUinF6zwQcZcYGhqclzpW9WgRw4S9u_U2w>
    <xme:L6H_aFwUuDNHrImHnqEbvZuD3AWccdITGKcGJ22gqBf6sB634aVtKcfGeKPutqIve
    Yyu49GQUbfqj9_8ImkHg4k8caARRKWWIdCDwxZK3_eVwKxDyy5xrQ>
X-ME-Received: <xmr:L6H_aFdJxCgeLvDF22Y18AqQhVVSJW6WwMOFvbmi54IdM1VHsLTNYzi_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheekgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeghrghlthgvrhcuhggvrhhnvghrucfuvefjpffgkfffgfftuceotgho
    nhhtrggtthesshgthhhnfigrlhhtvghrrdgvuheqnecuggftrfgrthhtvghrnhepgfevje
    etveeiieekgeettdfgkedthfffkedtudelveekgeektdffveefvdffieeknecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggtthessh
    gthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdroh
    hpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheptghonhhtrggtthesshgthhhn
    figrlhhtvghrrdgvuh
X-ME-Proxy: <xmx:L6H_aBKthetQZZqlDTXA4tUIA1JGZy9ZrS6Oz29-dEQ1ImRBWg99NA>
    <xmx:L6H_aGFax3O-ghZwz3Qnd2Jrbyl61Rso0ziG2PPfq_s0_aELTL66IA>
    <xmx:L6H_aLqMGHQjATV5O5YZ30yiv-gbh2DEk6cJi7ZCJkc6thBsgKfYRw>
    <xmx:L6H_aPS5718c-_5ZAY1ZnU7VnhEr8DkJAeu9kELHUUKhpv5N8a8UsQ>
    <xmx:L6H_aIXxtxT3EXiWsjegl8MclLdhbz8HFZ7qpJ_B5JeXI0wpi1vvTkQn>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Oct 2025 12:43:21 -0400 (EDT)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: openembedded-core@lists.openembedded.org
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>
Subject: [PATCH] core-image-weston: Add wayland as required feature.
Date: Mon, 27 Oct 2025 18:42:28 +0200
Message-ID: <20251027164236.2324092-1-contact@schnwalter.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 16:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225338

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
 meta/recipes-graphics/images/core-image-weston.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 62305cc1ce..96d9c34bfa 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -4,9 +4,11 @@ IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs weston
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image features_check
 
 CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
 
 QB_MEM = "-m 512"
+
+REQUIRED_DISTRO_FEATURES = "wayland"

