Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B64C105D995
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:30:51 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102184.1775640649150776840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=GRlvYAuG;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Dje044n9;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 37745EC0407;
	Wed,  8 Apr 2026 05:30:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 08 Apr 2026 05:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775640648; x=1775727048; bh=alkz32fNuC
	8qFPr+Yftt8aqvge3/22QQDBwWHUbX8ME=; b=GRlvYAuG0b2vpxZDvQ58iD2EUm
	PIDkFPgaM3pVgtPfla3Zzxhdici/n35tY0SAXgtOiURGuXu9ScqYBrr1LFEhRUPS
	400US8hUyHxG222+MmxeaLZYJHCUY61yIEfMS814iep8K1Qh4DV0pWbslilIm2Er
	r58qOM/5U3uEARs2RsjSZwE6NtMB46Oi3XWJwJ+mjncASOTU+LFYBPZ5VT73lc+h
	E5PCTYGod6Ofg3/iI3C0dBdi96clca014BrNg0OimXhQSlycdwX9t2zocoT/XqO8
	zFlDhFB2PTDHP06ZlqY92VVgoQGmrJyDY1/bOmvQpQdydAoQ2rCxq3PWm4sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775640648; x=1775727048; bh=alkz32fNuC8qFPr+Yftt8aqvge3/22QQDBw
	WHUbX8ME=; b=Dje044n9xAegg0HfHqn3DeQbJo1vqt1sBtoPVkrRUvkC4CvLCAY
	ydXxGirFF5WausgO0pYUuEd3M0/L2RDT86UZJqnVM3U2hg7vX1AghxYwkyhDZqbU
	ViQPCEr+GN1/kWg/v8MHvwJHM+Z60mU+RNmbChDJxNg9OWasPERMkXHS4p8pojtM
	GluoWnFsC65KEfs1LaNzf/eenDRw0p4/UdGO9B2X1Yp1iuVrZOLRcvcy7eQcEoqA
	mhzO50cX/V1BYD+rHSDmMSu15mGyvu6Q43Gs8sqMQd0Rtib7d8yVJrPsPHqH4Dy5
	n88AaN4KMN9SiH/rpnOW/jNgd/vy1Ai8+hA==
X-ME-Sender: <xms:RyDWabxC1QBmxpXxsafH1aV-Qx9-21M9zTUlhro0FQVsT1T8T2cigg>
    <xme:RyDWaatJ5DPsRUzg4BhdjgbmmgNB4zzntaSu02-hGaD-AO9JUmT7CJjUHS8BxTB2D
    IwIw5B9sD9AGIBsXcp5mnfzQ463QHU8NciTQKOOupGC5EDvsRyxwSk>
X-ME-Received: <xmr:RyDWaSsIhZrqYc66G8lC47d8BaoQcSgV2UhTqlVA1FNB-1ItkY2jftE_A5ZaWNZisUryrXHAJZxkEeRm0Vth8Dz8JFYGGQZxZ6RC4_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvfedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddqiedmnecujfgurhepkffuhffvve
    ffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehp
    rghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepjeekgeevkeeiue
    ehkeehleejgefgtdevheffvedtteeuffdvudfhheegteehtdeunecuffhomhgrihhnpeho
    phgvnhgvmhgsvgguuggvugdrohhrghdpnhhishhtrdhgohhvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdgu
    vghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hhrghrihhshhdrshgrughinhgvnhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpthht
    ohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhgpdhrtghpthhtohepshhunhguvggvphdrkhhokhhkohhnuggrseifihhn
    ughrihhvvghrrdgtohhm
X-ME-Proxy: <xmx:SCDWafOfaQqagewoaChKQc7M-LlFYV9JrtwOqUqQxT-a0ifUHBm5Yw>
    <xmx:SCDWaQ3oEu0-3RyXiNivsUh03xnt07YC82jhqj4Dcwwe3h6LQR1tJw>
    <xmx:SCDWabP8FSon_iPnbtt4OUlxSHkca-1gOFYlESAC3PNrDxio0Uu1xg>
    <xmx:SCDWaQ10PElGTOZOYmoPbXm0vx0KaEEwLwz7phCeowz6HpcNLxTrww>
    <xmx:SCDWaddV9nULiv9k5MsBy3kCqLzANMBToEUXXjV16HvN0nbFtPyjNIXm>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 05:30:47 -0400 (EDT)
