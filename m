Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09831C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 03:20:12 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.94565.1670988001317312889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 19:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm2 header.b=omrXKcvn;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.28, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 80A5E5C0066;
	Tue, 13 Dec 2022 22:20:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 13 Dec 2022 22:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1670988000; x=1671074400; bh=qcKkmEHxRr
	99pCg5yxtF2zeag8OknqsyVtcwgli2FBI=; b=omrXKcvnO6r5Ew7LNPZzjisuIj
	S86r+FhrYKAv1ke5iaNzzol7J9mM0emmvzF29iltTg3EareCDCUCX8i3o5aO32D5
	HUz3FcbSyheVMcK8BASVqNjPXaYutubDDq0n4MISPiKrArJMzM8QuZNq787OJ5DJ
	lYMJntq8BgXp/DbEhSFVynUG+Eb07B8BYVmkYeTBPJ+ZSYiD8wtBksNbWD0y7sxY
	IwwHhHeoDpKuaUvpLI08V9ZLyAFza1VrekgzXvaiSe59smYtf4DFsbJuxczcCll2
	46+ZC/BAU2WbRrsFMLZhXFz/oH/fjX732XB8D5oHHv71UZHqjJq71HIbnN0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670988000; x=1671074400; bh=qcKkmEHxRr99pCg5yxtF2zeag8Ok
	nqsyVtcwgli2FBI=; b=d5aZCh8nI+1tMTJ1uQOM94//4rdQiUL+VNLN201jAjYp
	pqnUMTL9Z/A9UmK5eoHQ1+0Hy13gWqM6RIwk44ix2PTVM61BRHNadjQKrMc2NUZK
	UYKb50crdaQ5ePLIQkQ5lc7wiSb5+7BZ7iSqmjjCTV6g8FjXB9lVobD2o4qrrFT3
	tM354eRYyoebp+jPy/A4YGIiqDDVk9JP/Yyaxyw7uVCud+kPvUYw9C0BnMNnDBVU
	I7xyYd+cJ+kgPM8230cvDmiOsZWy3hgRQUmY3fCX5OQUeK82yAVWgPNKsF7IbKQ7
	8FXMPxramKMd8Jv1kEcCY/qiKyY2ZAGy63E0+JLIsA==
X-ME-Sender: <xms:4ECZY8g6lGMl8VkUy20yO6GavqEkzBh1s0PrDRlyuBcJu-Nyfmgg2g>
    <xme:4ECZY1DTQnvjh4bmVOuSQAmiU6P4QEcIcpKzjti-ci0DRwwlje5GqLeVAPNnCAy3X
    F7MnuBgdnd9j5kCzF8>
X-ME-Received: <xmr:4ECZY0Exbqo4wWYqXZan2x4g8qdcpOuG8rw_H71MNFGuFInpTinj1RuDa-RTuwjOdq51hDriNXE7hGYktsaBOXk8Hg1KFTyUIao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4ECZY9TK-ptn4ihVh_kZWBOsEvamnk4e_aDhWAQkjXP_YfgxB6JM5w>
    <xmx:4ECZY5yYtstxh4kGMGKc_QO5bMgcFFNidTTbiBHftAgGypADG3GBfA>
    <xmx:4ECZY76-kUJ-blqj9elz_3q_bQJV86O2tA44qZGW_lW0vyxOxx4XGA>
    <xmx:4ECZY3bVfQ4XPf0I6cNBIW0s4Tz3RiuKFmA0znwiRNLcX-Yprlpp3Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 22:19:59 -0500 (EST)
Date: Tue, 13 Dec 2022 21:19:58 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-fitimage: reduce dependency to the cpio
Message-ID: <Y5lA3pSK+DT4WVnF@heinlein.taila677.ts.net>
References: <20221212221808.753268-1-patrick@stwcx.xyz>
 <fdd0b8fac4e6a8398c9cda35d0c11a3bac355c8e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ooZvOpTDmFK97WQj"
Content-Disposition: inline
In-Reply-To: <fdd0b8fac4e6a8398c9cda35d0c11a3bac355c8e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 03:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174548


--ooZvOpTDmFK97WQj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On Tue, Dec 13, 2022 at 11:52:08PM +0000, Richard Purdie wrote:
> On Mon, 2022-12-12 at 16:18 -0600, Patrick Williams wrote:
> > In order to build a fitimage, we don't need the image to be "complete"
> > but we need the cpio portion of it built since the cpio is what ends
> > up inside the FIT.  By reducing the dependency to `do_image_cpio` we
> > are able to include an image's rootfs as the ramdisk for a FIT and
> > then bundle that FIT into a larger SPI flash layout.
> >=20
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---

> > -            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends=
', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > +            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends=
', ' ${INITRAMFS_IMAGE}:do_image_cpio')
>=20
> I merged this but then realised you can't do this.=20
=2E..
> As such I reverted it.

Apologies for that.  It seemed to be working on my end but I was not
going to be surprised if someone told me I had very bad ideas as was
completely overlooking something.

> The copy to
> DEPLOY_DIR_IMAGE happens during do_image_complete so you can't rely on
> this to be present until that task.=20

I didn't notice this issue, but I very well could have had stale data in
my DEPLOY_DIR_IMAGE.  I'll investigate further.  Is there any reason
this couldn't be moved?

> We need the copy and sstate code so
> we have a manifest of what is "installed" so we can clean up the task
> and replace it with code re-running.

I'll look into this as well.  Is it fine to make do_image_cpio sstated?


--=20
Patrick Williams

--ooZvOpTDmFK97WQj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmOZQNwACgkQqwNHzC0A
wRmbdhAAoNiQ9huPxXWw1j6Aj+WOOeIiHu56BE4LtmcwSfptHDERJzsdzfUvxSdm
a396hWtVBcICs9EbZ/CGLky0hU8sFzDEXelmpkwTV7QTtCigpAynN9W0ehUD2vj+
Ph7ovIMFSz9t920CFkLOhS1DxeUAIHdb9Oj8rnoZBedRVJwI6wTVurDLNaCEGrPC
t6Mp9eP12QFBSwyL47QNZ3++o7HsF2rAcJhm4igV/8tF7oAoJz7yAckz8pqMj5z7
Prp7Pm6oNpiI9P6Qji0/nvPniPDeiy7cHOFt2y+IsDkPtdQyLZTwPnW/RpmrD8Qj
uK1q3WFHa9NdaqHjYJcG3oxUBz1/xmULdINlA0zcvaElfHLraJxQEVWL+IpB9z2n
rNkstNZXjL6YaLRX4VFjijzeByY3ioWaAb/SyX+hm3d0UtnxLC+bZp4/hf2aGwO3
orcOUnn/lqIMwZ/vnxFXUWMaFcmmjOSHaKDan81bls+hF68Edlezk9MetVLMGSOg
T3RKxt7NWLR+HDJJpwEXO9WPwM/5CSRqrrIzCE8eVCVrm79KAo/iBnxGwPzYoaAx
+BReNm/OQ0ravoHyDvXNeIBSE/5tgCjt1Pne/BQNUD3dMs2N+3T4ejBAM3nBBycY
0urpZs/ET3Cy8sQX8QMJfJ8MMIp0VyiwM+m0DbCWrqrUML0nq88=
=0sEW
-----END PGP SIGNATURE-----

--ooZvOpTDmFK97WQj--

