Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68532C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:50 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.8761.1645501969322530640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=IcmJ9Mxi;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A54585C0183
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Feb 2022 22:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=v9xxZpHREzTfywtbVZhMBmie79KTrV
	+rWavI2EkcXW4=; b=IcmJ9Mxig7jib2P9lgLPN5kcbMYVOKEPH9jbkkRM+XToWU
	MTXt3Txr+nXISfSj6vIBRhQtmdH4Pew5m3OzRr1N5aYczot3Wvm3NmhQf2Hmrf7m
	Wf2+aVEF+XzZExzaxzBM19kJrC4WkTO19RLWyPGYnFQHi8wBRo4I05sDBKFDachl
	+xd64IdfVX/3hWe19CzX1tWSn0sOuOCYIs5XqYt35oK/u+vDOx8H2LkX41fTzjAN
	EaLPSqrFaW2MIpuE9RsJA1mbng8R3zYGqazYGLQzjW6dH3q9ZQkxyVpq9pIM3nV+
	2DZrcqUJx5N92Xw+yUaRSoxipFqmfVk363ArRhVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=v9xxZp
	HREzTfywtbVZhMBmie79KTrV+rWavI2EkcXW4=; b=fb1nfXFsgq6TLMZpFBhL57
	fBC2ov1C/mtZEeJhVCTv9QAL2Ccd0aArdpZpdaOuC/bgaXcsemlZ7krEXmuQNBB5
	HEhTihUsFdEPOcfJeAs3r1nJ+ylzSHZOlRCOqjoXydcLlQRktdcXtDCR2liLL94Y
	Xgo9bn+4jEkEIMFLhGhYVvAVtsHImIZSuxgnxt/5m7m5PThLjF9j6QZyk8nTTJwz
	VdadCQUyHpjcPP02PbJbKDFEFBaLPISyTRectPf2NlG5GkjNzBnqZjaDC77knE3l
	lYoE2djgTD/dNE+ABkPWwfGwEG2zxmEqHWq3ychM/+APXdzoJJqy+m9yuk+hJp7A
	==
X-ME-Sender: <xms:EF4UYkPX2sEw7edW6W8e4A6TCg-XNcgF77sxiKHhQUCmk6InYC5SsA>
    <xme:EF4UYq_1TfsMSN4W1ldS9TNcDBSzcHxN1yYp8lDhPO8NNeBuibdh3cNIrWkfwd667
    -jGmrdCVHJwc3hQ7A>
X-ME-Received: 
 <xmr:EF4UYrQtoUEwsi6SADcOuwIgSbjMIrDY6a4hvXfYQ_qITPz5v5LmqX-ZcI2_I8w940pFzk458N3r8pGKrM1Pf4PnouOOfweAn5xCL2N-1IUiaL4erWkZUpi9kXfDC34q-oAUidOV>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:EF4UYsuZgz9VIqgjoaL_8YtTDm08nJZWwM1npjxiZvYb9_MitVe9dQ>
    <xmx:EF4UYsehnFTUdVxSl92yKFewNirX_nPhL8HVoGQHLteeBlpvnx0eCg>
    <xmx:EF4UYg1IZPaNULBmxeQmF2bU5CZSJ-QlGjslFuds6Kwh0qHBcJtUhg>
    <xmx:EF4UYmqPs3NdGMi8OLolz_gH8c7eyfP1PnPwhWJG9Q1fPgpNKvSnMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:47 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/8] rust: Rename arch_to_rust_target_arch() for
 generality
Date: Tue, 22 Feb 2022 14:22:28 +1030
Message-Id: <20220222035234.463162-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162116

It's not just for translating TARGET names, but any of BUILD, HOST or
TARGET.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/rust-common.bbclass           | 2 +-
 meta/recipes-devtools/rust/rust-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 2f2a31867ad0..e50d606ce26f 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -2,7 +2,7 @@ inherit python3native
 
 # Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
 # rust's internals won't choke on.
-def arch_to_rust_target_arch(arch):
+def arch_to_rust_arch(arch):
     if arch == "i586" or arch == "i686":
         return "x86"
     elif arch == "mipsel":
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 742933f1bd22..c36d836fcf41 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -313,7 +313,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
-    tspec['arch'] = arch_to_rust_target_arch(arch)
+    tspec['arch'] = arch_to_rust_arch(arch)
     tspec['os'] = "linux"
     if "musl" in tspec['llvm-target']:
         tspec['env'] = "musl"
-- 
2.32.0


