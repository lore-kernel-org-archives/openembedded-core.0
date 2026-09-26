Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED497C98332
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 15:01:19 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20485.1790434869537883017
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 08:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=NsJL5IwF;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=OWXgn4bq;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8B0FD7A0086;
	Sat, 26 Sep 2026 11:01:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 26 Sep 2026 11:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790434868;
	 x=1790521268; bh=FBtzCB1BNlMsPylS9kP9VOIXURvPKMECume3W2SRAAs=; b=
	NsJL5IwFDL5jJwz1xoedsNqm8xcG4IssglceTl6TdFAo4VhTYf/EV3/QhpAw6ueT
	MfqMOsvbZPgJaMq1SPumScTHnszoci4IgZgVjLfbE2kXz6NxY5hGCHP4GmGllHZx
	sJc+EF1t2dan5id1EH4unJqwmme8KcCRdzjVH5FmT+/1IJZ2qZFdfUrlSFY7uQjQ
	jrEKW7/BjdctrpjGIPpX7e1SHe93MInBbXtAv4moHvF9MGXkqhMEDD98ONYH1fbz
	W0zAF35CeQOMtp5SESPd6pk37SQpoXseJh83K2iT29JsNAnB/c6qJcpXSXc4YS9v
	1JRND9qqt88Mxl7kvfH9jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790434868; x=1790521268; bh=F
	BtzCB1BNlMsPylS9kP9VOIXURvPKMECume3W2SRAAs=; b=OWXgn4bq0bIlEbZVf
	Tcdn+FyVhMSpj/QArb0OEcwYihpfZK1i6ng4/g43lHEeNucpWSv1VTRit3jIsZ88
	oL5IEVwMdbO4v6RJdWLzld3ilt5/K7DUVd89C2FyjZt5ZPPpyJjywpiL58Y5Q+kS
	PnNF+zRWWzb2SQVbA6Mpx9irWqQqXVsjRv2BdsOTUxdfUU2+xPatBzg4q7Hj97jL
	RRJVszUuySlF8ndm11mYscvTXZ7NbOoQclf3iUiq2p740sAvjAYdmw8BP41mbUpI
	+tuBciWcR5piMnrCRqf+aBNm5noSNBGpXHzrlAn75qTtj36DXCeWIhnxWdA+BsGx
	J7FFg==
X-ME-Sender: <xms:NN63avlmLUXzioxt99_xfcu87-Eu9sGeJars-yqhZcWUcqjpiLfUUw>
    <xme:NN63ao0t-PIei_j_DlmmvLBfDmL6F43LVmm7daeP13TRbmEyveMAQpdGJw5e_8hrq
    XKCBtv9ccJLVKyV8LUILsT-SZivGf8HpxEnSVJ5jKW1ZqUDSZQgVPCi>
X-ME-Received: <xmr:NN63ajQJ3eSafFAlT8292ScIEsg1uKE9kNYbZVizO0FAnuchJBWoNsKrTtFLher2foMK_SazfgFcOAnYv6BXnVefiMFJiuxfEWE2fx8>
X-ME-Proxy-Cause: dmFkZTGljHiXk6o62mqy3Dwmw7cCUxXbIpXdvyEikkWQ+/IzGg13d8hHQYdTmAs3U+RWaM
    T1PXu4sYSeGJUMD4Lm2wfC4jTSdPwFiUmLbMxskndQWyBpXttM7EmrOEo3h0KqAn/KdYRq
    KvBCWJFFyGL2PvS4pF1FejhL2P+OsfRg6CyzWTlVTnEqX1yb1Y7ZZCeGOtChhq9fQsoC5D
    mqN87d406USl6tb76s6KQ24Wab9NWf+GOpK/O1TCfLOgaVd5DTOTtmJWp0fff/338YCVWT
    uwIhDMzdX2wG/el+DZ9p6LtbZuUfUD0V9XF0ouTzaC3CtMt81hxJnukRGCxYmI1NV7v/Zr
    2RlLVHlIfzA9G2IU5XrACTtlXKyIwn79uNguU6OivcCYYEzQvSq/8sobIXsYqPri6E12E6
    3X1KH1VJClys//3YA8kpTYVTY6aZsVliPfKy2vkBaYk6GB/3m6BzupHQsRoE6B70ztKS/T
    hTYUDr0U8g6KDZAJv5PhXHe4b50Dtz4ndiXSzuSwDYmPw1VCl9DrWRAWkj+piXcbQXpHUT
    J/B8LsbNvEm1f1TdZO0c8HGxXqHirBNMCtwzVEKZeW4UGaZS9lmUPRnxmiwhCBGYHxiqRo
    qnuoHXQOwgHIr0TPrcuADpZUbpDvio8W2ZvwKaJhTexlBUWUxU6SKl2YwlDg
