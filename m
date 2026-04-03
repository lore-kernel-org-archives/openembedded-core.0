Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BC4E85367
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 13:06:22 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11268.1775221575715394143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 06:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=xxYlmFSv;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=e+rrh25k;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D83317A025B;
	Fri,  3 Apr 2026 09:06:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 03 Apr 2026 09:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775221574; x=1775307974; bh=FZmovW2ZdM
	0PLziQCXekp86PfaRrn8zGWLVjnHtYkpA=; b=xxYlmFSvOy3gL1KhtElIPzTbQY
	qd/MsqIurctaxEWSj0QIv/1sgdwlfKKm6nIFNA19HbMYRq0TOzqK+w0o6IC/3Kv4
	h34ZpqGvUzdeTXc3mCnGNbF2jadRIzNkWN04K394oIna7Grzp/I580Fh5cP/Yq75
	AQqdI//UTnhAf/3ARHXdBtK0xEKB+Z5m3/jhXEbnMJ1zSgzrSlI+yj8St13njeJL
	Rx4U153ie190rVT/ft8Pmgckq1hZyVZtLVf+QbYm91ypE+PfRvoGC9dlVPiAgOpc
	TnyFDmtMJHZbwfXZzp/K3mYEif0sxFRQEUeWhR8Kx8izUwrEJeMQQQd+xgeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775221574; x=1775307974; bh=FZmovW2ZdM0PLziQCXekp86PfaRrn8zGWLV
	jnHtYkpA=; b=e+rrh25kP9kC1EyWKaRFKswTPhHbEQyZ1YZFADPkZxewzUs3C3N
	tNBBJBmq8V9nwhKuRfKrvExlJL9ww91elKDbX/cWwlM+vHyIZvxckEsUwKamXQYm
	zlJ9zSg7BYCUY/YeYEZPJPI2+FpfQrtNSQSOBMK+nU5PpaJUxSPj4etJY7bFs+OF
	91JgR0Dc18Uaku7cuNU28ntx5CN5LWy/4Fp65PA80Swe789skTiYbNQhyd/8jdmB
	UMV22oJyfJfKushKUZzLJ/pGDNz2k9vN1KnZInrgU2W//q0W8mSzTutxKm4+iALn
	v7r+MBHRmzsutzHp2FV5xoV06yGQf7odb+Q==
X-ME-Sender: <xms:RrvPabyRXGNG-zYXJFyUSJswhMJPQD54yZ5mEfY_L_DQ7t4zvpic8Q>
    <xme:RrvPaZSUPLNRe0JxMmsS6dHoTMHYZeeogs52zWfsyDM_ay1z7-y1ewQSEEEenJSb2
    ANnGfNZKYVWO5E4VtytzkiU0knCmIYua6qs6OYUayQFz4XrkMTz-Q>
X-ME-Received: <xmr:RrvPaS8xAUMiEWjXkZQyMpup-DjLItzg6jt_qMI8ItAl8cchHt_Z1r3P4Ye-HPzpPv5v7_aqUUMxzuM7X-57YTtyRci3J6VoEocLL78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeltddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertderje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhephffgheehjedugeeggeefuedvhffghfettdffjeeugf
    ejfedufeefgeekgfelfedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhr
    ghdphigrmhhlrdhinhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiise
    gthhgvrhhrhidruggvpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:RrvPaQp04NrEPYFLitaHFLTcS9b_i-merCb9BN8Rc3mo04bbg5wtZA>
    <xmx:RrvPafnh0Gj1eNjQCGyTNMH5718yIagp8MKeC2rcv8kqhIG1MEmZiw>
    <xmx:RrvPaXLYGSmeH35BWXYnvcbwDE1Y641oHXesOt7MeD67rMKqarQMsQ>
    <xmx:RrvPaUxHJPnGzXgsIV2bHRGog7PP2gFFXq9O-hj5cCM5WyZeSlhtfQ>
    <xmx:RrvPaV7eG0aQgkRO6sXzykWp4kgDfu090cWZ0otyXhNrDAJaPYHFh6Of>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 09:06:14 -0400 (EDT)
Message-ID: <752a6178f694a68d3d2ce8793a3a49b09f509e96.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
From: Paul Barker <paul@pbarker.dev>
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Date: Fri, 03 Apr 2026 14:06:11 +0100
In-Reply-To: <06f4e91b-faa2-403c-bb54-3215931aa9d3@cherry.de>
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
	 <aebb87e9-8bb8-4e89-ad2c-6dc447cd8ece@cherry.de>
	 <9c10e55cf57909e1cdbbf9d1a1dae2e01ebf808c.camel@pbarker.dev>
	 <06f4e91b-faa2-403c-bb54-3215931aa9d3@cherry.de>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-EtuI4zA4+ARr4XJDhsuu"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 13:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234586


