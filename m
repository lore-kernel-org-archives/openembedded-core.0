Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BB0F4BB8E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:35:36 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31639.1771968926457910033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 13:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=PPCXpjAW;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=D51fIq1r;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6EB35140019B;
	Tue, 24 Feb 2026 16:35:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 24 Feb 2026 16:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771968925; x=1772055325; bh=2V869QNLye
	UI/ugDy0K+Hid5OjfXbO9G0ZW/6/ymFic=; b=PPCXpjAW8L3MYP95gY8q2nUenN
	YTlbSLzMJazVJxdlN3J+5IyW/p4KU9zICXczt2V2WNJYg3PKEwAMIl91x1sjqp1s
	eLXQ//rzEn5BYqqRF4w07cVmu0uXc4KwP41RY2AQPOouNS9eYRtdej60lK64YaHg
	V95aRVO9I5f2IQ7OhCj8jgXHyX2TTOf64PRkZGRf2b1eqURcx3hjsOKioXgAyUTq
	CZ2xDUm1frX3prbZCYoAI+aQGnOzEbU3p0V9oqKBIO595dGysPtprfy+LNbf1Hjg
	KOOIp2ONUZIII1p3zMXmaOQ90W3R62NjUVYkqFzF0gX/HMnkZKrFmM7K2rvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771968925; x=1772055325; bh=2V869QNLyeUI/ugDy0K+Hid5OjfXbO9G0ZW
	/6/ymFic=; b=D51fIq1rQhghAq67e+c9TDSUJV3G7hY1DEajhXfsd8kk9J+nFGI
	/0PY0oSVgt2+rAILiP4GVcHsQ8i/7QWHjm3m/NMMymuNEMljGMGHAnSAmmbqttwW
	wWwZ26N4jmlNXYl94Q17YUCyK/EWxs2rJ9/ra8mfOr7C+6HSPC6vlEfIV5MksjNo
	f9e63sDQqCg/VfJNbSEX5FAgASu+2MULpJNCKIN0L7sRKhz4sNfOjH2vEm6uOKdK
	36HsQyw/5g4TTFmEJAep2BCQhEaeO8vWSWkVtn+48OMr2FH0UoHlmMma1Z8oOS5l
	JvQoD77TVAqNetF1E0QWlcjyftCBh1oA+vg==
X-ME-Sender: <xms:nRmeaQybLrfu0VyTQC_yq2RL_kEDHJvCnwb9C8F6auDDehsjS9wKTA>
    <xme:nRmeaaRryA0WCPxUMKvB63Tp3QTVSYq7zL8jtYekksSfPvghnyxGD1cJJx-_8EmBM
    JXlnpd-BJW0gc6oUsWIp1SgxdbRDo9VW7OS5qX9IvPONfCrTZ_lz_Y>
X-ME-Received: <xmr:nRmeaf8ihJZCHB56M5T4yfTSYjOv6YnNV6maKccjU7r_grnSt8O0-AOIbBzCoa0zPwm_oI_WBy5-hVILCrM0ZCsGScWrDnLXyUn8FyE_-1ZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeduvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepth
    ifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:nRmeaZpJolrD7SM5XinUmVgQKe6aXbYJ8r1zYYtr2qXIBUvP_SRoaA>
    <xmx:nRmeaUkw-LRu_8Xe-rZ_5ZEAuttwNH4Xy7aalK-S-4zFoGqDw2JyDg>
    <xmx:nRmeaYIQ8nddi169RmMIHa7o6HEsyPA32tMx6fhDYB5AuhojakanKQ>
    <xmx:nRmeaRyGUlxMAVKlVo86MQJMLwvZC5LzYP5pr0IIDDKty9mPrhWCzA>
    <xmx:nRmeaQDu3KldSnqX_u3uNPCADK1YjWU94XKBpEe3R9sXTFvMGLxoICwt>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 16:35:24 -0500 (EST)
