Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E67AC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 18:45:37 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1182.1784141135318217034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 11:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=j4yIjidx;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=PLab7Ju/;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6AF2F7A007C;
	Wed, 15 Jul 2026 14:45:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 15 Jul 2026 14:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784141134; x=1784227534; bh=/poCutLFW2
	7oOSqg83na5WydzFZd570lpqscdjsHteQ=; b=j4yIjidxFRQuQY0pTB/wkOmtVl
	AuhL65IrKWJppsHeaHwLORsdGtYu8av+X+QdEN/X2awscuxftVdurU/owRIX3O3h
	0v+3b1wQJgYO85BvMoP6Zkb/edAWNlrIgMWiEQe4V4VTxMno702cj4EvbCl1hNTU
	zbudZz4W2aqPbp5gycrKES75IQ/6/b9C+toR2jyksdHxW8XHB/oLJaQpwb9jFTKF
	AxycgUbc2DjyNOMrx3BdamgrzKuyPbYyXRcrvqGPJ4SRsuc3zEDRMHr324DTRmxk
	ILjaPmtYL/yv1RQbYQemZWfnJb8awA9fqRxljouuWiQWoaJ/bfr0k5aoLyIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784141134; x=1784227534; bh=/poCutLFW27oOSqg83na5WydzFZd570lpqs
	cdjsHteQ=; b=PLab7Ju/rAtp5fNN/xV6Et9KgMNl8jj6SW2CZFrgJOzfZ7s1+DU
	nL7bpsPTEb/MqV1u1WC8WTzxW2a44eVlpMUTBjEdV0u2qGsvUN/Eu4+euylFqLtE
	NvcWeY56ZrzYcJ+Ypuq4LfQU1MVISS36jXQ4wNMhe1aJyFlOyR0GgQsgvPbLi5PZ
	n6RsBtMOCwBJsc9SM5aAwuqQExAFBadJ1hbdFaUTgKkkOVCnslLGLxM0UFRCuQEI
	z8Coaeu3OvgqWaCqG+6Sav22rkfqg9JAbMywFVLPmunrhpNSjpMb97ic+4vXMJ5h
	cyzcEthL6sj4SDmel6IKabsX/auyVpTAdUw==
X-ME-Sender: <xms:TtVXaslsYRiP2sHvpbUUn0uBbY_U5jqT377h0ZKYkdYtDIe6gfdxKw>
    <xme:TtVXah2HF1k48ulAniiKB_2UrmM7sqqyEd22393rnS_aglyxC53XpS5Jq41Pw9mB6
    ZY-PDm6XAeLa_9vlhbRoYXIdWDdzRE_Z_UdO4AnkpkYbXchWNts6fzU>
X-ME-Received: <xmr:TtVXaoSLbfteTjcCHCY9cRCOpQ_B8CqPxU7vI2ROnsjKZXfLn6LGPX6Zv9EOZnNb7FhjpUmRO31KBviBbziPH4kzqLZ7hnJSR1zo3ZQl6rVs>
X-ME-Proxy-Cause: dmFkZTEuP+0fgfhRdgAZTMi/OMHhyS9/awsc0XxFmeunvUKuNchRz9vSw+M29kKbY4OAbI
    UR5KjQat64M3Z2FxXoZ7A/6OxiDn/kf4BgzXpP3FEYzRBmec14aQwCFeS4QOkwnTwCoh84
    4FxawLEJFi+oTY4uJWUOBOCuzcu0XRq1G6kkJBUijgBbDUe/WLLghN/7LITieiG0nLeYHd
    moft2JKQwKWUD/u6eiUcKiEFa4mQnbf96lxGsGAPgpi/B5j4z41FXSU6XX91jtVgFNLvnN
    DEPtzsk9t69qmv2fs1dEYjdpY2g8qsop2z+Ddjji0KIvqzUCaQQStGpMbCkw1voXl4CtRh
    EDbgu6rGvpitr1SKD72VEOQTvAGdQAfu4hvqYLd6ip/Gf+mNKWiXjIWYpQEdw65j5XHf/t
    h9suNt9/LckzRpDrotiZUf1n69ZgBTva8/7eQPUrzc5TF62qvtZX5jRMnReK+JNRmf49gy
    JLyfF7d0S6NT7D1hdv17PJR30sv8CTSePzCsMylVBcr8HhV9BQBXQstaZ+5tQATcK8gbmX
    WHrG8Y9kRHc9si/lZZMT7kztZhb9kIlOzxbVnfXl3NoS/O9H7tCOi2TXhVBlrQHM1RaUQ0
    x/6/+sIl4mBSZX3KEEaY8mFp7fqiE+ig/6KecYblT3YoSu1yDHkumOH6ZLgA
