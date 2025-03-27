Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97558C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 13:17:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.49733.1743081433810678828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 06:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YXFsfOu4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBE9144100;
	Thu, 27 Mar 2025 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743081432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ry5UCmpqKMWbqZn/6RVKtewGC4xkx3ctCJtWFklZr30=;
	b=YXFsfOu4adP+QQkcwrqXHk0YdC/tTfSA1vp3t+IPWgekJCM17RqVmc2m0HJCYKwLVeGNRs
	ZGQNnr63QJd9MaZDlBhRoc/KZnElQHP/FdywHUeIOqTnmchb/BqzHDliF3C1ltXAeKv9UX
	/79JwF7t+TD1iG1sjuSpILkFzg3+DjLC5cr+5jbmtKZ2RVoaND3vMoM9GRrbXg8jFoK5DK
	4EJOUCFpJ9ISfPTC88NbexzrBwSOYZiJVCVt/E7fXktLvirq2p4c+lTHid9QpCQDFV8Aqb
	sI1usCG2gCDAoFC+6P8vkC6hK+nMG8mfYHQ9kJYMubANY6CqQWJKlTAU8QlKQA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Mar 2025 14:16:52 +0100
Subject: [PATCH] classes/spdx-*.bbclass: move spdx2 specific variables out
 of spdx-common class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-sdpx-relocate-variables-v1-1-cd8227bde515@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMNP5WcC/x3MwQpAQBCA4VfRnE2tlRavIofBLFNCM5KSd7c5f
 of/f8BYhQ3a7AHlS0z2LaHIMxgX2mZGmZLBO1+50ge06bhRed1HOhkvUqFhZcMYiJohRF8XDlJ
 9KEe5/3PXv+8HqrjYSWkAAAA=
X-Change-ID: 20250327-sdpx-relocate-variables-f7aa9b7f2810
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PZPKQ0xRJ6Tock9zl/DfIGR4u0+h5pTIcuS/Mtyu21U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5U/XLDPd/oHyu85SKVYB8ZsM1ZI8GEDyin84E
 IWFu745KNWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+VP1wAKCRDRgEFAKaOo
 NlLGD/9yPIbq3B7UEiPHxNV9oKOtWSGrF6piGruZkxmLTYjPb3jOqk7bnmTz8oXFYpXiWz4OePY
 ZuH4FBkqO9Rp0WN1YhK+2SoyAYzI8jz2mjrbOOYF/OAwiDx9YwvZdaED1Hjb7+vAx+1BeadOBLC
 YV0v1k0abG7aUQai8o5sA0AoS9Pi+/iQMFEd2rK6y1Fcyxrk7YlVnQE5oG5Z1Hph2RA4/QV8kZi
 yPHtXoyD56XxX6M5+v33yCMA4sxhM+SHs6ryomRwrT4hMEOa8RqighHP59S8i7fY93jrf7l8o0Q
 lWdIUZnWiZUeHS7nuxKYzvR9GGZCxIdTcvag1sem5DN8LudGdTv3SBiqI0QXfAqQMZ2Yxbr1Lmb
 AbohGaI1nBYZCDmNlEdh2MRcktssrpOpMdRMGICL+Ol78vRbxA0Gx3dcVCrWm0PqMeZGXt59MPb
 CH3tjlabpt2wgZc4rIz2CtgF3jGxmy8DNaOz1ctUNFqWRPCMoRW5KormlfCeyS3GZfNjtGyAcrC
 VPRVFqMM9d4TGiUBv+3xFrfydYec0/+T/7gWy1NI1zTgOloBa+seZAY6z9bz/L9yJS52KuwFioh
 Yp8QFu5gUwE0ZU2o53qdWgVlrNqLHyheZmJDxlvohRyospp4/AjCZznLnzLPUYgY956wVqNA8XW
 Hu/IwznO0KoSdXQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeileehjefhhfelleelvdfhkeefjefgvdduhfduvefgfeelhffhfeegkefgtdetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhsphgugidrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsv
 gguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213730

Setting SPDX_ARCHIVE_SOURCES and SPDX_ARCHIVE_PACKAGED makes no
difference when using the spdx-3.0 class. Move these two in the spdx-2.0
class since they are only used there.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: if these are planned to be used in the future for spdx3, please
let me know - I'm trying to clear things out in the documentation.
---
 meta/classes/create-spdx-2.2.bbclass | 2 ++
 meta/classes/spdx-common.bbclass     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index de62379c50..7e8f8b9ff5 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -15,6 +15,8 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
     is the contact information for the person or organization who is doing the \
     build."
 
+SPDX_ARCHIVE_SOURCES ??= "0"
+SPDX_ARCHIVE_PACKAGED ??= "0"
 
 def get_namespace(d, name):
     import uuid
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 81ad4d3b7a..36feb56807 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,8 +26,6 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
-SPDX_ARCHIVE_SOURCES ??= "0"
-SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"

---
base-commit: 1db86a3381c94951de44bb2b6ec840fd99a7d4be
change-id: 20250327-sdpx-relocate-variables-f7aa9b7f2810

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


