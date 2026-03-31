Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5EB10F92F2
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:29:41 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2314.1774985375001013301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=h6b7BWHl;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=tjLBeT9Q;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 0F6C5EC0283;
	Tue, 31 Mar 2026 15:29:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 31 Mar 2026 15:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774985374; x=1775071774; bh=vB
	HL+rwm50x8U+bFaWyhWxgq/EjtHrncbZmF0cG4BI0=; b=h6b7BWHluy1SXS5VYG
	334q/ug90+jKbdqVlylnNe2uY32E3sXWyeRTSoTyXto1vs9LY+xK0sfiCMPLw/Vd
	6/RO0wqIT3au/FUP/MnIvuzEkKgAqoYonumf7sJLhbiozBkHGlR+JJp2q6VU2j5A
	1nDCKhfRbaqdAQS/t++mbsQD0KNYAGZ45pqd3EoEOgK9F6OukBR/EoIdTXngz5tq
	fLCMF5EkrmRqGB7GD3QhdTJm5JWTKTqBGNIyYjrU9njswkFFe3myMGC8JUHnfeVO
	huHitKMKpdZog0V2XZLjDStc9MKtPL7JnSnV04EKhEq4TK3d2pkGgVKALJ3ySo1I
	bC9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1774985374; x=1775071774; bh=vBHL+rwm50x8U+bFaWyhWxgq/Ejt
	HrncbZmF0cG4BI0=; b=tjLBeT9QgD8ARXUnIB7ODmaQc1yDLkarm2x/JUD4JP9X
	UXvpFhEQ6p1BRY5svX4G8Exlm7O9zzuVtcLedZJcxKYS1WTowotMzIKlRNskER70
	eGXq5tcsgJ5pawMc9b8WTN7q9gMkNDzUGueYFHjHdpmS3RM0tR2R2QCdNVCr/4VD
	HUT3g00Yc0a7rauIBay4Xnt/YhApaCfDcIVY5wsIodq3lXI0RS+uNW6J6lT/stSs
	HVjlcqxc5GiRzqZAB15ms3hUj9yc68EseTmwduczR0MNhMoKLsBcZVnhntavZfjk
	RIWRgQOIxAyqGDNCQ89hxfOQHJtrwco5ANYHsk+OlA==
X-ME-Sender: <xms:nSDMaa-iJJfvyozGE49lGLlpTiVWHGaEZaeFU7jz3hywTdY96vSf6Q>
    <xme:nSDMaQseqtgFHweE_cB1ukvcWm9sY-14SRaK8pBnF0aUDs8gzpuMm3cjjjQgofdzx
    B1b8q-RKhwLrpclKA4Zr8HHVu6j8_DoNbACJXsibKapw7okUWDpnTO6>
X-ME-Received: <xmr:nSDMadqi2Yda0-rSquQPjsZy2FhuUrHvCRz1DozDtA4fscwPeUu6xLIr4q3VCrqlz0-UXIgvw1TGuGtuf5qxshmVw5sfaSE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtredtje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepfeehffeujedvjeeigeeiveelueetvdeuffekleefje
    ekleekgeekhfehueffvdeunecuffhomhgrihhnpehmshhgihgurdhlihhnkhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvg
    hmsggvugguvggurdhorhhgpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:nSDMadl7zLR4_1Kf5kDpoBpkJR5qOkSK55TVurTn0mxKLy_oAN_4aw>
    <xmx:nSDMaRwvKPZd0M__m_aODbj19Rl4C_RuJfgLuF4HM9E0F6r-UxLfSw>
    <xmx:nSDMaVki1zx13AStSFrv_DlEdtLuvSAQczUIck5i4la5ZyocRV6LxA>
    <xmx:nSDMaadIFuTSFPJVSuqefZWmIjHHQOJfQ4jFrvoj1aMPuWpRASZ2og>
    <xmx:niDMaWg18AMiUbRyEPAjoFTrzemGJaNTxn884FL17M0FeKzVe1RaYphw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:29:33 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 0/4] Support opt-out of any default machine and distro
 features
Date: Tue, 31 Mar 2026 20:29:29 +0100
Message-Id: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkgzGkC/32Nyw6CMBBFf4XM2prSNjxc+R+GRWmnUjVApqXRE
 P5dinuXJzn33BUCkscAl2IFwuSDn8YdxKkAM+jxjszbnUFwUXEpGmbR6eUVmUMdF8LAbO2URGd
 cX0nYZzOh8+8jeet+HJb+gSbmTjYGH+JEn+Mzldn7k08l46zldcubStlaquvca3oinS0m6LZt+
 wKSOJm8xAAAAA==
X-Change-ID: 20260328-default-features-d7f43efcfb63
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=OprLEB7oPyUFLI28FaWhu4TZ97OmV7I0a0jQW/ORFSE=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSeUZjjwNK7NjhV45Jp5L+j35t//r2cu0e+qm/15aSd6
 xs6/APXdJSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAipzgYGZ4W3up2P3MpYmfS
 2ujvyxm2GGrN2XR/f1HNv8Q9Pu/WnsxjZLjF5vLqQMadxfJiZYtdr7BlSvE57Jky99dm0+j6+U+
 4fzEAAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234307

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
 meta/classes-recipe/crosssdk.bbclass               |  9 ++--
 meta/classes-recipe/native.bbclass                 |  9 ++--
 meta/classes-recipe/nativesdk.bbclass              | 10 ++--
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
 19 files changed, 113 insertions(+), 59 deletions(-)
---
base-commit: c56990178b31b893fbf695eaf6b67de501e9d2e9
change-id: 20260328-default-features-d7f43efcfb63

Best regards,
--  
Paul Barker


