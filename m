Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728D6C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:54 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.8808.1645501973685192048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=w0+Q6S+P;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0AB785C019A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 21 Feb 2022 22:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=ZFa+wXhP3MbLHQw+z5VIGSTuI0Lxfk
	/Q+Vk8CWHbtWs=; b=w0+Q6S+PeHBaZnX9+NOmdQDwtad0ZvZG7WIXyPl9h9zVFH
	nGylt0H71/HgcBbAfbc6J7J+nZJxb1iLCxxJSeYR7jyIPW5y5kyHFuTSxA9M1XAP
	qodgesXPmWLkt09zwkhemBkM9yW2tkBYTY4KLt7x0TgdiK/OLd2fpZefFWEgzS51
	Uy38lJLR/b7a2nF9ChAvP49eCh8BEAN2zY4MdYacC9tHgWfMOCfKoS9iZSrzsdYs
	mdTFPI3rx/2wLt9zx4CHpCeH4PKFnRGweX6EGSzi5X5iGhNHLGOqbNkjNYb7C2TG
	O7Blsoz+47gm31GN4LSAP8a0pBYw9/mmOm1xFSTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZFa+wX
	hP3MbLHQw+z5VIGSTuI0Lxfk/Q+Vk8CWHbtWs=; b=OWd0uDHA7qUR3NjDkhmI1M
	yJ2Oo+zixmiojkrXnEN5fB9ubCpgIV4fJUKPC4XbB2e1xAao/MC9xXsJK/gsfb9U
	mj+kl0epHtVbZ3zdChUcXnE0043DELP0EoxGvTm97ukKQst3QevU0RS1IRPyKbs1
	fW74gSballArp/wgIMXvYZSYmPPRzsosQrw0cHpxwsWWUaSPr3RJ1FkYDAQKkO5z
	asKEBkD62dt/UhvXPsMphJld8CLfJj7A0uPmHAxHJVN2Cnj+i8DgTNVYkfVWJ0cG
	aa2YxMs85LQgcS+T9H71L1toawwrs5pCsHVNWAQ+Ptf9EXjvpiM+fU/AWmuD4kCw
	==
X-ME-Sender: <xms:FF4UYj6g5IJR-dkQsm7tF0VPXqCA3OsJh1K-SQONubadTiZRF2Et0Q>
    <xme:FF4UYo4KbujA06Faf8qoUmDAgU4lbwTzNjTFSeukIlXDOhmGS2buSPkXS-d9NTco9
    7TF-CGnIrZn_4K2SA>
X-ME-Received: 
 <xmr:FF4UYqdqnqof8HMo-0S6fJJtmSZo5LRzRFKufqfba8A0XmIvVGhxjnOVz-nhjszUwD51fltAi0xk06mqbDlDd-ol8AFq8WemSAR1z86ph6EnxgTqYJefHbc0hSHsYGhgjMhnThMx>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:FF4UYkLfHGKaNdSsSjK8CTdZuhPDJgcaL-r7_AZI38AP3rQHVPxjQA>
    <xmx:FF4UYnIf_P-ywE8jfk5xnhPxE83Mdlp55IFzxKdCs4y7CHkbBjjDQw>
    <xmx:FF4UYtxrmNzRCFWdSscCoMicuPnTIhda2Lji0X56NH0ZcO0PTW1nZw>
    <xmx:FV4UYinBB3eh5I7umT8UaEtr8AyJdPfalpqrZ_hzdulhPjTbuUJjjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:51 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 5/8] rust: libstd-rs: Install deps under
 {RUST_,}TARGET_SYS mismatch
Date: Tue, 22 Feb 2022 14:22:31 +1030
Message-Id: <20220222035234.463162-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162119

The architecture mangling gets a bit too much here. Use globs to paper
over the problem.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/recipes-devtools/rust/libstd-rs.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index 987956344a24..e94fb8d5612e 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -35,6 +35,14 @@ do_install () {
     # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
     # files that get installed. Those are really only needed to incrementally rebuild the libstd library
     # itself and don't need to be installed.
-    rm -f ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+    #
+    # ${B} contains two directories, one for the target architecture and one for the build mode
+    # (e.g. "release"). In some cases (e.g. ARMv7) the build directory matches neither ${TARGET_SYS}
+    # (due to "unknown" vendor from rust_base_triple()) nor ${RUST_TARGET_SYS} (due to architecture
+    # name mangling in rust_base_triple()). Further, rust_base_triple() always assumes a linux
+    # OS, so exploit both "unknown" and "linux" in a triple glob to select the right source
+    # directory.
+    DEPS=${B}/*-unknown-linux-*/${BUILD_DIR}/deps
+    rm -f ${DEPS}/*.d
+    cp ${DEPS}/* ${D}${rustlibdir}
 }
-- 
2.32.0


