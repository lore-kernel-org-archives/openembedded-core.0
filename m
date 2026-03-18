Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A4410775EB
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:55 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19748.1773854092330464099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=qSpeFk6T;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=T6ceisaH;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6488B1400174;
	Wed, 18 Mar 2026 13:14:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Mar 2026 13:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773854091; x=1773940491; bh=xn
	75aDXBNTDXyaDz2rFH1PkSxR8NleioPbnEMTC0o2c=; b=qSpeFk6TR9GUR30T3v
	zULHm/oLgEdPs3vDJ1eE8UhHgcVl47BoZactR5u5ltuSKQFRxlzABm0pn/R2COu6
	nSVF4AInhh0XUdX5Ve52p8vFlx4YDgt9d/qdaT389CdD8NijAcIh6M79Z0Ch+mra
	p9Aq2yBUZV12Wv8bUeTookpVk+fbrmvrDHAoK8DfnYZ6n4mIlqXSjmMjZOZ9Aja7
	OKp6Lw+CNbE2UDg4TT0JYVEO/8s8xzL5OvPUImyqT3TVMCnRi4djrUudH9rZadEP
	lC+i3m+yv1wy3sgwUuqVrO2pPiYARsswfh0DIUZOzbP2WfFZzzOfZis3++MHgvEk
	7edg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773854091; x=1773940491; bh=xn75aDXBNTDXyaDz2rFH1PkSxR8N
	leioPbnEMTC0o2c=; b=T6ceisaHoXAXuve+DP0qsMPJZ9Sgrz85roH1Z7VHFavP
	L1jnUntJoQWpzvx3GOJWr7Brz20E9pYXWJXA4CjS2+FZbYQmBbMKI0avDX/1g1jC
	eI3wILml9MqEwT7fXiPxiqB9ZLxvXDLbemLCRZo/bD1CLZbTuoyYMzQhG/G4HOxy
	HdrQUJt+AEP9F4KQXoO4wsw7WpGntLZkrt9LV9OMD3VIzzmgK0/XY90r8kosyz9l
	9plU1+1uUiwP82mGwWJLCIlOCJFmFAYfcdb9hIPpX/xtczACVRUAh7D8vjCr4iKh
	/BwN0V99KJZuF7q+7HwbWpe6lQ4SIVSARMR+8RlnHg==
X-ME-Sender: <xms:i926aYnZ5GuPfUm2B2OKSu530uDHt_e0mSjKJYx6qr4uOmRn7PaThA>
    <xme:i926ad1Uwby-_6eBiCo8M6X4d0yuFN9PVsMNxq5d7aop5f_E3kqx3c_2PbaFqMbuS
    5HkTUOYOALqYtv7EsD_u9Eep7MC4xXtUdYRphTQy9qG-kknJqce1Tk>
X-ME-Received: <xmr:i926aUSmlCZNGMhsCP6tVBXqtUZH2RufK8Q0ngY0EKiS-m872LdEvQ5nWw2zdWmrXek4muwQmFr1vOBMUIaSYwzWtsh1tk8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhufffkfggtgfgvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepkedtgffhhfeigedtfeeifefhjedtkeffjeejff
    evfedtudehhfeigedtheeiuedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpuddt
    rdgssgdpuddvrdgssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvg
    hvpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhp
    vghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:i926afsrNmGl3IBu1UWyhBRfQZkxMH2nMXvyMBhltrvbieimLR_G0w>
    <xmx:i926aZa5vi7wrMXENXiAFLT1SmQm4WrvrGYrpzuW0d6MVVo1KB4wHQ>
    <xmx:i926aUu00Qm-1eq_P4XhJ1b_t1uwKmsiPWLAfPtz_ndvfuwdY80mGQ>
    <xmx:i926abHY_bD7bO36TIgSdrvIZtTfkNzNA_PWYEA6bG_zxLY6ejuz8A>
    <xmx:i926aeKEj8EHfUNAeMsPTXeArDyYV6zkh40HxXV_gxVCbpqooZa9i6wz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:50 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 00/12] Further check-layer fixes
