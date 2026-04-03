Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD176D73094
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 12:30:41 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10433.1775219438200874146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 05:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=D/zr3c60;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Mi93m3D+;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8336F1D001E5;
	Fri,  3 Apr 2026 08:30:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 03 Apr 2026 08:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775219437; x=1775305837; bh=ECFm4o/7QX
	VKt5BPhIz/TDIPrxHInMwN6yYzRN0qBvk=; b=D/zr3c60etEUPCs+N93+iMo/Pt
	KzFKcpeRjataAJhq2xoP6603Lmaz9zVrbMsgVii6zbq42he+EvvlvFShl6e0zZq9
	3qnsS2z92fnPdOJAp1E+wuujwR+axbtb+H+h6PpTj4WlqupEir7Ot2zu+lX5oLZV
	JSgWo2z544ZJq3DtHGODKBmpSQiV2Yqtn3CEkrDhDKdxFMZaC3sT4C9IS0iWl3Fu
	ViHZLTE4NXNeWArL8tQN7KHIyYMCEWLoxgmateFV77ChQdP1XqID2dy8yVBdie7E
	J1uMI9zFuzjl2KPD1lBHmHDVS1TruYppiFDrl9Ni98M3tR6Oi6T93V9OeKVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775219437; x=1775305837; bh=ECFm4o/7QXVKt5BPhIz/TDIPrxHInMwN6yY
	zRN0qBvk=; b=Mi93m3D+7lXazvHVJdpTmCqbkp4naBC5sb3xeYOAeXaGV8lP2en
	iuC7Kub//M/Bx0OfyG5nYfl0tshEoEG6QXcKioFgEPhKKXVpu5TgIXRSLPTk9c+F
	bOjSJD8+xmFfUrV4hGjFEk8bfxIBTBUJdyHJAdvPgRg8ATpmrslB9s7q07SjU6dG
	5uBMlUqkwC78IijV0dskRaNqXTRp7vzAoQe7uoRxSaYc4MgUxgHMFNOpznlfY8A6
	uVhS1YmpyqFT5X1alYMCeDB6YoO0vgOygHMffZc8jdnzBePgflxZmnlBzMbhMEYa
	nCF5+05rc3EkgCDnOn8RG0jZ9Y2kM6mAwLg==
X-ME-Sender: <xms:7LLPade9GGNQMKNwuGp0vlE6_SlcxmsBqJyb6MeVVVQ-OGjkhCllzQ>
    <xme:7LLPaROe37iKkqbWGNCT68hghCWPuk5bjsUmlCnFAXBUgngQwyRd_4qC0G91f31UG
    C0ClutYcmT4YY2Ch3Wh6HlPCd0KIhBGcunRwQ1ZVA2FGktd7H5eHg>
X-ME-Received: <xmr:7LLPaUJWCAcS01DPLNTNg8-0kusnzVdLzuyVZE3IQYKvuascBovaOsFyZknwXsVL6_ohnb3igxjW30Aio4f3lFS_CSTPU2Io50iEpX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmnecujfgurh
    epkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhk
    vghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpedttd
    fhleelvdefueekfefgteejkedtgfejhfdtvedvieevtdefkeeufeekudevfeenucffohhm
    rghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihrghmlhdrihhnpdhgnhhurdhorh
    hgpdgrthhlrghsshhirghnrdhnvghtpdihohgtthhophhrohhjvggtthdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtg
    hpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghm
    sggvugguvggurdhorhhg
X-ME-Proxy: <xmx:7LLPaSFPvmS-y01K84s2J-g4vCvtCh-9IWgDkYRFjn168Jyx5veahw>
    <xmx:7LLPacTUUVpMj3dyVa2IjNLkkTstJ5g6ebprtNMkJ7nlM2dteTYtQg>
    <xmx:7LLPaeGaR7Rbn9e5cbZDoQORsyUw7Fn3x36rx1eWcGUopk308rweQA>
    <xmx:7LLPaY_Ko9h_oAXrO7Z-44rEbqBuSvmD2EuCu_7viV8poOCh6SPCKg>
    <xmx:7bLPafEIMu3_Bwvt8bgFs1KMQ8sYmvCcd9asio-zHO2znfu743Rz2aQq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 08:30:36 -0400 (EDT)