X-ME-Proxy: <xmx:TtVXajtIh7YgV_1eEMWMsWKPRig1kQAjv60D6uq4uuNFYm_Wigin6w>
    <xmx:TtVXatZAqeygziYqvN92JnySRnXfYIt45dIscEf1xuS56nudu5hHRA>
    <xmx:TtVXaovKMMsl5zkPRcPBWJt8Ny6gYJMPlP8OTKkCmnx7wRqIAxd6qA>
    <xmx:TtVXavHRd3d_ZAxeWOh72r8AdmZtYBqCNezkfS7JdGUwappaPfE1cw>
    <xmx:TtVXauE1DDJMZH7nQaCsSatEtkw_P4rErvm_4Ip9YkYSb8UqbiocJSmg>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 14:45:33 -0400 (EDT)
Message-ID: <e2046a9aa4ac8f06f084e41765fe4e8062fc849f.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] u-boot: Update git server and branch
From: Paul Barker <paul@pbarker.dev>
To: reatmon@ti.com, openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2026 19:45:28 +0100
In-Reply-To: <20260715181725.936386-1-reatmon@ti.com>
References: <20260715181725.936386-1-reatmon@ti.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KvljcQtmuIjeBnL03Z++"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 18:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241034


--=-KvljcQtmuIjeBnL03Z++
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-15 at 13:17 -0500, Ryan Eatmon via
lists.openembedded.org wrote:
> The u-boot project has moved to a new official git repository server [1] =
for
> all of their work and switch from master to main for the default branch.
>=20
> [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e6448=
8ac41c3683cacd44173a96d24
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
> index 574768b9f8..55f33efc98 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -14,7 +14,7 @@ PE =3D "1"
>  # repo during parse
>  SRCREV =3D "88dc2788777babfd6322fa655df549a019aa1e69"
> =20
> -SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Dv${PV}"
> +SRC_URI =3D "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=3Dh=
ttps;branch=3Dmain;tag=3Dv${PV}"
> =20
>  B =3D "${WORKDIR}/build"

=46rom #u-boot on irc.libera.chat today:

  14:52:10 <marex> Tartarus: can we already start using the git.u-b-p.org a=
s a primary git tree ?
  14:59:18 <Tartarus> marex: My hope was to switch over officially next wee=
k. I need to see what else needs to be done before we can fully switch over
  15:11:52 <marex> Tartarus: ACK
  16:19:06 <bryanb> Tartarus: I noticed the commit too. should yocto people=
 start switching things over for their CI/CD stuff as well or should they h=
old off?
  16:19:58 <Tartarus> bryanb: Hold off a bit more

So, we should probably wait a week or two before taking this.

Best regards,

--=20
Paul Barker


--=-KvljcQtmuIjeBnL03Z++
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalfVSBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boARAQCkK2PCGhpnWJhj5qIh8s27GdYtCyPOJtN2
qwHeaIM27wEAmzesgfjlN+EJW9wl3T6tcxPDt8aCIyKNvyR5yf6PQgE=
=MnGh
-----END PGP SIGNATURE-----

--=-KvljcQtmuIjeBnL03Z++--

