Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF494107638D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 17:42:05 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19110.1775065324579616416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 10:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=PsuV5IP9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=l+FKe1A3;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AE5947A008F;
	Wed,  1 Apr 2026 13:42:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 01 Apr 2026 13:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1775065323; x=1775151723; bh=3C
	+aCtYnCo8zsSl1HrwApFjvl+0WNmpR5WzvkmcidvM=; b=PsuV5IP9Oyc1G2s0zC
	ALgkXstjTPIDUVciEKRAUDwfQcrHD3dxQtnYEo/Xegs/RqTsKQZjWH5mBeMo2oYD
	1Mx4urFkiV/fbmAdfYC42Ie/r540Yqq0fNC9DtqouLJ/7+5rNGsbTAP/Nx4wTsNu
	e6QIsY2LS8gBmkpTj0A2OJOns3q15i/jOnrXDVi/+xDOJv3wngH3STUlYCeyV0kc
	7cWEF022K4e2LmyK3BSjTkTMbZVz+JZ3vyKnYGyuCwzZEAlfq2phlUej2smWU2N6
	FPlaWt3zFVb4tWVhgqIGTC7pU97zS7xOn5626zkFMv225lWaFNYXsvM4+jA6OwoZ
	v/6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775065323; x=1775151723; bh=3C+aCtYnCo8zsSl1HrwApFjvl+0W
	NmpR5WzvkmcidvM=; b=l+FKe1A3IpKKw2OWU1eJ4hjZBrXj7ZAVADBidQ0EEVAj
	LJRQu10n18+iwHUP50yEE8Q4N7sqdUfEILOWUmoeHhQtebF2nxNw3sIuIlgG5H/F
	wSTXTfiCpnmMIDgcQO/VS55DQtmsHciEVCC75PISuMZJx3LFvWBzFTkhHwMdzC57
	at9b27yLANs34Dl9PPK2DlOBGRqO5yzcOBQVr1Zyuyvx9b3vt9WzQfwU/bB3/Yaw
	OKaUOTcI3YMd//BWXuxTNYvsMY0vv9Ui1cxBfYsx5kRA5o/7/aNnb2dTqYh6xPhk
	dUx9vlrrELfLQ1n/0fpcZXNBTCsAeDNDBgRGJjrIQQ==
X-ME-Sender: <xms:6ljNaUoYNGIJPjHg9FqmfRcGr3NpSgKvS6Di9sKIgWO-8xCK7q9EHg>
    <xme:6ljNaQpzzAZxAifhR8neKZzCNoHOBj8UJPr2P-WIPDubk5dViP-tE6J4R0K6vPSop
    hIM_YdP7NJ2OtgpuO0Hm7COZt4lps-0SaCJAmCLhZaQYE0ywZi5V7Y>
X-ME-Received: <xmr:6ljNaW3t6IE39kRfuwKRHz_5Hl8nmhy6E73iJWIo9Lah9NU03oIfg1milTDxSr0hHxEEJvJ_5QgmVUx2rOIHa-U_HRnGVl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtredtje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepfeehffeujedvjeeigeeiveelueetvdeuffekleefje
    ekleekgeekhfehueffvdeunecuffhomhgrihhnpehmshhgihgurdhlihhnkhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtohepohhpvghnvg
    hmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:6ljNaXBO0yMqUBtONDOaS8losKnWhf-GTpX_4BM5_bnt26KUXwjD-w>
    <xmx:61jNaWeDd3JX9nGWDB43RpWEaNTq1hNWI5bvL8mCibAN6xk9B2RDQw>
    <xmx:61jNaUhofS_S-v6xAn7tnLH805TNyHHz8nWqKsk1MFgPhNn49bc70g>
    <xmx:61jNaWrJClJ8cdESY0eNUZKZN2lMswXkT9ogBn3iKm3dIXK96ozFKg>
    <xmx:61jNaTOL7hEaoA-9pPYVvlY_F18OQQZAddjlGCRe-DXyzDCSjfrsCaKY>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 13:42:02 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v3 0/4] Support opt-out of any default machine and distro
 features
Date: Wed, 01 Apr 2026 18:41:55 +0100
Message-Id: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONYzWkC/33NQQ7CIBQE0KsY1mIoH0vrynsYF1A+FjVtA5Rom
 t5dWjeaGJeTzLyZSEDvMJDDZiIekwuu73KA7YY0reouSJ3JmXDGSwa8ogatGu+RWlRx9BiokVY
 A2sbqEkieDR6te6zk6fzOYdRXbOLiLI3Whdj75/qZiqX3h08FZbRmsmZVKYwEcRy08jf0O4OJL
 AeJfxBQ/CB4JqwELcBU2uzlNzHP8wvb0R/TBwEAAA==