Date: Wed, 18 Mar 2026 17:14:43 +0000
Message-Id: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPdumkC/x2MWwqAIBAArxL73YLZQ+kq0cdiWy5FhUIU4d2TP
 gdm5oXIQThCX7wQ+JIox56hKgtwnvaFUabMoJXuVF1ZnOVG59mtGz0cUCPNqjVktSPTQM7OwNn
 5l8OY0gcAJ1qQYgAAAA==
X-Change-ID: 20260318-fix-checklayer-2-af057a82ca74
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2992; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=c0IrElvCrh1RWXz2jfJsohTyU87fgrJdr+GvYXUQftg=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuuttRlb1Z1+zX7yWpL3/ffr/r5OLnHPtvZfG+P3bv5
 odD74SMbnSUsjCIcTHIiimybO75ev9pryNvRsgtBZg5rEwgQxi4OAVgImulGRl6O9apiUzcYfRi
 7lauQ7FnvBkPuAkL69U8WOSi9M/92VxNhn9m/h2KUi6zeYKVV68Ms3O+JPZ6hfTy9IZ9c7+JPLs
 68xwHAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233417

This series follows on from the two patches I sent earlier this week
[1], and Richard's patch to fix [2]. With all these applied, most of the
check-layer failures in openembedded-core are resolved, with two
exceptions:

  - mesa:do_recipe_qa signature changes based on MACHINE due to use of
    VULKAN_DRIVES in PACKAGECONFIG. However, adding VULKAN_DRIVERS to
    PACKAGECONFIG[vardeps] doesn't fix the issue.

  - lttng-ust:do_recipe_qa signature changes based on MACHINE due to use
    of PYTHON_OPTION (-> PYTHON_SITEPACKAGES_DIR -> libdir) in
    PACKAGECONFIG. However, adding PYTHON_OPTION or
    PYTHON_SITEPACKAGES_DIR to PACKAGECONFIG[vardeps] doesn't fix the
    issue.

There may be a couple of other things that need investigating to make
everything pass, but I wanted to get validation on this initial set of
fixes now. In particular, is setting PACKAGECONFIG[vardeps] the right
thing to do?

[1]: https://lore.kernel.org/openembedded-core/20260316-fix-checklayer-v1-0-f3bcaa60e93c@pbarker.dev/
[2]: https://lore.kernel.org/openembedded-core/20260317121307.935437-1-richard.purdie@linuxfoundation.org/

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Paul Barker (12):
      checklayer: Fix regex in get_signatures
      curl: Drop arch dependent search paths
      ghostscript: Drop arch dependent search paths
      libssh2: Drop arch dependent search paths
      flac: Use arch independent search path
      gettext: Use arch independent search paths
      gnutls: Use arch independent search paths
      initscripts: Make SRC_URI arch independent
      linux-yocto: Avoid arch dependent vardeps for SRC_URI
      libsdl2: Explicitly set PACKAGECONFIG vardeps
      graphene: Explicitly set PACKAGECONFIG vardeps
      gstreamer1.0-plugins-good: Explicitly set PACKAGECONFIG vardeps

 meta/recipes-core/gettext/gettext_1.0.bb                             | 4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb                     | 4 +---
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb             | 3 +--
 meta/recipes-graphics/graphene/graphene_1.10.8.bb                    | 3 +++
 meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb                     | 3 +++
 meta/recipes-kernel/linux/linux-yocto.inc                            | 5 +++++
 meta/recipes-multimedia/flac/flac_1.5.0.bb                           | 2 +-
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb | 3 +++
 meta/recipes-support/curl/curl_8.19.0.bb                             | 2 +-
 meta/recipes-support/gnutls/gnutls_3.8.12.bb                         | 4 ++--
 meta/recipes-support/libssh2/libssh2_1.11.1.bb                       | 3 +--
 scripts/lib/checklayer/__init__.py                                   | 2 +-
 12 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 531f87111d83430615f2e20dd41a3dd5fc25c7ab
change-id: 20260318-fix-checklayer-2-af057a82ca74

Best regards,
-- 
Paul Barker