--=-EtuI4zA4+ARr4XJDhsuu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-03 at 14:56 +0200, Quentin Schulz via
lists.openembedded.org wrote:
> Hi Paul,
>=20
> On 4/3/26 2:30 PM, Paul Barker wrote:
> > On Fri, 2026-04-03 at 14:06 +0200, Quentin Schulz via
> > lists.openembedded.org wrote:
> > > Hi Paul,
> > >=20
> > > On 4/3/26 1:54 PM, Paul Barker via lists.openembedded.org wrote:
> > > > tar 1.34 (and possibly earlier versions) is unable to extract tarba=
lls
> > > > containing read-only files with xattrs. This was fixed upstream, bu=
t
> > > > it's unlikely at this point that the fix will be backported to RHEL=
9
> > > > related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The =
issue
> > > > affects these distros specifically because they have selinux enable=
d by
> > > > default and this uses xattrs.
> > > >=20
> > > > The specific failure we've seen is with the /usr/lib/udev/hwdb.bin =
file
> > > > installed by the systemd recipe - this file is chmod 0444. This lea=
ds to
> > > > the following error, typically during do_image_wic (shortened and s=
plit
> > > > to make it readable):
> > > >=20
> > > >       subprocess.CalledProcessError: Command
> > > >       'tar --xattrs --xattrs-include=3D'*' -cf - -S -C .../tmp/work=
/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
> > > >       tar --xattrs --xattrs-include=3D'*' -xf - -C .../tmp/work/qem=
ux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
> > > >       returned non-zero exit status 2.
> > > >=20
> > > > That error message is likely to confuse users, and the fix is not
> > > > obvious. So, error out if tar 1.34 or earlier is present on affecte=
d
> > > > distros and recommend upgrading or using the buildtools tarball.
> > > >=20
> > > > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > > > ---
> > > >    meta/classes-global/sanity.bbclass | 15 +++++++++++++++
> > > >    1 file changed, 15 insertions(+)
> > > >=20
> > > > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-glob=
al/sanity.bbclass
> > > > index b5d905399b73..2e486966a93b 100644
> > > > --- a/meta/classes-global/sanity.bbclass
> > > > +++ b/meta/classes-global/sanity.bbclass
> > > > @@ -551,6 +551,21 @@ def check_tar_version(sanity_data):
> > > >        except subprocess.CalledProcessError as e:
> > > >            return "Unable to execute tar --help, exit code %d\n%s\n=
" % (e.returncode, e.output)
> > > >   =20
> > > > +    try:
> > > > +        distro =3D oe.lsb.distro_identifier()
> > > > +    except Exception:
> > > > +        distro =3D None
> > > > +
> > > > +    if distro:
> > > > +        rhel9_alike_prefixes =3D ("rhel-9", "centos-9", "rocky-9",=
 "almalinux-9")
> > > > +        rhel9_tar_minimum_version =3D "1.35"
> > > > +        for prefix in rhel9_alike_prefixes:
> > >=20
> > > The commit log doesn't explain why that is specific to centos 9 and
> > > derivatives.
> > >=20
> > > Did CentOS break tar only for themselves, or is it the only distro wi=
th
> > > that specific broken tar version or is it the only distro with that o=
ld
> > > of a version of tar?
> > >=20
> > > I'm asking because I am not sure we need to filter on the distro AND =
we
> > > also probably should update the min version of tar listed in
> > > documentation/poky.yaml.in in yocto-docs.
> >=20
> > Hi Quentin, thanks for the feedback!
> >=20
> > The issue exists in upstream tar, I'm unsure when it was introduced. It
> > was fixed for 1.35 [1].
> >=20
>=20
> This is **weird**, because we do have other distros with tar 1.34 and=20
> they don't seem to be failing (from what I could tell from our bugzilla=
=20
> ticket). Debian 12 (bookworm) has it for example according to pkgs.org.=
=20
> So either CentOS has a patch for 1.34 that others don't and it breaks=20
> stuff, or other distros have a patch that CentOS doesn't? I couldn't see=
=20
> anything obvious between CentOS-9/Debian-Bookworm so don't know :/
>=20
> Can you please add this info to the commit log? That we do have other=20
> distros with 1.34 and they work fine, just the CentOS-9 and its=20
> derivatives that are failing, hence why we require this only for those=
=20
> distros?

Hi Quentin,

The commit message says:

    The issue affects these distros specifically because they have
    selinux enabled by default and this uses xattrs.

We don't see failures on Debian 12 because files typically don't have
xattrs set by the host OS there.

We could require tar 1.35 everywhere, but that will require a lot more
users to install buildtools before they can start a build.

I'm happy to add more info if it's needed. I should also add a Fixes tag
for #16143.

Thanks,

--=20
Paul Barker


--=-EtuI4zA4+ARr4XJDhsuu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCac+7QxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bn50AQDPPKM/VU05kYgyYO+eqJvsI6GkI2I2AAsO
dRqM2EEkSwD+JDHkd0GmrcWy45/ayf2QDPsAhPyV6DVX0X7Nfih2yw0=
=P8rA
-----END PGP SIGNATURE-----

--=-EtuI4zA4+ARr4XJDhsuu--