X-ME-Proxy: <xmx:NN63aivsK8TNlLDmZX4qht_OD0zHy80D_w_5JkIBb15RZKYsS2tfIA>
    <xmx:NN63agauTOh0PXnZqZBfKrc4aeiKE5yEU4LgRExMGz4rimeXpj2lbQ>
    <xmx:NN63avtnHwz3CpAnVt66Vdz3nl8kpxH1z8LGRih4gfeGS1f9AZiw6A>
    <xmx:NN63aqF6w8F2k6eW-C3pHodVGcJL2SXdFSqWX2Cj9LBRiw7yQJ2kQw>
    <xmx:NN63ao0_GqqL18HLLycxZQtvUGIfAUcpts8k-1IZ6QNeGZDxSWwOiAyF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 11:01:07 -0400 (EDT)
Message-ID: <96d7662de4f754571942df16f9944fa8ce13a0f7.camel@pbarker.dev>
Subject: Re: [PATCH] kernel: use absolute paths in the kernel-image scripts
From: Paul Barker <paul@pbarker.dev>
To: WXbet <wxbet.oe@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2026 16:01:06 +0100
In-Reply-To: <20260914182130.19543-1-wxbet.oe@gmail.com>
References: <20260914182130.19543-1-wxbet.oe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 15:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246639

On Mon, 2026-09-14 at 20:21 +0200, WXbet wrote:
> From: WXbet <57314510+WXbet@users.noreply.github.com>
>=20
> On the target, the postinst of kernel-image-<type> creates the
> ${KERNEL_IMAGEDEST}/<type> link with a path relative to the current
> directory, and the postrm removes it the same way. opkg runs package
> scripts in the directory of its caller, so an upgrade started from any
> directory other than / makes ln fail. The fallback then copies the image
> with install, which the busybox defconfig does not enable:
>=20
>   sh: install: command not found
>=20
> and the postrm leaves the link behind.

This describes two issues, we shouldn't just fix one of them. We should
also fix the on-target postinst script relying on a command that is by
default missing if you use busybox.

I think should just enable CONFIG_INSTALL in the busybox defconfig. That
shouldn't use much disk space and trying to handle the potential absense
of `install` on the device in various scripts would be a lot of work.

>=20
> Anchor the link location at / as the rootfs-time case anchors it at $D.
> The link target stays relative to ${KERNEL_IMAGEDEST}.
>=20
> Signed-off-by: WXbet <57314510+WXbet@users.noreply.github.com>
> ---
>=20
> Notes:
>     The relative path seems to date back to bb946b8cdb ("classes/kernel: =
Use
>     a copy of image for kernel*.rpm if fs doesn't support symlinks"), whi=
ch
>     moved the link from do_install into the postinst. When $D is set at r=
ootfs
>     time, the link is still anchored at $D. If the on-target case is mean=
t to
>     be relative to the current directory, please let me know how package
>     managers are expected to call it.

Looking at KERNEL_IMAGEDEST, it's weakly assigned in two places:

    meta/classes-recipe/kernel-fit-image.bbclass:
        KERNEL_IMAGEDEST ?=3D "/boot"

    meta/classes-recipe/kernel.bbclass
        KERNEL_IMAGEDEST ?=3D "boot"

I think the solution is to use an absolute path for this variable in
kernel.bbclass. Then the rest of this patch becomes unnecessary, but we
still need a follow up patch to enable CONFIG_INSTALL in the busybox
defconfig.

Are you able to send a v2 series fixing both issues?

Best regards,

--=20
Paul Barker


