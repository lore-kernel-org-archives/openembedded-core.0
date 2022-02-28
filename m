Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D774C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:40:06 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web09.20617.1646059205059882927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=d6uCOG8r;
 spf=pass (domain: aj.id.au, ip: 66.111.4.27, mailfrom: andrew@aj.id.au)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6EEFD5C02F7;
	Mon, 28 Feb 2022 09:40:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 28 Feb 2022 09:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=8wuf5eQhpE/JnLyz33TWeVvk+OQLd5
	yzdOCeF7ZF5cY=; b=d6uCOG8r/p/LBME9Dl+I38mGTwdkFr3VfdqVrXGSMPIJXW
	gXAH9tHYAX72pAYwx2tHabGM79ehypKVAuN+z1moD8MppTcKvEjHOeokAyASnBv+
	qpJYrpT5JKPSZPSZXtQ1ecFEEJFA1qKSoHSOyZOcR0d+0prO0KYBM0rD46YZeK6M
	KCL5ExpRFwtGyp+DP+QG9sKu038XFAbKY5XoCPAOAzzAztedHhoCrPLR5GX6I9UP
	+Bg7euF3ZgbTDqja4FdcbZCLkQ+HU36gzXkPxwgjFqo/jDdFSUZZI+DeZLBVAMBj
	9nrSTdm49w0CsTpmnfHxMCGQMyq598LRM5VqfTYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8wuf5e
	QhpE/JnLyz33TWeVvk+OQLd5yzdOCeF7ZF5cY=; b=gTLEKqZSNjiWiJKgop4b+T
	mv1k3M2ebzYiBLGuSn1d7c39IwwbDGBp3lUKyMcvWthUCAZhIrlEt2pqBZ9oqGXl
	sYVNgHwbXOrWTW2El1Us0/2wQLtP/97hNvg//uSHKcOVX6085F+cV2mQdLVsovLY
	EtLQ/L8xQKiEZ9m2lxUhDtA30vWE409Y6N7csuQ+sAnyuHZl2uW/20DveMhmKeF9
	3a365+LpfpkW24t//2aOTzafNsWuChyYFg+7sVSreDzcLFh3FHkagJElldzRfb49
	JpEcdUNthPVBvOV1fcpe413kNXIzR08jjC4h6foWRRXxgCHHNpOV/r218g/4w3CA
	==
X-ME-Sender: <xms:xN4cYgzSSALV9Vwx1kf-Hpl-bydIUZEMuzPfNxt-weFpCbQMTB_25A>
    <xme:xN4cYkRTvrjq9YDKerN19cFOCuQQQx5gHWbEyAxTpFEpnkejGfLMcLKdfUVLW1poM
    hhqHy9s5vKdEBYh3A>
X-ME-Received: 
 <xmr:xN4cYiXk6FnaL3JIugc8eThFvxENaBKPGUdE2t_yfDsshUqcCjG3D2j-n9UuC4lQ9ckWICUJ7jt1Dty3HkAkEqmLsoXGKnpdolaB4ztTEB3KzvO5IyswCLTk6Weg1AkS>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepleffvdfgheelteelgfehfeegfefhud
    eukeegvdevffdutdduieevffetvdeuudeunecuffhomhgrihhnpehruhhsthdqlhgrnhhg
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:xN4cYujNITKJwbSOmdyfbTmrwefIxbGqJPvGelS8bwQh0NxLoZg-nw>
    <xmx:xN4cYiDghvXK2KdBQKIWXQQNarHgr8grav8W2aZ_JrPpqouIChsmBg>
    <xmx:xN4cYvLJMJZUUrjwqt56FMxIdOAt47N1g5gNEtlEmHgkJYZ9A8Yszw>
    <xmx:xN4cYj6uHWu8iMbAgIQxAgEYIIoxnOps1AcVeRFF_P3LhpzEwGsb2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 09:40:02 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org
Subject: [PATCH v2 2/3] rust: Introduce RUST_BUILD_ARCH
Date: Tue,  1 Mar 2022 01:09:47 +1030
Message-Id: <20220228143948.50809-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220228143948.50809-1-andrew@aj.id.au>
References: <20220228143948.50809-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162503

RUST_BUILD_ARCH contains the arch_to_rust_arch()-translated value of
BUILD_ARCH. This is necessary to acquire the correct snapshot artifacts
under Linux where `uname -m` reports "ppc64le" rather than
"powerpc64le".

Change-Id: I6aec23aced8e1c6f0bfc46fe52531b0c16bcf687
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/rust-common.bbclass             |  4 ++++
 meta/recipes-devtools/rust/rust-snapshot.inc | 12 ++++++------
 meta/recipes-devtools/rust/rust.inc          |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 8cfe864ca3fd..65ad677499cb 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -89,6 +89,10 @@ def rust_base_triple(d, thing):
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
     return arch + vendor + '-' + os + libc
 
+
+# In some cases uname and the toolchain differ on their idea of the arch name
+RUST_BUILD_ARCH = "${@oe.rust.arch_to_rust_arch(d.getVar('BUILD_ARCH'))}"
+
 # Naming explanation
 # Yocto
 # - BUILD_SYS - Yocto triple of the build environment
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 74b558262f62..173648c889fb 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -15,11 +15,11 @@ SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6d
 SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
 
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
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 1d6f99afad31..f39228e3c08d 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -27,7 +27,7 @@ CARGO_DISABLE_BITBAKE_VENDORING = "1"
 
 # We can't use RUST_BUILD_SYS here because that may be "musl" if
 # TCLIBC="musl". Snapshots are always -unknown-linux-gnu
-SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
+SNAPSHOT_BUILD_SYS = "${RUST_BUILD_ARCH}-unknown-linux-gnu"
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
-- 
2.32.0