Message-ID: <9c10e55cf57909e1cdbbf9d1a1dae2e01ebf808c.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
From: Paul Barker <paul@pbarker.dev>
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Date: Fri, 03 Apr 2026 13:30:32 +0100
In-Reply-To: <aebb87e9-8bb8-4e89-ad2c-6dc447cd8ece@cherry.de>
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
	 <aebb87e9-8bb8-4e89-ad2c-6dc447cd8ece@cherry.de>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rLz+Qx57rl2Q8+mRMPj/"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 12:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234584


--=-rLz+Qx57rl2Q8+mRMPj/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-03 at 14:06 +0200, Quentin Schulz via
lists.openembedded.org wrote:
> Hi Paul,
>=20
> On 4/3/26 1:54 PM, Paul Barker via lists.openembedded.org wrote:
> > tar 1.34 (and possibly earlier versions) is unable to extract tarballs
> > containing read-only files with xattrs. This was fixed upstream, but
> > it's unlikely at this point that the fix will be backported to RHEL9
> > related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issu=
e
> > affects these distros specifically because they have selinux enabled by
> > default and this uses xattrs.
> >=20
> > The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
> > installed by the systemd recipe - this file is chmod 0444. This leads t=
o
> > the following error, typically during do_image_wic (shortened and split
> > to make it readable):
> >=20
> >      subprocess.CalledProcessError: Command
> >      'tar --xattrs --xattrs-include=3D'*' -cf - -S -C .../tmp/work/qemu=
x86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
> >      tar --xattrs --xattrs-include=3D'*' -xf - -C .../tmp/work/qemux86_=
64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
> >      returned non-zero exit status 2.
> >=20
> > That error message is likely to confuse users, and the fix is not
> > obvious. So, error out if tar 1.34 or earlier is present on affected
> > distros and recommend upgrading or using the buildtools tarball.
> >=20
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >   meta/classes-global/sanity.bbclass | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >=20
> > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/s=
anity.bbclass
> > index b5d905399b73..2e486966a93b 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -551,6 +551,21 @@ def check_tar_version(sanity_data):
> >       except subprocess.CalledProcessError as e:
> >           return "Unable to execute tar --help, exit code %d\n%s\n" % (=
e.returncode, e.output)
> >  =20
> > +    try:
> > +        distro =3D oe.lsb.distro_identifier()
> > +    except Exception:
> > +        distro =3D None
> > +
> > +    if distro:
> > +        rhel9_alike_prefixes =3D ("rhel-9", "centos-9", "rocky-9", "al=
malinux-9")
> > +        rhel9_tar_minimum_version =3D "1.35"
> > +        for prefix in rhel9_alike_prefixes:
>=20
> The commit log doesn't explain why that is specific to centos 9 and=20
> derivatives.
>=20
> Did CentOS break tar only for themselves, or is it the only distro with=
=20
> that specific broken tar version or is it the only distro with that old=
=20
> of a version of tar?
>=20
> I'm asking because I am not sure we need to filter on the distro AND we=
=20
> also probably should update the min version of tar listed in=20
> documentation/poky.yaml.in in yocto-docs.

Hi Quentin, thanks for the feedback!

The issue exists in upstream tar, I'm unsure when it was introduced. It
was fixed for 1.35 [1].

We have only seen issues on the autobuilder with rhel9 related distros.
This is tracked by RedHat [2], but a fix is not expected as they don't
want to risk breaking any existing workarounds.

In our bugzilla, this is the remaining error in #16143 [3] after the
pseudo fixes, see comments 23 onwards.

[1]: https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=3D0b74885e81=
b90d6ab4890b195dce99ca9109fe59
[2]: https://redhat.atlassian.net/browse/RHEL-158896
[3]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16143

Best regards,

--=20
Paul Barker


--=-rLz+Qx57rl2Q8+mRMPj/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCac+y6BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bu1xAP9azT7viOwxkIK4QX4OS5DxsCbOZgYWGvxZ
3pYthfTgPQD/Q0m2tt9QQo/NxZj0e2XYKfsz2iHqhKPiSJEERbsT/AI=
=JIXU
-----END PGP SIGNATURE-----

--=-rLz+Qx57rl2Q8+mRMPj/--

