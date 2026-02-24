Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB5EE9B24D
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 10:08:39 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17201.1771927714823639877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 02:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=a9XsCvU3;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=VHkQT772;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0580F140013E;
	Tue, 24 Feb 2026 05:08:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 24 Feb 2026 05:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771927714; x=1772014114; bh=pGNVRTERze
	oOQzEwb1TpXbFs4Yq7B23/yiRutS3LuYI=; b=a9XsCvU3BhEQ4UY7njqI+4MhEp
	jenOjq4clJDogDfk6KGVok4KTG6Sn/xO8FE9sbkQSjYtw+vNRVkP4I1n/Aq7Hgji
	06Slg0S4HvMgCvJk2R4Bt2ZWy6V00bTzu5RM/TKxPbETg8jzz8IM/qw0voPXdOJC
	Bw7Qem0x7YBDn28KBN3bZFBHNA8cq5GKupn144013XvUHIUOoZ4S+t6PQCkXupDE
	XQbwNMqDd0dgenkhfDnOt6OonP9uV3ohKfhgpsD4T290jYDGuMT2VlbghvP99T2J
	qGbPIBFF2Mim90MiHD9ogpx6lapuZeAqOnK/A/o6d//dmiB42kEAhHWybpbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771927714; x=1772014114; bh=pGNVRTERzeoOQzEwb1TpXbFs4Yq7B23/yiR
	utS3LuYI=; b=VHkQT772c0h7vOJTha8vVm0QeXR1/3GShXahI2xhAy8oYn9acxN
	8Ips9TqcxEEquc9s5hhQliT9NOrgBhQ0Fa8C+YXTizT6ZbRziG/yrTLZ9IK3iqhM
	KO12ZEEaanjXjspLFMlNc8Hiinkzwx5T4NC+69PJneyW4RLLBsAJ6N0pmoPt0oTR
	pbL5dmM9w7owumMh9YybBPGOyjuOl0Xj6fxz6e0YvtqJRnkigVkwdDoDZwPdDoIp
	iqfpbt+DeqNmHruTFms7NfwOU31Xi/Zb6IlvzmgzS77NEJlu7/cVVivXpcVt6t7G
	7VtxF2P4LfdyeV2RK6Oti7uMSoXjyV8VgBQ==
X-ME-Sender: <xms:oXidaaNhHwEboZsBiLZ1WxfbKewzm4YCXkDqiUG_x9ezltbEkaPLRw>
    <xme:oXidae-j7OC_H9wwbmFadZ3qEr6OiScsW3SNNSJnCjUCSZ-fkWSPE0ITUPzwDy3s8
    0GLmKnM_JD3vk3kFHGIWkY5YVhI1KeScC1lnqqxGYx-nzs47XW-YfM>
X-ME-Received: <xmr:oXidae58p_bVQktWBpeB_vXJznvnNSbLQrR4Blk_rc157ZUlTqnfeNgsjF1w_n3ueBLhU-S1KUgHKXzBayPrG-_WjtMcDxEf4oP0kE7vcfAS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeelkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptedufeeutdefvdejtdegvedujeeguefhjefhtd
    dtffetjeeihfejhefggffhgedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpfihkshdrihhnnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtfihovghrnhgvrhesghhmrghilh
    drtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhs
    rdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:oXidaV1O0DYXX3cUrSj_mVDpi7HlmH97V1QNajCcqZUbS9gQu5WM8w>
    <xmx:oXidaVBpm0oLsZwzG_YmRceJgWbwBD0EprNPCSlKrWziO4X5TUJJjg>
    <xmx:oXidaX2iIXgwAseexOchHzlNO2Ga0P4AQsF55iqIiT_8X-F-ZlVwBw>
    <xmx:oXidafsvH2tvSU29GWIiiROoR0RIKPCffBe9ADDyeDoQur6PvnhsdA>
    <xmx:onidaXcfBkEnAtuWkMGjeMMI79lrCGvDpvN-JtKyGmym_G4-raRPcHTy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 05:08:33 -0500 (EST)
