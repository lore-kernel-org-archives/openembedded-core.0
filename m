Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF73DC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:56:16 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.8782.1645502175467547011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=MBzKv+mT;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C20F65C018D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:56:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 21 Feb 2022 22:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; bh=BDaLMiZhnhve0yjZ962gxW5UercXnZHAAr2ZYgUC5zg=; b=MBzKv
	+mTrP8j6XgKOWBdbMeSkIHhVABeqEGty9haq0KGqcinjXIBkhlWBArmF+4458fco
	CJy1cp92ajyPMrcfGbb2GXJ8zojeKKE0Go8vWqC7Di7Hwtxu8YvyU8NKqbAuku0+
	WgeuNwDi2NcKlQJ5bDF4rV8pGM9Q7667YzL9YojSFr2yH5u5ogPi2UV20YvqkcMW
	gLlYiM82NrHm4GkbfFo/eGPZb8wik1sQchgZdaQ9H/iVmkUsV8vNehIMpbIV4gzJ
	QajSGnmuogaFtBmfTx/ZY7w0hiK5H7Vm2bX36heAS1Iy1V5iTD5kXgrR+OtvdU33
	/zZ9YfCblsn8A8JGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=BDaLMiZhnhve0yjZ962gxW5UercXn
	ZHAAr2ZYgUC5zg=; b=E8w8ATyKpDj3Bbn/NO8aEOViMHndD2CZp0DOjrxU7C+gQ
	BDGzEVkyboTvTfS5jlGhYgHBhWvkPM9keob/ey+UQUecugrICdyt+oyE4EsCrIjS
	H56G/7uGL/VhQtZvMwbeZoVzjBgLaMKf0qN5sTSwDZl6v7qxDyUvwKWVYWCZCGLT
	BIZIzLoIqxqbk5auOGsH/t+sy5n6x140Vzj01Ji6+EhOwa0tD8iqmMNAJU/fInc3
	eSgiD/PAqztbYYqXFLZzuTPnx3OGLajkVplBFfya6QufLDhA0J2fGZEd8Exh+pZy
	iphbimTatHF5aJYuj7QueDKqHmqNuUJhHQntMomRQ==
X-ME-Sender: <xms:3l4UYnDn2XaO5OuBpuNJcfj2yI0YrDVmoGqsYvUzLn093vreK4bOlQ>
    <xme:3l4UYthG7CPlnDphGzHcuVOsHrRbzlh5RuzSeBdVzi7EE_F8NNP28eISvyIQ6RxaX
    ffqXTnG7JQbAsrs1w>
X-ME-Received: 
 <xmr:3l4UYimSwClj4VbXl-e2ig5_8J_Si_uY3SX-Phw6Rg6I7lskf5PxSKxZC6482qA7J8aGID6b3yVyxBPfeXzvnXXwES5cxAy4iVR4mLyuQy4-uAkB2pxliWNDcP9bJzMwfkD2znMy>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
    dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3l4UYpx9_lqJvXNlouXm_3uUW34CeGKW3sXY8uoti8VkDq-xGvdnMw>
    <xmx:3l4UYsRnSbNxDGievjCrCITx6EhsLweetHgUmncr3WA0Qs5a3oTqsw>
    <xmx:3l4UYsbiEWvWJK4ZVLcYeicCmS3T4wRy4qnqxrSxqX5t6cI7keaRXg>
    <xmx:3l4UYrN8cTbUVy4m8zADYJFOO0lZ3zDaOobftViRtwnKiTFJOmdazg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:56:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] meta-openembedded: Fix CARGO_BUILD_TARGET
Date: Tue, 22 Feb 2022 14:25:58 +1030
Message-Id: <20220222035558.463828-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:56:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162123

On modern Power systems `uname -m` yields 'ppc64le' but Rust knows the
architecture as 'powerpc64le'. Use RUST_HOST_SYS rather than HOST_SYS to
ensure we have the right arch name.

Change-Id: I63640e39d29a00c3101425213ba4b1d248ac9ace
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/classes/pyo3.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/classes/pyo3.bbclass b/meta-python/classes/pyo3.bbclass
index 6ce21329c2ef..c2e8e7b385c0 100644
--- a/meta-python/classes/pyo3.bbclass
+++ b/meta-python/classes/pyo3.bbclass
@@ -3,12 +3,12 @@
 # and setuptools_rust properly set up the environment for cross compilation
 #
 
-inherit cargo python3-dir siteinfo
+inherit cargo python3-dir siteinfo rust-common
 
 export PYO3_CROSS="1"
 export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
 export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
-export CARGO_BUILD_TARGET="${HOST_SYS}"
+export CARGO_BUILD_TARGET="${RUST_HOST_SYS}"
 export RUSTFLAGS
 export PYO3_PYTHON="${PYTHON}"
 export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
-- 
2.32.0


