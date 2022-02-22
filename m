Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B57C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:47 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.8806.1645501966410932484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=GF4tNx0G;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 76A725C010E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 21 Feb 2022 22:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; bh=iYQxFaqwyeAjitWwlVegxX6ru+LeFVBz9Qf0SLqkCHg=; b=GF4tN
	x0GUaOaOCNMPw9AQZvs+VMQQz279V/gqsw+jXVoiJ7Rb+goJKNZEOvAmq8TznWnD
	ddUCLuHHaOQFDBAZJakK7ZSRj17IFNWfdST0Vw5OspBI+QpFR9Yqms1y1QeNU25/
	Bh3cheBVW56vHGzQAFiKxLcDiGmSwScZhSyQcMN/l9QWNOg30j4ZXEokRugo2qho
	EUXVBzxr3Arxyx966KZ3A/HeZf/zyg0nnJ6O1tY4DhY3yMxtwmF74kc5Kap9Nosr
	yvfHd2Nio/8thJJjOnk2PXeQN/Biy7jCD7oXqelQxRbP8T6L6pIlvFwMJ0tdISAp
	bXLX8FAJBEjPcjhLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=iYQxFaqwyeAjitWwlVegxX6ru+LeF
	VBz9Qf0SLqkCHg=; b=b6o+APp+zvwjQySehLUtTubxyjv1FV+f8O3HpO8pxeiIy
	j03w/4tMiD7wCge0Xb6dsJjd+caorPLboZ64isW/WsFkOCsAzmF6c4hf1MT6QvsG
	aqPTKEj8YSitev5KLOW1i3/pOhnTZghe1+l5wzo120m1YHMZjQcqV+KFGhiUNWgQ
	csCNzSydSVbysbCQ1cuNIsRpRZ0JSX5QOm3Njs8qX7+HpacpnT6Gfob4fTCkWdQt
	dsAxnbcVT0KlaeBMSZRFrtsqYoHG/nZ7Sfaap5ed6QE3oyLAHFAJnYaSfLBZtA+w
	5Fqx5MCrELVsVZWUF3iJflSvAq82n5lpBadsSHRWw==
X-ME-Sender: <xms:DV4UYotCeQvB4WmFNBzk-qkBUG3q6mFqz5iEZw6GfFGbe9Z_0yZr0A>
    <xme:DV4UYldThP7JfZ2bcDpPJASM8HRSVSlYR5K4MKZUOgLsLeqPZj67IYiBdc8j7NGgM
    nswJxrLjJjPE_k0Jw>
X-ME-Received: 
 <xmr:DV4UYjz-y36Ej2fNuB6JEzAek60q2CmGyjfIkCncxdPsQtiIG2CFqr5b9nk2IhVfpN1D5Dd1Gg7gLxOACgXwLnVw6AWQ9XS8yzwnRWauFM_fiM9qeydmR_Jki38tPcX6X8zaNu2i>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeeiteehudevlefhvddvjeeluefhleetveehff
    fgiedtfeegkeejfeeivefgheehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DV4UYrOTeO_mpUVU0-RmZDYalumeMSSKOcxnrp_N2rqhmY4PGgdaPA>
    <xmx:DV4UYo95UerruPERkfA2ZGNbEso2fefkVU42EnTCPd_O4vWxe73nyA>
    <xmx:DV4UYjXYoYpJVEdMNSxjK_PVhjS-Olnz1PPT9332LDdgqEJgV6LIpA>
    <xmx:DV4UYhL6KIOLJdu5tQ16HpMtpyBB7wcvc7BleptkIIDcXP1l3BmgfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:44 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/8] rust: Fix powerpc64le support
Date: Tue, 22 Feb 2022 14:22:26 +1030
Message-Id: <20220222035234.463162-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162114

Hello,

This series was motivated by some CI failures we saw in OpenBMC on our
ppc64le build machines, driven by the python3-cryptography dependency of
the tpm2-pkcs11 package, pulled in via packagegroup-security-tpm2.

I previously sent an initial, wildly insufficient attempt that fixed the
immediate error of using a bad architecture name in the snapshot
download URLs:

https://lore.kernel.org/openembedded-core/20220218054315.169005-1-andrew@aj.id.au/

Khem was on the money with his query, and pulling that thread led
to this unwieldy series. Together these patches (plus another for
meta-openembedded to fix CARGO_BUILD_TARGET) result in a successful
`bitbake python3-cryptography` targetting an ARMv7 machine (an ASPEED
AST2600 BMC SoC) on ppc64le and x86-64.

Please treat the patches with suspicion, I really just slashed my way
through it all until the build didn't fail, then tried to clean the
result up into a series that might be reviewable. Hence RFC.

Anyway, please take a look!

Andrew

Andrew Jeffery (8):
  rust: Migrate arch_to_rust_target_arch() to rust-common class
  rust: Rename arch_to_rust_target_arch() for generality
  rust: Handle Power arch variants in arch_to_rust_arch()
  rust: Consistently use RUST_{BUILD,HOST,TARGET}_{ARCH,SYS}
  rust: libstd-rs: Install deps under {RUST_,}TARGET_SYS mismatch
  rust: Mitigate duplicate sections on matching architectures
  rust: Add snapshot checksums for powerpc64le
  rust: Introduce RUST_BUILD_ARCH

 meta/classes/cargo.bbclass                    |  4 +-
 meta/classes/cargo_common.bbclass             |  6 +--
 meta/classes/rust-common.bbclass              | 23 ++++++++++-
 meta/classes/rust.bbclass                     |  8 ++--
 meta/recipes-devtools/rust/libstd-rs.inc      | 12 +++++-
 meta/recipes-devtools/rust/rust-common.inc    | 29 ++++----------
 .../rust/rust-cross-canadian-common.inc       |  6 +--
 .../rust/rust-cross-canadian.inc              | 23 +++++------
 meta/recipes-devtools/rust/rust-cross.inc     |  2 +-
 meta/recipes-devtools/rust/rust-snapshot.inc  | 16 +++++---
 meta/recipes-devtools/rust/rust.inc           | 38 ++++++++++---------
 11 files changed, 96 insertions(+), 71 deletions(-)

-- 
2.32.0