Message-ID: <f893c9bfd5410258400cd75d076fcb9be66a4714.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] binutils: Set status for CVE-2025-69646 &
 CVE-2025-69649
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Wed, 08 Apr 2026 10:30:44 +0100
In-Reply-To: <9b85db42-8a0a-41a9-b31f-7da1ba0f5e0d@windriver.com>
References: <20260406070506.3779367-1-Harish.Sadineni@windriver.com>
	 <aff85443515795d097949cedbf07bd2ed40d7372.camel@pbarker.dev>
	 <9b85db42-8a0a-41a9-b31f-7da1ba0f5e0d@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-r4hhACCkh74X9NJKQ17b"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234822


--=-r4hhACCkh74X9NJKQ17b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-06 at 15:26 +0530, Sadineni, Harish via
lists.openembedded.org wrote:
> On 4/6/2026 1:58 PM, Paul Barker wrote:
> > On Mon, 2026-04-06 at 00:05 -0700, Sadineni, Harish via
> > lists.openembedded.org wrote:
> > > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> > >=20
> > > Set CVE_STATUS for CVE-2025-69646 and CVE-2025-69649, as both CVES ar=
e already resolved
> > > in the latest binutils 2.46 version upgrade.
> > >=20
> > > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > > ---
> > >   meta/recipes-devtools/binutils/binutils-2.46.inc | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/=
recipes-devtools/binutils/binutils-2.46.inc
> > > index ff10050dd9..dc8b6be03e 100644
> > > --- a/meta/recipes-devtools/binutils/binutils-2.46.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
> > > @@ -34,3 +34,6 @@ SRC_URI =3D "\
> > >        file://0013-Define-alignof-using-_Alignof-when-using-C11-or-ne=
we.patch \
> > >        file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_of=
il.patch \
> > >   "
> > > +
> > > +CVE_STATUS[CVE-2025-69646] =3D "fixed-version: Fixed from version 2.=
46"
> > Hi Harish,
> >=20
> > According to https://nvd.nist.gov/vuln/detail/CVE-2025-69646, the CPE
> > for CVE-2025-69646 is "cpe:2.3:a:gnu:binutils:2.44:*:*:*:*:*:*:*", so i=
t
> > should already be seen as fixed in 2.46. Which tool is reporting this a=
s
> > an unresolved CVE?
> git branch -a --contains 598704a00cbac5e85c2bedd363357b5bf6fcee33
> * master
>  =C2=A0 remotes/origin/HEAD -> origin/master
>  =C2=A0 remotes/origin/binutils-2_46-branch
>  =C2=A0 remotes/origin/master
>=20
>=20
> The above git info (and bugzilla) shows that the commit id got=20
> merged/fixed in 2.46 branch. And so it documented as fixed from 2.46.
> And, it is not shown by any tool as unresolved but we see CVE's status=
=20
> is well documented and maintained in kernel-recipes
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/l=
inux/cve-exclusion.inc
> So, We thought of maintaining the CVE's status for toolchain components=
=20
> from now.

Hi Harish,

The entries in cve-exclusion.inc cover cases where the CPE is not set
correctly by NVD. For example, the last entry is for CVE-2023-6535 which
was fixed in Linux 6.8 but NVD still have the CPE as
"cpe:2.3:o:linux:linux_kernel:-:*:*:*:*:*:*:*", indicating that all
versions of the kernel contain this issue. So we need to set CVE_STATUS
ourselves for this one.

If the data published by NVD is correct then we do not need our own
CVE_STATUS entry.

> > > +CVE_STATUS[CVE-2025-69649] =3D "fixed-version: Fixed from version 2.=
46"
> > According to https://nvd.nist.gov/vuln/detail/CVE-2025-69649, the CPE
> > for this one is "cpe:2.3:a:gnu:binutils:*:*:*:*:*:*:*:*". Please includ=
e
> > some info/links in the commit message to confirm that this was fixed fo=
r
> > v2.46.
> Ok,=C2=A0 I will add the commit reference in commit message while sending=
 v2.

We do need this CVE_STATUS entry as the data published by NVD is
incomplete. Please send a v2.

Best regards,

--=20
Paul Barker


--=-r4hhACCkh74X9NJKQ17b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadYgRBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkFBAP9EI3kzsdKrp1QJYhfXR77PjMuMvMSR5iSI
dH2duD3FhwEAqzNyq23KoyUI75sEqfjPzCq0Zag041m7x82yL9x73gc=
=9rP/
-----END PGP SIGNATURE-----

--=-r4hhACCkh74X9NJKQ17b--

