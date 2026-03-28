Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987DB10F3DE0
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:49:20 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8245.1774691354346718742
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=aeAl/LF6;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=s42z3ieb;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 49712EC0224;
	Sat, 28 Mar 2026 05:49:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 28 Mar 2026 05:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774691353; x=1774777753; bh=Vh
	BqnJAjphZvg99CizDzK9j/jaB5ITUSSqeLOCBiGVA=; b=aeAl/LF6efZp459bUF
	ezKkssWFF4onr7c7HrH0ml8Sg2yovD67KLUhZFoPSn8Qcv24hLDO0OFFZ6FQgtuc
	8J70fbwtnx9GHJGfd2XWQX19JHwO3Fu9pxStVhbfQHNDXS1Jy0Ok9GkvCbUtbm9u
	ho+OhfSNRqFcPZQvn+CAxARvVjqEoIH6iUzdAG8D+NoA12LXosOqMvfrLnbxJj1m
	9Hhrxo3SvFbhfoPz9sDF9T1Fx13kgyyXelK2P4lm5rqZ59TuXq2rbJ0MrOYaWKUj
	CBPfYvAePqX1Czir0baEFvzTPI+VybRjT066H9yPPyUycFk7h1Zaozk7phnYJXga
	tm1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1774691353; x=1774777753; bh=VhBqnJAjphZvg99CizDzK9j/jaB5
	ITUSSqeLOCBiGVA=; b=s42z3iebldH4TuB0R80Gdm4HdLMFAOEV6NvNoWwRykfl
	2XVTIeftBeEUirOz+lqKwCO/dCe1OIld8gc/McY5Tryw0XwRXIAM2wAIlCDYJZYI
	Zc+QQfAQnjr5oIAsKoZRavq+HRvKMWHmxEBffMJ3LtotCPZzDunzLzxvl+GkX6B2
	WuVXffBNDKjFbJUvLlw115uWMgElqW8JEhrfhY6U0y3nhPvaReaidGINEmGw68NL
	slmU8ePmunZUS3uZoAkCVFX2sqNFFyYkn712yN5EHLc6OHfL0V7chYCcJNJLqGNq
	fHZcEzx883F8+vfbzQVI5tRndpzzGC8a3E45s8clIw==
X-ME-Sender: <xms:GaTHaY6Cj4ULkWzTkbroyuqF4YgJvzGsEBo_9kvZ1PE-_1K__cOe0g>
    <xme:GaTHaf7J4SRFq2K53FGuXYxBSbczng2T606FcPZ4_awbI4YBmxkMJmJQkRmP9Ng0V
    yQj6On5QfM0Eutc257KBMeRfvCqLNbZttqdjWqM1MUsQQI3942phZU>
X-ME-Received: <xmr:GaTHaVErDj6XtwUruBUo515OQ1ZkKd48OaPK5ZtcJw5BLInhxZ3b24EWcbcGTLE84ThMOS84da4O0fFgwwgGcWAuMt6wEEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepieduhedvgfdtgffhffelgfelieehvefgtdelvd
    fhkedvjeeiteetffdtfeeugfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpohhp
    vghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghrkh
    gvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhs
    thhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:GaTHaYSAeXvxUqJqbNDqBaeuaK7EERPHOXP3_BQQZFH-yNT6d3dQ4Q>
    <xmx:GaTHaevNqJdcY59TcAfq7aTdWcCua1zQo9tWoXTeTZ-J248_Ep_LeQ>
    <xmx:GaTHaXy6HHiAV1PCp7TcqA1RKwkZcDEUD8Gp8Tg6kZkMfx5d_I0K7A>
    <xmx:GaTHaY6Bq0FnwcATcUKrYpRfBtdZr60_H8aggnvG0fDQOSzAch9-0Q>
    <xmx:GaTHabdny83v8jDJn7MeqaQgR0r5ScxmfPZ93znD5vN8eUKz4Xi6wFg9>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:49:12 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/4] Support opt-out of any default machine and distro
 features
Date: Sat, 28 Mar 2026 09:48:58 +0000
Message-Id: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqkx2kC/yXMQQrCMBBG4auUWRtoE6nSq4iLNPmnHZEqmUSE0
 rsb2+W3eG8lRRIoDc1KCR9ReS0V3amhMPtlgpFYTba1fevs1USwL89sGD6XBDXxwmcHDjz2jmr
 2TmD57svb/bCW8YGQ/x/ath+lAV7OdAAAAA==
