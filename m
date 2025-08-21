Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3270CA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:54:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.11722.1755788085316147911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SKZofyPv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67D4B43911;
	Thu, 21 Aug 2025 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755788083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=49Wgw/W0hNlMPa7ZKP27k1WXawwfXXJ1jtSN/eZBYdc=;
	b=SKZofyPvqc874CDMf5EwaZa/bifCq5Et+t2JBEgUHGothsXs4dvIh49xIZu6LI+ngnLqEq
	lFZqj0/UExukYNu/uO0cBSO5+HZJgm8AlUUN8ZNKVDoL2Hsn/OuFEJPCEJ52t5/i3+vWIt
	cPkkkbAk91tLGELjnBJkqKX/pEVUzqFq5Lltn6qaGWJYgMGyaGaR2XYQZUHa8b7lWa2aVC
	Mex4KNnZlU/MTjiHfDB4T+3ebunwfjpKyvdGkhVNGnBAdUvnwrI/hPGxPuBCfyG+QJFqL6
	8mHsOyboFiK30FrMwRsp6YBO/qMfaRl2hW39aumSkgqggsJv30ETlx3cBWe1mg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v3 0/2] spdx3: Add optional support for exporting
Date: Thu, 21 Aug 2025 16:54:34 +0200
Message-ID: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepmfgrmhgvlhcuuehouhhhrghrrgcuoehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhuefgteejvdefvdekvddvtdetudekkeetieeugfduueetvdejvedvieduhffhteenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeeltddrieefrddvtddvrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrieefrddvtddvrdegtddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrh
 ihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222245

Hi all,

This patch series introduces *optional* support for exporting
build-time configuration metadata into SPDX 3.0 documents.

The goal is to improve traceability and reproducibility in SPDX output,
particularly for security-critical settings.

The series adds support for two types of build metadata:

  1. Linux kernel configuration (.config)
     - Exported as a dedicated build_Build object
     - Each CONFIG_* line becomes a 'DictionaryEntry' in 'build_parameter'
     - Linked to the main recipe build using an 'ancestorOf' relationship
     - Controlled via 'SPDX_INCLUDE_KERNEL_CONFIG' (default: "0")

  2. PACKAGECONFIG feature set
     - Each PACKAGECONFIG feature is recorded as a DictionaryEntry
     - Captures whether a feature is enabled or disabled
     - Stored in the recipe's build_Build.build_parameter
     - Controlled via 'SPDX_INCLUDE_PACKAGECONFIG' (default: "0")

Both features are fully opt-in and have negligible runtime cost when
disabled.

This makes it easy for users to selectively enable metadata export only
when needed; for example, in CI pipelines, security audits, or diffing
builds for regressions.

As discussed in [1], the kernel's .config is a good candidate for
inclusion in SPDX.

The approach follows SPDX modeling by introducing a *separate build object*
for kernel configuration, avoiding overloading the meaning of the main
recipe build. This is linked via a 'ancestorOf' relationship to preserve
traceability.

Regarding PACKAGECONFIG values exported by SPDX_INCLUDE_BUILD_VARIABLES,
there are raw unevaluated strings and don’t show which features are
enabled/disabled.

Exporting each PACKAGECONFIG feature explicitly provides clear,
machine-readable data, which is especially useful for diffing builds.

While this doesn't aim to turn SPDX into a full build tracker, it *does*
provide a consistent, machine-readable way to surface relevant build
decisions in SBOMs already being generated.

This approach was validated internally to track hardening flags and
kernel changes.

[1] https://lists.openembedded.org/g/openembedded-core/message/220705

Kamel Bouhara (2):
  kernel.bbclass: Add task to export kernel configuration to SPDX
  spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX

 meta/classes-recipe/kernel.bbclass   | 63 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass | 11 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 +++++++++
 3 files changed, 94 insertions(+)

--
2.43.0


