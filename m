Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E381090249
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:02 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14698.1773936299687452858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=pZN77xxA;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=JFGryLwR;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D9F1F1400087;
	Thu, 19 Mar 2026 12:04:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 19 Mar 2026 12:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773936298; x=1774022698; bh=X0
	UZaO4ikB1DepQQa44brlff7WtrItRckZS3i8caLD0=; b=pZN77xxAXrNzFD+Sil
	yqlRmBusyH4siU30MDVWVChL8VtOqTpRV4S8I6duCydeCokA/OCcNIaOde6HlRVR
	zpebAtEzHr/upFicbbgGLMyiU/yvnJSA6Qr15p478lFlmIvvu08mRt6hrbi1qGwd
	IFuKnWVzC8CcqLTAmDTlsIaAO4YnF/4lYBPjRHnarJCWyGdDGrKWpC5H83nMvX9o
	6sM7rpucWXeMlBDMBCnd2xmVHDhTkrWmYhvuMOXvAaHDX8dAkeeD0duCfyyxhsMt
	tBB2oPfDXnvJKDsa/yPCcAsaq0AQUlGsVM6oVafeqDIFDkMxluQgHJyrV60//e7q
	olxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773936298; x=1774022698; bh=X0UZaO4ikB1DepQQa44brlff7Wtr
	ItRckZS3i8caLD0=; b=JFGryLwRjqN+23g3TJfPIZI7gfL0OQ98dzpY+tzwxr0v
	ZRYfwNhVfVLOki0gI19cxoOtb5jspaEDxLYUeaeaHkFJTDe/3qp5YLKmebqsgIjI
	q7NGlb8c/ecr71JoP861FfrOoxMz9KfJmvFVZVj0s9qNXBZJ0IovffElD5N8iZKh
	fwymJyGCcWhrdQja8KjSwz7WesLEJWiMX6YPl6F+3mZdQBqDiP/GUZ1KFrB644Im
	iN5a088Pyji/q1fnieRQUOxEiOzV3jfDFSdonNPF8udbEUkTislqXU/j2WVNT73F
	x5qbol3dHqu7qiY1wgPDqvpba/EkudIQs1ccdm0cYg==
X-ME-Sender: <xms:qh68aW0NGdE8UWqAT9lmUyaGklIax5THAofqmtnIDUJORAJvlbETSw>
    <xme:qh68afFEykgjOxC3NiKJHekQ9ewIugAR0wjuM_El88PX2JBUdZ2H6TpTeDlBpXsYc
    S0wnMteWxV7sqG644xw3teckV3Ard84Vcl3A5fHtTUsgWJdZdNHvnSv>
X-ME-Received: <xmr:qh68acjWhHhI_HuQWKz6Y7nPEA8oc0K21uon3we_Oi4KDwZ7fwvF8FvDPTJBozboB-tqulMW6b93EoYl7jriFaiVPghOsnM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhephedtvdevfffggfehuedvkeegkeekleelhfevje
    etudeuheevteetieejheehveeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpuddv
    rdgssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhish
    htshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphgruhhlsehpsggr
    rhhkvghrrdguvghv
X-ME-Proxy: <xmx:qh68aS9swUFh2fV60kdwy67Fz2DUhnL95VttS9cWz3fl8kLe6Z4pzg>
    <xmx:qh68abrHpy0hzo6l0dEsOxXBTqAgdRk-qEu_1ET7ivQBbEsgPbpEKw>
    <xmx:qh68aZ8R8TZWaF9ULhrGP7RCCVa1PYdwOn5_vemzTXFd8p2sOH2mvA>
    <xmx:qh68aXUNovacCiiZMNyaTE_erXBtMRVf3kGXl5fN-S_LcJZGwb9D4g>
    <xmx:qh68aQZ1bunF4csZJqhK-mhTnWi4GS-2LB8Ds43hLrSLvNt8NeH-N3TR>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:04:58 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 0/8] Further check-layer fixes
Date: Thu, 19 Mar 2026 16:04:38 +0000
Message-Id: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYevGkC/32NQQqDMBBFryKz7pQYrQldeY/iYkzGGiwqkxIq4
 t2beoAu3+f/93eILIEj3IsdhFOIYZkz6EsBbqT5yRh8ZtBKN6oqLQ7hg25kN71oY0GNNKibIas
 dmRrybBXOnVP56DKPIb4X2c6HVP7SP7JUosLK2p4ax7Vxvl17konl6jlBdxzHF/e8fECyAAAA
X-Change-ID: 20260318-fix-checklayer-2-af057a82ca74
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2128; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=pXfc0ymjeD4ibKfyH4e/VXKp0J5l4nDu0TcDv5tp4CU=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVtRs9BBYOqvoNKD1r+XWTdvPn61U/Vn8+VLX+7nz
 t+oVZrI2VHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJRK1n+B+86M2ha65PVRLj
 lvxyiK2NrWLymF8c79UoJ8yWtbzyZCsjw3l77nvqkct/3dEQyE3SjJ5ocdbtYZLvhEt3qq9UOcV
 +YwUA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233534

Following on from recent changes merged to master, the patches here fix
yocto-check-layer issues and clean up unnecessarily arch-dependent
PACKAGECONFIG / SRC_URI values.

The vardep changes I had in v1 of this series were the wrong way to try
to fix the remaining issues. Instead, the PACKAGECONFIG test in
do_recipe_qa needs moving to a different point in the build process to
allow for arch-dependent values. We can't eliminate all architecture
dependencies from PACKAGECONFIG, it would be too difficult to support
all valid use cases with that restriction.

Moving the PACKAGECONFIG QA test is left for another patch series. These
patches can be taken independently while we continue to figure out the
correct solution for the QA test.

---
Changes in v2:
- Dropped unnecessary changes to vardeps.
- Improved commit message for initscripts SRC_URI change.
- Link to v1: https://lore.kernel.org/r/20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev

---
Paul Barker (8):
      checklayer: Fix regex in get_signatures
      curl: Drop arch dependent search paths
      ghostscript: Drop arch dependent search paths
      libssh2: Drop arch dependent search paths
      flac: Use arch independent search path
      gettext: Use arch independent search paths
      gnutls: Use arch independent search paths
      initscripts: Make SRC_URI arch independent

 meta/recipes-core/gettext/gettext_1.0.bb                 | 4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb         | 4 +---
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb | 3 +--
 meta/recipes-multimedia/flac/flac_1.5.0.bb               | 2 +-
 meta/recipes-support/curl/curl_8.19.0.bb                 | 2 +-
 meta/recipes-support/gnutls/gnutls_3.8.12.bb             | 4 ++--
 meta/recipes-support/libssh2/libssh2_1.11.1.bb           | 3 +--
 scripts/lib/checklayer/__init__.py                       | 2 +-
 8 files changed, 10 insertions(+), 14 deletions(-)
---
base-commit: aeb2a667b93a14dec2fb9f564c77912b56803d2b
change-id: 20260318-fix-checklayer-2-af057a82ca74

Best regards,
-- 
Paul Barker