X-Change-ID: 20260328-default-features-d7f43efcfb63
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3350; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=jU+4xRwVqR+s6pjRDyb0cHVDkKBH5Gs+YHRoETOQJgM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSejXj5+2CeR/6KnJaDbic/Lxf7oDPZNozV+HGm+JGAm
 ZMOcWQ0dZSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAiJ+oY/tk7trUrWPq3N142
 4QqS3r1VbpK76E7J/l9rC5m/WtmUxjL8Mz+qq7LzOoPU44Z2Df/VzI+nmiycFCH8leVk+x2ho/f
 +sgIA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234450

This is the second version of my patch series to improve DISTRO_FEATURES
& MACHINE_FEATURES handling. The first version complicated modification
of variables in conf files, requiring use of :append when we should just
be able to use +=.

In this version we directly append the filtered defaults to the target
variable, instead of using an intermediate variable. So, default distro
features are listed in DISTRO_FEATURES_DEFAULTS, this list is filtered
to remove features listed in DISTRO_FEATURES_OPTED_OUT and the result is
appended to DISTRO_FEATURES. Similar behaviour exists for
MACHINE_FEATURES_DEFAULTS, MACHINE_FEATURES_OPTED_OUT and
MACHINE_FEATURES.

See patches 2/4 & 3/4 for updated migration notes.

This series doesn't include issuing warnings if DISTRO_FEATURES_BACKFILL
or DISTRO_FEATURES_BACKFILL_CONSIDERED is set, that can be added as a
follow up if these changes are accepted.

---
Changes in v3:
- Fix test_filter_default_features(), strip DEFAULT_FEATURES before
  comparison
- Don't clear DISTRO_FEATURES in native, nativesdk & crosssdk handlers.
  Filtering already exists to propagate only the features we want to
  keep.
- Link to v2: https://patch.msgid.link/20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev

Changes in v2:
- Rename {DISTRO,MACHINE}_FEATURES_DEFAULT_RAW to
  {DISTRO,MACHINE}_FEATURES_DEFAULTS.
- {DISTRO,MACHINE}_FEATURES_DEFAULT is removed.
- filter_default_features() appends directly to
  {DISTRO,MACHINE}_FEATURES.
- Follow through the consequences of the above changes.
- Changed in meta-yocto should no longer be needed.
- Link to v1: https://patch.msgid.link/20260328-default-features-v1-0-90790864d734@pbarker.dev

---
Paul Barker (4):
      oelib: utils: Support filtering default features
      meta: Support opting out of any distro features
      meta: Support opting out of any machine features
      lib: oe: Drop backfill support

 meta/classes-global/base.bbclass                   |  7 +--
 meta/classes-recipe/crosssdk.bbclass               |  8 ++--
 meta/classes-recipe/native.bbclass                 |  8 ++--
 meta/classes-recipe/nativesdk.bbclass              |  9 ++--
 meta/conf/bitbake.conf                             |  3 +-
 meta/conf/distro/include/default-distrovars.inc    | 15 +++---
 meta/conf/distro/include/tclibc-musl.inc           |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc         |  2 +-
 meta/conf/distro/include/tclibc-picolibc.inc       |  2 +-
 meta/conf/documentation.conf                       |  8 ++--
 meta/conf/machine/include/mips/arch-mips.inc       |  2 +-
 meta/conf/machine/include/powerpc/tune-power5.inc  |  2 +-
 meta/conf/machine/include/powerpc/tune-power6.inc  |  2 +-
 meta/conf/machine/include/powerpc/tune-power7.inc  |  2 +-
 .../conf/machine/include/powerpc/tune-ppce5500.inc |  2 +-
 .../conf/machine/include/powerpc/tune-ppce6500.inc |  2 +-
 meta/conf/machine/include/x86/arch-x86.inc         |  2 +-
 meta/lib/oe/utils.py                               | 53 ++++++++++++++--------
 meta/lib/oeqa/selftest/cases/oelib/utils.py        | 38 +++++++++++++++-
 19 files changed, 110 insertions(+), 59 deletions(-)
---
base-commit: c56990178b31b893fbf695eaf6b67de501e9d2e9
change-id: 20260328-default-features-d7f43efcfb63

Best regards,
--  
Paul Barker