X-Change-ID: 20260328-default-features-d7f43efcfb63
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=ow8Es9TCM+mbo9uPF21PZUtVomP26KThwym1tjs7dQo=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeXyK+vmHCg+jV965e2xTTEpXebFqece2PQvCZhwqlL
 7ODQ7smdJSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAiN38wMrw6vGqVeUnnwRaR
 dRyCqf9OK7XdMFa+YKxwfvX3CCUOGTdGhl19/ovOBkSLKSWeTZjN8zd7yuT9WeKpn5dMyCpb38m
 7mB0A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234122

These changes should be applied *after* the corresponding changes are
applied in meta-yocto [1].

[1]: https://lore.kernel.org/poky/20260328-default-features-v1-0-549331ccfab0@pbarker.dev/T/

These changes implement the third proposal from my email on "Improving
DISTRO_FEATURES backfill & opt-out" [2]:

   Merge the current contents of `DISTRO_FEATURES_BACKFILL` into
   `DISTRO_FEATURES_DEFAULT`. This variable will be filtered to disable
   any items listed in `DISTRO_FEATURES_OPTOUT` before use, efficiently
   and without the use of `:remove`. Deprecate
   `DISTRO_FEATURES_BACKFILL` and `DISTRO_FEATURES_BACKFILL_CONSIDERED`,
   issuing warnings if either is used.

[2]: https://lists.openembedded.org/g/openembedded-architecture/topic/improving_distro_features/118009864

DISTRO_FEATURES_DEFAULT is now set from DISTRO_FEATURES_DEFAULT_RAW,
excluding entries listed in DISTRO_FEATURES_OPTED_OUT. _OPTED_OUT was
chosen over _OPTOUT for improved clarity.

This series doesn't include issuing warnings if DISTRO_FEATURES_BACKFILL
or DISTRO_FEATURES_BACKFILL_CONSIDERED is set, that can be added as a
follow up if these changes are accepted.

The change is also carried through to MACHINE_FEATURES to keep things
consistent.

---
Paul Barker (4):
      oelib: utils: Support filtering default features
      meta: Support opting out of any distro features
      meta: Support opting out of any machine features
      lib: oe: Drop backfill support

 meta/classes-global/base.bbclass                   |  7 +--
 meta/classes-recipe/crosssdk.bbclass               |  7 ++-
 meta/classes-recipe/native.bbclass                 |  7 ++-
 meta/classes-recipe/nativesdk.bbclass              |  8 ++--
 meta/conf/bitbake.conf                             |  7 ++-
 meta/conf/distro/include/default-distrovars.inc    | 15 +++---
 meta/conf/distro/include/tclibc-musl.inc           |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc         |  2 +-
 meta/conf/distro/include/tclibc-picolibc.inc       |  2 +-
 meta/conf/documentation.conf                       | 14 +++---
 .../machine/include/loongarch/qemuloongarch.inc    |  3 +-
 meta/conf/machine/include/mips/arch-mips.inc       |  2 +-
 meta/conf/machine/include/powerpc/tune-power5.inc  |  2 +-
 meta/conf/machine/include/powerpc/tune-power6.inc  |  2 +-
 meta/conf/machine/include/powerpc/tune-power7.inc  |  2 +-
 .../conf/machine/include/powerpc/tune-ppce5500.inc |  2 +-
 .../conf/machine/include/powerpc/tune-ppce6500.inc |  2 +-
 meta/conf/machine/include/qemu.inc                 |  4 +-
 meta/conf/machine/include/riscv/qemuriscv.inc      |  2 +-
 meta/conf/machine/include/x86/arch-x86.inc         |  2 +-
 meta/conf/machine/include/x86/x86-base.inc         |  5 +-
 meta/conf/machine/qemux86-64.conf                  |  2 +-
 meta/conf/machine/qemux86.conf                     |  2 +-
 meta/lib/oe/utils.py                               | 54 ++++++++++++++--------
 meta/lib/oeqa/selftest/cases/oelib/utils.py        | 31 ++++++++++++-
 25 files changed, 118 insertions(+), 70 deletions(-)
---
base-commit: b50d6debf7baa555fbfb3521c4f952675bba2d37
change-id: 20260328-default-features-d7f43efcfb63

Best regards,
--  
Paul Barker


