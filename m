Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673DCC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:51 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.8752.1645501970765039930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=Cj7kqf+d;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 1DCAB5C010E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 21 Feb 2022 22:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=miJN5OFLrY440gU7TyKuAbytf/Gr2C
	0onaoTqg5no1E=; b=Cj7kqf+dcn/lKguZLtS5Uvm8uztv4MuxM36ogLg7ug8wT8
	pwGB2H5Zinh1XLl1j0/Lq/e6adi8LzGsbTAguMR88Batm6nJpITy//zW1O7SBJT3
	/lfSH5WUgUDR5Z+Cq/Qn/lSLh0f/qu6P29U82/GzwfycdQE8R6bkhhYS2dB2nith
	mM0mT6KUOJoEGOMYY4C0qWBUmR1gz6liQ7Y7bROUjdBenorNAn8b7T/vIfnvJX74
	wuIRhCWIXAZDMin7rzpTngzSWsKqXJrQ0wytVZ879+oxNgtSZiDK2uKkJ6FzuP1X
	E/JO4taIfp9Uz4kwNVJV/q1RqoSTHymm3oQquJ7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=miJN5O
	FLrY440gU7TyKuAbytf/Gr2C0onaoTqg5no1E=; b=kIh073V33hbF/PVULNxr94
	6VzzzuB5n4yxFUnk2fwv86pHA2+ttpr4jQx0xEHGDzM6jW+dKxevzLdIHGJnE/1h
	QyNDdKdMNiMNuv6LUL7ynrENGec+v9OJIORkgWZJ7xWBznUtVroHwqPGQu5xCGOC
	6ccFQeb2aahJA1c9g/hD7SsuN4UKM9W1ibUu7GrB8kFgxL6MTv/tlaWHqhWOBRzR
	uCdBzPyypNc7xbaZZ5mLUn6gXExG0Dut2WrKSW1QXlv7mcRKX3VlTIndGQTECeWv
	v3YYPAFb8pXdx2MOTamRLkkvc/4Jq8LNHMmKw5G0hdTtkCOUxyAipsuzRW/ZXczA
	==
X-ME-Sender: <xms:EV4UYkPCD35rwHJPv7dQA4R6N_zaf2ntpAkP_AijiPDNSPJyQM9fhg>
    <xme:EV4UYq8E-Ex_UtCaM6jwycWNfhAd5Utw8QybdlLPBDmrRa1Qb7pZ5WeRAlRppjRTy
    -f0Ob5ZPbDzC5lEtQ>
X-ME-Received: 
 <xmr:EV4UYrSQg6SppT0RtkN4AHLgdRftMWeDrCEB78xsc-sJqPH9EPvhc7R79gwT5Nk96r_aIx3_rGbXbxNQdqYjKwUUl22kSlKObnnkg1c4CrpZNbKFrG1E9XnpDbPw20E7Wbxl21XL>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:EV4UYsvA2QL7Ld0zTDOmwnM15cvkc4lRban7-DzAgUcmpgr9fTvQQw>
    <xmx:EV4UYsc8VdsuD1HuAzh-_PgjlC_esJlL4p4LtfaaJ9MJ4DN1EU7ktw>
    <xmx:EV4UYg1HQBInOcqbGxOksNzRaK8H_dyVw63yxb0tfjX0IaNa_v94Bw>
    <xmx:El4UYmp-8MRebEgO5iwkg8IvZTWtL9thvPHrw4-VTwjtf_vjsyKh-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:48 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 3/8] rust: Handle Power arch variants in
 arch_to_rust_arch()
Date: Tue, 22 Feb 2022 14:22:29 +1030
Message-Id: <20220222035234.463162-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162117

Modern Power ecosystems can be either BE or LE, so handle both. Further,
rust understands these as "powerpc64" and "powerpc64le" respectively.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/rust-common.bbclass           | 4 +++-
 meta/recipes-devtools/rust/rust-common.inc | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index e50d606ce26f..3c7d133f0445 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -11,8 +11,10 @@ def arch_to_rust_arch(arch):
         return "mips64"
     elif arch == "armv7":
         return "arm"
-    elif arch == "powerpc64le":
+    elif arch == "ppc64":
         return "powerpc64"
+    elif arch == "ppc64le":
+        return "powerpc64le"
     else:
         return arch
 
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index c36d836fcf41..4b758260d276 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -265,7 +265,8 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
+    trans['powerpc64'] = "powerpc"
+    trans['powerpc64le'] = "powerpc"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
-- 
2.32.0


