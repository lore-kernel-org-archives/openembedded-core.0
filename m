Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50D1C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:05:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17898.1752656723480954207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pJrc1oMy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D95C442E77;
	Wed, 16 Jul 2025 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752656721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5lZ1BefO9TFSKFPpjmNSg+5MfU37mDZ+fOX0wFSMYsk=;
	b=pJrc1oMyhewIAxrfz+cS5DSLEEz8voR3ApEa+1GoTy5380uBwhIWly3VWw1SE4vIxfCi7b
	k+QLhrv9fgkErQ3Q4fBRgRjdVZ3cyIfls/TpHwfQG7R1v/mg1cpSH79rVVavLwJMKggSvf
	EbWxXBzbBVLPhdYMCVKLZBAAUm7zAUcIw9gI89/2hsA3MK0aIfx6Qq2vJwHKA1+IzrkWmK
	REaKHUoS5yTayuwFhbHDzTk1ya3A9ErCE8gGZLxetuPXNUcuCNsXkOd3/do3LR1moFnOKu
	TMLu5oA9FsOu4H2bi2g3ZpYGQ2xMswwl9VcifSSLXzSAqDz6Q5q/jQE8oiH3yQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 0/1] spdx3: Export kernel configuration as build parameters in SPDX output
Date: Wed, 16 Jul 2025 11:05:16 +0200
Message-ID: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffveduffejheeltdffheevgfefveeuledugeejvdfffffhuddutdekuddutdeinecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhou
 ggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220438

Enhances the SPDX 3.0 support in OpenEmbedded by ensuring that the kernel's build-time
configuration is captured and embedded in the generated SPDX metadata.

Recipes that provide "virtual/kernel" now have their '${B}/.config' file parsed, and each 'CONFIG_*'
entry is added to the SPDX document as a 'build_parameter'.

Including the kernel configuration in SPDX output is particularly relevant for compliance, security
auditing, and long-term maintenance, as it provides a machine-readable view of the exact kernel
features enabled or disabled at build time.

Potential future enhancements:

- Support parsing `CONFIG_FOO is not set` entries to document explicitly
  disabled kernel options for greater completeness.
- Optionally allow filtering or scoping of exported options (e.g., via
  'SPDX_KERNEL_CONFIG_FILTER') to limit output size or focus on security-relevant flags e.g.:

	# Only include a specific list of kernel config options in SPDX output
	SPDX_KERNEL_CONFIG_FILTER = "CONFIG_HARDENED_USERCOPY CONFIG_STACKPROTECTOR_STRONG CONFIG_SECURITY_SELINUX CONFIG_MODULE_SIG"

Feedback is welcome.

Greetings,
Kamel

Kamel Bouhara (1):
  spdx3: Add optional kernel configuration export to build_parameter for
    virtual/kernel

 meta/classes/create-spdx-3.0.bbclass |  6 ++++++
 meta/lib/oe/spdx30_tasks.py          | 32 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

--
2.43.0