Message-ID: <5b5a9978c1ff38196770632536028f3933521bf1.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 01/10] wic: re-implement sector-size support
From: Paul Barker <paul@pbarker.dev>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2026 21:35:21 +0000
In-Reply-To: <aZ3wlSWmvQaOrsU_@localhost.localdomain>
References: <20260223215008.2062721-1-twoerner@gmail.com>
	 <20260223215008.2062721-2-twoerner@gmail.com>
	 <5c5a5fe66c0eddc7a061047ee1c56af9141a1e3f.camel@pbarker.dev>
	 <aZ3wlSWmvQaOrsU_@localhost.localdomain>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vdx0ibMqZpv5gcnTAwql"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231904


--=-vdx0ibMqZpv5gcnTAwql
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-24 at 13:40 -0500, Trevor Woerner wrote:
> On Tue 2026-02-24 @ 09:52:55 AM, Paul Barker wrote:
> > On Mon, 2026-02-23 at 16:49 -0500, Trevor Woerner via
> > lists.openembedded.org wrote:
> > > @@ -340,11 +331,15 @@ class Disk:
> > >              raise WicError("Partition %s is not in the image" % pnum=
)
> > >          part =3D self.partitions[pnum]
> > >          # check if fstype is supported
> > > +        # NOTE: parted is unable to identify dos-type partitions wit=
h a 4k sector-size
> > > +        #       if the type is empty and a non-default sector size i=
s used, assume 'fat'
> > > +        #       fdisk identifies them without issue
> > > +        part_fstype =3D part.fstype if part.fstype or self.sector_si=
ze =3D=3D 512 else 'fat'
> >=20
> > This is difficult to parse. What's the result if part.fstype is None bu=
t
> > self.sector_size is 512?
>=20
> I had added 3 lines of comments before this line hoping it would help :-D
>=20
> The crux of the problem is that wic uses parted to identify partition
> types. I found a bug in parted whereby it can't identify dos-type
> partitions when using sector-sizes that aren't 512.
>=20
> Note that it is entirely possible that the partition type is not known
> or invalid; in which case parted will not be able to identify the
> partition type and part.fstype will be None. If sector-size=3D512 and
> parted does not know the type (None) then that is probably accurate.
> However if sector-size!=3D512 and parted can not identify the partition
> type then either the partition is truly invalid, or it might be type fat
> (due to the bug in parted).
>=20
> I was able to use fdisk to confirm that fat-style partitions created by
> wic that have sector-size!=3D512 are in fact valid partitions. So you
> might wonder: why not switch wic from using parted to identify partition
> types to using fdisk? That would be a larger project, and probably
> something that wic will have to consider at some point. Or possibly try
> to create a patch for parted to correctly identify dos-type partitions
> when sector-size!=3D512. The problem is that the output from fdisk is not
> easy to parse, and is known to change from time to time. parted offers
> an -m option that will cause it to produce output that is very easy to
> parse whereas fdisk offers no such option, making any code that tries to
> read fdisk output more difficult to maintain.
>=20
> So, for now hopefully, the above line will accept parted's assessment of
> the partition type even if it is None when sector-size=3D512. If
> sector-size!=3D512 then use parted's assessment unless it is None, in
> which case assume fat.
>=20
> The above line performs this logic correctly (I'm fairly sure).
>=20
> Would you prefer to see an expanded comment? Or would you prefer to see
> a ... more explicit way of writing that code?

Ok, this makes sense given parted limitations. Agreed that switching to
using fdisk is a project for another day.

I struggle to parse backwards if conditions (what Python calls
"conditional expressions") with more than one thing going on, but it
looks correct if I squint at it more so let's just go with it.

> > > @@ -638,14 +634,19 @@ class Disk:
> > > =20
> > >  def wic_ls(args, native_sysroot):
> > >      """List contents of partitioned image or vfat partition."""
> > > -    disk =3D Disk(args.path.image, native_sysroot)
> > > +    disk =3D Disk(args.path.image, native_sysroot, sector_size=3Darg=
s.sector_size)
> > >      if not args.path.part:
> > >          if disk.partitions:
> > >              print('Num     Start        End          Size      Fstyp=
e')
> > >              for part in disk.partitions.values():
> > > +                # size values are in bytes from parted; convert to s=
ectors if a custom sector size was requested
> > > +                display_size =3D part.size
> > > +                if args.sector_size and args.sector_size !=3D disk._=
lsector_size:
> > > +                    display_size =3D part.size // args.sector_size
> > >                  print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
> > > -                          part.pnum, part.start, part.end,
> > > -                          part.size, part.fstype))
> > > +                          part.pnum, part.start // args.sector_size,
> > > +                          part.end // args.sector_size,
> > > +                          display_size, part.fstype))
> >=20
> > This looks like it could confuse users - is it always clear to the user
> > whether the output is in bytes or in sectors? Why not leave this always
> > printing the size in bytes so that there's no confusion?
>=20
> I was following fdisk's lead here. When you use fdisk to display an
> image's partition table, the numbers are expressed in sector-sized
> values, and since this output looks a lot like what fdisk would print
> out, I was copying its behaviour.