Message-ID: <afa3b3fb5c285e9d0a2b55a753244df88ac70465.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 04/10] wic: provide oe-core wks files
From: Paul Barker <paul@pbarker.dev>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2026 10:08:30 +0000
In-Reply-To: <20260223215008.2062721-5-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
	 <20260223215008.2062721-5-twoerner@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ccDQSHuxdKg2ohV7CgVQ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 10:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231760


--=-ccDQSHuxdKg2ohV7CgVQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
lists.openembedded.org wrote:
> By convention, wic will look for a "wic" directory in the top-level
> of all BBLAYERS in order to find *wks files. oe-core was the only
> exception; it stored its *wks files in scripts/lib/wic/canned-wks.
> Take the *wks, *wks.in, *inc, and *cfg files that were in the old wks
> location and place them in a "wic" top-level directory in the oe-core
> layer, thereby following the convention of every other layer.
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v5
> - rebase with master
> - split patchset out again
>=20
> v4: skipped to align/combine with other patch set
>=20
> changes in v3:
> - squashed into 1 large patch
>=20
> changes in v2:
> - none
> ---
>  meta/classes-recipe/image_types_wic.bbclass |  2 +-
>  meta/wic/common.wks.inc                     |  3 +++
>  meta/wic/directdisk-bootloader-config.cfg   | 27 +++++++++++++++++++++
>  meta/wic/directdisk-bootloader-config.wks   |  8 ++++++
>  meta/wic/directdisk-gpt.wks                 | 10 ++++++++
>  meta/wic/directdisk-multi-rootfs.wks        | 23 ++++++++++++++++++
>  meta/wic/directdisk.wks                     |  8 ++++++
>  meta/wic/efi-bootdisk.wks.in                |  3 +++
>  meta/wic/efi-uki-bootdisk.wks.in            |  3 +++
>  meta/wic/mkdisk-ufs.wks                     |  5 ++++
>  meta/wic/mkefidisk.wks                      | 11 +++++++++
>  meta/wic/mkhybridiso.wks                    |  7 ++++++
>  meta/wic/qemuloongarch.wks                  |  3 +++
>  meta/wic/qemuriscv.wks                      |  3 +++
>  meta/wic/qemux86-directdisk.wks             |  8 ++++++
>  meta/wic/sdimage-bootpart.wks               |  6 +++++
>  meta/wic/systemd-bootdisk.wks               | 11 +++++++++
>  17 files changed, 140 insertions(+), 1 deletion(-)
>  create mode 100644 meta/wic/common.wks.inc
>  create mode 100644 meta/wic/directdisk-bootloader-config.cfg
>  create mode 100644 meta/wic/directdisk-bootloader-config.wks
>  create mode 100644 meta/wic/directdisk-gpt.wks
>  create mode 100644 meta/wic/directdisk-multi-rootfs.wks
>  create mode 100644 meta/wic/directdisk.wks
>  create mode 100644 meta/wic/efi-bootdisk.wks.in
>  create mode 100644 meta/wic/efi-uki-bootdisk.wks.in
>  create mode 100644 meta/wic/mkdisk-ufs.wks
>  create mode 100644 meta/wic/mkefidisk.wks
>  create mode 100644 meta/wic/mkhybridiso.wks
>  create mode 100644 meta/wic/qemuloongarch.wks
>  create mode 100644 meta/wic/qemuriscv.wks
>  create mode 100644 meta/wic/qemux86-directdisk.wks
>  create mode 100644 meta/wic/sdimage-bootpart.wks
>  create mode 100644 meta/wic/systemd-bootdisk.wks

Can we move these files from scripts/lib/wic/canned-wks to the new
location before removing wic, i.e. re-order this and the previous
commit? That would better preserve the history of these files and
simplify the diff.

Best regards,

--=20
Paul Barker


--=-ccDQSHuxdKg2ohV7CgVQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ14nhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biggAQDBKjpL9M+LzyzHVsq67XRgd/kCkpx16yHj
vaMmhpdSmwEA6PBcNBwVjXZBHIzO+KsTjxXUjvneqJnBjSme2omY8gE=
=sULK
-----END PGP SIGNATURE-----

--=-ccDQSHuxdKg2ohV7CgVQ--

