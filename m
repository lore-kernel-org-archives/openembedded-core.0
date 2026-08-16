Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CABCC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 09:36:25 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7165.1786872984408794991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=EFXJokvQ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=IVAl4nZq;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E68E97A0122;
	Sun, 16 Aug 2026 05:36:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Aug 2026 05:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786872983;
	 x=1786959383; bh=DgTaHl+NoJNa7W4BvIh+eb8ZFwaDPAdvLrKbRA91UeU=; b=
	EFXJokvQc9aBopsOcf2q+ZolTLcQrJzHe5iG5X54wN9ism2d7EyZFy8m98QinoHJ
	1X1niZkRxJyLq9ShOa3bg/jU0Wdc9n38A6vmzmFXkuQMiyxL+4/AaqmYIjCTg9ka
	hJQtDxdX7KKv0ccucw7zARgbbTQuBOe3rFeXH00yO8/jNBw77DJyNQdGcYgQuVP0
	pFuwGamk/HZujUaSSehUNCX2metwi2GBtxBQox7a042JnKlXg0OoCgnDWfOZCgiL
	5HzKwLN0822PpBawKGIvnWHzkXgSbWEWh+iffbHHzEXgKStXROxSK6B9Ad2nMvTZ
	b8iDb2rH2+94ei9WmOJ9LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786872983; x=1786959383; bh=D
	gTaHl+NoJNa7W4BvIh+eb8ZFwaDPAdvLrKbRA91UeU=; b=IVAl4nZq/JJZFjPm/
	/nbM+UYnVuvZ2wWajBNq1CgI4OK6GydyGHEpwfpXX+uPhHjMc0k5FDFLPnT9udpV
	A39koB6mZge1fEENg0tlAwV20dx8z1uO1Ac8BrPm3vRJEJml1CNqZEr3TGXP8uKC
	XoCfT7aI8SF6Eqbg9clV8c4b4MAdbpfgQ2evOvKR1j4C/gwUmD1ocWAby/pHudCg
	1U4s2Bmp2/OQWTTKtUoavn6DEGeF77UvZsPgxta8lQJXvUPONkwQt5+PfttesesO
	R7RNkrUTJrhAECmjR+t6gf11TZxbn2O7nLS5SbCL/sn5nRXzYKdcR1rhmUi836y0
	PVKLQ==
X-ME-Sender: <xms:l4SBanhpnxlqWXtHqXrg8448IsZmPxrCIOnOr3DG6fxmtYJhF5z1gQ>
    <xme:l4SBaqBX1UTnCuoI8UAQqTYg3ZIjpGyw05B6xVfUpPYa4nMQuRGsZOAKNBI8xNaYm
    vzVkI_0SRLbd7CRiH-dK_dYDZ4VKlNqlTY-sNwPo5OKeqI6hr5XciqC>
X-ME-Received: <xmr:l4SBaksFWbcHBllPmx_aov3V5wWfpTaH91CaaG_G2HIY5zwgKV5i2WAzx9Gxl4P50bBaLIqO5-W8kXGkXGEtKGx0ldE_3vmnbfxaVGS-nGAy>
X-ME-Proxy-Cause: dmFkZTF/D/d+7nKhhvZPy6FLm+hXqrTMemPdZm7meEaFnE70I0R4aG2Y1NAm0q2ktVOVPj
    mg1UDRNmoP/31Q0vg5piHa9adBDjCX8g2seguZaOoAmVrsIhskCb97RqYPNjL1oLtVDitc
    Ook3d/LpAh9SZAvlKGid3xxJzl4J1Bn4+jMX4c55h78HS4vSLrgvitJmsLWuwh0rp2ENJQ
    wdIEitU5h9X6wVS0o8GvvKR+XJc9XdnkZdcksrR86cK9Qw7eltF6qrAMpvOXWjaLlTpHFB
    AEPU+x67t8NrnjteINAcB+jy2+m1Rlg8YqHS9U/PA3thd56meBsflrqm6C/P6jceVqbxWG
    io0AMOBiDxm/0xlRKZMC3i7uju+6q6f2aukmO5T0vedAsGIanSYIlvhbDqRe35wx9vrFxk
    0ylGx9pseJaB7DXCuHfUxJn/dlkETD2RP0R+5mr2H+jBPRwhPN28mKTznYfS/c3Om/twrP
    O/nhunIgr701QDO0XfRYTifeKmyObzUn2K5B4OCRIvCg8wWioVcNMNsr32P5Z4rjfUtvJo
    +3T2JqoaN7be5SMAg95OHvTooE2uvclOAYnzf47Yp2Ne0f5xgTn2ZgfIHT7O2f24U8P3G3
    jWDp8iivJX8yQy45l2Um0pXpzfrpMzXXVBdQDUROMnRrlZl77Zu4X5vTg6uQ
X-ME-Proxy: <xmx:l4SBavbrph49JzC2GcVXW7ldZKyZ0WKfnVc0ythmqch_U9c67B1NRA>
    <xmx:l4SBanX5n8lgHe7rAHFked-5bvJrqYyiohUiZDZKcEY5RtKVLjreJg>
    <xmx:l4SBaj5AsJ6pfM3y5nchfSrEVSC6FQzO1Etb8JEeVQvRHbyhuWREzA>
    <xmx:l4SBaijBf8MYDJ-0X1rQKxVejx36q0PF8QvdCDwj3qL0h6xy6JOQ6w>
    <xmx:l4SBasGpveJjtvqVMBoYw_R8DEdgCVxwrJ0aizjLm9x5rYqy8TUvVbWl>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 05:36:23 -0400 (EDT)
Message-ID: <bc68aa3b2ccc7def8130e240e82c9d4977a12121.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 03/17] libarchive: fix CVE-2026-14164
From: Paul Barker <paul@pbarker.dev>
To: Fabien Thomas <fabien.thomas@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 10:36:22 +0100
In-Reply-To: <444439890165ed1ceb7dbf68655d320c554e6acd.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
	 <444439890165ed1ceb7dbf68655d320c554e6acd.1786633048.git.fabien.thomas@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 09:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243509

On Thu, 2026-08-13 at 17:21 +0200, Fabien Thomas wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Backport patch to fix CVE-2026-14164.
>=20
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-14164
>=20
> Upstream fix:
>   https://github.com/libarchive/libarchive/commit/f774f03b40cb109348e5c6d=
52b59c864e3cfa8e8
>=20
> Tested with ptest:
> Before: PASSED: 5, FAILED: 0, SKIPPED: 0
> After: PASSED: 5, FAILED: 0, SKIPPED: 0
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>

Hi Fabien,

Please drop this one, I've replied to the original patch [1].

[1]: https://lore.kernel.org/openembedded-core/0447ebc9d29b0736de8ba0c75f15=
5ed4f880d072.camel@pbarker.dev/

--=20
Paul Barker