Ok, if we're copying behaviour of an existing tool that makes sense. I
want to avoid surprising users.

> > > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition=
.py
> > > index 8fed686e903e..df6e3271649b 100644
> > > --- a/scripts/lib/wic/partition.py
> > > +++ b/scripts/lib/wic/partition.py
> > > @@ -65,6 +65,50 @@ class Partition():
> > > =20
> > >          self.lineno =3D lineno
> > >          self.source_file =3D ""
> > > +        self.sector_size =3D 512
> > > +
> > > +    def _mkdosfs_extraopts(self):
> > > +        """
> > > +        Build mkdosfs extra options ensuring the CLI sector size is =
applied.
> > > +        """
> > > +        extraopts =3D self.mkfs_extraopts or ''
> > > +        tokens =3D []
> > > +        skip_next =3D False
> > > +        for tok in extraopts.split():
> > > +            if skip_next:
> > > +                skip_next =3D False
> > > +                continue
> > > +            if tok =3D=3D '-S':
> > > +                skip_next =3D True
> > > +                continue
> > > +            if tok.startswith('-S'):
> > > +                continue
> > > +            tokens.append(tok)
> > > +        tokens.extend(['-S', str(self.sector_size)])
> > > +        return ' '.join(tokens).strip()
> >=20
> > This section needs a comment to explain what it's doing.
>=20
> Both _mkdosfs_extraopts() and _mkfs_ext_extraopts() are performing,
> essentially, the same thing using very similar code. But you
> only made this comment for _mkfs_ext_extraopts(), does that mean
> _mkdosfs_extraopts() is understandable but _mkfs_ext_extraopts() is not?
>=20
> Both of them have docstrings that explain their function... albeit
> rather tersely. Would you like to see these docstrings expanded? I'd be
> happy to expand the docstring for one or both of them.

_mkfs_ext_extraopts has the comment:

    # Only add an explicit block size when a non-default sector size is req=
uested.

But looking again, that doesn't quite explain well enough. A comment
in both place that this is ignoring any sector size argument already
specified and replacing it with self.sector_size is probably good to
have. It begs the question - is that safe to do? Or should we throw an
error if self.mkfs_extraopts includes an option to set the sector size?

Best regards,

--=20
Paul Barker


--=-vdx0ibMqZpv5gcnTAwql
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ4ZmREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blymAP4paVWLKPqQTDQrMPF/GFngL/NnakdOXkQ5
l6IsmWr1+AEAkn5PmwXtY1Lv55Tr6HZfkFZetWW/MUBv8S7DZ2+htg0=
=VT5H
-----END PGP SIGNATURE-----

--=-vdx0ibMqZpv5gcnTAwql--

