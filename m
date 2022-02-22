Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73049C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:57 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.8763.1645501976605642768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=jbQEiddA;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id EA6C55C010E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Feb 2022 22:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=ynByY8P1DN/Zjsf5CH5Z9pp6IVOvLW
	4pbIpsqlN9EU4=; b=jbQEiddAdQUBINYKE/xSgoD7yaoG02EH9H6N+Loz42b4XS
	qbQPWeblUg+PxyAyDZMgv3xkPKLFIo7LLmm2nCiLrf1BjIpqN4UCU8doreAgsk8s
	4X92TzJx7MAVQyWQbXEDhyvSFwEGQx4yQOIKYbRU9WMahsjzGrfHetZT1Yclq3e5
	pgYmtXHMh0/s4ercarByxeh1gVMh8ibRUYx/Hru31wpnLeJS2lCmgF3zNvm6Bm3h
	hdXT6JoGYI96Yd4xkEcNGjTE1LDuWsHmW1niA/U3KkKD5ZWt/dStc945/TZ8PSfI
	rE0nMfxlnXmJVM/CSQbdvvST6OxXLyaTrw9Erh7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ynByY8
	P1DN/Zjsf5CH5Z9pp6IVOvLW4pbIpsqlN9EU4=; b=W/WopTpMJILIqVSqRzPaJ5
	x+zaSXvYTicO/9ICsLcwgLpaPUzmdHjly3bREvq5V8OWlCQ1nF386toBByobybH4
	h3CWbUfPrFnIhDLX1cEoW3hP9OKYRha+XWXMpOWcD5n1jLJgFNDN65/atYTHTJfF
	XkZCaCrEmEs5NHxswvqEhzvf2gFdZmgtqQ09PzBl5boIl+dZk+k/hyrHKa3/xRO7
	uRpfMAOeTPu6go6EtAsEddFBg3yXe4vfucR55Qwfuo6PdkDsIzp0d4blHUCfoj2t
	9U4NIW6Olxeya3Umw+7y2gFCZ1aBbBeMfvi/p+IF1lJq4k3P5KPDq/DRrx53mfWw
	==
X-ME-Sender: <xms:F14UYpWOCIo8tfVvQdMKFOp3EJVuB3E2N10L7bLt00s8VmE9R8Gviw>
    <xme:F14UYpmvEGUBhUw6ehq1d_D8aPfMOpihauLeWRgz8rbmAu9bOS_k8RIsoq33yQpjf
    VLwN0G07gbcv8ZCxg>
X-ME-Received: 
 <xmr:F14UYlaSSozdN_KE2VUSW_XiD8EWo1lfbqVjQup2ETFnwSseVglXHPxfDvEwfoFmcSV1Xm8XNDOlM7GiIoOP8qlMAFx7s0njvuztdvOsB6oj_ao61kz5KySZhZnI5e6_lthBzEFl>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeelffdvgfehleetlefgheefgeefhfduue
    ekgedvveffuddtudeivefftedvueduueenucffohhmrghinheprhhushhtqdhlrghnghdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:F14UYsX-ZHtLqif0RM35kQXmghEJBWfVvcaqQAMcQKX0Vpk4ivWT7A>
    <xmx:F14UYjk8xTbdtChU-Qqs2HgcY-El8z6K1j-YwBEbNZE-YHvihwlq-Q>
    <xmx:F14UYpd2iPl_USPCxMkPuBh_cgUPTKInadfW1NNe0QefMhr3UXyLzA>
    <xmx:F14UYpTcFzxj1Af8LuvDHCymiTY_gg_KJqQuWK7VvnnE7fHOoDzP5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:54 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 7/8] rust: Add snapshot checksums for powerpc64le
Date: Tue, 22 Feb 2022 14:22:33 +1030
Message-Id: <20220222035234.463162-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162121

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/recipes-devtools/rust/rust-snapshot.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 74b558262f62..d6ffe92d07ee 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -14,6 +14,10 @@ SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3618da916a0f92f241cf1d67d04bb578
 SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6df36990953c1670c6a5676bc12d4cb"
 SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
 
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "fc07eb3e9f3d227428cc5b53ca868e3de375bc198ce4dce7b87a9246e6fec81a"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f43cb99109c3438c77c7079cdce4673df3320e310158e0b4d949c1babc4300fc"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "599cf1b5a8cdbf76d591621bc9222aefa60e2f5fd378ae71c4dcf4514c47122e"
+
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
     https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-- 
2.32.0


