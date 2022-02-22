Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683B8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:59 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.8810.1645501978049869275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=conNEolJ;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 63BD95C010E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Feb 2022 22:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=7zhbA8vxaWnKtdp4NeABdSdo2wCRBU
	9kSTvlVdGyVDk=; b=conNEolJmWT97JlK1WAUHa9qNC2mgUn1rez7iaPEDDoCwI
	dUVySL94MuPi7wqokrUVoDfP18rrBmwnS175TL12ZcvIk9gEhC+3tkGRYvmSw/DM
	/ic2wxzd2n8MVJ1af5QP83A/pC8/YV63nL88BLxrJWDSX9mHHb3Vunti2yQDmpk6
	t+FgjhvCcOShzR0DQ/tmv22V8bdw/jX64Pc27mflxU+WhBltrH9PGYhKdSrPl0eP
	ax6ybe1tjvlcvg+JGcdHmXOf4RYN6TKwgUa//tbOAAkR5G7K+G64Kyugt9/ssAAC
	d+iJtBlIrQo2/R5JNi0RgalVlROT9NT7q35uU/kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7zhbA8
	vxaWnKtdp4NeABdSdo2wCRBU9kSTvlVdGyVDk=; b=B+Hk7LhqaPECQNhpUIr0wA
	z6u35xJTpwFq1xnlfBOs9dFJgw66YJJQrtsmwdb4mfsU4mvdpPgdN7wmBlwpTPuN
	/3Rm6zpKyPkeg2sew+M1VDdvzbZW504G6v3iNIREKYyoF7mTtnLa7A0DW1VoLvR+
	4L9/6z49bdAK8D8FDVMiMZdu1/1Infajwbs9qIOCfLy9uPq57/0k8dOQrsbXERhr
	LcPmASkgANMZ9+ygzUiJqsp5DR9WaAgak/v48rZT0WZ6URzOYRuPE4buBGHLVlBc
	SQnjqGHsMCYvjdfFvfqlJQOAergv9NDtCvx35VCstuJUTaOPoJBxHzO4xqFyvR1A
	==
X-ME-Sender: <xms:GV4UYq7sg8-LRqQICxcAqHvIF81PSkGYS0-Kf_cGCUcbVXOsM84Smg>
    <xme:GV4UYj42Lj7sB6BtTOwXQwoZ1OmmI7GGITaR6YWQ61Oilud_QjhcKJLsC2gpD_OwM
    Bji7t0ucsEs2pvVRg>
X-ME-Received: 
 <xmr:GV4UYpck8brUnWyrC3FPCC6zgMe5kgzEV6DOi5il5RzUEDaG8n2QaWFmmbj2nvIzVVJaXBMtIbhM3C7iHcj5k1JOl3OZzixM8DQ8AGQIbTv_hjbAzh3tt6NoQ9RoCazQRxe5EA4L>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeelffdvgfehleetlefgheefgeefhfduue
    ekgedvveffuddtudeivefftedvueduueenucffohhmrghinheprhhushhtqdhlrghnghdr
    ohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GV4UYnKqozHUmGzONSFHMorKPxBdNgT0_2NOpiuEp9_4yp4lpRHrEg>
    <xmx:GV4UYuLCLWemmKubcGWkbvXQAG9-nZsMc4HK6OQQv8_aYcc3L3iH-Q>
    <xmx:GV4UYoyi0TAHRt9LIv78gcM1Pwi7knfhCZiyVV8CD5z7iOFVaIugeQ>
    <xmx:GV4UYtmyX4D01GQP-kJSGsLZTqf7J5b29BUTdMSTaUpInIiAqDi-mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:56 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 8/8] rust: Introduce RUST_BUILD_ARCH
Date: Tue, 22 Feb 2022 14:22:34 +1030
Message-Id: <20220222035234.463162-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162122

On modern Power systems `uname -m` yields 'ppc64le' while the toolchain
knows the architecture as 'powerpc64le'. Provide a mapping from one to
the other to download the correct snapshot artifacts.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/rust-common.bbclass             |  3 +++
 meta/recipes-devtools/rust/rust-snapshot.inc | 12 ++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 58ece01097c8..2ee7e178e536 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -107,6 +107,9 @@ def rust_base_triple(d, thing):
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
     return arch + vendor + '-' + os + libc
 
+# In some cases uname and the toolchain differ on their idea of the arch name
+RUST_BUILD_ARCH = "${@arch_to_rust_arch(d.getVar('BUILD_ARCH'))}"
+
 # Naming explanation
 # Yocto
 # - BUILD_SYS - Yocto triple of the build environment
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index d6ffe92d07ee..d0c05aec7866 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -19,11 +19,11 @@ SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f43cb99109c3438c77c7079cdce4673
 SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "599cf1b5a8cdbf76d591621bc9222aefa60e2f5fd378ae71c4dcf4514c47122e"
 
 SRC_URI += " \
-    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
-    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
+    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
 "
 
-RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
-CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
+RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-- 
2.32.0


